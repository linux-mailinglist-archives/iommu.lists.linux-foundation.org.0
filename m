Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F045164B00
	for <lists.iommu@lfdr.de>; Wed, 10 Jul 2019 18:55:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 14B584723;
	Wed, 10 Jul 2019 16:55:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 446774563
	for <iommu@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 16:45:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E97FF88E
	for <iommu@lists.linux-foundation.org>;
	Wed, 10 Jul 2019 16:45:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C288344;
	Wed, 10 Jul 2019 09:45:40 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ED083F246;
	Wed, 10 Jul 2019 09:45:38 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 2/3] iommu/io-pgtable-arm: Add support for
	AARCH64 split pagetables
To: Jordan Crouse <jcrouse@codeaurora.org>, freedreno@lists.freedesktop.org
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
	<1562612447-19856-3-git-send-email-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d9c1a115-ca4f-efda-4ba2-adefbd802849@arm.com>
Date: Wed, 10 Jul 2019 17:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562612447-19856-3-git-send-email-jcrouse@codeaurora.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Herring <robh@kernel.org>, jean-philippe.brucker@arm.com,
	linux-arm-msm@vger.kernel.org, dianders@chromium.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	hoegsberg@google.com, linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

Hi Jordan,

On 08/07/2019 20:00, Jordan Crouse wrote:
> Add a new sub-format ARM_64_LPAE_SPLIT_S1 to create and set up split
> pagetables (TTBR0 and TTBR1). The initialization function sets up the
> correct va_size and sign extension bits and programs the TCR registers.
> Split pagetable formats use their own own map/unmap wrappers to ensure
> that the correct pagetable is selected based on the incoming iova but
> most of the heavy lifting is common to the other formats.

I'm somewhat concerned that this implementation is very closely tied to 
the current Adreno use-case, and won't easily generalise in future to 
other potential TTBR1 uses which have been tossed around, like 
SMMUv3-without-substream-ID.

Furthermore, even for the Adreno pretend-PASID case it appears to be a 
bit too fragile for comfort - given that a DOMAIN_ATTR_SPLIT_TABLES 
domain doesn't look any different from a regular one from the users' 
point of view, what's to stop them making "without PASID" mappings in 
the lower half of the address space, and thus unwittingly pulling the 
rug out from under their own feet upon attaching an aux domain? In fact 
allocating a TTBR0 table at all for the main domain seems like little 
more than a waste of memory.

> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/iommu/io-pgtable-arm.c | 261 +++++++++++++++++++++++++++++++++++++----
>   drivers/iommu/io-pgtable.c     |   1 +
>   include/linux/io-pgtable.h     |   2 +
>   3 files changed, 240 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 161a7d56..aec35e5 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -118,7 +118,12 @@
>   #define ARM_LPAE_TCR_TG0_64K		(1 << 14)
>   #define ARM_LPAE_TCR_TG0_16K		(2 << 14)
>   
> +#define ARM_LPAE_TCR_TG1_4K		(0 << 30)
> +#define ARM_LPAE_TCR_TG1_64K		(1 << 30)
> +#define ARM_LPAE_TCR_TG1_16K		(2 << 30)
> +
>   #define ARM_LPAE_TCR_SH0_SHIFT		12
> +#define ARM_LPAE_TCR_SH1_SHIFT		28
>   #define ARM_LPAE_TCR_SH0_MASK		0x3
>   #define ARM_LPAE_TCR_SH_NS		0
>   #define ARM_LPAE_TCR_SH_OS		2
> @@ -126,6 +131,8 @@
>   
>   #define ARM_LPAE_TCR_ORGN0_SHIFT	10
>   #define ARM_LPAE_TCR_IRGN0_SHIFT	8
> +#define ARM_LPAE_TCR_ORGN1_SHIFT	26
> +#define ARM_LPAE_TCR_IRGN1_SHIFT	24
>   #define ARM_LPAE_TCR_RGN_MASK		0x3
>   #define ARM_LPAE_TCR_RGN_NC		0
>   #define ARM_LPAE_TCR_RGN_WBWA		1
> @@ -136,6 +143,7 @@
>   #define ARM_LPAE_TCR_SL0_MASK		0x3
>   
>   #define ARM_LPAE_TCR_T0SZ_SHIFT		0
> +#define ARM_LPAE_TCR_T1SZ_SHIFT		16
>   #define ARM_LPAE_TCR_SZ_MASK		0xf
>   
>   #define ARM_LPAE_TCR_PS_SHIFT		16
> @@ -152,6 +160,14 @@
>   #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
>   #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
>   
> +#define ARM_LPAE_TCR_SEP_SHIFT		47
> +#define ARM_LPAE_TCR_SEP_31		(0x0ULL << ARM_LPAE_TCR_SEP_SHIFT)
> +#define ARM_LPAE_TCR_SEP_35		(0x1ULL << ARM_LPAE_TCR_SEP_SHIFT)
> +#define ARM_LPAE_TCR_SEP_39		(0x2ULL << ARM_LPAE_TCR_SEP_SHIFT)
> +#define ARM_LPAE_TCR_SEP_41		(0x3ULL << ARM_LPAE_TCR_SEP_SHIFT)
> +#define ARM_LPAE_TCR_SEP_43		(0x4ULL << ARM_LPAE_TCR_SEP_SHIFT)
> +#define ARM_LPAE_TCR_SEP_UPSTREAM	(0x7ULL << ARM_LPAE_TCR_SEP_SHIFT)

