Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3231C08CB
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 23:10:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B06F25279;
	Thu, 30 Apr 2020 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s804K3LArW-R; Thu, 30 Apr 2020 21:10:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2828525281;
	Thu, 30 Apr 2020 21:10:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E2B2C016F;
	Thu, 30 Apr 2020 21:10:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EB9BC016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6707A88871
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vjbCEkaHQ2G for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 21:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E29248886D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 21:10:15 +0000 (UTC)
IronPort-SDR: bGtElUGTgXkIn/eVMtvmfUg0M0PMRlkhDgsl+nlMvMdXTCMh6k2bYOGS1W4pAHjIEkzrSslbYV
 wvWieHTmFxAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 14:10:14 -0700
IronPort-SDR: rMyFru6ygd/4Pb86NBUPiwU+TSBA2noZt2VYVFyTo3OZHtuwptkoi8s1u1Z3ldXwCd8RNpiygs
 Z5SpE9BM47eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="247319487"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga007.jf.intel.com with ESMTP; 30 Apr 2020 14:10:14 -0700
Date: Thu, 30 Apr 2020 14:16:17 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v6 17/25] iommu/arm-smmu-v3: Implement
 iommu_sva_bind/unbind()
Message-ID: <20200430141617.6ad4be4c@jacob-builder>
In-Reply-To: <20200430143424.2787566-18-jean-philippe@linaro.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-18-jean-philippe@linaro.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, robin.murphy@arm.com, fenghua.yu@intel.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, catalin.marinas@arm.com, felix.kuehling@amd.com,
 will@kernel.org, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jean,

A couple question on how SMMU handles CD.v and translation disable.

