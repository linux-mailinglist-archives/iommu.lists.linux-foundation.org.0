Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69D1442E0
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 18:11:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE4E786420;
	Tue, 21 Jan 2020 17:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twtnBa+agEnU; Tue, 21 Jan 2020 17:11:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D1AA8201C;
	Tue, 21 Jan 2020 17:11:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5FABC1D88;
	Tue, 21 Jan 2020 17:11:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B051EC0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 17:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E2358201C
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 17:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cwfRZ2Dnm-e for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 17:11:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50E6481EE9
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 17:11:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579626694; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=EPBfq3Cn0Ur34cIyveswNHADy+SSoohXu9of9oDtLQY=;
 b=twC6k8bupajDVKsg+qAyqaiC/TSIC0JmS6fUcP+S07wclB69+bFViJx9zcJvu+5kuBFkLOos
 jnPWRZX2FtKhQddb71mFhpn/BuH/9PfJSG3IJRXL61T43HWSElPASqgl9p0S+Xoz66xNQnA3
 LkyV968QlFJYJa0OuivC0/WggGQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2730c4.7f60c4c415e0-smtp-out-n03;
 Tue, 21 Jan 2020 17:11:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BBD44C4479C; Tue, 21 Jan 2020 17:11:32 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05A27C43383;
 Tue, 21 Jan 2020 17:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05A27C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 21 Jan 2020 10:11:29 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 2/5] iommu/arm-smmu: Add support for split pagetables
Message-ID: <20200121171127.GA5025@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>
References: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
 <1576514271-15687-3-git-send-email-jcrouse@codeaurora.org>
 <a38fe02a-4f84-f032-8c9d-4ecf72a87a55@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a38fe02a-4f84-f032-8c9d-4ecf72a87a55@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
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

