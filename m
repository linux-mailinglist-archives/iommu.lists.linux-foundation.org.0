Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B2118D3AD
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 17:10:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D5B1E88A9E;
	Fri, 20 Mar 2020 16:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0b7eqKdDPO8I; Fri, 20 Mar 2020 16:10:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E27E988A3D;
	Fri, 20 Mar 2020 16:10:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9949C1D91;
	Fri, 20 Mar 2020 16:10:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFA73C07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CD3D2889CE
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6beJ0g3ivl3k for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 16:10:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED84188904
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584720618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhcONvFcpeB62AOVeOzwruBzMWpD+P7Fed42L4CFLw0=;
 b=Xfc3f3UDYNioowY3ko/s5z9tZ+O8AR8Ly0kVTBHbd6UM86CDXgnD6zLCdYYaQytm/DbeNI
 4VataS4NutORvnS/pOxacVXcLnkxgoroKxwasx4Xh5CUcQyEzARs6X8j8NrL0SUhmTzpgK
 OXkBFnL5wFhg9uzuCoES43ewhf4PNAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-t6pTOVUEPGCvPanWYuHxtA-1; Fri, 20 Mar 2020 12:10:15 -0400
X-MC-Unique: t6pTOVUEPGCvPanWYuHxtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01F4A1005510;
 Fri, 20 Mar 2020 16:10:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 934971E6;
 Fri, 20 Mar 2020 16:10:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
 robin.murphy@arm.com
Subject: [PATCH v10 04/13] iommu/smmuv3: Dynamically allocate s1_cfg and s2_cfg
Date: Fri, 20 Mar 2020 17:09:23 +0100
Message-Id: <20200320160932.27222-5-eric.auger@redhat.com>
In-Reply-To: <20200320160932.27222-1-eric.auger@redhat.com>
References: <20200320160932.27222-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org
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

In preparation for the introduction of nested stages
let's turn s1_cfg and s2_cfg fields into pointers which are
dynamically allocated depending on the smmu_domain stage.

In nested mode, both stages will coexist and s1_cfg will
be allocated when the guest configuration gets passed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/arm-smmu-v3.c | 94 ++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 3d726e97934f..8b3083c5f27b 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -719,10 +719,8 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
 
 	enum arm_smmu_domain_stage	stage;
-	union {
-		struct arm_smmu_s1_cfg	s1_cfg;
-		struct arm_smmu_s2_cfg	s2_cfg;
-	};
+	struct arm_smmu_s1_cfg		*s1_cfg;
+	struct arm_smmu_s2_cfg		*s2_cfg;
 
 	struct iommu_domain		domain;
 
@@ -1598,9 +1596,9 @@ static __le64 *arm_smmu_get_cd_ptr(struct arm_smmu_domain *smmu_domain,
 	unsigned int idx;
 	struct arm_smmu_l1_ctx_desc *l1_desc;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg.cdcfg;
+	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg->cdcfg;
 
-	if (smmu_domain->s1_cfg.s1fmt == STRTAB_STE_0_S1FMT_LINEAR)
+	if (smmu_domain->s1_cfg->s1fmt == STRTAB_STE_0_S1FMT_LINEAR)
 		return cdcfg->cdtab + ssid * CTXDESC_CD_DWORDS;
 
 	idx = ssid >> CTXDESC_SPLIT;
@@ -1635,7 +1633,7 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
 	__le64 *cdptr;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
-	if (WARN_ON(ssid >= (1 << smmu_domain->s1_cfg.s1cdmax)))
+	if (WARN_ON(ssid >= (1 << smmu_domain->s1_cfg->s1cdmax)))
 		return -E2BIG;
 
 	cdptr = arm_smmu_get_cd_ptr(smmu_domain, ssid);
@@ -1700,7 +1698,7 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_domain *smmu_domain)
 	size_t l1size;
 	size_t max_contexts;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
+	struct arm_smmu_s1_cfg *cfg = smmu_domain->s1_cfg;
 	struct arm_smmu_ctx_desc_cfg *cdcfg = &cfg->cdcfg;
 
 	max_contexts = 1 << cfg->s1cdmax;
@@ -1748,7 +1746,7 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
 	int i;
 	size_t size, l1size;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg.cdcfg;
