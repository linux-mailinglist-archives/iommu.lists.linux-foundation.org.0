Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73724E747E
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 16:09:34 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C3DFDCC0;
	Mon, 28 Oct 2019 15:09:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F382C1164
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 15:09:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 25F4287B
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 15:09:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A931F1;
	Mon, 28 Oct 2019 08:09:26 -0700 (PDT)
Received: from [10.1.194.43] (unknown [10.1.194.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE1FC3F6C4;
	Mon, 28 Oct 2019 08:09:25 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] iommu/io-pgtable-arm: Rationalise TTBRn handling
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
References: <cover.1572024119.git.robin.murphy@arm.com>
	<74ada0e6c488a2310206a553eb108cc28fd52457.1572024120.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <5324d888-857a-b07c-439c-4ae4ea3a9784@arm.com>
Date: Mon, 28 Oct 2019 15:09:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74ada0e6c488a2310206a553eb108cc28fd52457.1572024120.git.robin.murphy@arm.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 25/10/2019 19:08, Robin Murphy wrote:
> TTBR1 values have so far been redundant since no users implement any
> support for split address spaces. Crucially, though, one of the main
> reasons for wanting to do so is to be able to manage each half entirely
> independently, e.g. context-switching one set of mappings without
> disturbing the other. Thus it seems unlikely that tying two tables
> together in a single io_pgtable_cfg would ever be particularly desirable
> or useful.
> 
> Streamline the configs to just a single conceptual TTBR value
> representing the allocated table. This paves the way for future users to
> support split address spaces by simply allocating a table and dealing
> with the detailed TTBRn logistics themselves.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm-smmu-v3.c        |  2 +-
>  drivers/iommu/arm-smmu.c           |  9 ++++-----
>  drivers/iommu/io-pgtable-arm-v7s.c | 16 +++++++---------
>  drivers/iommu/io-pgtable-arm.c     |  5 ++---
>  drivers/iommu/ipmmu-vmsa.c         |  2 +-
>  drivers/iommu/msm_iommu.c          |  4 ++--
>  drivers/iommu/mtk_iommu.c          |  4 ++--
>  drivers/iommu/qcom_iommu.c         |  3 +--
>  include/linux/io-pgtable.h         |  4 ++--
>  9 files changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 3f20e548f1ec..da31e607698f 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2170,7 +2170,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
>  	}
>  
>  	cfg->cd.asid	= (u16)asid;
> -	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
> +	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
>  	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
>  	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
>  	return 0;
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 2bc3e93b11e6..a249e4e49ead 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -534,13 +534,12 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>  	/* TTBRs */
>  	if (stage1) {
>  		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
> -			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr[0];
> -			cb->ttbr[1] = pgtbl_cfg->arm_v7s_cfg.ttbr[1];
> +			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
> +			cb->ttbr[1] = 0;
>  		} else {
> -			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
> +			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
>  			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> -			cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr[1];
> -			cb->ttbr[1] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> +			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
>  		}
>  	} else {
>  		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 7c3bd2c3cdca..4d2c1e7f67c4 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -822,15 +822,13 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>  	/* Ensure the empty pgd is visible before any actual TTBR write */
>  	wmb();
>  
> -	/* TTBRs */
> -	cfg->arm_v7s_cfg.ttbr[0] = virt_to_phys(data->pgd) |
> -				   ARM_V7S_TTBR_S | ARM_V7S_TTBR_NOS |
> -				   (cfg->coherent_walk ?
> -				   (ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBWA) |
> -				    ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBWA)) :
> -				   (ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC) |
> -				    ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)));
> -	cfg->arm_v7s_cfg.ttbr[1] = 0;
> +	/* TTBR */
> +	cfg->arm_v7s_cfg.ttbr = virt_to_phys(data->pgd) | ARM_V7S_TTBR_S |
> +				(cfg->coherent_walk ? (ARM_V7S_TTBR_NOS |
> +				  ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_WBWA) |
> +				  ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_WBWA)) :
> +				 (ARM_V7S_TTBR_IRGN_ATTR(ARM_V7S_RGN_NC) |
> +				  ARM_V7S_TTBR_ORGN_ATTR(ARM_V7S_RGN_NC)));

