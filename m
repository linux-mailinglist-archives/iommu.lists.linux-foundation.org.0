Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08F19DE0B
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 20:36:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A395088E3D;
	Fri,  3 Apr 2020 18:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDnpYb2StMc8; Fri,  3 Apr 2020 18:36:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 641668920C;
	Fri,  3 Apr 2020 18:36:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 528B2C1D85;
	Fri,  3 Apr 2020 18:36:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8CEEC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C81A12046F
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lo9cRv3uWdkt for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 18:36:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id C20AA2045E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:29 +0000 (UTC)
IronPort-SDR: Xvy+TtKtoQMN2Gr6OMQ8p/nHhqb8md1vehYyEi2pVN4DGnqiwFdWDk7Mpts0BkmbZrnQUczBt+
 QfcaCGGiCzSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 11:36:27 -0700
IronPort-SDR: FglbFKplkio6a1USfTt1waIKGtCC/U5LUWi/Q3A0D1U7pleEYECug4/LbJWJh1uieUfPIuxn2n
 WaT0tWFuP2sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="268439818"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 11:36:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v11 04/10] iommu/vt-d: Add nested translation helper function
Date: Fri,  3 Apr 2020 11:42:08 -0700
Message-Id: <1585939334-21396-5-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Liu@osuosl.org,
 Jonathan Cameron <jic23@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Nested translation mode is supported in VT-d 3.0 Spec.CH 3.8.
With PASID granular translation type set to 0x11b, translation
result from the first level(FL) also subject to a second level(SL)
page table translation. This mode is used for SVA virtualization,
where FL performs guest virtual to guest physical translation and
SL performs guest physical to host physical translation.

This patch adds a helper function for setting up nested translation
where second level comes from a domain and first level comes from
a guest PGD.

---
v11 Added check for nesting domain attr. Moved flags to header file.
    Improved flow in MTS handling suggested by Eric.
---

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Liu, Yi L <yi.l.liu@intel.com>
---
 drivers/iommu/intel-iommu.c |  25 -----
 drivers/iommu/intel-pasid.c | 246 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/iommu/intel-pasid.h |  12 +++
 include/linux/intel-iommu.h |  28 +++++
 4 files changed, 283 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index e599b2537b1c..c0dadec5a6b3 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -296,31 +296,6 @@ static inline void context_clear_entry(struct context_entry *context)
 static struct dmar_domain *si_domain;
 static int hw_pass_through = 1;
 
-/* si_domain contains mulitple devices */
-#define DOMAIN_FLAG_STATIC_IDENTITY		BIT(0)
-
-/*
- * This is a DMA domain allocated through the iommu domain allocation
- * interface. But one or more devices belonging to this domain have
- * been chosen to use a private domain. We should avoid to use the
- * map/unmap/iova_to_phys APIs on it.
- */
-#define DOMAIN_FLAG_LOSE_CHILDREN		BIT(1)
-
-/*
- * When VT-d works in the scalable mode, it allows DMA translation to
- * happen through either first level or second level page table. This
- * bit marks that the DMA translation for the domain goes through the
- * first level page table, otherwise, it goes through the second level.
- */
-#define DOMAIN_FLAG_USE_FIRST_LEVEL		BIT(2)
-
-/*
- * Domain represents a virtual machine which demands iommu nested
- * translation mode support.
- */
-#define DOMAIN_FLAG_NESTING_MODE		BIT(3)
-
 #define for_each_domain_iommu(idx, domain)			\
 	for (idx = 0; idx < g_num_of_iommus; idx++)		\
 		if (domain->iommu_refcnt[idx])
diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 66c364719ad1..fcd015644c4f 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -359,6 +359,76 @@ pasid_set_flpm(struct pasid_entry *pe, u64 value)
 	pasid_set_bits(&pe->val[2], GENMASK_ULL(3, 2), value << 2);
 }
 
