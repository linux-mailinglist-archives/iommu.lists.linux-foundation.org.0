Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E1F107AAC
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 23:41:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A460D8832A;
	Fri, 22 Nov 2019 22:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42Gjxa8mVBcx; Fri, 22 Nov 2019 22:40:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC2B98835E;
	Fri, 22 Nov 2019 22:40:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8F16C18DA;
	Fri, 22 Nov 2019 22:40:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32920C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 295408751D
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmlGaOVqUmlW for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 22:40:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-185.smtp-out.us-west-2.amazonses.com
 (a27-185.smtp-out.us-west-2.amazonses.com [54.240.27.185])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 06D7D8750B
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574462456;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=S8nx/1vCgySigrC/nMBLvVc8uHHSLfRHeXZe4g+zun8=;
 b=Ic7HgOx3cdbYnkWKSMEVH1ckExKkdybJz4Rr4Pi7YkQ5CVHSBHNLIph5OTp34BCf
 oxI3nSEISVQqiME2YEYMsoO0yz/3MUEnf2sC2NigfxSBcHM7Nt+D6HNYo/GYBqd0fc8
 u1pZAStn5hSBXz/9dMJR7QvU/MZ9MIrjyROLjAnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574462456;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=S8nx/1vCgySigrC/nMBLvVc8uHHSLfRHeXZe4g+zun8=;
 b=PIltyhqmQ8frFTu7hVtLGX/7uBDiX4S3Pf1U4WNfHLgUIA3VCd4XRHSHKC9UV9Dx
 2Ju2wtD+XEN2FxeG7LQ1ry/GqDpKAHIGEiDcLHxftAqeQ73JnOjGkoALofr70LOrwbQ
 iBy7/oGmbcJt7oKgXIGjWbktQrWSUfeRJaeUANkM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FA4EC447AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 22 Nov 2019 22:40:56 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 08/10] iommu/io-pgtable-arm: Rationalise TTBRn handling
Message-ID: <0101016e95468161-9f055ea7-a1bd-4eec-8b4f-319c01fb948f-000000@us-west-2.amazonses.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1572024119.git.robin.murphy@arm.com>
 <74ada0e6c488a2310206a553eb108cc28fd52457.1572024120.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74ada0e6c488a2310206a553eb108cc28fd52457.1572024120.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.11.22-54.240.27.185
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
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

On Fri, Oct 25, 2019 at 07:08:37PM +0100, Robin Murphy wrote:
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

Tested-by: Jordan Crouse <jcrouse@codeaurora.org>

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
> -- 
> 2.21.0.dirty
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
