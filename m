Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A21F835A
	for <lists.iommu@lfdr.de>; Sat, 13 Jun 2020 15:07:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58A4588C01;
	Sat, 13 Jun 2020 13:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqbP6-2x7pzS; Sat, 13 Jun 2020 13:07:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35E99880C2;
	Sat, 13 Jun 2020 13:07:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16974C016F;
	Sat, 13 Jun 2020 13:07:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3681AC016F
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3229F87D40
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVgsmsLMj9xP for <iommu@lists.linux-foundation.org>;
 Sat, 13 Jun 2020 13:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EAB9A87D3B
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 13:07:31 +0000 (UTC)
IronPort-SDR: p8ctAfRl8MrKywr8XI0jbYGaDADJ1bLvtYBqCl4HYN67lev0PfMdKODdaqloNzZVtmTRp+xEfv
 L2UOyhE8BtBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2020 06:07:31 -0700
IronPort-SDR: vHst0eXicXHqYEf+pQk0FSDzcIS8JhPFi+JBqhLFRJPdt7Y4MLGJDj+ei71bhsRntiGwHJ+HBH
 NIehc6CkMHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,507,1583222400"; d="scan'208";a="419815734"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.28.93])
 ([10.255.28.93])
 by orsmga004.jf.intel.com with ESMTP; 13 Jun 2020 06:07:25 -0700
Subject: Re: [PATCH v2 11/12] x86/mmu: Allocate/free PASID
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
 <ajd@linux.ibm.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-12-git-send-email-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <59971fe5-31ec-defb-ead6-3e733aa371f7@linux.intel.com>
Date: Sat, 13 Jun 2020 21:07:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1592008893-9388-12-git-send-email-fenghua.yu@intel.com>
Content-Language: en-US
Cc: x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Fenghua,

On 2020/6/13 8:41, Fenghua Yu wrote:
> A PASID is allocated for an "mm" the first time any thread attaches
> to an SVM capable device. Later device attachments (whether to the same
> device or another SVM device) will re-use the same PASID.
> 
> The PASID is freed when the process exits (so no need to keep
> reference counts on how many SVM devices are sharing the PASID).

FYI.

Jean-Philippe Brucker has a patch for mm->pasid management in the vendor
agnostic manner.

https://www.spinics.net/lists/iommu/msg44459.html

Best regards,
baolu