On Tue, Jan 21, 2020 at 02:36:19PM +0000, Robin Murphy wrote:
> On 16/12/2019 4:37 pm, Jordan Crouse wrote:
> >Add support to enable split pagetables (TTBR1) if the supporting driver
> >requests it via the DOMAIN_ATTR_SPLIT_TABLES flag. When enabled, the driver
> >will set up the TTBR0 and TTBR1 regions and program the default domain
> >pagetable on TTBR1.
> >
> >After attaching the device, the value of he domain attribute can
> >be queried to see if the split pagetables were successfully programmed.
> >Furthermore the domain geometry will be updated so that the caller can
> >determine the active region for the pagetable that was programmed.
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> >  drivers/iommu/arm-smmu.c | 40 +++++++++++++++++++++++++++++++++++-----
> >  drivers/iommu/arm-smmu.h | 45 +++++++++++++++++++++++++++++++++++++++------
> >  2 files changed, 74 insertions(+), 11 deletions(-)
> >
> >diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> >index c106406..7b59116 100644
> >--- a/drivers/iommu/arm-smmu.c
> >+++ b/drivers/iommu/arm-smmu.c
> >@@ -538,9 +538,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
> >  			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
> >  			cb->ttbr[1] = 0;
> >  		} else {
> >-			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> >-			cb->ttbr[0] |= FIELD_PREP(TTBRn_ASID, cfg->asid);
> >-			cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> >+			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> >+				cb->ttbr[0] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> >+				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> >+				cb->ttbr[1] |=
> >+					FIELD_PREP(TTBRn_ASID, cfg->asid);
> >+			} else {
> >+				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> >+				cb->ttbr[0] |=
> >+					FIELD_PREP(TTBRn_ASID, cfg->asid);
> >+				cb->ttbr[1] = FIELD_PREP(TTBRn_ASID, cfg->asid);
> >+			}
> >  		}
> >  	} else {
> >  		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> >@@ -651,6 +659,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  	enum io_pgtable_fmt fmt;
> >  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> >  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> >+	u32 quirks = 0;
> >  	mutex_lock(&smmu_domain->init_mutex);
> >  	if (smmu_domain->smmu)
> >@@ -719,6 +728,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		oas = smmu->ipa_size;
> >  		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
> >  			fmt = ARM_64_LPAE_S1;
> >+			if (smmu_domain->split_pagetables)
> >+				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
> >  		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
> >  			fmt = ARM_32_LPAE_S1;
> >  			ias = min(ias, 32UL);
> >@@ -788,6 +799,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
> >  		.tlb		= smmu_domain->flush_ops,
> >  		.iommu_dev	= smmu->dev,
> >+		.quirks		= quirks,
> >  	};
> >  	if (smmu_domain->non_strict)
> >@@ -801,8 +813,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  	/* Update the domain's page sizes to reflect the page table format */
> >  	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> >-	domain->geometry.aperture_end = (1UL << ias) - 1;
> >-	domain->geometry.force_aperture = true;
> >+
> >+	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> >+		domain->geometry.aperture_start = ~((1ULL << ias) - 1);
> 
> AKA "~0UL << ias", if I'm not mistaken ;)
> 
> >+		domain->geometry.aperture_end = ~0UL;
> >+	} else {
> >+		domain->geometry.aperture_end = (1UL << ias) - 1;
> >+		domain->geometry.force_aperture = true;
> >+		smmu_domain->split_pagetables = false;
> >+	}
> >  	/* Initialise the context bank with our page table cfg */
> >  	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
> >@@ -1484,6 +1503,9 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
> >  		case DOMAIN_ATTR_NESTING:
> >  			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
> >  			return 0;
> >+		case DOMAIN_ATTR_SPLIT_TABLES:
> >+			*(int *)data = smmu_domain->split_pagetables;
> >+			return 0;
> >  		default:
> >  			return -ENODEV;
> >  		}
> >@@ -1524,6 +1546,14 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> >  			else
> >  				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> >  			break;
> >+		case DOMAIN_ATTR_SPLIT_TABLES:
> >+			if (smmu_domain->smmu) {
> >+				ret = -EPERM;
> >+				goto out_unlock;
> >+			}
> >+			if (*(int *)data)
> >+				smmu_domain->split_pagetables = true;
> 
> I still like the idea of passing the actual split point here, but as it is I
> think this sets the scene perfectly for coming back and doing that later.
> 
> >+			break;
> >  		default:
> >  			ret = -ENODEV;
> >  		}
> >diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> >index afab9de..68526cc 100644
> >--- a/drivers/iommu/arm-smmu.h
> >+++ b/drivers/iommu/arm-smmu.h
> >@@ -177,6 +177,16 @@ enum arm_smmu_cbar_type {
> >  #define TCR_IRGN0			GENMASK(9, 8)
> >  #define TCR_T0SZ			GENMASK(5, 0)
> >+#define TCR_TG1				GENMASK(31, 30)
> >+
> >+#define TG0_4K				0
> >+#define TG0_64K				1
> >+#define TG0_16K				2
> >+
> >+#define TG1_16K				1
> >+#define TG1_4K				2
> >+#define TG1_64K				3
> >+
> >  #define ARM_SMMU_CB_CONTEXTIDR		0x34
> >  #define ARM_SMMU_CB_S1_MAIR0		0x38
> >  #define ARM_SMMU_CB_S1_MAIR1		0x3c
> >@@ -329,16 +339,39 @@ struct arm_smmu_domain {
> >  	struct mutex			init_mutex; /* Protects smmu pointer */
> >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> >  	struct iommu_domain		domain;
> >+	bool				split_pagetables;
> >  };
> >+static inline u32 arm_smmu_lpae_tcr_tg(struct io_pgtable_cfg *cfg)
> >+{
> >+	u32 val;
> >+
> >+	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
> >+		return FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg);
> >+
> >+	val = FIELD_PREP(TCR_TG1, cfg->arm_lpae_s1_cfg.tcr.tg);
> >+
> >+	if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_4K)
> >+		val |= FIELD_PREP(TCR_TG0, TG0_4K);
> >+	else if (cfg->arm_lpae_s1_cfg.tcr.tg == TG1_16K)
> >+		val |= FIELD_PREP(TCR_TG0, TG0_16K);
> >+	else
> >+		val |= FIELD_PREP(TCR_TG0, TG0_64K);
> >+
> >+	return val;
> >+}
> 
> This is all a bit ugly - I'd really like to rely on the real values from
> both io_pgtable instances if at all possible...
> 
> >+
> >  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
> >  {
> >-	return TCR_EPD1 |
> >-	       FIELD_PREP(TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> >-	       FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> >-	       FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> >-	       FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> >-	       FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> >+	u32 tcr = FIELD_PREP(TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> >+		FIELD_PREP(TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> >+		FIELD_PREP(TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> >+		FIELD_PREP(TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> >+
> >+	if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1))
> >+		return tcr | TCR_EPD1 | arm_smmu_lpae_tcr_tg(cfg);
> >+
> >+	return tcr | (tcr << 16) | arm_smmu_lpae_tcr_tg(cfg);
> 
> ...especially here - leaving TTBR0 enabled but pointing to who-knows-what
> until someone fills it in at some arbitrary point in the future seems rather
> scary.
> 
> I'm looking at iommu_aux_attach_device() and friends, and it appears pretty
> achievable to hook that up in a workable manner, even if it's just routed
> straight through to the impl to only work within qcom-specific parameters to
> begin with. I figure the first aux_attach_dev sanity-checks that the main
> domain is using TTBR1 with a compatible split, sets TTBR0 and updates the
> merged TCR value at that point. For subsequent calls it shouldn't need to do
> much more than sanity-check that a new aux domain has the same parameters as
> the existing one(s) (and again, such checks could potentially even start out
> as just "this is OK by construction" comments). I guess we'd probably want a
> count of the number of 'live' aux domains so we can simply disable TTBR0 on
> the final aux_detach_dev without having to keep detailed track of whatever
> the GPU has actually context switched in the hardware. Can you see any holes
> in that idea?

Let me repeat this back just to be sure we're on the same page. When the quirk
is enabled on the primary domain, we'll set up TTBR1 and leave TTBR0 disabled.
Then, when the first aux domain is attached we will set up that io_ptgable
to enable TTBR0 and then let the GPU do what the GPU does until the last aux is
detached and we can switch off TTBR0 again.

I like this. I'll have to do a bit more exploration because the original aux
design assumed that we didn't need to touch the hardware and I'm not sure if
there are any resource contention issues between the primary domain and the aux
domain. Luckily, these should be solvable if they exist (and the original design
didn't take into account the TLB flush problem so this was likely something we
had to do anyway).

> I haven't thought it through in detail, but it also feels like between
> aux_attach_dev and/or the TTBR1 quirk in attach_dev there ought to be enough
> information to influence the context bank allocation or shuffle any existing
> domains such that you can ensure that the right thing ends up in magic
> context 0 when it needs to be. That could be a pretty neat and robust way to
> finally put that to bed.

I'll try to wrap my brain around this as well. Seems like we could do a magic
swizzle of the SID mappings but I'm not sure how we could safely pull that off
on an existing domain. Maybe I'm overthinking it.

I'll spin up a new copy of the TTBR1 quirk patch and revive the aux domain stuff
and then we can go from there.

Thanks,
Jordan

> Robin.
> 
> >  }
> >  static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
