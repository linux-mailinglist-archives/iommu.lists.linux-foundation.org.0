Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 22323136109
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 20:26:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B919586DE2;
	Thu,  9 Jan 2020 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u82UfZiamFci; Thu,  9 Jan 2020 19:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8785886DB3;
	Thu,  9 Jan 2020 19:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AB23C0881;
	Thu,  9 Jan 2020 19:26:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77948C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 19:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 70853883A8
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 19:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1SU5Jp9Ts1A for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 19:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1781D88330
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 19:25:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1578597958; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=P7iT6C4yS6d0pj4gGc3+4Aans4LpK2LQk8W2gXRqLqE=;
 b=TboG/PhGTZ9UYMCdGn/fqmM9FASSp59FWTkdl2iU+/Ns9KlpdjoIWCZ+aYaqAmL6iHQ/AbZk
 2Le5kUU/cSYYvZozwEracaoCjG7yVWr8+l7IOS9ZmfbYFJlM7CvXDKrjum4onFfbcu32cHjy
 q7surRL9PNytwyESZiY9mAIXcZM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e177e40.7fdadd794228-smtp-out-n02;
 Thu, 09 Jan 2020 19:25:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 73085C4479C; Thu,  9 Jan 2020 19:25:51 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F006C433CB;
 Thu,  9 Jan 2020 19:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F006C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 9 Jan 2020 12:25:47 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 2/5] iommu/arm-smmu: Add support for split pagetables
Message-ID: <20200109192547.GA14008@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
 <20200109143333.GB12236@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109143333.GB12236@willie-the-truck>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Thu, Jan 09, 2020 at 02:33:34PM +0000, Will Deacon wrote:
> On Mon, Dec 16, 2019 at 09:37:48AM -0700, Jordan Crouse wrote:
> > Add support to enable split pagetables (TTBR1) if the supporting driver
> > requests it via the DOMAIN_ATTR_SPLIT_TABLES flag. When enabled, the driver
> > will set up the TTBR0 and TTBR1 regions and program the default domain
> > pagetable on TTBR1.
> > 
> > After attaching the device, the value of he domain attribute can
> > be queried to see if the split pagetables were successfully programmed.
> > Furthermore the domain geometry will be updated so that the caller can
> > determine the active region for the pagetable that was programmed.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >  drivers/iommu/arm-smmu.c | 40 +++++++++++++++++++++++++++++++++++-----
> >  drivers/iommu/arm-smmu.h | 45 +++++++++++++++++++++++++++++++++++++++------
> >  2 files changed, 74 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index c106406..7b59116 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -538,9 +538,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> >  			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
> >  			cb->ttbr[1] = 0;
> >  		} else {
> > -			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > -			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> > -			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> > +			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> > +				cb->ttbr[0] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> > +				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > +				cb->ttbr[1] |=
> > +					FIELD_PREP(TTBRn_ASID, cfg->asid);
> > +			} else {
> > +				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> > +				cb->ttbr[0] |=
> > +					FIELD_PREP(TTBRn_ASID, cfg->asid);
> > +				cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> > +			}
> 
> I still don't understand why you have to set the ASID in both of the TTBRs.
> Assuming TCR.A1 is clear, then we should only need to set the field in
> TTBR0.

This is mostly out of a sense of symmetry with the non-split configuration. I'll
clean it up.

