Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E951E74
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 00:38:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F052C4E;
	Mon, 24 Jun 2019 22:38:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0026AB43
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 22:38:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA39D7FB
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 22:38:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jun 2019 15:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="172143276"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2019 15:38:03 -0700
Date: Mon, 24 Jun 2019 15:41:19 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 20/22] iommu/vt-d: Add bind guest PASID support
Message-ID: <20190624154119.075dddd1@jacob-builder>
In-Reply-To: <20190618174449.00001ab8@huawei.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-21-git-send-email-jacob.jun.pan@linux.intel.com>
	<20190618174449.00001ab8@huawei.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>, Liu@mail.linuxfoundation.org,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 18 Jun 2019 17:44:49 +0100
Jonathan Cameron <jonathan.cameron@huawei.com> wrote:

> On Sun, 9 Jun 2019 06:44:20 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > When supporting guest SVA with emulated IOMMU, the guest PASID
> > table is shadowed in VMM. Updates to guest vIOMMU PASID table
> > will result in PASID cache flush which will be passed down to
> > the host as bind guest PASID calls.
> > 
> > For the SL page tables, it will be harvested from device's
> > default domain (request w/o PASID), or aux domain in case of
> > mediated device.
> > 
> >     .-------------.  .---------------------------.
> >     |   vIOMMU    |  | Guest process CR3, FL only|
> >     |             |  '---------------------------'
> >     .----------------/
> >     | PASID Entry |--- PASID cache flush -
> >     '-------------'                       |
> >     |             |                       V
> >     |             |                CR3 in GPA
> >     '-------------'
> > Guest
> > ------| Shadow |--------------------------|--------
> >       v        v                          v
> > Host
> >     .-------------.  .----------------------.
> >     |   pIOMMU    |  | Bind FL for GVA-GPA  |
> >     |             |  '----------------------'
> >     .----------------/  |
> >     | PASID Entry |     V (Nested xlate)
> >     '----------------\.------------------------------.
> >     |             |   |SL for GPA-HPA, default domain|
> >     |             |   '------------------------------'
> >     '-------------'
> > Where:
> >  - FL = First level/stage one page tables
> >  - SL = Second level/stage two page tables
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>  
> 
> 
> A few trivial bits inline.  As far as I can tell looks good but I'm
> not that familiar with the hardware.
> 
Thank you so much for the review.

