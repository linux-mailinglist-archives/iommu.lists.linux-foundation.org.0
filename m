Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F3A3D1D11
	for <lists.iommu@lfdr.de>; Thu, 22 Jul 2021 06:31:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82ABF82A29;
	Thu, 22 Jul 2021 04:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czZJF-G9lDbh; Thu, 22 Jul 2021 04:31:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 794B982A56;
	Thu, 22 Jul 2021 04:31:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5386CC000E;
	Thu, 22 Jul 2021 04:31:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E7ADC000E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 04:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63C3D40134
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 04:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jb6ctivg4eYd for <iommu@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 04:31:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A31B400A8
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 04:31:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297126020"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="297126020"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 21:30:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="454612687"
Received: from km-skylake-client-platform.sc.intel.com ([172.25.103.115])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 21:30:57 -0700
From: Kyung Min Park <kyung.min.park@intel.com>
To: iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu/vt-d: Dump DMAR translation structure
Date: Wed, 21 Jul 2021 21:24:53 -0700
Message-Id: <20210722042453.10579-1-kyung.min.park@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: ravi.v.shankar@intel.com, ashok.raj@intel.com, dwmw2@infradead.org,
 Kyung Min Park <kyung.min.park@intel.com>, will@kernel.org
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

When the dmar translation fault happens, the kernel prints a single line
fault reason with corresponding hexadecimal code defined in the Intel VT-d
specification.

Currently, when user wants to debug the translation fault in detail,
debugfs is used for dumping the dmar_translation_struct, which is not
available when the kernel failed to boot.

Dump the DMAR translation structure, pagewalk the IO page table and print
the page table entry when the fault happens.

Signed-off-by: Kyung Min Park <kyung.min.park@intel.com>
---
ChangeLog:
- Change from v1 to v2:
  1. fix compilation issue with different IOMMU config option.
---
 drivers/iommu/intel/dmar.c  |   8 ++-
 drivers/iommu/intel/iommu.c | 107 ++++++++++++++++++++++++++++++++++++
 include/linux/dmar.h        |   4 ++
 3 files changed, 116 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index d66f79acd14d..c74d97c5ec21 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1948,19 +1948,21 @@ static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr >> 48,
 		       fault_reason, reason);
-	else if (pasid == INVALID_IOASID)
+	else if (pasid == INVALID_IOASID) {
 		pr_err("[%s NO_PASID] Request device [0x%02x:0x%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write",
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr,
 		       fault_reason, reason);
-	else
+		dmar_fault_dump_ptes(iommu, source_id, addr, pasid);
+	} else {
 		pr_err("[%s PASID 0x%x] Request device [0x%02x:0x%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write", pasid,
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr,
 		       fault_reason, reason);
-
+		dmar_fault_dump_ptes(iommu, source_id, addr, pasid);
+	}
 	return 0;
 }
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index a6a07d985709..859ec0832429 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -173,6 +173,8 @@ static struct intel_iommu **g_iommus;
 
 static void __init check_tylersburg_isoch(void);
 static int rwbf_quirk;