ARM_V7S_TTBR_NOS seems to have sneaked into the cfg->coherent_walk
condition here - which you haven't mentioned in the commit log, so it
doesn't look like it should be in this commit.

Steve

>  	return &data->iop;
>  
>  out_free_data:
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 1795df8f7a51..bc0841040ebe 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -872,9 +872,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  	/* Ensure the empty pgd is visible before any actual TTBR write */
>  	wmb();
>  
> -	/* TTBRs */
> -	cfg->arm_lpae_s1_cfg.ttbr[0] = virt_to_phys(data->pgd);
> -	cfg->arm_lpae_s1_cfg.ttbr[1] = 0;
> +	/* TTBR */
> +	cfg->arm_lpae_s1_cfg.ttbr = virt_to_phys(data->pgd);
>  	return &data->iop;
>  
>  out_free_data:
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index e4da6efbda49..4fe0ff3216ce 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -416,7 +416,7 @@ static void ipmmu_domain_setup_context(struct ipmmu_vmsa_domain *domain)
>  	u32 tmp;
>  
>  	/* TTBR0 */
> -	ttbr = domain->cfg.arm_lpae_s1_cfg.ttbr[0];
> +	ttbr = domain->cfg.arm_lpae_s1_cfg.ttbr;
>  	ipmmu_ctx_write_root(domain, IMTTLBR0, ttbr);
>  	ipmmu_ctx_write_root(domain, IMTTUBR0, ttbr >> 32);
>  
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index be99d408cf35..9ceec140fa67 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -279,8 +279,8 @@ static void __program_context(void __iomem *base, int ctx,
>  	SET_V2PCFG(base, ctx, 0x3);
>  
>  	SET_TTBCR(base, ctx, priv->cfg.arm_v7s_cfg.tcr);
> -	SET_TTBR0(base, ctx, priv->cfg.arm_v7s_cfg.ttbr[0]);
> -	SET_TTBR1(base, ctx, priv->cfg.arm_v7s_cfg.ttbr[1]);
> +	SET_TTBR0(base, ctx, priv->cfg.arm_v7s_cfg.ttbr);
> +	SET_TTBR1(base, ctx, 0);
>  
>  	/* Set prrr and nmrr */
>  	SET_PRRR(base, ctx, priv->cfg.arm_v7s_cfg.prrr);
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 67a483c1a935..ef0b36eeb83d 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -392,7 +392,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
>  	/* Update the pgtable base address register of the M4U HW */
>  	if (!data->m4u_dom) {
>  		data->m4u_dom = dom;
> -		writel(dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
> +		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
>  		       data->base + REG_MMU_PT_BASE_ADDR);
>  	}
>  
> @@ -797,7 +797,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
>  	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
>  	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
>  	if (m4u_dom)
> -		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
> +		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
>  		       base + REG_MMU_PT_BASE_ADDR);
>  	return 0;
>  }
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 66e9b40e9275..9a57eb6c253c 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -269,10 +269,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  
>  		/* TTBRs */
>  		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
> -				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[0] |
> +				pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
>  				FIELD_PREP(TTBRn_ASID, ctx->asid));
>  		iommu_writeq(ctx, ARM_SMMU_CB_TTBR1,
> -				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[1] |
>  				FIELD_PREP(TTBRn_ASID, ctx->asid));
>  
>  		/* TCR */
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index ee21eedafe98..53bca5343f52 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -100,7 +100,7 @@ struct io_pgtable_cfg {
>  	/* Low-level data specific to the table format */
>  	union {
>  		struct {
> -			u64	ttbr[2];
> +			u64	ttbr;
>  			u64	tcr;
>  			u64	mair;
>  		} arm_lpae_s1_cfg;
> @@ -111,7 +111,7 @@ struct io_pgtable_cfg {
>  		} arm_lpae_s2_cfg;
>  
>  		struct {
> -			u32	ttbr[2];
> +			u32	ttbr;
>  			u32	tcr;
>  			u32	nmrr;
>  			u32	prrr;
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
