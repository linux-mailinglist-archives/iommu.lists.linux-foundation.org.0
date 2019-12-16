Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 130051219D3
	for <lists.iommu@lfdr.de>; Mon, 16 Dec 2019 20:19:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDA06876B8;
	Mon, 16 Dec 2019 19:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BD0e-StZDNln; Mon, 16 Dec 2019 19:19:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C844887749;
	Mon, 16 Dec 2019 19:19:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B61ACC077D;
	Mon, 16 Dec 2019 19:19:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51A9CC1D83
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4004E87789
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lwZUaN6hX1a for <iommu@lists.linux-foundation.org>;
 Mon, 16 Dec 2019 19:19:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C33FA8772F
 for <iommu@lists.linux-foundation.org>; Mon, 16 Dec 2019 19:19:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 11:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="209411635"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 16 Dec 2019 11:19:22 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v8 02/10] iommu/vt-d: Add nested translation helper function
Date: Mon, 16 Dec 2019 11:24:04 -0800
Message-Id: <1576524252-79116-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576524252-79116-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1576524252-79116-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Liu@osuosl.org
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

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
---
 drivers/iommu/intel-pasid.c | 213 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/iommu/intel-pasid.h |  12 +++
 include/linux/intel-iommu.h |   3 +
 include/uapi/linux/iommu.h  |   5 +-
 4 files changed, 232 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 3cb569e76642..b178ad9e47ae 100644
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
+	pasid_set_bits(&pe->val[1], GENMASK_ULL(63, 32), value << 27);
+}
+
+/*
+ * Setup the Cache Disable (CD) field (Bit 89)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_cd(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 25, 1);
+}
+
+/*
+ * Setup the Extended Memory Type Enable (EMTE) field (Bit 90)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_emte(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 26, 1);
+}
+
+/*
+ * Setup the Extended Access Flag Enable (EAFE) field (Bit 135)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_eafe(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[2], 1 << 7, 1);
+}
+
+/*
+ * Setup the Page-level Cache Disable (PCD) field (Bit 95)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_pcd(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 31, 1);
+}
+
+/*
+ * Setup the Page-level Write-Through (PWT)) field (Bit 94)
+ * of a scalable mode PASID entry.
+ */
+static inline void
+pasid_set_pwt(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[1], 1 << 30, 1);
+}
+
 static void
 pasid_cache_invalidation_with_pasid(struct intel_iommu *iommu,
 				    u16 did, int pasid)
@@ -599,3 +669,146 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 
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
+	 * on host needs regardless of  guest settings.
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
+	if (ecap_mts(iommu->ecap)) {
+		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EMTE) {
+			pasid_set_emte(pte);
+			pasid_set_emt(pte, pasid_data->emt);
+		}
+		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PCD)
+			pasid_set_pcd(pte);
+		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_PWT)
+			pasid_set_pwt(pte);
+		if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_CD)
+			pasid_set_cd(pte);
+		pasid_set_pat(pte, pasid_data->pat);
+	} else if (pasid_data->flags & IOMMU_SVA_VTD_GPASID_EMT_MASK) {
+		pr_warn("No memory type support for bind guest PASID on %s\n",
+			iommu->name);
+		return -EINVAL;
+	}
+
+	return 0;
+
+}
+
+/**
+ * intel_pasid_setup_nested() - Set up PASID entry for nested translation
+ * which is used for vSVA. The first level page tables are used for
+ * GVA-GPA or GIOVA-GPA translation in the guest, second level page tables
+ *  are used for GPA-HPA translation.
+ *
+ * @iommu:      Iommu which the device belong to
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
+	u64 pgd_val;
+	int agaw;
+	u16 did;
+
+	if (!ecap_nest(iommu->ecap)) {
+		pr_err("IOMMU: %s: No nested translation support\n",
+		       iommu->name);
+		return -EINVAL;
+	}
+
+	pte = intel_pasid_get_entry(dev, pasid);
+	if (WARN_ON(!pte))
+		return -EINVAL;
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
+		pasid_set_flpm(pte, 1);
+		break;
+	case ADDR_WIDTH_4LEVEL:
+		pasid_set_flpm(pte, 0);
+		break;
+	default:
+		dev_err(dev, "Invalid paging mode %d\n", addr_width);
+		return -EINVAL;
+	}
+
+	pasid_set_flptr(pte, (u64)gpgd);
+
+	intel_pasid_setup_bind_data(iommu, pte, pasid_data);
+
+	/* Setup the second level based on the given domain */
+	pgd = domain->pgd;
+
+	for (agaw = domain->agaw; agaw != iommu->agaw; agaw--) {
+		pgd = phys_to_virt(dma_pte_addr(pgd));
+		if (!dma_pte_present(pgd)) {
+			pasid_clear_entry(pte);
+			dev_err(dev, "Invalid domain page table\n");
+			return -EINVAL;
+		}
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
+	return 0;
+}
diff --git a/drivers/iommu/intel-pasid.h b/drivers/iommu/intel-pasid.h
index fc8cd8f17de1..95ed160b1947 100644
--- a/drivers/iommu/intel-pasid.h
+++ b/drivers/iommu/intel-pasid.h
@@ -36,6 +36,7 @@
  * to vmalloc or even module mappings.
  */
 #define PASID_FLAG_SUPERVISOR_MODE	BIT(0)
+#define PASID_FLAG_NESTED		BIT(1)
 
 struct pasid_dir_entry {
 	u64 val;
@@ -45,6 +46,11 @@ struct pasid_entry {
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
@@ -93,6 +99,12 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
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
index 74b79e2e6a73..19bf9ff180ae 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -34,6 +34,9 @@
 #define VTD_STRIDE_SHIFT        (9)
 #define VTD_STRIDE_MASK         (((u64)-1) << VTD_STRIDE_SHIFT)
 
+#define ADDR_WIDTH_5LEVEL	(57)
+#define ADDR_WIDTH_4LEVEL	(48)
+
 #define DMA_PTE_READ (1)
 #define DMA_PTE_WRITE (2)
 #define DMA_PTE_LARGE_PAGE (1 << 7)
diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 4ad3496e5c43..fcafb6401430 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
 	__u32 pat;
 	__u32 emt;
 };
-
+#define IOMMU_SVA_VTD_GPASID_EMT_MASK	(IOMMU_SVA_VTD_GPASID_CD | \
+					 IOMMU_SVA_VTD_GPASID_EMTE | \
+					 IOMMU_SVA_VTD_GPASID_PCD |  \
+					 IOMMU_SVA_VTD_GPASID_PWT)
 /**
  * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
  * @version:	Version of this data structure
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