+	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg->cdcfg;
 
 	if (cdcfg->l1_desc) {
 		size = CTXDESC_L2_ENTRIES * (CTXDESC_CD_DWORDS << 3);
@@ -1839,17 +1837,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	}
 
 	if (smmu_domain) {
-		switch (smmu_domain->stage) {
-		case ARM_SMMU_DOMAIN_S1:
-			s1_cfg = &smmu_domain->s1_cfg;
-			break;
-		case ARM_SMMU_DOMAIN_S2:
-		case ARM_SMMU_DOMAIN_NESTED:
-			s2_cfg = &smmu_domain->s2_cfg;
-			break;
-		default:
-			break;
-		}
+		s1_cfg = smmu_domain->s1_cfg;
+		s2_cfg = smmu_domain->s2_cfg;
 	}
 
 	if (val & STRTAB_STE_0_V) {
@@ -2286,11 +2275,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cmd.opcode	= CMDQ_OP_TLBI_NH_ASID;
-		cmd.tlbi.asid	= smmu_domain->s1_cfg.cd.asid;
+		cmd.tlbi.asid	= smmu_domain->s1_cfg->cd.asid;
 		cmd.tlbi.vmid	= 0;
 	} else {
 		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
-		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
+		cmd.tlbi.vmid	= smmu_domain->s2_cfg->vmid;
 	}
 
 	/*
@@ -2324,10 +2313,10 @@ static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
 
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		cmd.opcode	= CMDQ_OP_TLBI_NH_VA;
-		cmd.tlbi.asid	= smmu_domain->s1_cfg.cd.asid;
+		cmd.tlbi.asid	= smmu_domain->s1_cfg->cd.asid;
 	} else {
 		cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
-		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
+		cmd.tlbi.vmid	= smmu_domain->s2_cfg->vmid;
 	}
 
 	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
@@ -2477,22 +2466,24 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_s1_cfg *s1_cfg = smmu_domain->s1_cfg;
+	struct arm_smmu_s2_cfg *s2_cfg = smmu_domain->s2_cfg;
 
 	iommu_put_dma_cookie(domain);
 	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
 
 	/* Free the CD and ASID, if we allocated them */
-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
-		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
-
-		if (cfg->cdcfg.cdtab) {
+	if (s1_cfg) {
+		if (s1_cfg->cdcfg.cdtab) {
 			arm_smmu_free_cd_tables(smmu_domain);
-			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
+			arm_smmu_bitmap_free(smmu->asid_map, s1_cfg->cd.asid);
 		}
-	} else {
-		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
-		if (cfg->vmid)
-			arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
+		kfree(s1_cfg);
+	}
+	if (s2_cfg) {
+		if (s2_cfg->vmid)
+			arm_smmu_bitmap_free(smmu->vmid_map, s2_cfg->vmid);
+		kfree(s2_cfg);
 	}
 
 	kfree(smmu_domain);
@@ -2505,15 +2496,21 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	int ret;
 	int asid;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
+	struct arm_smmu_s1_cfg *cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 	typeof(&pgtbl_cfg->arm_lpae_s1_cfg.tcr) tcr = &pgtbl_cfg->arm_lpae_s1_cfg.tcr;
 
+	if (!cfg)
+		return -ENOMEM;
+
 	asid = arm_smmu_bitmap_alloc(smmu->asid_map, smmu->asid_bits);
-	if (asid < 0)
-		return asid;
+	if (asid < 0) {
+		ret = asid;
+		goto out_free_cfg;
+	}
 
 	cfg->s1cdmax = master->ssid_bits;
 
+	smmu_domain->s1_cfg = cfg;
 	ret = arm_smmu_alloc_cd_tables(smmu_domain);
 	if (ret)
 		goto out_free_asid;
@@ -2544,6 +2541,9 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	arm_smmu_free_cd_tables(smmu_domain);
 out_free_asid:
 	arm_smmu_bitmap_free(smmu->asid_map, asid);
+out_free_cfg:
+	kfree(cfg);
+	smmu_domain->s1_cfg = NULL;
 	return ret;
 }
 
@@ -2551,14 +2551,19 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 				       struct arm_smmu_master *master,
 				       struct io_pgtable_cfg *pgtbl_cfg)
 {
-	int vmid;
+	int vmid, ret;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
+	struct arm_smmu_s2_cfg *cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
 	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
 
+	if (!cfg)
+		return -ENOMEM;
+
 	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
-	if (vmid < 0)
-		return vmid;
+	if (vmid < 0) {
+		ret = vmid;
+		goto out_free_cfg;
+	}
 
 	vtcr = &pgtbl_cfg->arm_lpae_s2_cfg.vtcr;
 	cfg->vmid	= (u16)vmid;
@@ -2570,7 +2575,12 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
+	smmu_domain->s2_cfg = cfg;
 	return 0;
+
+out_free_cfg:
+	kfree(cfg);
+	return ret;
 }
 
 static int arm_smmu_domain_finalise(struct iommu_domain *domain,
@@ -2848,10 +2858,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 		ret = -ENXIO;
 		goto out_unlock;
 	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
-		   master->ssid_bits != smmu_domain->s1_cfg.s1cdmax) {
+		   master->ssid_bits != smmu_domain->s1_cfg->s1cdmax) {
 		dev_err(dev,
 			"cannot attach to incompatible domain (%u SSID bits != %u)\n",
-			smmu_domain->s1_cfg.s1cdmax, master->ssid_bits);
+			smmu_domain->s1_cfg->s1cdmax, master->ssid_bits);
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