+static inline struct device_domain_info *
+dmar_search_domain_by_dev_info(int segment, int bus, int devfn);
 
 /*
  * set to 1 to panic kernel if can't successfully enable VT-d
@@ -998,6 +1000,111 @@ static void free_context_table(struct intel_iommu *iommu)
 	spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
+static void pgtable_walk(struct intel_iommu *iommu, unsigned long pfn, u8 bus, u8 devfn)
+{
+	struct dma_pte *parent, *pte = NULL;
+	struct device_domain_info *info;
+	struct dmar_domain *domain = NULL;
+	int offset, level;
+
+	info = dmar_search_domain_by_dev_info(iommu->segment, bus, devfn);
+	if (!info) {
+		pr_info("no iommu info for this device.\n");
+		return;
+	}
+
+	domain = info->domain;
+	if (!domain) {
+		pr_info("iommu domain does not exist for this device.\n");
+		return;
+	}
+	level = agaw_to_level(domain->agaw);
+	parent = domain->pgd;
+	if (!parent) {
+		pr_info("NULL pointer of page table entry.\n");
+		return;
+	}
+
+	while (1) {
+		offset = pfn_level_offset(pfn, level);
+		pte = &parent[offset];
+		if (!pte || (dma_pte_superpage(pte) || !dma_pte_present(pte))) {
+			pr_info("pte not present at level %d", level);
+			break;
+		}
+		pr_info("pte level: %d, pte value: %llx\n", level, pte->val);
+
+		if (level == 1)
+			break;
+		parent = phys_to_virt(dma_pte_addr(pte));
+		level--;
+	}
+}
+
+void dmar_fault_dump_ptes(struct intel_iommu *iommu, u16 source_id, unsigned long long addr,
+			  u32 pasid)
+{
+	struct pasid_dir_entry *dir, *pde;
+	struct pasid_entry *entries, *pte;
+	struct context_entry *ctx_entry;
+	struct root_entry *rt_entry;
+	u8 devfn = source_id & 0xff;
+	u8 bus = source_id >> 8;
+	int i, dir_index, index;
+
+	/* root entry dump */
+	rt_entry = &iommu->root_entry[bus];
+	if (!rt_entry) {
+		pr_info("root table entry is not present\n");
+		return;
+	}
+	if (!sm_supported(iommu))
+		pr_info("%s, root_entry[63:0]: %llx", iommu->name, rt_entry->lo);
+	else
+		pr_info("%s, root_entry[127:0]: %llx, %llx\n", iommu->name,
+			rt_entry->hi, rt_entry->lo);
+
+	/* context entry dump */
+	ctx_entry = iommu_context_addr(iommu, bus, devfn, 0);
+	if (!ctx_entry) {
+		pr_info("context table entry is not present\n");
+		return;
+	}
+	pr_info("%s, ctx_entry[127:0]: %llx, %llx\n", iommu->name, ctx_entry->hi, ctx_entry->lo);
+
+	/* legacy mode does not require PASID entries */
+	if (!sm_supported(iommu))
+		goto pgtable_walk;
+
+	/* get the pointer to pasid directory entry */
+	dir = phys_to_virt(ctx_entry->lo & VTD_PAGE_MASK);
+	if (!dir) {
+		pr_info("pasid directory entry is not present\n");
+		return;
+	}
+	/* For request-without-pasid, get the pasid from context entry */
+	if (intel_iommu_sm && pasid == INVALID_IOASID)
+		pasid = PASID_RID2PASID;
+
+	dir_index = pasid >> PASID_PDE_SHIFT;
+	pde = &dir[dir_index];
+	pr_info("%s, pasid_dir_entry: %llx\n", iommu->name, pde->val);
+
+	/* get the pointer to the pasid table entry */
+	entries = get_pasid_table_from_pde(pde);
+	if (!entries) {
+		pr_info("pasid table entry is not present\n");
+		return;
+	}
+	index = pasid & PASID_PTE_MASK;
+	pte = &entries[index];
+	for (i = 0; i < ARRAY_SIZE(pte->val); i++)
+		pr_info("%s, pasid_table_entry[%d]: %llx\n", iommu->name, i, pte->val[i]);
+
+pgtable_walk:
+	pgtable_walk(iommu, addr >> VTD_PAGE_SHIFT, bus, devfn);
+}
+
 static struct dma_pte *pfn_to_dma_pte(struct dmar_domain *domain,
 				      unsigned long pfn, int *target_level)
 {
diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index e04436a7ff27..cdcb1b6d85b9 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -142,9 +142,13 @@ extern int dmar_parse_one_satc(struct acpi_dmar_header *hdr, void *arg);
 extern int dmar_release_one_atsr(struct acpi_dmar_header *hdr, void *arg);
 extern int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert);
 extern int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info);
+void dmar_fault_dump_ptes(struct intel_iommu *iommu, u16 source_id,
+			  unsigned long long addr, u32 pasid);
 #else /* !CONFIG_INTEL_IOMMU: */
 static inline int intel_iommu_init(void) { return -ENODEV; }
 static inline void intel_iommu_shutdown(void) { }
+static inline void dmar_fault_dump_ptes(struct intel_iommu *iommu, u16 source_id,
+					unsigned long long addr, u32 pasid) {}
 
 #define	dmar_parse_one_rmrr		dmar_res_noop
 #define	dmar_parse_one_atsr		dmar_res_noop
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
