Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 292ECF5B51
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 23:50:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D08F8D30;
	Fri,  8 Nov 2019 22:50:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 792A0B0B
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:50:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 49DA1196
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 22:50:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2019 14:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; d="scan'208";a="206140788"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
	by orsmga003.jf.intel.com with ESMTP; 08 Nov 2019 14:50:36 -0800
Date: Fri, 8 Nov 2019 14:55:06 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v7 04/11] iommu/vt-d: Replace Intel specific PASID
	allocator with IOASID
Message-ID: <20191108145506.6bcb6f9e@jacob-builder>
In-Reply-To: <b69e22f9-a0cf-51e2-6840-44ac523e9e28@redhat.com>
References: <1571946904-86776-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571946904-86776-5-git-send-email-jacob.jun.pan@linux.intel.com>
	<b69e22f9-a0cf-51e2-6840-44ac523e9e28@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Fri, 8 Nov 2019 12:30:31 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Jacob,
> 
> On 10/24/19 9:54 PM, Jacob Pan wrote:
> > Make use of generic IOASID code to manage PASID allocation,
> > free, and lookup. Replace Intel specific code.
> > 
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/iommu/intel-iommu.c | 12 ++++++------
> >  drivers/iommu/intel-pasid.c | 36
> > ------------------------------------ drivers/iommu/intel-svm.c   |
> > 39 +++++++++++++++++++++++---------------- 3 files changed, 29
> > insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c
> > b/drivers/iommu/intel-iommu.c index ced1d89ef977..2ea09b988a23
> > 100644 --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -5311,7 +5311,7 @@ static void auxiliary_unlink_device(struct
> > dmar_domain *domain, domain->auxd_refcnt--;
> >  
> >  	if (!domain->auxd_refcnt && domain->default_pasid > 0)
> > -		intel_pasid_free_id(domain->default_pasid);
> > +		ioasid_free(domain->default_pasid);
> >  }
> >  
> >  static int aux_domain_add_dev(struct dmar_domain *domain,
> > @@ -5329,10 +5329,10 @@ static int aux_domain_add_dev(struct
> > dmar_domain *domain, if (domain->default_pasid <= 0) {
> >  		int pasid;
> >  
> > -		pasid = intel_pasid_alloc_id(domain, PASID_MIN,
> > -
> > pci_max_pasids(to_pci_dev(dev)),
> > -					     GFP_KERNEL);
> > -		if (pasid <= 0) {
> > +		/* No private data needed for the default pasid */
> > +		pasid = ioasid_alloc(NULL, PASID_MIN,
> > pci_max_pasids(to_pci_dev(dev)) - 1,
> > +				NULL);
> > +		if (pasid == INVALID_IOASID) {
> >  			pr_err("Can't allocate default pasid\n");
> >  			return -ENODEV;
> >  		}
> > @@ -5368,7 +5368,7 @@ static int aux_domain_add_dev(struct
> > dmar_domain *domain, spin_unlock(&iommu->lock);
> >  	spin_unlock_irqrestore(&device_domain_lock, flags);
> >  	if (!domain->auxd_refcnt && domain->default_pasid > 0)
> > -		intel_pasid_free_id(domain->default_pasid);
> > +		ioasid_free(domain->default_pasid);
> >  
> >  	return ret;
> >  }
> > diff --git a/drivers/iommu/intel-pasid.c
> > b/drivers/iommu/intel-pasid.c index d81e857d2b25..e79d680fe300
> > 100644 --- a/drivers/iommu/intel-pasid.c
> > +++ b/drivers/iommu/intel-pasid.c
> > @@ -26,42 +26,6 @@
> >   */
> >  static DEFINE_SPINLOCK(pasid_lock);
> >  u32 intel_pasid_max_id = PASID_MAX;
> > -static DEFINE_IDR(pasid_idr);
> > -
> > -int intel_pasid_alloc_id(void *ptr, int start, int end, gfp_t gfp)
> > -{
> > -	int ret, min, max;
> > -
> > -	min = max_t(int, start, PASID_MIN);
> > -	max = min_t(int, end, intel_pasid_max_id);
> > -
> > -	WARN_ON(in_interrupt());
> > -	idr_preload(gfp);
> > -	spin_lock(&pasid_lock);
> > -	ret = idr_alloc(&pasid_idr, ptr, min, max, GFP_ATOMIC);
> > -	spin_unlock(&pasid_lock);
> > -	idr_preload_end();
> > -
> > -	return ret;
> > -}
> > -
> > -void intel_pasid_free_id(int pasid)
> > -{
> > -	spin_lock(&pasid_lock);
> > -	idr_remove(&pasid_idr, pasid);
> > -	spin_unlock(&pasid_lock);
> > -}
> > -
> > -void *intel_pasid_lookup_id(int pasid)
> > -{
> > -	void *p;
> > -
> > -	spin_lock(&pasid_lock);
> > -	p = idr_find(&pasid_idr, pasid);
> > -	spin_unlock(&pasid_lock);
> > -
> > -	return p;
> > -}
> >  
> >  int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int
> > *pasid) {
> > diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> > index 9b159132405d..a9a7f85a09bc 100644
> > --- a/drivers/iommu/intel-svm.c
> > +++ b/drivers/iommu/intel-svm.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/dmar.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/mm_types.h>
> > +#include <linux/ioasid.h>
> >  #include <asm/page.h>
> >  
> >  #include "intel-pasid.h"
> > @@ -318,16 +319,15 @@ int intel_svm_bind_mm(struct device *dev, int
> > *pasid, int flags, struct svm_dev_ if (pasid_max >
> > intel_pasid_max_id) pasid_max = intel_pasid_max_id;
> >  
> > -		/* Do not use PASID 0 in caching mode (virtualised
> > IOMMU) */
> > -		ret = intel_pasid_alloc_id(svm,
> > -					   !!cap_caching_mode(iommu->cap),
> > -					   pasid_max - 1,
> > GFP_KERNEL);
> > -		if (ret < 0) {
> > +		/* Do not use PASID 0, reserved for RID to PASID */
> > +		svm->pasid = ioasid_alloc(NULL, PASID_MIN,
> > +					pasid_max - 1, svm);  
> pasid_max -1 is inclusive. whereas max param in intel_pasid_alloc_id()
> is exclusive right? If you fixed an issue, you can mention it in the
> commit message.
yes, i should mention that. intel_pasid_alloc_id() uses IDR which is
end exclusive. ioasid uses xarray, which is inclusive. 
> > +		if (svm->pasid == INVALID_IOASID) {  
> >  			kfree(svm);>
> > kfree(sdev);  
> > +			ret = ENOSPC;  
> -ENOSPC.
> Nit: in 2/11 vcmd_alloc_pasid returned -ENOMEM
yes, it should be -ENOSPC as well.

> >  			goto out;
> >  		}
> > -		svm->pasid = ret;
> >  		svm->notifier.ops = &intel_mmuops;
> >  		svm->mm = mm;
> >  		svm->flags = flags;
> > @@ -337,7 +337,7 @@ int intel_svm_bind_mm(struct device *dev, int
> > *pasid, int flags, struct svm_dev_ if (mm) {
> >  			ret =
> > mmu_notifier_register(&svm->notifier, mm); if (ret) {
> > -				intel_pasid_free_id(svm->pasid);
> > +				ioasid_free(svm->pasid);
> >  				kfree(svm);
> >  				kfree(sdev);
> >  				goto out;
> > @@ -353,7 +353,7 @@ int intel_svm_bind_mm(struct device *dev, int
> > *pasid, int flags, struct svm_dev_ if (ret) {
> >  			if (mm)
> >  				mmu_notifier_unregister(&svm->notifier,
> > mm);
> > -			intel_pasid_free_id(svm->pasid);
> > +			ioasid_free(svm->pasid);
> >  			kfree(svm);
> >  			kfree(sdev);
> >  			goto out;
> > @@ -401,7 +401,12 @@ int intel_svm_unbind_mm(struct device *dev,
> > int pasid) if (!iommu)
> >  		goto out;
> >  
> > -	svm = intel_pasid_lookup_id(pasid);
> > +	svm = ioasid_find(NULL, pasid, NULL);
> > +	if (IS_ERR(svm)) {
> > +		ret = PTR_ERR(svm);
> > +		goto out;
> > +	}
> > +
> >  	if (!svm)
> >  		goto out;
> >  
> > @@ -423,7 +428,9 @@ int intel_svm_unbind_mm(struct device *dev, int
> > pasid) kfree_rcu(sdev, rcu);
> >  
> >  				if (list_empty(&svm->devs)) {
> > -
> > intel_pasid_free_id(svm->pasid);
> > +					/* Clear private data so
> > that free pass check */> +
> > ioasid_set_data(svm->pasid, NULL);  
> I don't get the above comment. Why is it needed?
Having private data associated with an IOASID is an indicator that this
IOASID is busy. So we have to clear it to signal it is free.
Actually, I am planning to introduce a refcount per IOASID since there
will be multiple users of IOASID, e.g. IOMMU driver and KVM. When
refcount == 0, we can free.

> > +					ioasid_free(svm->pasid);
> >  					if (svm->mm)
> >  						mmu_notifier_unregister(&svm->notifier,
> > svm->mm); 
> > @@ -458,10 +465,11 @@ int intel_svm_is_pasid_valid(struct device
> > *dev, int pasid) if (!iommu)
> >  		goto out;
> >  
> > -	svm = intel_pasid_lookup_id(pasid);
> > -	if (!svm)
> > +	svm = ioasid_find(NULL, pasid, NULL);
> > +	if (IS_ERR(svm)) {
> > +		ret = PTR_ERR(svm);
> >  		goto out;
> > -
> > +	}
> >  	/* init_mm is used in this case */
> >  	if (!svm->mm)
> >  		ret = 1;
> > @@ -568,13 +576,12 @@ static irqreturn_t prq_event_thread(int irq,
> > void *d) 
> >  		if (!svm || svm->pasid != req->pasid) {
> >  			rcu_read_lock();
> > -			svm = intel_pasid_lookup_id(req->pasid);
> > +			svm = ioasid_find(NULL, req->pasid, NULL);
> >  			/* It *can't* go away, because the driver
> > is not permitted
> >  			 * to unbind the mm while any page faults
> > are outstanding.
> >  			 * So we only need RCU to protect the
> > internal idr code. */ rcu_read_unlock();
> > -
> > -			if (!svm) {
> > +			if (IS_ERR(svm) || !svm) {
> >  				pr_err("%s: Page request for
> > invalid PASID %d: %08llx %08llx\n", iommu->name, req->pasid,
> > ((unsigned long long *)req)[0], ((unsigned long long *)req)[1]);
> >   
> Thanks
> 
> Eric
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
