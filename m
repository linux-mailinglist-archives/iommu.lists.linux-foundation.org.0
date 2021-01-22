Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C1300375
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 13:51:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 17B77870DE;
	Fri, 22 Jan 2021 12:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxw88rhbBmj7; Fri, 22 Jan 2021 12:51:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E8FD870FA;
	Fri, 22 Jan 2021 12:51:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C39FC013A;
	Fri, 22 Jan 2021 12:51:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0C9EC013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 12:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC41886A88
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 12:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nn0_89Uwb83 for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 12:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B8AE869ED
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 12:51:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47B61230FC;
 Fri, 22 Jan 2021 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611319897;
 bh=yqIm0U8WV/fqdqpmdTQOBRj3ZGpBBlAdYG1vcL0JPdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9z7aFBJq7dCpahomVFCtZTA0NSNOUpa5UIus0RlaX1qAdoUMyqrcuY54oydBVk4Z
 gw2oo5awzra4iB1Mg8RHZ9ex60kMvRCkn5k4nHl50oqnJbx2fAy22ckO0uZx26q7XD
 VpjD9W4uAX/BjL6GKb0lWNhWu5c0auQ+lglyYxvggPfF+VyPh9huV2BLm3X9XTFaoZ
 PRv3XfUWtpJ4Ov/MGcw5r/DDO3r6BTvCIDTTpd+qte5ctdHsop1M6rm51zg6FTw79C
 UavE3egzXEfoCqWmkFtOxKEllbBz2sMShrG8kXcHSlU2WgwVQXpmnVgzSGJ7lrOZZw
 t+aky/vGjivYg==
