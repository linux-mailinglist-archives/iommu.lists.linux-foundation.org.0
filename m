Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2CBE7C64
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 23:34:14 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B9648EED;
	Mon, 28 Oct 2019 22:34:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9D479EE2
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:34:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 014C987C
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 22:34:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 15:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="205300605"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2019 15:34:07 -0700
Date: Mon, 28 Oct 2019 15:38:31 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v7 08/11] iommu/vt-d: Misc macro clean up for SVM
Message-ID: <20191028153831.0594d56e@jacob-builder>
In-Reply-To: <c07409eb-83e1-58eb-92d9-7e3c8208d5b7@linux.intel.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-9-git-send-email-jacob.jun.pan@linux.intel.com>
	<c07409eb-83e1-58eb-92d9-7e3c8208d5b7@linux.intel.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	Jonathan Cameron <jic23@kernel.org>
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

On Sat, 26 Oct 2019 09:00:51 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi,
> 
> On 10/25/19 3:55 AM, Jacob Pan wrote:
> > Use combined macros for_each_svm_dev() to simplify SVM device
> > iteration and error checking.
> > 
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > ---
> >   drivers/iommu/intel-svm.c | 89
> > ++++++++++++++++++++++------------------------- 1 file changed, 42
> > insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> > index a9a7f85a09bc..a18b02a9709d 100644
> > --- a/drivers/iommu/intel-svm.c
> > +++ b/drivers/iommu/intel-svm.c
> > @@ -212,6 +212,10 @@ static const struct mmu_notifier_ops
> > intel_mmuops = { static DEFINE_MUTEX(pasid_mutex);
> >   static LIST_HEAD(global_svm_list);
> >   
> > +#define for_each_svm_dev(svm, dev)			\
> > +	list_for_each_entry(sdev, &svm->devs, list)	\
> > +	if (dev == sdev->dev)				\
> > +
> >   int intel_svm_bind_mm(struct device *dev, int *pasid, int flags,
> > struct svm_dev_ops *ops) {
> >   	struct intel_iommu *iommu =
> > intel_svm_device_to_iommu(dev); @@ -257,15 +261,13 @@ int
> > intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct
> > svm_dev_ goto out; }
> >   
> > -			list_for_each_entry(sdev, &svm->devs,
> > list) {
> > -				if (dev == sdev->dev) {
> > -					if (sdev->ops != ops) {
> > -						ret = -EBUSY;
> > -						goto out;
> > -					}
> > -					sdev->users++;
> > -					goto success;
> > +			for_each_svm_dev(svm, dev) {
> > +				if (sdev->ops != ops) {
> > +					ret = -EBUSY;
> > +					goto out;
> >   				}
> > +				sdev->users++;
> > +				goto success;
> >   			}
> >   
> >   			break;
> > @@ -402,50 +404,43 @@ int intel_svm_unbind_mm(struct device *dev,
> > int pasid) goto out;
> >   
> >   	svm = ioasid_find(NULL, pasid, NULL);
> > -	if (IS_ERR(svm)) {
> > +	if (IS_ERR_OR_NULL(svm)) {
> >   		ret = PTR_ERR(svm);
> >   		goto out;
> >   	}
> >   
> > -	if (!svm)
> > -		goto out;  
> 
> If svm == NULL here, this function will return success. This isn't
> expected, right?
> 
you are right, should handle separately.

Thanks!
> Others looks good to me.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> 
> Best regards,
> baolu
> 
> > -
> > -	list_for_each_entry(sdev, &svm->devs, list) {
> > -		if (dev == sdev->dev) {
> > -			ret = 0;
> > -			sdev->users--;
> > -			if (!sdev->users) {
> > -				list_del_rcu(&sdev->list);
> > -				/* Flush the PASID cache and IOTLB
> > for this device.
> > -				 * Note that we do depend on the
> > hardware *not* using
> > -				 * the PASID any more. Just as we
> > depend on other
> > -				 * devices never using PASIDs that
> > they have no right
> > -				 * to use. We have a *shared*
> > PASID table, because it's
> > -				 * large and has to be physically
> > contiguous. So it's
> > -				 * hard to be as defensive as we
> > might like. */
> > -				intel_pasid_tear_down_entry(iommu,
> > dev, svm->pasid);
> > -				intel_flush_svm_range_dev(svm,
> > sdev, 0, -1, 0);
> > -				kfree_rcu(sdev, rcu);
> > -
> > -				if (list_empty(&svm->devs)) {
> > -					/* Clear private data so
> > that free pass check */
> > -
> > ioasid_set_data(svm->pasid, NULL);
> > -					ioasid_free(svm->pasid);
> > -					if (svm->mm)
> > -
> > mmu_notifier_unregister(&svm->notifier, svm->mm); -
> > -					list_del(&svm->list);
> > -
> > -					/* We mandate that no page
> > faults may be outstanding
> > -					 * for the PASID when
> > intel_svm_unbind_mm() is called.
> > -					 * If that is not obeyed,
> > subtle errors will happen.
> > -					 * Let's make them less
> > subtle... */
> > -					memset(svm, 0x6b,
> > sizeof(*svm));
> > -					kfree(svm);
> > -				}
> > +	for_each_svm_dev(svm, dev) {
> > +		ret = 0;
> > +		sdev->users--;
> > +		if (!sdev->users) {
> > +			list_del_rcu(&sdev->list);
> > +			/* Flush the PASID cache and IOTLB for
> > this device.
> > +			 * Note that we do depend on the hardware
> > *not* using
> > +			 * the PASID any more. Just as we depend
> > on other
> > +			 * devices never using PASIDs that they
> > have no right
> > +			 * to use. We have a *shared* PASID table,
> > because it's
> > +			 * large and has to be physically
> > contiguous. So it's
> > +			 * hard to be as defensive as we might
> > like. */
> > +			intel_pasid_tear_down_entry(iommu, dev,
> > svm->pasid);
> > +			intel_flush_svm_range_dev(svm, sdev, 0,
> > -1, 0);
> > +			kfree_rcu(sdev, rcu);
> > +
> > +			if (list_empty(&svm->devs)) {
> > +				/* Clear private data so that free
> > pass check */
> > +				ioasid_set_data(svm->pasid, NULL);
> > +				ioasid_free(svm->pasid);
> > +				if (svm->mm)
> > +
> > mmu_notifier_unregister(&svm->notifier, svm->mm);
> > +				list_del(&svm->list);
> > +				/* We mandate that no page faults
> > may be outstanding
> > +				 * for the PASID when
> > intel_svm_unbind_mm() is called.
> > +				 * If that is not obeyed, subtle
> > errors will happen.
> > +				 * Let's make them less subtle...
> > */
> > +				memset(svm, 0x6b, sizeof(*svm));
> > +				kfree(svm);
> >   			}
> > -			break;
> >   		}
> > +		break;
> >   	}
> >    out:
> >   	mutex_unlock(&pasid_mutex);
> > @@ -581,7 +576,7 @@ static irqreturn_t prq_event_thread(int irq,
> > void *d)
> >   			 * to unbind the mm while any page faults
> > are outstanding.
> >   			 * So we only need RCU to protect the
> > internal idr code. */ rcu_read_unlock();
> > -			if (IS_ERR(svm) || !svm) {
> > +			if (IS_ERR_OR_NULL(svm)) {
> >   				pr_err("%s: Page request for
> > invalid PASID %d: %08llx %08llx\n", iommu->name, req->pasid,
> > ((unsigned long long *)req)[0], ((unsigned long long *)req)[1]);
> >   

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
