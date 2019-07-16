Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E226AD58
	for <lists.iommu@lfdr.de>; Tue, 16 Jul 2019 19:05:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E082DC2;
	Tue, 16 Jul 2019 17:04:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 43D52D9B
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 17:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8F92879
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 17:04:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2019 10:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,271,1559545200"; d="scan'208";a="319053613"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.145])
	by orsmga004.jf.intel.com with ESMTP; 16 Jul 2019 10:04:54 -0700
Date: Tue, 16 Jul 2019 10:04:53 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v4 20/22] iommu/vt-d: Add bind guest PASID support
Message-ID: <20190716170453.GA54873@otc-nc-03>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-21-git-send-email-jacob.jun.pan@linux.intel.com>
	<2c5a7686-aef7-f98f-cb1c-8e0eb31b2bfa@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c5a7686-aef7-f98f-cb1c-8e0eb31b2bfa@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	Ashok Raj <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
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

Hi Eric

Jacob is on sabbatical, so i'll give it my best shot :-)

Yi/Kevin can jump in...

On Tue, Jul 16, 2019 at 06:45:51PM +0200, Auger Eric wrote:
> Hi Jacob,
> 
> On 6/9/19 3:44 PM, Jacob Pan wrote:
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
> > ---
> >  drivers/iommu/intel-iommu.c |   4 +
> >  drivers/iommu/intel-svm.c   | 187 ++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/intel-iommu.h |  13 ++-
> >  include/linux/intel-svm.h   |  17 ++++
> >  4 files changed, 219 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > index 7cfa0eb..3b4d712 100644
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
> not requested
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
> > +		/* VT-d supports devices with full 20 bit PASIDs only */
> > +		if (pci_max_pasids(to_pci_dev(dev)) != PASID_MAX)
> > +			return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * We only check host PASID range, we have no knowledge to check
> > +	 * guest PASID range nor do we use the guest PASID.
> guest pasid is set below in svm->gpasid.
> So I am confused, do you handle gpasid or not? If you don't use gpasid
> at the moment, then you may return -EINVAL if data->flags &
> IOMMU_SVA_GPASID_VAL.
> 
> I confess I don't really understand gpasid as I thought you use
> enlightened PASID allocation to use a system wide PASID allocator on
> host so in which case guest and host PASID do differ?

Correct, from within the guest, we only use the enlightned allocator.

Guest PASID can be managed via Qemu, and it will also associate
guest pasid's with appropriate host pasids. Sort of how guest bdf
and host bdf are managed for page-request etc.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
