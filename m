Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687D2B7C57
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 12:22:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9B17854B4;
	Wed, 18 Nov 2020 11:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaI0ZMvCJtGR; Wed, 18 Nov 2020 11:22:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 53C7B85487;
	Wed, 18 Nov 2020 11:22:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B65CC07FF;
	Wed, 18 Nov 2020 11:22:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 247C2C07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 13739854B4
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LGFLZuwRL9A for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 11:22:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D00185487
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605698574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddwD2vqIvhvWPRs86xcPJXkhNWMoaWi7DkNuxi9Kik8=;
 b=S17IEoukT5Ozso6IAUBNh+v3DCuYrlF9ZGcyCeMr2vYuCMAOt2UxsvVLFOo4rri/NdQ1Xo
 EylzZYYM5vvESkAmGitblz+epCmWB4pb5FY+epQ5WHh/miliXZ7pdXo4TeFNIZw06umu7j
 254XHkwNnN6Kg/wAKIgWCVKrpHZ8OGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-DBRq8LMPPIC_v8mgGl_wXw-1; Wed, 18 Nov 2020 06:22:50 -0500
X-MC-Unique: DBRq8LMPPIC_v8mgGl_wXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40AC1084D64;
 Wed, 18 Nov 2020 11:22:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-104.ams2.redhat.com [10.36.115.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7B95B4BC;
 Wed, 18 Nov 2020 11:22:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com,
 alex.williamson@redhat.com
Subject: [PATCH v13 05/15] iommu/smmuv3: Get prepared for nested stage support
Date: Wed, 18 Nov 2020 12:21:41 +0100
Message-Id: <20201118112151.25412-6-eric.auger@redhat.com>
In-Reply-To: <20201118112151.25412-1-eric.auger@redhat.com>
References: <20201118112151.25412-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

When nested stage translation is setup, both s1_cfg and
s2_cfg are set.

We introduce a new smmu domain abort field that will be set
upon guest stage1 configuration passing.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

In nested mode, only stage 2 is "finalized" as the host does
not own/configure the stage 1 context descriptor; guest does.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v10 -> v11:
- Fix an issue reported by Shameer when switching from with vSMMU
  to without vSMMU. Despite the spec does not seem to mention it
  seems to be needed to reset the 2 high 64b when switching from
  S1+S2 cfg to S1 only. Especially dst[3] needs to be reset (S2TTB).
  On some implementations, if the S2TTB is not reset, this causes
  a C_BAD_STE error
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 64 +++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 +
 2 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 18ac5af1b284..412ea1bafa50 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1181,8 +1181,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	 * three cases at the moment:
 	 *
 	 * 1. Invalid (all zero) -> bypass/fault (init)
-	 * 2. Bypass/fault -> translation/bypass (attach)
-	 * 3. Translation/bypass -> bypass/fault (detach)
+	 * 2. Bypass/fault -> single stage translation/bypass (attach)
+	 * 3. Single or nested stage Translation/bypass -> bypass/fault (detach)
+	 * 4. S2 -> S1 + S2 (attach_pasid_table)
+	 * 5. S1 + S2 -> S2 (detach_pasid_table)
 	 *
 	 * Given that we can't update the STE atomically and the SMMU
 	 * doesn't read the thing in a defined order, that leaves us
@@ -1193,7 +1195,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val = le64_to_cpu(dst[0]);
-	bool ste_live = false;
+	bool s1_live = false, s2_live = false, ste_live;
+	bool abort, nested = false, translate = false;
 	struct arm_smmu_device *smmu = NULL;
 	struct arm_smmu_s1_cfg *s1_cfg;
 	struct arm_smmu_s2_cfg *s2_cfg;
@@ -1233,6 +1236,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		default:
 			break;
 		}
+		nested = s1_cfg->set && s2_cfg->set;
+		translate = s1_cfg->set || s2_cfg->set;
 	}
 
 	if (val & STRTAB_STE_0_V) {
@@ -1240,23 +1245,36 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
 		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live = true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live = true;
+			s2_live = true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live = true;
+			s2_live = true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
 
+	ste_live = s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val = STRTAB_STE_0_V;
 
 	/* Bypass/fault */
-	if (!smmu_domain || !(s1_cfg->set || s2_cfg->set)) {
-		if (!smmu_domain && disable_bypass)
+
+	if (!smmu_domain)
+		abort = disable_bypass;
+	else
+		abort = smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -1274,8 +1292,16 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		return;
 	}
 
+	BUG_ON(ste_live && !nested);
+
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
 	if (s1_cfg->set) {
-		BUG_ON(ste_live);
+		BUG_ON(s1_live);
 		dst[1] = cpu_to_le64(
 			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
 			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
@@ -1294,7 +1320,14 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	}
 
 	if (s2_cfg->set) {
-		BUG_ON(ste_live);
+		u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
+
+		if (s2_live) {
+			u64 s2ttb = le64_to_cpu(dst[3] & STRTAB_STE_3_S2TTB_MASK);
+
+			BUG_ON(s2ttb != vttbr);
+		}
+
 		dst[2] = cpu_to_le64(
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -1304,9 +1337,12 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R);
 
-		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] = cpu_to_le64(vttbr);
 
 		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] = 0;
+		dst[3] = 0;
 	}
 
 	if (master->ats_enabled)
@@ -1982,6 +2018,14 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 		return 0;
 	}
 
+	if (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED &&
+	    (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+	     !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
+		dev_info(smmu_domain->smmu->dev,
+			 "does not implement two stages\n");
+		return -EINVAL;
+	}
+
 	/* Restrict the stage to what we can actually support */
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
 		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 07f59252dd21..269779dee8d1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -206,6 +206,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
 
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -682,6 +683,7 @@ struct arm_smmu_domain {
 	enum arm_smmu_domain_stage	stage;
 	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
+	bool				abort;
 
 	struct iommu_domain		domain;
 
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