> 
> >  		}
> >  	} else {
> >  		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> > @@ -651,6 +659,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  	enum io_pgtable_fmt fmt;
> >  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> > +	u32 quirks = 0;
> >  
> >  	mutex_lock(&smmu_domain->init_mutex);
> >  	if (smmu_domain->smmu)
> > @@ -719,6 +728,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		oas = smmu->ipa_size;
> >  		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
> >  			fmt = ARM_64_LPAE_S1;
> > +			if (smmu_domain->split_pagetables)
> > +				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> >  		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
> >  			fmt = ARM_32_LPAE_S1;
> >  			ias = min(ias, 32UL);
> > @@ -788,6 +799,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
> >  		.tlb		= smmu_domain->flush_ops,
> >  		.iommu_dev	= smmu->dev,
> > +		.quirks		= quirks,
> >  	};
> >  
> >  	if (smmu_domain->non_strict)
> > @@ -801,8 +813,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  
> >  	/* Update the domain's page sizes to reflect the page table format */
> >  	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> > -	domain->geometry.aperture_end = (1UL << ias) - 1;
> > -	domain->geometry.force_aperture = true;
> > +
> > +	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> > +		domain->geometry.aperture_start = ~((1ULL << ias) - 1);
> > +		domain->geometry.aperture_end = ~0UL;
> > +	} else {
> > +		domain->geometry.aperture_end = (1UL << ias) - 1;
> > +		domain->geometry.force_aperture = true;
> > +		smmu_domain->split_pagetables = false;
> > +	}
> >  
> >  	/* Initialise the context bank with our page table cfg */
> >  	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> > @@ -1484,6 +1503,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
> >  		case DOMAIN_ATTR_NESTING:
> >  			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
> >  			return 0;
> > +		case DOMAIN_ATTR_SPLIT_TABLES:
> > +			*(int *)data = smmu_domain->split_pagetables;
> > +			return 0;
> >  		default:
> >  			return -ENODEV;
> >  		}
> > @@ -1524,6 +1546,14 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> >  			else
> >  				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> >  			break;
> > +		case DOMAIN_ATTR_SPLIT_TABLES:
> > +			if (smmu_domain->smmu) {
> > +				ret = -EPERM;
> > +				goto out_unlock;
> > +			}
> > +			if (*(int *)data)
> > +				smmu_domain->split_pagetables = true;
> > +			break;
> >  		default:
> >  			ret = -ENODEV;
> >  		}
> > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > index afab9de..68526cc 100644
> > --- a/drivers/iommu/arm-smmu.h
> > +++ b/drivers/iommu/arm-smmu.h
> > @@ -177,6 +177,16 @@ enum arm_smmu_cbar_type {
> >  #define TCR_IRGN0			GENMASK(9, 8)
> >  #define TCR_T0SZ			GENMASK(5, 0)
> >  
> > +#define TCR_TG1				GENMASK(31, 30)
> > +
> > +#define TG0_4K				0
> > +#define TG0_64K				1
> > +#define TG0_16K				2
> > +
> > +#define TG1_16K				1
> > +#define TG1_4K				2
> > +#define TG1_64K				3
> > +
> >  #define ARM_SMMU_CB_CONTEXTIDR		0x34
> >  #define ARM_SMMU_CB_S1_MAIR0		0x38
> >  #define ARM_SMMU_CB_S1_MAIR1		0x3c
> > @@ -329,16 +339,39 @@ struct arm_smmu_domain {
> >  	struct mutex			init_mutex; /* Protects smmu pointer */
> >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> >  	struct iommu_domain		domain;
> > +	bool				split_pagetables;
> >  };
> >  
> > +static inline u32 arm_smmu_lpae_tcr_tg(struct io_pgtable_cfg *cfg)
> > +{
> > +	u32 val;
> > +
> > +	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
> > +		return FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg);
> > +
> > +	val = FIELD_PREP(TCR_TG1, cfg->arm_lpae_s1_cfg.tcr.tg);
> > +
> > +	if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_4K)
> > +		val |= FIELD_PREP(TCR_TG0, TG0_4K);
> > +	else if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_16K)
> > +		val |= FIELD_PREP(TCR_TG0, TG0_16K);
> > +	else
> > +		val |= FIELD_PREP(TCR_TG0, TG0_64K);
> 
> This looks like it's making assumptions about the order in which page-tables
> are installed, which I'd really like to avoid. See below.

> >  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
> >  {
> > -	return TCR_EPD1 |
> > -	       FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> > -	       FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> > -	       FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> > -	       FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> > -	       FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> > +	u32 tcr = FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> > +		FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> > +		FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> > +		FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> > +
> > +	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
> > +		return tcr | TCR_EPD1 | arm_smmu_lpae_tcr_tg(cfg);
> 
> This is interesting. If the intention is to have both TTBR0 and TTBR1
> used concurrently by different domains, then we probably need to be a bit
> smarter about setting TCR_EPDx. Can we do something like start off with them
> both set, and then just clear the one we want when installing a page-table?

My intention is that there should only be one domain that programs the hardware
and installs the TTBR1 page-table.

Under the proposed design [1] we used an aux domain that was basically a wrapper
for a page-table and a domain attribute to return the physical address of the
page-table to the GPU hardware which can program the TTBR0 register at runtime
[2].  

The object of this patch is that in split pagetable mode the "master" domain
programs both the TTBR0 and TTBR1 sides of the TCR register but leaves the
actual TTBR0 register empty for the GPU to manage.

The GPU isn't currently set up to program register configuration outside of
swapping the TTBR0 register and hitting the TIBALL bit which is part of an
built in opcode and its not practical to add TCR configuration to the mix.

I also feel pretty strongly that we should leave register configuration to the
arm-smmu driver as much as possible so that was my motivation for doing this
patch in this manner.

Jordan

[1] https://patchwork.freedesktop.org/patch/306117/
[2] https://patchwork.freedesktop.org/patch/307616/?series=57441&rev=3

> Will

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