> Jonathan
> 
> > ---
> >  drivers/iommu/intel-iommu.c |   4 +
> >  drivers/iommu/intel-svm.c   | 187
> > ++++++++++++++++++++++++++++++++++++++++++++
> > include/linux/intel-iommu.h |  13 ++- include/linux/intel-svm.h
> > |  17 ++++ 4 files changed, 219 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c
> > b/drivers/iommu/intel-iommu.c index 7cfa0eb..3b4d712 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5782,6 +5782,10 @@ const struct iommu_ops intel_iommu_ops = {
> >  	.dev_enable_feat	= intel_iommu_dev_enable_feat,
> >  	.dev_disable_feat	= intel_iommu_dev_disable_feat,
> >  	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
> > +#ifdef CONFIG_INTEL_IOMMU_SVM
> > +	.sva_bind_gpasid	= intel_svm_bind_gpasid,
> > +	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
> > +#endif
> >  };
> >  
> >  static void quirk_iommu_g4x_gfx(struct pci_dev *dev)
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> > index 66d98e1..f06a82f 100644
> > --- a/drivers/iommu/intel-svm.c
> > +++ b/drivers/iommu/intel-svm.c
> > @@ -229,6 +229,193 @@ static LIST_HEAD(global_svm_list);
> >  	list_for_each_entry(sdev, &svm->devs, list)	\
> >  	if (dev == sdev->dev)				\
> >  
> > +int intel_svm_bind_gpasid(struct iommu_domain *domain,
> > +			struct device *dev,
> > +			struct gpasid_bind_data *data)
> > +{
> > +	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> > +	struct intel_svm_dev *sdev;
> > +	struct intel_svm *svm = NULL;  
> I think this is set in all the paths that use it..
> 
indeed. will remove.
> > +	struct dmar_domain *ddomain;
> > +	int ret = 0;
> > +
> > +	if (WARN_ON(!iommu) || !data)
> > +		return -EINVAL;
> > +
> > +	if (data->version != IOMMU_GPASID_BIND_VERSION_1 ||
> > +		data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
> > +		return -EINVAL;
> > +
> > +	if (dev_is_pci(dev)) {
> > +		/* VT-d supports devices with full 20 bit PASIDs
> > only */
> > +		if (pci_max_pasids(to_pci_dev(dev)) != PASID_MAX)
> > +			return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * We only check host PASID range, we have no knowledge to
> > check
> > +	 * guest PASID range nor do we use the guest PASID.
> > +	 */
> > +	if (data->hpasid <= 0 || data->hpasid >= PASID_MAX)
> > +		return -EINVAL;
> > +
> > +	ddomain = to_dmar_domain(domain);
> > +	/* REVISIT:
> > +	 * Sanity check adddress width and paging mode support
> > +	 * width matching in two dimensions:
> > +	 * 1. paging mode CPU <= IOMMU
> > +	 * 2. address width Guest <= Host.
> > +	 */
> > +	mutex_lock(&pasid_mutex);
> > +	svm = ioasid_find(NULL, data->hpasid, NULL);
> > +	if (IS_ERR(svm)) {
> > +		ret = PTR_ERR(svm);
> > +		goto out;
> > +	}
> > +	if (svm) {
> > +		/*
> > +		 * If we found svm for the PASID, there must be at
> > +		 * least one device bond, otherwise svm should be
> > freed.
> > +		 */
> > +		BUG_ON(list_empty(&svm->devs));
> > +
> > +		for_each_svm_dev() {
> > +			/* In case of multiple sub-devices of the
> > same pdev assigned, we should
> > +			 * allow multiple bind calls with the same
> > PASID and pdev.
> > +			 */
> > +			sdev->users++;
> > +			goto out;
> > +		}
> > +	} else {
> > +		/* We come here when PASID has never been bond to
> > a device. */
> > +		svm = kzalloc(sizeof(*svm), GFP_KERNEL);
> > +		if (!svm) {
> > +			ret = -ENOMEM;
> > +			goto out;
> > +		}
> > +		/* REVISIT: upper layer/VFIO can track host
> > process that bind the PASID.
> > +		 * ioasid_set = mm might be sufficient for vfio to
> > check pasid VMM
> > +		 * ownership.
> > +		 */
> > +		svm->mm = get_task_mm(current);
> > +		svm->pasid = data->hpasid;
> > +		if (data->flags & IOMMU_SVA_GPASID_VAL) {
> > +			svm->gpasid = data->gpasid;
> > +			svm->flags &= SVM_FLAG_GUEST_PASID;
> > +		}
> > +		refcount_set(&svm->refs, 0);
> > +		ioasid_set_data(data->hpasid, svm);
> > +		INIT_LIST_HEAD_RCU(&svm->devs);
> > +		INIT_LIST_HEAD(&svm->list);
> > +
> > +		mmput(svm->mm);
> > +	}
> > +	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
> > +	if (!sdev) {
> > +		ret = -ENOMEM;
> > +		goto out;
> > +	}
> > +	sdev->dev = dev;
> > +	sdev->users = 1;
> > +
> > +	/* Set up device context entry for PASID if not enabled
> > already */
> > +	ret = intel_iommu_enable_pasid(iommu, sdev->dev);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable PASID
> > capability\n");
> > +		kfree(sdev);
> > +		goto out;
> > +	}
> > +
> > +	/*
> > +	 * For guest bind, we need to set up PASID table entry as
> > follows:
> > +	 * - FLPM matches guest paging mode
> > +	 * - turn on nested mode
> > +	 * - SL guest address width matching
> > +	 */
> > +	ret = intel_pasid_setup_nested(iommu,
> > +				dev,
> > +				(pgd_t *)data->gpgd,
> > +				data->hpasid,
> > +				data->flags,
> > +				ddomain,
> > +				data->addr_width);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to set up PASID %llu in
> > nested mode, Err %d\n",
> > +			data->hpasid, ret);
> > +		kfree(sdev);
> > +		goto out;
> > +	}
> > +	svm->flags |= SVM_FLAG_GUEST_MODE;
> > +
> > +	init_rcu_head(&sdev->rcu);
> > +	refcount_inc(&svm->refs);
> > +	list_add_rcu(&sdev->list, &svm->devs);
> > + out:
> > +	mutex_unlock(&pasid_mutex);
> > +	return ret;
> > +}
> > +
> > +int intel_svm_unbind_gpasid(struct device *dev, int pasid)
> > +{
> > +	struct intel_svm_dev *sdev;
> > +	struct intel_iommu *iommu;
> > +	struct intel_svm *svm;
> > +	int ret = -EINVAL;
> > +
> > +	mutex_lock(&pasid_mutex);
> > +	iommu = intel_svm_device_to_iommu(dev);
> > +	if (!iommu)
> > +		goto out;
> > +
> > +	svm = ioasid_find(NULL, pasid, NULL);
> > +	if (IS_ERR(svm)) {
> > +		ret = PTR_ERR(svm);
> > +		goto out;
> > +	}
> > +
> > +	if (!svm)
> > +		goto out;
> > +
> > +	for_each_svm_dev() {
> > +		ret = 0;
> > +		sdev->users--;
> > +		if (!sdev->users) {
> > +			list_del_rcu(&sdev->list);
> > +			intel_pasid_tear_down_entry(iommu, dev,
> > svm->pasid);
> > +			/* TODO: Drain in flight PRQ for the PASID
> > since it
> > +			 * may get reused soon, we don't want to
> > +			 * confuse with its previous live.  
> life?
> 
right. thanks.
> > +			 * intel_svm_drain_prq(dev, pasid);
> > +			 */
> > +			kfree_rcu(sdev, rcu);
> > +
> > +			if (list_empty(&svm->devs)) {
> > +				list_del(&svm->list);
> > +				kfree(svm);
> > +				/*
> > +				 * We do not free PASID here until
> > explicit call
> > +				 * from VFIO to free. The PASID
> > life cycle
> > +				 * management is largely tied to
> > VFIO management
> > +				 * of assigned device life cycles.
> > In case of
> > +				 * guest exit without a explicit
> > free PASID call,
> > +				 * the responsibility lies in VFIO
> > layer to free
> > +				 * the PASIDs allocated for the
> > guest.
> > +				 * For security reasons, VFIO has
> > to track the
> > +				 * PASID ownership per guest
> > anyway to ensure
> > +				 * that PASID allocated by one
> > guest cannot be
> > +				 * used by another.
> > +				 */
> > +				ioasid_set_data(pasid, NULL);
> > +			}
> > +		}
> > +		break;
> > +	}
> > + out:
> > +	mutex_unlock(&pasid_mutex);
> > +
> > +	return ret;
> > +}
> > +
> >  int intel_svm_bind_mm(struct device *dev, int *pasid, int flags,
> > struct svm_dev_ops *ops) {
> >  	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> > diff --git a/include/linux/intel-iommu.h
> > b/include/linux/intel-iommu.h index b75f17d..94d3a9a 100644
> > --- a/include/linux/intel-iommu.h
> > +++ b/include/linux/intel-iommu.h
> > @@ -677,7 +677,9 @@ int intel_iommu_enable_pasid(struct intel_iommu
> > *iommu, struct device *dev); int intel_svm_init(struct intel_iommu
> > *iommu); extern int intel_svm_enable_prq(struct intel_iommu *iommu);
> >  extern int intel_svm_finish_prq(struct intel_iommu *iommu);
> > -
> > +extern int intel_svm_bind_gpasid(struct iommu_domain *domain,
> > +		struct device *dev, struct gpasid_bind_data *data);
> > +extern int intel_svm_unbind_gpasid(struct device *dev, int pasid);
> >  struct svm_dev_ops;
> >  
> >  struct intel_svm_dev {
> > @@ -693,12 +695,19 @@ struct intel_svm_dev {
> >  
> >  struct intel_svm {
> >  	struct mmu_notifier notifier;
> > -	struct mm_struct *mm;
> > +	union {
> > +		struct mm_struct *mm;
> > +		u64 gcr3;
> > +	};
> >  	struct intel_iommu *iommu;
> >  	int flags;
> >  	int pasid;
> > +	int gpasid; /* Guest PASID in case of vSVA bind with
> > non-identity host
> > +		     * to guest PASID mapping.
> > +		     */
> >  	struct list_head devs;
> >  	struct list_head list;
> > +	refcount_t refs; /* Number of devices sharing this PASID */
> >  };
> >  
> >  extern struct intel_iommu *intel_svm_device_to_iommu(struct device
> > *dev); diff --git a/include/linux/intel-svm.h
> > b/include/linux/intel-svm.h index e3f7631..577d5df 100644
> > --- a/include/linux/intel-svm.h
> > +++ b/include/linux/intel-svm.h
> > @@ -52,6 +52,23 @@ struct svm_dev_ops {
> >   * do such IOTLB flushes automatically.
> >   */
> >  #define SVM_FLAG_SUPERVISOR_MODE	(1<<1)
> > +/*
> > + * The SVM_FLAG_GUEST_MODE flag is used when a guest process bind
> > to a device.
> > + * In this case the mm_struct is in the guest kernel or userspace,
> > its life
> > + * cycle is managed by VMM and VFIO layer. For IOMMU driver, this
> > API provides
> > + * means to bind/unbind guest CR3 with PASIDs allocated for a
> > device.
> > + */
> > +#define SVM_FLAG_GUEST_MODE	(1<<2)
> > +/*
> > + * The SVM_FLAG_GUEST_PASID flag is used when a guest has its own
> > PASID space,
> > + * which requires guest and host PASID translation at both
> > directions. We keep
> > + * track of guest PASID in order to provide lookup service to
> > device drivers.
> > + * One such example is a physical function (PF) driver that
> > supports mediated
> > + * device (mdev) assignment. Guest programming of mdev
> > configuration space can
> > + * only be done with guest PASID, therefore PF driver needs to
> > find the matching
> > + * host PASID to program the real hardware.
> > + */
> > +#define SVM_FLAG_GUEST_PASID	(1<<3)
> >  
> >  #ifdef CONFIG_INTEL_IOMMU_SVM
> >    
> 
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