On Thu, 30 Apr 2020 16:34:16 +0200
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> The sva_bind() function allows devices to access process address
> spaces using a PASID (aka SSID).
> 
> (1) bind() allocates or gets an existing MMU notifier tied to the
>     (domain, mm) pair. Each mm gets one PASID.
> 
> (2) Any change to the address space calls invalidate_range() which
> sends ATC invalidations (in a subsequent patch).
> 
> (3) When the process address space dies, the release() notifier
> disables the CD to allow reclaiming the page tables. Since release()
> has to be light we do not instruct device drivers to stop DMA here,
> we just ignore incoming page faults.
> 
>     To avoid any event 0x0a print (C_BAD_CD) we disable translation
>     without clearing CD.V. PCIe Translation Requests and Page Requests
>     are silently denied. Don't clear the R bit because the S bit can't
>     be cleared when STALL_MODEL==0b10 (forced), and clearing R without
>     clearing S is useless. Faulting transactions will stall and will
> be aborted by the IOPF handler.
> 
> (4) After stopping DMA, the device driver releases the bond by calling
>     unbind(). We release the MMU notifier, free the PASID and the
> bond.
> 
> Three structures keep track of bonds:
> * arm_smmu_bond: one per (device, mm) pair, the handle returned to the
>   device driver for a bind() request.
> * arm_smmu_mmu_notifier: one per (domain, mm) pair, deals with ATS/TLB
>   invalidations and clearing the context descriptor on mm exit.
> * arm_smmu_ctx_desc: one per mm, holds the pinned ASID and pgd.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v5->v6:
> * Implement bind() directly instead of going through io_mm_ops
> * Don't clear S and R bits in step (3), it doesn't work with
>   STALL_FORCE.
> ---
>  drivers/iommu/Kconfig       |   1 +
>  drivers/iommu/arm-smmu-v3.c | 256
> +++++++++++++++++++++++++++++++++++- 2 files changed, 253
> insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 1e64ee6592e16..f863c4562feeb 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -432,6 +432,7 @@ config ARM_SMMU_V3
>  	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
>  	depends on ARM64
>  	select IOMMU_API
> +	select IOMMU_SVA
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select GENERIC_MSI_IRQ_DOMAIN
>  	help
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index c7942d0540599..00e5b69bb81a5 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -24,6 +24,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/mmu_context.h>
> +#include <linux/mmu_notifier.h>
>  #include <linux/msi.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -36,6 +37,7 @@
>  #include <linux/amba/bus.h>
>  
>  #include "io-pgtable-arm.h"
> +#include "iommu-sva.h"
>  
>  /* MMIO registers */
>  #define ARM_SMMU_IDR0			0x0
> @@ -731,8 +733,31 @@ struct arm_smmu_domain {
>  
>  	struct list_head		devices;
>  	spinlock_t			devices_lock;
> +
> +	struct mmu_notifier_ops		mn_ops;
>  };
>  
> +struct arm_smmu_mmu_notifier {
> +	struct mmu_notifier		mn;
> +	struct arm_smmu_ctx_desc	*cd;
> +	bool				cleared;
> +	refcount_t			refs;
> +	struct arm_smmu_domain		*domain;
> +};
> +
> +#define mn_to_smmu(mn) container_of(mn, struct
> arm_smmu_mmu_notifier, mn) +
> +struct arm_smmu_bond {
> +	struct iommu_sva		sva;
> +	struct mm_struct		*mm;
> +	struct arm_smmu_mmu_notifier	*smmu_mn;
> +	struct list_head		list;
> +	refcount_t			refs;
> +};
> +
> +#define sva_to_bond(handle) \
> +	container_of(handle, struct arm_smmu_bond, sva)
> +
>  struct arm_smmu_option_prop {
>  	u32 opt;
>  	const char *prop;
> @@ -742,6 +767,13 @@ static DEFINE_XARRAY_ALLOC1(asid_xa);
>  static DEFINE_SPINLOCK(contexts_lock);
>  static DEFINE_MUTEX(arm_smmu_sva_lock);
>  
> +/*
> + * When a process dies, DMA is still running but we need to clear
> the pgd. If we
> + * simply cleared the valid bit from the context descriptor, we'd
> get event 0x0a
> + * which are not recoverable.
> + */
> +static struct arm_smmu_ctx_desc invalid_cd = { 0 };
> +
>  static struct arm_smmu_option_prop arm_smmu_options[] = {
>  	{ ARM_SMMU_OPT_SKIP_PREFETCH,
> "hisilicon,broken-prefetch-cmd" }, { ARM_SMMU_OPT_PAGE0_REGS_ONLY,
> "cavium,cn9900-broken-page1-regspace"}, @@ -1652,7 +1684,9 @@ static
> int __arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
>  	 * (2) Install a secondary CD, for SID+SSID traffic.
>  	 * (3) Update ASID of a CD. Atomically write the first 64
> bits of the
>  	 *     CD, then invalidate the old entry and mappings.
> -	 * (4) Remove a secondary CD.
> +	 * (4) Quiesce the context without clearing the valid bit.
> Disable
> +	 *     translation, and ignore any translation fault.
> +	 * (5) Remove a secondary CD.
>  	 */
>  	u64 val;
>  	bool cd_live;
> @@ -1669,8 +1703,10 @@ static int __arm_smmu_write_ctx_desc(struct
> arm_smmu_domain *smmu_domain, val = le64_to_cpu(cdptr[0]);
>  	cd_live = !!(val & CTXDESC_CD_0_V);
>  
> -	if (!cd) { /* (4) */
> +	if (!cd) { /* (5) */
>  		val = 0;
> +	} else if (cd == &invalid_cd) { /* (4) */
> +		val |= CTXDESC_CD_0_TCR_EPD0;
>  	} else if (cd_live) { /* (3) */
>  		val &= ~CTXDESC_CD_0_ASID;
>  		val |= FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid);
> @@ -1883,7 +1919,6 @@ static struct arm_smmu_ctx_desc
> *arm_smmu_share_asid(u16 asid) return NULL;
>  }
>  
> -__maybe_unused
>  static struct arm_smmu_ctx_desc *arm_smmu_alloc_shared_cd(struct
> mm_struct *mm) {
>  	u16 asid;
> @@ -1976,7 +2011,6 @@ static struct arm_smmu_ctx_desc
> *arm_smmu_alloc_shared_cd(struct mm_struct *mm) return ERR_PTR(ret);
>  }
>  
> -__maybe_unused
>  static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
>  {
>  	if (arm_smmu_free_asid(cd)) {
> @@ -2611,6 +2645,8 @@ static bool arm_smmu_capable(enum iommu_cap cap)
>  	}
>  }
>  
> +static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops;
> +
>  static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>  {
>  	struct arm_smmu_domain *smmu_domain;
> @@ -2638,6 +2674,7 @@ static struct iommu_domain
> *arm_smmu_domain_alloc(unsigned type)
> mutex_init(&smmu_domain->init_mutex);
> INIT_LIST_HEAD(&smmu_domain->devices);
> spin_lock_init(&smmu_domain->devices_lock);
> +	smmu_domain->mn_ops = arm_smmu_mmu_notifier_ops;
>  
>  	return &smmu_domain->domain;
>  }
> @@ -3118,6 +3155,208 @@ arm_smmu_iova_to_phys(struct iommu_domain
> *domain, dma_addr_t iova) return ops->iova_to_phys(ops, iova);
>  }
>  
> +static struct mmu_notifier *arm_smmu_mmu_notifier_alloc(struct
> mm_struct *mm) +{
> +	struct arm_smmu_mmu_notifier *smmu_mn;
> +
> +	smmu_mn = kzalloc(sizeof(*smmu_mn), GFP_KERNEL);
> +	if (!smmu_mn)
> +		return ERR_PTR(-ENOMEM);
> +
> +	smmu_mn->cd = arm_smmu_alloc_shared_cd(mm);
> +	if (IS_ERR(smmu_mn->cd)) {
> +		void *ptr = ERR_CAST(smmu_mn->cd);
> +
> +		kfree(smmu_mn);
> +		return ptr;
> +	}
> +	refcount_set(&smmu_mn->refs, 1);
> +
> +	return &smmu_mn->mn;
> +}
> +
> +static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
> +{
> +	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
> +
> +	arm_smmu_free_shared_cd(smmu_mn->cd);
> +	kfree(smmu_mn);
> +}
> +
> +static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
> +					 struct mm_struct *mm,
> +					 unsigned long start,
> unsigned long end) +{
> +	/* TODO: invalidate ATS */
> +}
> +
> +static void arm_smmu_mm_release(struct mmu_notifier *mn, struct
> mm_struct *mm) +{
> +	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
> +	struct arm_smmu_domain *smmu_domain;
> +
> +	mutex_lock(&arm_smmu_sva_lock);
> +	if (smmu_mn->cleared) {
> +		mutex_unlock(&arm_smmu_sva_lock);
> +		return;
> +	}
> +
> +	smmu_domain = smmu_mn->domain;
> +
> +	/*
> +	 * DMA may still be running. Keep the cd valid but disable
> +	 * translation, so that new events will still result in
> stall.
> +	 */
Does "disable translation" also disable translated requests? I guess
release is called after tlb invalidate range, so assuming no more
devTLB left to generate translated request?

> +	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, &invalid_cd);
> +
> +	arm_smmu_tlb_inv_asid(smmu_domain->smmu, smmu_mn->cd->asid);
> +	/* TODO: invalidate ATS */
> +
If mm release is called after tlb invalidate range, is it still
necessary to invalidate again?

> +	smmu_mn->cleared = true;
> +	mutex_unlock(&arm_smmu_sva_lock);
> +}
> +
> +static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
> +	.alloc_notifier		= arm_smmu_mmu_notifier_alloc,
> +	.free_notifier		= arm_smmu_mmu_notifier_free,
> +	.invalidate_range	= arm_smmu_mm_invalidate_range,
> +	.release		= arm_smmu_mm_release,
> +};
> +
> +static struct iommu_sva *
> +__arm_smmu_sva_bind(struct device *dev, struct mm_struct *mm)
> +{
> +	int ret;
> +	ioasid_t pasid;
> +	struct mmu_notifier *mn;
> +	struct arm_smmu_bond *bond;
> +	struct arm_smmu_mmu_notifier *smmu_mn;
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	if (!master || !master->sva_enabled)
> +		return ERR_PTR(-ENODEV);
> +
> +	/* If bind() was already called for this (dev, mm) pair,
> reuse it. */
> +	list_for_each_entry(bond, &master->bonds, list) {
> +		if (bond->mm == mm) {
> +			refcount_inc(&bond->refs);
> +			return &bond->sva;
> +		}
> +	}
> +
> +	mn = mmu_notifier_get(&smmu_domain->mn_ops, mm);
> +	if (IS_ERR(mn))
> +		return ERR_CAST(mn);
> +
> +	smmu_mn = mn_to_smmu(mn);
> +	if (smmu_mn->domain)
> +		refcount_inc(&smmu_mn->refs);
> +
> +	bond = kzalloc(sizeof(*bond), GFP_KERNEL);
> +	if (!bond) {
> +		ret = -ENOMEM;
> +		goto err_put_mn;
> +	}
> +
> +	/* Allocate a PASID for this mm if necessary */
> +	pasid = iommu_sva_alloc_pasid(mm, 1, (1U <<
> master->ssid_bits) - 1);
> +	if (pasid == INVALID_IOASID) {
> +		ret = -ENOSPC;
> +		goto err_free_bond;
> +	}
> +	bond->mm = mm;
> +	bond->sva.dev = dev;
> +	bond->smmu_mn = smmu_mn;
> +	refcount_set(&bond->refs, 1);
> +
> +	ret = arm_smmu_write_ctx_desc(smmu_domain, mm->pasid,
> smmu_mn->cd);
> +	if (ret)
> +		goto err_free_pasid;
> +
> +	bond->sva.dev = dev;
> +	list_add(&bond->list, &master->bonds);
> +	smmu_mn->domain = smmu_domain;
> +	return &bond->sva;
> +
> +err_free_pasid:
> +	iommu_sva_free_pasid(mm);
> +err_free_bond:
> +	kfree(bond);
> +err_put_mn:
> +	refcount_dec(&smmu_mn->refs);
> +	mmu_notifier_put(mn);
> +	return ERR_PTR(ret);
> +}
> +
> +static void __arm_smmu_sva_unbind(struct iommu_sva *handle)
> +{
> +	struct arm_smmu_mmu_notifier *smmu_mn;
> +	struct arm_smmu_bond *bond = sva_to_bond(handle);
> +	struct iommu_domain *domain =
> iommu_get_domain_for_dev(handle->dev);
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	if (!refcount_dec_and_test(&bond->refs))
> +		return;
> +
> +	list_del(&bond->list);
> +
> +	smmu_mn = bond->smmu_mn;
> +	/*
> +	 * This is redundant as the MMU notifier already counts
> refs, but frees
> +	 * the bond in a RCU callback which cannot sleep. We have
> much cleaning
> +	 * to do and we hold all the right locks, so duplicate the
> refcounting.
> +	 */
> +	if (refcount_dec_and_test(&smmu_mn->refs)) {
> +		arm_smmu_write_ctx_desc(smmu_domain,
> bond->mm->pasid, NULL); +
> +		/*
> +		 * If we went through clear(), we've already
> invalidated, and no
> +		 * new TLB entry can have been formed.
> +		 */
> +		if (!smmu_mn->cleared) {
> +			arm_smmu_tlb_inv_asid(smmu_domain->smmu,
> +					      smmu_mn->cd->asid);
> +			/* TODO: invalidate ATS */
> +		}
> +	}
> +
> +	iommu_sva_free_pasid(bond->mm);
> +	kfree(bond);
> +	mmu_notifier_put(&smmu_mn->mn);
> +}
> +
> +static struct iommu_sva *
> +arm_smmu_sva_bind(struct device *dev, struct mm_struct *mm, void
> *drvdata) +{
> +	struct iommu_sva *handle;
> +	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&arm_smmu_sva_lock);
> +	handle = __arm_smmu_sva_bind(dev, mm);
> +	mutex_unlock(&arm_smmu_sva_lock);
> +	return handle;
> +}
> +
> +static void arm_smmu_sva_unbind(struct iommu_sva *handle)
> +{
> +	mutex_lock(&arm_smmu_sva_lock);
> +	__arm_smmu_sva_unbind(handle);
> +	mutex_unlock(&arm_smmu_sva_lock);
> +}
> +
> +static int arm_smmu_sva_get_pasid(struct iommu_sva *handle)
> +{
> +	struct arm_smmu_bond *bond = sva_to_bond(handle);
> +
> +	return bond->mm->pasid;
> +}
> +
>  static struct platform_driver arm_smmu_driver;
>  
>  static
> @@ -3426,6 +3665,12 @@ static int arm_smmu_dev_disable_sva(struct
> device *dev) master->sva_enabled = false;
>  	mutex_unlock(&arm_smmu_sva_lock);
>  
> +	/*
> +	 * Since the MMU notifier ops are held in the domain, it is
> not safe to
> +	 * free the domain until all MMU notifiers are freed.
> +	 */
> +	mmu_notifier_synchronize();
> +
>  	return 0;
>  }
>  
> @@ -3482,6 +3727,9 @@ static struct iommu_ops arm_smmu_ops = {
>  	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
>  	.dev_enable_feat	= arm_smmu_dev_enable_feature,
>  	.dev_disable_feat	= arm_smmu_dev_disable_feature,
> +	.sva_bind		= arm_smmu_sva_bind,
> +	.sva_unbind		= arm_smmu_sva_unbind,
> +	.sva_get_pasid		= arm_smmu_sva_get_pasid,
>  	.pgsize_bitmap		= -1UL, /* Restricted during
> device attach */ };
>  

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
