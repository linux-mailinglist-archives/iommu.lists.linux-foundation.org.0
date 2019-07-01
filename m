Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB25792F
	for <lists.iommu@lfdr.de>; Thu, 27 Jun 2019 04:00:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8124CE46;
	Thu, 27 Jun 2019 02:00:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03E8ECDE
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 02:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 338C13D0
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 02:00:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jun 2019 19:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,422,1557212400"; d="scan'208";a="337421637"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga005.jf.intel.com with ESMTP; 26 Jun 2019 19:00:39 -0700
Subject: Re: [PATCH v4 15/22] iommu/vt-d: Replace Intel specific PASID
	allocator with IOASID
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1560087862-57608-16-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1cffc7c7-b71b-767a-a35f-d6063dc64b2b@linux.intel.com>
Date: Thu, 27 Jun 2019 09:53:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560087862-57608-16-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Jacob,

On 6/9/19 9:44 PM, Jacob Pan wrote:
> Make use of generic IOASID code to manage PASID allocation,
> free, and lookup. Replace Intel specific code.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>   drivers/iommu/intel-iommu.c | 11 +++++------
>   drivers/iommu/intel-pasid.c | 36 ------------------------------------
>   drivers/iommu/intel-svm.c   | 37 +++++++++++++++++++++----------------
>   3 files changed, 26 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 5b84994..39b63fe 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5167,7 +5167,7 @@ static void auxiliary_unlink_device(struct dmar_domain *domain,
>   	domain->auxd_refcnt--;
>   
>   	if (!domain->auxd_refcnt && domain->default_pasid > 0)
> -		intel_pasid_free_id(domain->default_pasid);
> +		ioasid_free(domain->default_pasid);
>   }
>   
>   static int aux_domain_add_dev(struct dmar_domain *domain,
> @@ -5185,10 +5185,9 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
>   	if (domain->default_pasid <= 0) {
>   		int pasid;
>   
> -		pasid = intel_pasid_alloc_id(domain, PASID_MIN,
> -					     pci_max_pasids(to_pci_dev(dev)),
> -					     GFP_KERNEL);
> -		if (pasid <= 0) {
> +		pasid = ioasid_alloc(NULL, PASID_MIN, pci_max_pasids(to_pci_dev(dev)) - 1,
> +				domain);
> +		if (pasid == INVALID_IOASID) {
>   			pr_err("Can't allocate default pasid\n");
>   			return -ENODEV;
>   		}
> @@ -5224,7 +5223,7 @@ static int aux_domain_add_dev(struct dmar_domain *domain,
>   	spin_unlock(&iommu->lock);
>   	spin_unlock_irqrestore(&device_domain_lock, flags);
>   	if (!domain->auxd_refcnt && domain->default_pasid > 0)
> -		intel_pasid_free_id(domain->default_pasid);
> +		ioasid_free(domain->default_pasid);
>   
>   	return ret;
>   }
> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
> index 69fddd3..1e25539 100644
> --- a/drivers/iommu/intel-pasid.c
> +++ b/drivers/iommu/intel-pasid.c
> @@ -26,42 +26,6 @@
>    */
>   static DEFINE_SPINLOCK(pasid_lock);
>   u32 intel_pasid_max_id = PASID_MAX;
> -static DEFINE_IDR(pasid_idr);
> -
> -int intel_pasid_alloc_id(void *ptr, int start, int end, gfp_t gfp)
> -{
> -	int ret, min, max;
> -
> -	min = max_t(int, start, PASID_MIN);
> -	max = min_t(int, end, intel_pasid_max_id);
> -
> -	WARN_ON(in_interrupt());
> -	idr_preload(gfp);
> -	spin_lock(&pasid_lock);
> -	ret = idr_alloc(&pasid_idr, ptr, min, max, GFP_ATOMIC);
> -	spin_unlock(&pasid_lock);
> -	idr_preload_end();
> -
> -	return ret;
> -}
> -
> -void intel_pasid_free_id(int pasid)
> -{
> -	spin_lock(&pasid_lock);
> -	idr_remove(&pasid_idr, pasid);
> -	spin_unlock(&pasid_lock);
> -}
> -
> -void *intel_pasid_lookup_id(int pasid)
> -{
> -	void *p;
> -
> -	spin_lock(&pasid_lock);
> -	p = idr_find(&pasid_idr, pasid);
> -	spin_unlock(&pasid_lock);
> -
> -	return p;
> -}
>   
>   int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int *pasid)
>   {
> diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> index 8f87304..9cbcc1f 100644
> --- a/drivers/iommu/intel-svm.c
> +++ b/drivers/iommu/intel-svm.c
> @@ -25,6 +25,7 @@
>   #include <linux/dmar.h>
>   #include <linux/interrupt.h>
>   #include <linux/mm_types.h>
> +#include <linux/ioasid.h>
>   #include <asm/page.h>
>   
>   #include "intel-pasid.h"
> @@ -332,16 +333,15 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
>   		if (pasid_max > intel_pasid_max_id)
>   			pasid_max = intel_pasid_max_id;
>   
> -		/* Do not use PASID 0 in caching mode (virtualised IOMMU) */
> -		ret = intel_pasid_alloc_id(svm,
> -					   !!cap_caching_mode(iommu->cap),
> -					   pasid_max - 1, GFP_KERNEL);
> -		if (ret < 0) {
> +		/* Do not use PASID 0, reserved for RID to PASID */
> +		svm->pasid = ioasid_alloc(NULL, PASID_MIN,
> +					pasid_max - 1, svm);
> +		if (svm->pasid == INVALID_IOASID) {
>   			kfree(svm);
>   			kfree(sdev);
> +			ret = ENOSPC;
>   			goto out;
>   		}
> -		svm->pasid = ret;
>   		svm->notifier.ops = &intel_mmuops;
>   		svm->mm = mm;
>   		svm->flags = flags;
> @@ -351,7 +351,7 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
>   		if (mm) {
>   			ret = mmu_notifier_register(&svm->notifier, mm);
>   			if (ret) {
> -				intel_pasid_free_id(svm->pasid);
> +				ioasid_free(svm->pasid);
>   				kfree(svm);
>   				kfree(sdev);
>   				goto out;
> @@ -367,7 +367,7 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
>   		if (ret) {
>   			if (mm)
>   				mmu_notifier_unregister(&svm->notifier, mm);
> -			intel_pasid_free_id(svm->pasid);
> +			ioasid_free(svm->pasid);
>   			kfree(svm);
>   			kfree(sdev);
>   			goto out;
> @@ -400,7 +400,12 @@ int intel_svm_unbind_mm(struct device *dev, int pasid)
>   	if (!iommu)
>   		goto out;
>   
> -	svm = intel_pasid_lookup_id(pasid);
> +	svm = ioasid_find(NULL, pasid, NULL);
> +	if (IS_ERR(svm)) {
> +		ret = PTR_ERR(svm);
> +		goto out;
> +	}
> +
>   	if (!svm)
>   		goto out;
>   

How about using IS_ERR_OR_NULL() here?

> @@ -422,7 +427,7 @@ int intel_svm_unbind_mm(struct device *dev, int pasid)
>   				kfree_rcu(sdev, rcu);
>   
>   				if (list_empty(&svm->devs)) {
> -					intel_pasid_free_id(svm->pasid);
> +					ioasid_free(svm->pasid);
>   					if (svm->mm)
>   						mmu_notifier_unregister(&svm->notifier, svm->mm);
>   
> @@ -457,10 +462,11 @@ int intel_svm_is_pasid_valid(struct device *dev, int pasid)
>   	if (!iommu)
>   		goto out;
>   
> -	svm = intel_pasid_lookup_id(pasid);
> -	if (!svm)
> +	svm = ioasid_find(NULL, pasid, NULL);
> +	if (IS_ERR(svm)) {

Same here.

> +		ret = PTR_ERR(svm);
>   		goto out;
> -
> +	}
>   	/* init_mm is used in this case */
>   	if (!svm->mm)
>   		ret = 1;
> @@ -567,13 +573,12 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>   
>   		if (!svm || svm->pasid != req->pasid) {
>   			rcu_read_lock();
> -			svm = intel_pasid_lookup_id(req->pasid);
> +			svm = ioasid_find(NULL, req->pasid, NULL);
>   			/* It *can't* go away, because the driver is not permitted
>   			 * to unbind the mm while any page faults are outstanding.
>   			 * So we only need RCU to protect the internal idr code. */
>   			rcu_read_unlock();
> -
> -			if (!svm) {
> +			if (IS_ERR(svm) || !svm) {

Ditto.

>   				pr_err("%s: Page request for invalid PASID %d: %08llx %08llx\n",
>   				       iommu->name, req->pasid, ((unsigned long long *)req)[0],
>   				       ((unsigned long long *)req)[1]);
> 

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