Date: Fri, 22 Jan 2021 12:51:33 +0000
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: add support for BBML
Message-ID: <20210122125132.GB24102@willie-the-truck>
References: <20201126034230.777-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126034230.777-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Thu, Nov 26, 2020 at 11:42:30AM +0800, Zhen Lei wrote:
> When changing from a set of pages/smaller blocks to a larger block for an
> address, the software should follow the sequence of BBML processing.
> 
> When changing from a block to a set of pages/smaller blocks for an
> address, there's no need to use nT bit. If an address in the large block
> is accessed before page table switching, the TLB caches the large block
> mapping. After the page table is switched and before TLB invalidation
> finished, new access requests are still based on large block mapping.
> After the block or page is invalidated, the system reads the small block
> or page mapping from the memory; If the address in the large block is not
> accessed before page table switching, the TLB has no cache. After the
> page table is switched, a new access is initiated to read the small block
> or page mapping from the memory.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 +
>  drivers/iommu/io-pgtable-arm.c              | 46 ++++++++++++++++-----
>  include/linux/io-pgtable.h                  |  1 +
>  4 files changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index e634bbe60573..14a1a11565fb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1977,6 +1977,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
>  		.tlb		= &arm_smmu_flush_ops,
>  		.iommu_dev	= smmu->dev,
> +		.bbml		= smmu->bbml,
>  	};
>  
>  	if (smmu_domain->non_strict)
> @@ -3291,6 +3292,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  
>  	/* IDR3 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
> +	smmu->bbml = FIELD_GET(IDR3_BBML, reg);
>  	if (FIELD_GET(IDR3_RIL, reg))
>  		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index d4b7f40ccb02..aa7eb460fa09 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -51,6 +51,7 @@
>  #define IDR1_SIDSIZE			GENMASK(5, 0)
>  
>  #define ARM_SMMU_IDR3			0xc
> +#define IDR3_BBML			GENMASK(12, 11)
>  #define IDR3_RIL			(1 << 10)
>  
>  #define ARM_SMMU_IDR5			0x14
> @@ -617,6 +618,7 @@ struct arm_smmu_device {
>  
>  	int				gerr_irq;
>  	int				combined_irq;
> +	int				bbml;
>  
>  	unsigned long			ias; /* IPA */
>  	unsigned long			oas; /* PA */
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..341581337ad0 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -72,6 +72,7 @@
>  
>  #define ARM_LPAE_PTE_NSTABLE		(((arm_lpae_iopte)1) << 63)
>  #define ARM_LPAE_PTE_XN			(((arm_lpae_iopte)3) << 53)
> +#define ARM_LPAE_PTE_nT			(((arm_lpae_iopte)1) << 16)
>  #define ARM_LPAE_PTE_AF			(((arm_lpae_iopte)1) << 10)
>  #define ARM_LPAE_PTE_SH_NS		(((arm_lpae_iopte)0) << 8)
>  #define ARM_LPAE_PTE_SH_OS		(((arm_lpae_iopte)2) << 8)
> @@ -255,7 +256,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>  
>  static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>  				phys_addr_t paddr, arm_lpae_iopte prot,
> -				int lvl, arm_lpae_iopte *ptep)
> +				int lvl, arm_lpae_iopte *ptep, arm_lpae_iopte nT)
>  {
>  	arm_lpae_iopte pte = prot;
>  
> @@ -265,37 +266,60 @@ static void __arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>  		pte |= ARM_LPAE_PTE_TYPE_BLOCK;
>  
>  	pte |= paddr_to_iopte(paddr, data);
> +	pte |= nT;
>  
>  	__arm_lpae_set_pte(ptep, pte, &data->iop.cfg);
>  }
>  
> +static void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
> +				    arm_lpae_iopte *ptep);
>  static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>  			     unsigned long iova, phys_addr_t paddr,
>  			     arm_lpae_iopte prot, int lvl,
>  			     arm_lpae_iopte *ptep)
>  {
>  	arm_lpae_iopte pte = *ptep;
> +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  
>  	if (iopte_leaf(pte, lvl, data->iop.fmt)) {
>  		/* We require an unmap first */
>  		WARN_ON(!selftest_running);
>  		return -EEXIST;
>  	} else if (iopte_type(pte, lvl) == ARM_LPAE_PTE_TYPE_TABLE) {
> -		/*
> -		 * We need to unmap and free the old table before
> -		 * overwriting it with a block entry.
> -		 */
>  		arm_lpae_iopte *tblp;
> +		struct io_pgtable *iop = &data->iop;
>  		size_t sz = ARM_LPAE_BLOCK_SIZE(lvl, data);
>  
> -		tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
> -			WARN_ON(1);
> -			return -EINVAL;
> +		switch (cfg->bbml) {
> +		case 0:
> +			/*
> +			 * We need to unmap and free the old table before
> +			 * overwriting it with a block entry.
> +			 */
> +			tblp = ptep - ARM_LPAE_LVL_IDX(iova, lvl, data);
> +			if (__arm_lpae_unmap(data, NULL, iova, sz, lvl, tblp) != sz) {
> +				WARN_ON(1);
> +				return -EINVAL;
> +			}
> +			break;
> +		case 1:
> +			__arm_lpae_init_pte(data, paddr, prot, lvl, ptep, ARM_LPAE_PTE_nT);
> +
> +			io_pgtable_tlb_flush_walk(iop, iova, sz, ARM_LPAE_GRANULE(data));
> +			tblp = iopte_deref(pte, data);
> +			__arm_lpae_free_pgtable(data, lvl + 1, tblp);
> +			break;
> +		case 2:
> +			__arm_lpae_init_pte(data, paddr, prot, lvl, ptep, 0);
> +
> +			io_pgtable_tlb_flush_walk(iop, iova, sz, ARM_LPAE_GRANULE(data));
> +			tblp = iopte_deref(pte, data);
> +			__arm_lpae_free_pgtable(data, lvl + 1, tblp);
> +			return 0;

Sorry, but I really don't understand what you're trying to do here. The old
code uses BBM for the table -> block path so we don't need anything extra
here. The dodgy case is when we unmap part of a block, and end up installing
a table via arm_lpae_split_blk_unmap(). We can't use BBM there because there
could be ongoing DMA to parts of the block mapping that we want to remain in
place.

Are you seeing a problem in practice?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