+/*
+ * Setup the Extended Memory Type(EMT) field (Bits 91-93)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_emt(struct pasid_entry *pe, u64 value)
+{
+	pasid_set_bits(&pe->val[1], GENMASK_ULL(29, 27), value << 27);
+}
+
+/*
+ * Setup the Page Attribute Table (PAT) field (Bits 96-127)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_pat(struct pasid_entry *pe, u64 value)
+{
+	pasid_set_bits(&pe->val[1], GENMASK_ULL(63, 32), value << 32);
+}
+
+/*
+ * Setup the Cache Disable (CD) field (Bit 89)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_cd(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 25, 1 << 25);
+}
+
+/*
+ * Setup the Extended Memory Type Enable (EMTE) field (Bit 90)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_emte(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 26, 1 << 26);
+}
+
+/*
+ * Setup the Extended Access Flag Enable (EAFE) field (Bit 135)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_eafe(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[2], 1 << 7, 1 << 7);
+}
+
+/*
+ * Setup the Page-level Cache Disable (PCD) field (Bit 95)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_pcd(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 31, 1 << 31);
+}
+
+/*
+ * Setup the Page-level Write-Through (PWT)) field (Bit 94)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_pwt(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 30, 1 << 30);
+}
+
 static void
 pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
 				    u16 did, int pasid)
@@ -492,7 +562,7 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
 
 	/* Setup Present and PASID Granular Transfer Type: */
-	pasid_set_translation_type(pte, 1);
+	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_FL_ONLY);
 	pasid_set_present(pte);
 	pasid_flush_caches(iommu, pte, pasid, did);
 
@@ -562,7 +632,7 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 	pasid_set_domain_id(pte, did);
 	pasid_set_slptr(pte, pgd_val);
 	pasid_set_address_width(pte, agaw);
-	pasid_set_translation_type(pte, 2);
+	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_SL_ONLY);
 	pasid_set_fault_enable(pte);
 	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
 
@@ -596,7 +666,7 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 	pasid_clear_entry(pte);
 	pasid_set_domain_id(pte, did);
 	pasid_set_address_width(pte, iommu->agaw);
-	pasid_set_translation_type(pte, 4);
+	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_PT);
 	pasid_set_fault_enable(pte);
 	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
 
@@ -610,3 +680,173 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 
 	return 0;
 }