This is a specific detail of SMMUv2, and nothing to do with the 
LPAE/AArch64 VMSA formats.

> +
>   #define ARM_LPAE_MAIR_ATTR_SHIFT(n)	((n) << 3)
>   #define ARM_LPAE_MAIR_ATTR_MASK		0xff
>   #define ARM_LPAE_MAIR_ATTR_DEVICE	0x04
> @@ -179,11 +195,12 @@ struct arm_lpae_io_pgtable {
>   	struct io_pgtable	iop;
>   
>   	int			levels;
> +	u32			sep;
>   	size_t			pgd_size;
>   	unsigned long		pg_shift;
>   	unsigned long		bits_per_level;
>   
> -	void			*pgd;
> +	void			*pgd[2];
>   };
>   
>   typedef u64 arm_lpae_iopte;
> @@ -426,7 +443,8 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>   	arm_lpae_iopte pte;
>   
>   	if (data->iop.fmt == ARM_64_LPAE_S1 ||
> -	    data->iop.fmt == ARM_32_LPAE_S1) {
> +	    data->iop.fmt == ARM_32_LPAE_S1 ||
> +	    data->iop.fmt == ARM_64_LPAE_SPLIT_S1) {
>   		pte = ARM_LPAE_PTE_nG;
>   		if (!(prot & IOMMU_WRITE) && (prot & IOMMU_READ))
>   			pte |= ARM_LPAE_PTE_AP_RDONLY;
> @@ -470,11 +488,10 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>   	return pte;
>   }
>   
> -static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int iommu_prot)
> +static int _arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
> +			phys_addr_t paddr, size_t size, int iommu_prot,
> +			arm_lpae_iopte *ptep)
>   {
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte *ptep = data->pgd;
>   	int ret, lvl = ARM_LPAE_START_LVL(data);
>   	arm_lpae_iopte prot;
>   
> @@ -497,12 +514,39 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>   	return ret;
>   }
>   
> +static int arm_lpae_split_map(struct io_pgtable_ops *ops, unsigned long iova,
> +		phys_addr_t paddr, size_t size, int iommu_prot)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	unsigned long mask = 1UL << data->sep;
> +	arm_lpae_iopte *ptep;
> +
> +	if (iova & mask) {
> +		ptep = data->pgd[1];
> +		iova &= (mask - 1);
> +	} else
> +		ptep = data->pgd[0];

AFAICS, this logic effectively aliases the TTBR1 region across the 
entire upper half of the address hole, so bogus IOVAs may corrupt valid 
mappings instead of giving errors as expected.