> 
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> v2:
> - Define a helper free_bind() to simplify error exit code in bind_mm()
>    (Thomas)
> - Fix a ret error code in bind_mm() (Thomas)
> - Change pasid's type from "int" to "unsigned int" to have consistent
>    pasid type in iommu (Thomas)
> - Simplify alloc_pasid() a bit.
> 
>   arch/x86/include/asm/iommu.h       |   2 +
>   arch/x86/include/asm/mmu_context.h |  14 ++++
>   drivers/iommu/intel/svm.c          | 101 +++++++++++++++++++++++++----
>   3 files changed, 105 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/x86/include/asm/iommu.h b/arch/x86/include/asm/iommu.h
> index bf1ed2ddc74b..ed41259fe7ac 100644
> --- a/arch/x86/include/asm/iommu.h
> +++ b/arch/x86/include/asm/iommu.h
> @@ -26,4 +26,6 @@ arch_rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
>   	return -EINVAL;
>   }
>   
> +void __free_pasid(struct mm_struct *mm);
> +
>   #endif /* _ASM_X86_IOMMU_H */
> diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
> index 47562147e70b..f8c91ce8c451 100644
> --- a/arch/x86/include/asm/mmu_context.h
> +++ b/arch/x86/include/asm/mmu_context.h
> @@ -13,6 +13,7 @@
>   #include <asm/tlbflush.h>
>   #include <asm/paravirt.h>
>   #include <asm/debugreg.h>
> +#include <asm/iommu.h>
>   
>   extern atomic64_t last_mm_ctx_id;
>   
> @@ -117,9 +118,22 @@ static inline int init_new_context(struct task_struct *tsk,
>   	init_new_context_ldt(mm);
>   	return 0;
>   }
> +
> +static inline void free_pasid(struct mm_struct *mm)
> +{
> +	if (!IS_ENABLED(CONFIG_INTEL_IOMMU_SVM))
> +		return;
> +
> +	if (!cpu_feature_enabled(X86_FEATURE_ENQCMD))
> +		return;
> +
> +	__free_pasid(mm);
> +}
> +
>   static inline void destroy_context(struct mm_struct *mm)
>   {
>   	destroy_context_ldt(mm);
> +	free_pasid(mm);
>   }
>   
>   extern void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index 4e775e12ae52..27dc866b8461 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -425,6 +425,53 @@ int intel_svm_unbind_gpasid(struct device *dev, unsigned int pasid)
>   	return ret;
>   }
>   
> +static void free_bind(struct intel_svm *svm, struct intel_svm_dev *sdev,
> +		      bool new_pasid)
> +{
> +	if (new_pasid)
> +		ioasid_free(svm->pasid);
> +	kfree(svm);
> +	kfree(sdev);
> +}
> +
> +/*
> + * If this mm already has a PASID, use it. Otherwise allocate a new one.
> + * Let the caller know if a new PASID is allocated via 'new_pasid'.
> + */
> +static int alloc_pasid(struct intel_svm *svm, struct mm_struct *mm,
> +		       unsigned int pasid_max, bool *new_pasid,
> +		       unsigned int flags)
> +{
> +	unsigned int pasid;
> +
> +	*new_pasid = false;
> +
> +	/*
> +	 * Reuse the PASID if the mm already has a PASID and not a private
> +	 * PASID is requested.
> +	 */
> +	if (mm && mm->pasid && !(flags & SVM_FLAG_PRIVATE_PASID)) {
> +		/*
> +		 * Once a PASID is allocated for this mm, the PASID
> +		 * stays with the mm until the mm is dropped. Reuse
> +		 * the PASID which has been already allocated for the
> +		 * mm instead of allocating a new one.
> +		 */
> +		ioasid_set_data(mm->pasid, svm);
> +
> +		return mm->pasid;
> +	}
> +
> +	/* Allocate a new pasid. Do not use PASID 0, reserved for init PASID. */
> +	pasid = ioasid_alloc(NULL, PASID_MIN, pasid_max - 1, svm);
> +	if (pasid != INVALID_IOASID) {
> +		/* A new pasid is allocated. */
> +		*new_pasid = true;
> +	}
> +
> +	return pasid;
> +}
> +
>   /* Caller must hold pasid_mutex, mm reference */
>   static int
>   intel_svm_bind_mm(struct device *dev, unsigned int flags,
> @@ -518,6 +565,8 @@ intel_svm_bind_mm(struct device *dev, unsigned int flags,
>   	init_rcu_head(&sdev->rcu);
>   
>   	if (!svm) {
> +		bool new_pasid;
> +
>   		svm = kzalloc(sizeof(*svm), GFP_KERNEL);
>   		if (!svm) {
>   			ret = -ENOMEM;
> @@ -529,12 +578,9 @@ intel_svm_bind_mm(struct device *dev, unsigned int flags,
>   		if (pasid_max > intel_pasid_max_id)
>   			pasid_max = intel_pasid_max_id;
>   
> -		/* Do not use PASID 0, reserved for RID to PASID */
> -		svm->pasid = ioasid_alloc(NULL, PASID_MIN,
> -					  pasid_max - 1, svm);
> +		svm->pasid = alloc_pasid(svm, mm, pasid_max, &new_pasid, flags);
>   		if (svm->pasid == INVALID_IOASID) {
> -			kfree(svm);
> -			kfree(sdev);
> +			free_bind(svm, sdev, new_pasid);
>   			ret = -ENOSPC;
>   			goto out;
>   		}
> @@ -547,9 +593,7 @@ intel_svm_bind_mm(struct device *dev, unsigned int flags,
>   		if (mm) {
>   			ret = mmu_notifier_register(&svm->notifier, mm);
>   			if (ret) {
> -				ioasid_free(svm->pasid);
> -				kfree(svm);
> -				kfree(sdev);
> +				free_bind(svm, sdev, new_pasid);
>   				goto out;
>   			}
>   		}
> @@ -565,12 +609,18 @@ intel_svm_bind_mm(struct device *dev, unsigned int flags,
>   		if (ret) {
>   			if (mm)
>   				mmu_notifier_unregister(&svm->notifier, mm);
> -			ioasid_free(svm->pasid);
> -			kfree(svm);
> -			kfree(sdev);
> +			free_bind(svm, sdev, new_pasid);
>   			goto out;
>   		}
>   
> +		if (mm && new_pasid && !(flags & SVM_FLAG_PRIVATE_PASID)) {
> +			/*
> +			 * Track the new pasid in the mm. The pasid will be
> +			 * freed at process exit. Don't track requested
> +			 * private PASID in the mm.
> +			 */
> +			mm->pasid = svm->pasid;
> +		}
>   		list_add_tail(&svm->list, &global_svm_list);
>   	} else {
>   		/*
> @@ -640,7 +690,8 @@ static int intel_svm_unbind_mm(struct device *dev, unsigned int pasid)
>   			kfree_rcu(sdev, rcu);
>   
>   			if (list_empty(&svm->devs)) {
> -				ioasid_free(svm->pasid);
> +				/* Clear data in the pasid. */
> +				ioasid_set_data(pasid, NULL);
>   				if (svm->mm)
>   					mmu_notifier_unregister(&svm->notifier, svm->mm);
>   				list_del(&svm->list);
> @@ -1001,3 +1052,29 @@ unsigned int intel_svm_get_pasid(struct iommu_sva *sva)
>   
>   	return pasid;
>   }
> +
> +/*
> + * An invalid pasid is either 0 (init PASID value) or bigger than max PASID
> + * (PASID_MAX - 1).
> + */
> +static bool invalid_pasid(unsigned int pasid)
> +{
> +	return (pasid == INIT_PASID) || (pasid >= PASID_MAX);
> +}
> +
> +/* On process exit free the PASID (if one was allocated). */
> +void __free_pasid(struct mm_struct *mm)
> +{
> +	unsigned int pasid = mm->pasid;
> +
> +	/* No need to free invalid pasid. */
> +	if (invalid_pasid(pasid))
> +		return;
> +
> +	/*
> +	 * Since the pasid is not bound to any svm by now, there is no race
> +	 * here with binding/unbinding and no need to protect the free
> +	 * operation by pasid_mutex.
> +	 */
> +	ioasid_free(pasid);
> +}
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