+
+static int intel_pasid_setup_bind_data(struct intel_iommu *iommu,
+				struct pasid_entry *pte,
+				struct iommu_gpasid_bind_data_vtd *pasid_data)
+{
+	/*
+	 * Not all guest PASID table entry fields are passed down during bind,
+	 * here we only set up the ones that are dependent on guest settings.
+	 * Execution related bits such as NXE, SMEP are not meaningful to IOMMU,
+	 * therefore not set. Other fields, such as snoop related, are set based
+	 * on host needs regardless of guest settings.
+	 */
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_SRE) {
+		if (!ecap_srs(iommu->ecap)) {
+			pr_err("No supervisor request support on %s\n",
+			       iommu->name);
+			return -EINVAL;
+		}
+		pasid_set_sre(pte);
+	}
+
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EAFE) {
+		if (!ecap_eafs(iommu->ecap)) {
+			pr_err("No extended access flag support on %s\n",
+				iommu->name);
+			return -EINVAL;
+		}
+		pasid_set_eafe(pte);
+	}
+
+	/*
+	 * Memory type is only applicable to devices inside processor coherent
+	 * domain. PCIe devices are not included. We can skip the rest of the
+	 * flags if IOMMU does not support MTS.
+	 */
+	if (!(pasid_data->flags & IOMMU_SVA_VTD_GPASID_MTS_MASK))
+		return 0;
+
+	if (!ecap_mts(iommu->ecap)) {
+		pr_err("No memory type support for bind guest PASID on %s\n", iommu->name);
+		return -EINVAL;
+	}
+
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EMTE) {
+		pasid_set_emte(pte);
+		pasid_set_emt(pte, pasid_data->emt);
+	}
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PCD)
+		pasid_set_pcd(pte);
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PWT)
+		pasid_set_pwt(pte);
+	if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_CD)
+		pasid_set_cd(pte);
+	pasid_set_pat(pte, pasid_data->pat);
+
+	return 0;
+}
+
+/**
+ * intel_pasid_setup_nested() - Set up PASID entry for nested translation.
+ * This could be used for guest shared virtual address. In this case, the
+ * first level page tables are used for GVA-GPA translation in the guest,
+ * second level page tables are used for GPA-HPA translation.
+ *
+ * @iommu:      IOMMU which the device belong to
+ * @dev:        Device to be set up for translation
+ * @gpgd:       FLPTPTR: First Level Page translation pointer in GPA
+ * @pasid:      PASID to be programmed in the device PASID table
+ * @pasid_data: Additional PASID info from the guest bind request
+ * @domain:     Domain info for setting up second level page tables
+ * @addr_width: Address width of the first level (guest)
+ */
+int intel_pasid_setup_nested(struct intel_iommu *iommu,
+			struct device *dev, pgd_t *gpgd,
+			int pasid, struct iommu_gpasid_bind_data_vtd *pasid_data,
+			struct dmar_domain *domain,
+			int addr_width)
+{
+	struct pasid_entry *pte;
+	struct dma_pte *pgd;
+	int ret = 0;
+	u64 pgd_val;
+	int agaw;
+	u16 did;
+
+	if (!ecap_nest(iommu->ecap)) {
+		pr_err_ratelimited("IOMMU: %s: No nested translation support\n",
+		       iommu->name);
+		return -EINVAL;
+	}
+
+	if (!(domain->flags & DOMAIN_FLAG_NESTING_MODE)) {
+		pr_err_ratelimited("Domain is not in nesting mode, %x\n", domain->flags);
+		return -EINVAL;
+	}
+
+	pte = intel_pasid_get_entry(dev, pasid);
+	if (WARN_ON(!pte))
+		return -EINVAL;
+
+	/*
+	 * Caller must ensure PASID entry is not in use, i.e. not bind the
+	 * same PASID to the same device twice.
+	 */
+	if (pasid_pte_is_present(pte))
+		return -EBUSY;
+
+	pasid_clear_entry(pte);
+
+	/* Sanity checking performed by caller to make sure address
+	 * width matching in two dimensions:
+	 * 1. CPU vs. IOMMU
+	 * 2. Guest vs. Host.
+	 */
+	switch (addr_width) {
+	case ADDR_WIDTH_5LEVEL:
+		if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+			cap_5lp_support(iommu->cap)) {
+			pasid_set_flpm(pte, 1);
+		} else {
+			dev_err_ratelimited(dev, "5-level paging not supported\n");
+			return -EINVAL;
+		}
+		break;
+	case ADDR_WIDTH_4LEVEL:
+		pasid_set_flpm(pte, 0);
+		break;
+	default:
+		dev_err_ratelimited(dev, "Invalid guest address width %d\n", addr_width);
+		return -EINVAL;
+	}
+
+	/* First level PGD is in GPA, must be supported by the second level */
+	if ((u64)gpgd > domain->max_addr) {
+		dev_err_ratelimited(dev, "Guest PGD %llx not supported, max %llx\n",
+			(u64)gpgd, domain->max_addr);
+		return -EINVAL;
+	}
+	pasid_set_flptr(pte, (u64)gpgd);
+
+	ret = intel_pasid_setup_bind_data(iommu, pte, pasid_data);
+	if (ret) {
+		dev_err_ratelimited(dev, "Guest PASID bind data not supported\n");
+		return ret;
+	}
+
+	/* Setup the second level based on the given domain */
+	pgd = domain->pgd;
+
+	agaw = iommu_skip_agaw(domain, iommu, &pgd);
+	if (agaw < 0) {
+		dev_err_ratelimited(dev, "Invalid domain page table\n");
+		return -EINVAL;
+	}
+	pgd_val = virt_to_phys(pgd);
+	pasid_set_slptr(pte, pgd_val);
+	pasid_set_fault_enable(pte);
+
+	did = domain->iommu_did[iommu->seq_id];
+	pasid_set_domain_id(pte, did);
+
+	pasid_set_address_width(pte, agaw);
+	pasid_set_page_snoop(pte, !!ecap_smpwc(iommu->ecap));
+
+	pasid_set_translation_type(pte, PASID_ENTRY_PGTT_NESTED);
+	pasid_set_present(pte);
+	pasid_flush_caches(iommu, pte, pasid, did);
+
+	return ret;
+}
diff --git a/drivers/iommu/intel-pasid.h b/drivers/iommu/intel-pasid.h
index 92de6df24ccb..698015ee3f04 100644
--- a/drivers/iommu/intel-pasid.h
+++ b/drivers/iommu/intel-pasid.h
@@ -36,6 +36,7 @@
  * to vmalloc or even module mappings.
  */
 #define PASID_FLAG_SUPERVISOR_MODE	BIT(0)