> +
> +	return _arm_lpae_map(data, iova, paddr, size, iommu_prot, ptep);
> +}
> +
> +static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
> +			phys_addr_t paddr, size_t size, int iommu_prot)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +
> +	return _arm_lpae_map(data, iova, paddr, size, iommu_prot, data->pgd[0]);
> +}
> +
>   static void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
>   				    arm_lpae_iopte *ptep)
>   {
>   	arm_lpae_iopte *start, *end;
>   	unsigned long table_size;
>   
> +	if (!ptep)
> +		return;
> +
>   	if (lvl == ARM_LPAE_START_LVL(data))
>   		table_size = data->pgd_size;
>   	else
> @@ -532,7 +576,8 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
>   {
>   	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
>   
> -	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd);
> +	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd[0]);
> +	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd[1]);
>   	kfree(data);
>   }
>   
> @@ -643,11 +688,28 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>   	return __arm_lpae_unmap(data, iova, size, lvl + 1, ptep);
>   }
>   
> +static size_t arm_lpae_split_unmap(struct io_pgtable_ops *ops,
> +				   unsigned long iova, size_t size)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	unsigned long mask = 1UL << data->sep;
> +	arm_lpae_iopte *ptep;
> +	int lvl = ARM_LPAE_START_LVL(data);
> +
> +	if (iova & mask) {
> +		ptep = data->pgd[1];
> +		iova &= (mask - 1);
> +	} else
> +		ptep = data->pgd[0];
> +
> +	return __arm_lpae_unmap(data, iova, size, lvl, ptep);
> +}
> +
>   static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>   			     size_t size)
>   {
>   	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte *ptep = data->pgd;
> +	arm_lpae_iopte *ptep = data->pgd[0];
>   	int lvl = ARM_LPAE_START_LVL(data);
>   
>   	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
> @@ -656,11 +718,11 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>   	return __arm_lpae_unmap(data, iova, size, lvl, ptep);
>   }
>   
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> +static phys_addr_t _arm_lpae_iova_to_phys(struct arm_lpae_io_pgtable *data,
> +					  unsigned long iova,
> +					  arm_lpae_iopte *ptep)
>   {
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte pte, *ptep = data->pgd;
> +	arm_lpae_iopte pte;
>   	int lvl = ARM_LPAE_START_LVL(data);
>   
>   	do {
> @@ -692,6 +754,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>   	return iopte_to_paddr(pte, data) | iova;
>   }
>   
> +
> +static phys_addr_t arm_lpae_split_iova_to_phys(struct io_pgtable_ops *ops,
> +					       unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	unsigned long mask = 1UL << data->sep;
> +	arm_lpae_iopte *ptep;
> +
> +	if (iova & mask) {
> +		ptep = data->pgd[1];
> +		iova &= (mask - 1);
> +	} else
> +		ptep = data->pgd[0];
> +
> +	return _arm_lpae_iova_to_phys(data, iova, ptep);
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +
> +	return _arm_lpae_iova_to_phys(data, iova, data->pgd[0]);
> +}
> +
>   static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
>   {
>   	unsigned long granule, page_sizes;
> @@ -771,6 +858,9 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>   	pgd_bits = va_bits - (data->bits_per_level * (data->levels - 1));
>   	data->pgd_size = 1UL << (pgd_bits + ilog2(sizeof(arm_lpae_iopte)));
>   
> +	data->pgd[0] = NULL;
> +	data->pgd[1] = NULL;
> +
>   	data->iop.ops = (struct io_pgtable_ops) {
>   		.map		= arm_lpae_map,
>   		.unmap		= arm_lpae_unmap,
> @@ -780,8 +870,8 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>   	return data;
>   }
>   
> -static struct io_pgtable *
> -arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> +static struct arm_lpae_io_pgtable *
> +_arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg)
>   {
>   	u64 reg;
>   	struct arm_lpae_io_pgtable *data;
> @@ -845,8 +935,6 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   
>   	reg |= (64ULL - cfg->ias) << ARM_LPAE_TCR_T0SZ_SHIFT;
>   
> -	/* Disable speculative walks through TTBR1 */
> -	reg |= ARM_LPAE_TCR_EPD1;

Not setting EPD1 at all could potentially lead to problems for systems 
not using split tables.

>   	cfg->arm_lpae_s1_cfg.tcr = reg;
>   
>   	/* MAIRs */
> @@ -863,24 +951,143 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>   	cfg->arm_lpae_s1_cfg.mair[1] = 0;
>   
>   	/* Looking good; allocate a pgd */
> -	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
> -	if (!data->pgd)
> +	data->pgd[0] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
> +	if (!data->pgd[0])
>   		goto out_free_data;
>   
>   	/* Ensure the empty pgd is visible before any actual TTBR write */
>   	wmb();
>   
>   	/* TTBRs */
> -	cfg->arm_lpae_s1_cfg.ttbr[0] = virt_to_phys(data->pgd);
> +	cfg->arm_lpae_s1_cfg.ttbr[0] = virt_to_phys(data->pgd[0]);
>   	cfg->arm_lpae_s1_cfg.ttbr[1] = 0;
> +	return data;
> +
> +out_free_data:
> +	kfree(data);
> +	return NULL;
> +}
> +
> +
> +/* Allocate split pagetables */
> +static struct io_pgtable *
> +arm_64_lpae_alloc_pgtable_split_s1(struct io_pgtable_cfg *cfg, void *cookie)
> +{
> +	u64 reg;
> +	struct arm_lpae_io_pgtable *data;
> +	u32 sep;
> +
> +	/* Figure out what the sign extension bit should be */
> +	switch (cfg->ias) {

IAS only tells you how wide the SMMU's address input is; what you really 
care about for sign extension is how wide the relevant masters' address 
*outputs* are. There's no way we can know that here, so AFAICS the only 
truly robust answer is for the caller requesting split tables to also 
provide the appropriate split point.

> +	case 32:
> +	case 36:
> +	case 40:
> +	case 42:
> +	case 44:
> +		sep = cfg->ias - 1;
> +		/* Adjust the address size to account for the extension bit */
> +		cfg->ias--;
> +		break;
> +	case 48:
> +		/* IAS of 48 is a special case, it has a dedicated bit */

That's not only not VMSA, but not even any architected SMMU behaviour; 
it just happens to be the way that one user of io-pgtable-arm currently 
mangles its IAS values.

Robin.

> +		sep = 48;
> +		break;
> +	default:
> +		return NULL;
> +	}
> +
> +	data = _arm_64_lpae_alloc_pgtable_s1(cfg);
> +	if (!data)
> +		return NULL;
> +
> +	/* Add the TTBR1 settings */
> +	reg = cfg->arm_lpae_s1_cfg.tcr;
> +
> +	/* TCR */
> +	reg |= (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH1_SHIFT) |
> +	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN1_SHIFT) |
> +	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN1_SHIFT);
> +
> +	switch (ARM_LPAE_GRANULE(data)) {
> +	case SZ_4K:
> +		reg |= ARM_LPAE_TCR_TG1_4K;
> +		break;
> +	case SZ_16K:
> +		reg |= ARM_LPAE_TCR_TG1_16K;
> +		break;
> +	case SZ_64K:
> +		reg |= ARM_LPAE_TCR_TG1_64K;
> +		break;
> +	}
> +
> +	reg |= (64ULL - cfg->ias) << ARM_LPAE_TCR_T1SZ_SHIFT;
> +
> +	switch (sep) {
> +	case 31:
> +		reg |= ARM_LPAE_TCR_SEP_31;
> +		break;
> +	case 35:
> +		reg |= ARM_LPAE_TCR_SEP_35;
> +		break;
> +	case 39:
> +		reg |= ARM_LPAE_TCR_SEP_39;
> +		break;
> +	case 41:
> +		reg |= ARM_LPAE_TCR_SEP_41;
> +		break;
> +	case 43:
> +		reg |= ARM_LPAE_TCR_SEP_43;
> +		break;
> +	case 48:
> +		reg |= ARM_LPAE_TCR_SEP_UPSTREAM;
> +		break;
> +	}
> +
> +	cfg->arm_lpae_s1_cfg.tcr = reg;
> +
> +	/* Allocate the TTBR1 pagetable */
> +	data->pgd[1] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
> +	if (!data->pgd[1])
> +		goto out_free_data;
> +
> +	/* Override the data ops with split table specific ops */
> +	data->iop.ops = (struct io_pgtable_ops) {
> +		.map		= arm_lpae_split_map,
> +		.unmap		= arm_lpae_split_unmap,
> +		.iova_to_phys	= arm_lpae_split_iova_to_phys,
> +	};
> +
> +	/*
> +	 * remember the sign extension bit, we'll need it later to figure out
> +	 * which pagetable to use
> +	 */
> +	data->sep = sep;
> +
> +	/* Ensure the empty pgd is visible before any actual TTBR write */
> +	wmb();
> +
> +	cfg->arm_lpae_s1_cfg.ttbr[1] = virt_to_phys(data->pgd[1]);
>   	return &data->iop;
>   
>   out_free_data:
> +	__arm_lpae_free_pages(data->pgd[0], data->pgd_size, cfg);
>   	kfree(data);
>   	return NULL;
>   }
>   
>   static struct io_pgtable *
> +arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
> +{
> +	struct arm_lpae_io_pgtable *data;
> +
> +	data = _arm_64_lpae_alloc_pgtable_s1(cfg);
> +	if (!data)
> +		return NULL;
> +
> +	return &data->iop;
> +}
> +
> +static struct io_pgtable *
>   arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   {
>   	u64 reg, sl;
> @@ -960,15 +1167,15 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
>   	cfg->arm_lpae_s2_cfg.vtcr = reg;
>   
>   	/* Allocate pgd pages */
> -	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
> -	if (!data->pgd)
> +	data->pgd[0] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
> +	if (!data->pgd[0])
>   		goto out_free_data;
>   
>   	/* Ensure the empty pgd is visible before any actual TTBR write */
>   	wmb();
>   
>   	/* VTTBR */
> -	cfg->arm_lpae_s2_cfg.vttbr = virt_to_phys(data->pgd);
> +	cfg->arm_lpae_s2_cfg.vttbr = virt_to_phys(data->pgd[0]);
>   	return &data->iop;
>   
>   out_free_data:
> @@ -1041,6 +1248,11 @@ struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
>   	.free	= arm_lpae_free_pgtable,
>   };
>   
> +struct io_pgtable_init_fns io_pgtable_arm_64_lpae_split_s1_init_fns = {
> +	.alloc	= arm_64_lpae_alloc_pgtable_split_s1,
> +	.free	= arm_lpae_free_pgtable,
> +};
> +
>   struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
>   	.alloc	= arm_64_lpae_alloc_pgtable_s2,
>   	.free	= arm_lpae_free_pgtable,
> @@ -1095,9 +1307,9 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
>   
>   	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
>   		cfg->pgsize_bitmap, cfg->ias);
> -	pr_err("data: %d levels, 0x%zx pgd_size, %lu pg_shift, %lu bits_per_level, pgd @ %p\n",
> +	pr_err("data: %d levels, 0x%zx pgd_size, %lu pg_shift, %lu bits_per_level, pgd @ %p %p\n",
>   		data->levels, data->pgd_size, data->pg_shift,
> -		data->bits_per_level, data->pgd);
> +		data->bits_per_level, data->pgd[0], data->pgd[1]);
>   }
>   
>   #define __FAIL(ops, i)	({						\
> @@ -1112,6 +1324,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
>   	static const enum io_pgtable_fmt fmts[] = {
>   		ARM_64_LPAE_S1,
>   		ARM_64_LPAE_S2,
> +		ARM_64_LPAE_SPLIT_S1,
>   	};
>   
>   	int i, j;
> diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
> index ced53e5..ed1985f 100644
> --- a/drivers/iommu/io-pgtable.c
> +++ b/drivers/iommu/io-pgtable.c
> @@ -20,6 +20,7 @@ io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
>   	[ARM_64_LPAE_S1] = &io_pgtable_arm_64_lpae_s1_init_fns,
>   	[ARM_64_LPAE_S2] = &io_pgtable_arm_64_lpae_s2_init_fns,
>   	[ARM_MALI_LPAE] = &io_pgtable_arm_mali_lpae_init_fns,
> +	[ARM_64_LPAE_SPLIT_S1] = &io_pgtable_arm_64_lpae_split_s1_init_fns,
>   #endif
>   #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
>   	[ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index b5a450a..2ed0e6a 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -10,6 +10,7 @@ enum io_pgtable_fmt {
>   	ARM_32_LPAE_S1,
>   	ARM_32_LPAE_S2,
>   	ARM_64_LPAE_S1,
> +	ARM_64_LPAE_SPLIT_S1,
>   	ARM_64_LPAE_S2,
>   	ARM_V7S,
>   	ARM_MALI_LPAE,
> @@ -211,6 +212,7 @@ extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns;
>   extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns;
>   extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns;
>   extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns;
> +extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_split_s1_init_fns;
>   extern struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns;
>   extern struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns;
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