+#define PASID_FLAG_NESTED		BIT(1)
 
 /*
  * The PASID_FLAG_FL5LP flag Indicates using 5-level paging for first-
@@ -51,6 +52,11 @@ struct pasid_entry {
 	u64 val[8];
 };
 
+#define PASID_ENTRY_PGTT_FL_ONLY	(1)
+#define PASID_ENTRY_PGTT_SL_ONLY	(2)
+#define PASID_ENTRY_PGTT_NESTED		(3)
+#define PASID_ENTRY_PGTT_PT		(4)
+
 /* The representative of a PASID table */
 struct pasid_table {
 	void			*table;		/* pasid table pointer */
@@ -99,6 +105,12 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 				   struct dmar_domain *domain,
 				   struct device *dev, int pasid);
+int intel_pasid_setup_nested(struct intel_iommu *iommu,
+			struct device *dev, pgd_t *pgd,
+			int pasid,
+			struct iommu_gpasid_bind_data_vtd *pasid_data,
+			struct dmar_domain *domain,
+			int addr_width);
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
 				 struct device *dev, int pasid);
 
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index ed7171d2ae1f..6da03f627ba3 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -42,6 +42,9 @@
 #define DMA_FL_PTE_PRESENT	BIT_ULL(0)
 #define DMA_FL_PTE_XD		BIT_ULL(63)
 
+#define ADDR_WIDTH_5LEVEL	(57)
+#define ADDR_WIDTH_4LEVEL	(48)
+
 #define CONTEXT_TT_MULTI_LEVEL	0
 #define CONTEXT_TT_DEV_IOTLB	1
 #define CONTEXT_TT_PASS_THROUGH 2
@@ -480,6 +483,31 @@ struct context_entry {
 	u64 hi;
 };
 
+/* si_domain contains mulitple devices */
+#define DOMAIN_FLAG_STATIC_IDENTITY		BIT(0)
+
+/*
+ * This is a DMA domain allocated through the iommu domain allocation
+ * interface. But one or more devices belonging to this domain have
+ * been chosen to use a private domain. We should avoid to use the
+ * map/unmap/iova_to_phys APIs on it.
+ */
+#define DOMAIN_FLAG_LOSE_CHILDREN		BIT(1)
+
+/*
+ * When VT-d works in the scalable mode, it allows DMA translation to
+ * happen through either first level or second level page table. This
+ * bit marks that the DMA translation for the domain goes through the
+ * first level page table, otherwise, it goes through the second level.
+ */
+#define DOMAIN_FLAG_USE_FIRST_LEVEL		BIT(2)
+
+/*
+ * Domain represents a virtual machine which demands iommu nested
+ * translation mode support.
+ */
+#define DOMAIN_FLAG_NESTING_MODE		BIT(3)
+
 struct dmar_domain {
 	int	nid;			/* node id */
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
