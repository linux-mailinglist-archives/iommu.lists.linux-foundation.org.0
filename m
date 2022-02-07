Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E224AB526
	for <lists.iommu@lfdr.de>; Mon,  7 Feb 2022 07:43:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9BD040278;
	Mon,  7 Feb 2022 06:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPZmPHLSTu4C; Mon,  7 Feb 2022 06:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CAE1C40207;
	Mon,  7 Feb 2022 06:43:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DAFAC0073;
	Mon,  7 Feb 2022 06:43:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9939BC000B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87C4640207
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5iNs5jxmaSO for <iommu@lists.linux-foundation.org>;
 Mon,  7 Feb 2022 06:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C3E8400E5
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644216183; x=1675752183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ExNa4riMiRn3tJUUnGOWKKokWOZoF/At4lWu1NiLiTc=;
 b=gg+ZTYGJJCBKBBzvn9t8WKo/GPzN/Fe3fnV8hk137SIVMJMXwCoF27vB
 3/ijEfahNIsP6+HkDfcV9vWYPVLhlzN2K8UtNd2sxj/lBYhYGyDonav/h
 gxU66T+PfA77SoD3VIBfwn8y9i2mOG2icoY9ODsgWIzC+EO356Zq+/W7U
 DUlw+6HUtoNnsYFOcYSdo8v5evw3JDnJ8OtpmIWHzLGGnme+x3p6CMJ+X
 UGyWo0XWWMl7rO+9GbiE8zNnTZC1+OiBDY3X1obP60dscaTH1NlAWa2IJ
 v36SpNPrUlWmvgF9IAsu6uGa0lnlVJenXegOeq+lnF8xL9rGT1gNqe6fF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228622924"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="228622924"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2022 22:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525020191"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 06 Feb 2022 22:42:59 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Liu Yi L <yi.l.liu@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: [PATCH v1 01/10] iommu/vt-d: Move DMAR specific helpers into dmar.c
Date: Mon,  7 Feb 2022 14:41:33 +0800
Message-Id: <20220207064142.1092846-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207064142.1092846-1-baolu.lu@linux.intel.com>
References: <20220207064142.1092846-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Some ACPI/DMAR specific helpers are defined in iommu.c but used in dmar.c.
Move those helpers to the place where they are used. No functional change.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/dmar.h        |  43 +++++--
 drivers/iommu/intel/dmar.c  | 216 +++++++++++++++++++++++++++++++-
 drivers/iommu/intel/iommu.c | 241 +-----------------------------------
 3 files changed, 246 insertions(+), 254 deletions(-)

diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index 45e903d84733..53746cc1efb2 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -52,6 +52,32 @@ struct dmar_drhd_unit {
 	struct intel_iommu *iommu;
 };
 
+struct dmar_rmrr_unit {
+	struct list_head list;		/* list of rmrr units	*/
+	struct acpi_dmar_header *hdr;	/* ACPI header		*/
+	u64	base_address;		/* reserved base address*/
+	u64	end_address;		/* reserved end address */
+	struct dmar_dev_scope *devices;	/* target devices */
+	int	devices_cnt;		/* target device count */
+};
+
+struct dmar_atsr_unit {
+	struct list_head list;		/* list of ATSR units */
+	struct acpi_dmar_header *hdr;	/* ACPI header */
+	struct dmar_dev_scope *devices;	/* target devices */
+	int devices_cnt;		/* target device count */
+	u8 include_all:1;		/* include all ports */
+};
+
+struct dmar_satc_unit {
+	struct list_head list;		/* list of SATC units */
+	struct acpi_dmar_header *hdr;	/* ACPI header */
+	struct dmar_dev_scope *devices;	/* target devices */
+	struct intel_iommu *iommu;	/* the corresponding iommu */
+	int devices_cnt;		/* target device count */
+	u8 atc_required:1;		/* ATS is required */
+};
+
 struct dmar_pci_path {
 	u8 bus;
 	u8 device;
@@ -69,6 +95,9 @@ struct dmar_pci_notify_info {
 
 extern struct rw_semaphore dmar_global_lock;
 extern struct list_head dmar_drhd_units;
+extern struct list_head dmar_rmrr_units;
+extern struct list_head dmar_atsr_units;
+extern struct list_head dmar_satc_units;
 
 #define for_each_drhd_unit(drhd)					\
 	list_for_each_entry_rcu(drhd, &dmar_drhd_units, list,		\
@@ -89,6 +118,9 @@ extern struct list_head dmar_drhd_units;
 				dmar_rcu_check())			\
 		if (i=drhd->iommu, 0) {} else 
 
+#define for_each_rmrr_units(rmrr)					\
+	list_for_each_entry(rmrr, &dmar_rmrr_units, list)
+
 static inline bool dmar_rcu_check(void)
 {
 	return rwsem_is_locked(&dmar_global_lock) ||
@@ -143,23 +175,12 @@ static inline void dmar_fault_dump_ptes(struct intel_iommu *iommu, u16 source_id
 extern int iommu_detected, no_iommu;
 extern int intel_iommu_init(void);
 extern void intel_iommu_shutdown(void);
-extern int dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg);
-extern int dmar_parse_one_atsr(struct acpi_dmar_header *header, void *arg);
-extern int dmar_check_one_atsr(struct acpi_dmar_header *hdr, void *arg);
-extern int dmar_parse_one_satc(struct acpi_dmar_header *hdr, void *arg);
-extern int dmar_release_one_atsr(struct acpi_dmar_header *hdr, void *arg);
 extern int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert);
 extern int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info);
 #else /* !CONFIG_INTEL_IOMMU: */
 static inline int intel_iommu_init(void) { return -ENODEV; }
 static inline void intel_iommu_shutdown(void) { }
 
-#define	dmar_parse_one_rmrr		dmar_res_noop
-#define	dmar_parse_one_atsr		dmar_res_noop
-#define	dmar_check_one_atsr		dmar_res_noop
-#define	dmar_release_one_atsr		dmar_res_noop
-#define	dmar_parse_one_satc		dmar_res_noop
-
 static inline int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info)
 {
 	return 0;
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 915bff76fe96..c94decd052f6 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -58,6 +58,9 @@ struct dmar_res_callback {
  */
 DECLARE_RWSEM(dmar_global_lock);
 LIST_HEAD(dmar_drhd_units);
+LIST_HEAD(dmar_rmrr_units);
+LIST_HEAD(dmar_atsr_units);
+LIST_HEAD(dmar_satc_units);
 
 struct acpi_table_header * __initdata dmar_tbl;
 static int dmar_dev_scope_status = 1;
@@ -518,8 +521,214 @@ static int dmar_parse_one_rhsa(struct acpi_dmar_header *header, void *arg)
 #define	dmar_parse_one_rhsa		dmar_res_noop
 #endif
 
-static void
-dmar_table_print_dmar_entry(struct acpi_dmar_header *header)
+#ifdef CONFIG_INTEL_IOMMU
+static inline int rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
+{
+	if (!IS_ALIGNED(rmrr->base_address, PAGE_SIZE) ||
+	    !IS_ALIGNED(rmrr->end_address + 1, PAGE_SIZE) ||
+	    rmrr->end_address <= rmrr->base_address ||
+	    arch_rmrr_sanity_check(rmrr))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
+{
+	struct acpi_dmar_reserved_memory *rmrr;
+	struct dmar_rmrr_unit *rmrru;
+
+	rmrr = (struct acpi_dmar_reserved_memory *)header;
+	if (rmrr_sanity_check(rmrr)) {
+		pr_warn(FW_BUG
+			   "Your BIOS is broken; bad RMRR [%#018Lx-%#018Lx]\n"
+			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
+			   rmrr->base_address, rmrr->end_address,
+			   dmi_get_system_info(DMI_BIOS_VENDOR),
+			   dmi_get_system_info(DMI_BIOS_VERSION),
+			   dmi_get_system_info(DMI_PRODUCT_VERSION));
+		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
+	}
+
+	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
+	if (!rmrru)
+		goto out;
+
+	rmrru->hdr = header;
+	rmrru->base_address = rmrr->base_address;
+	rmrru->end_address = rmrr->end_address;
+	rmrru->devices = dmar_alloc_dev_scope((void *)(rmrr + 1),
+				((void *)rmrr) + rmrr->header.length,
+				&rmrru->devices_cnt);
+
+	if (rmrru->devices_cnt && !rmrru->devices)
+		goto free_rmrru;
+
+	list_add(&rmrru->list, &dmar_rmrr_units);
+
+	return 0;
+free_rmrru:
+	kfree(rmrru);
+out:
+	return -ENOMEM;
+}
+
+static struct dmar_atsr_unit *dmar_find_atsr(struct acpi_dmar_atsr *atsr)
+{
+	struct dmar_atsr_unit *atsru;
+	struct acpi_dmar_atsr *tmp;
+
+	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list,
+				dmar_rcu_check()) {
+		tmp = (struct acpi_dmar_atsr *)atsru->hdr;
+		if (atsr->segment != tmp->segment)
+			continue;
+		if (atsr->header.length != tmp->header.length)
+			continue;
+		if (memcmp(atsr, tmp, atsr->header.length) == 0)
+			return atsru;
+	}
+
+	return NULL;
+}
+
+static int dmar_parse_one_atsr(struct acpi_dmar_header *hdr, void *arg)
+{
+	struct acpi_dmar_atsr *atsr;
+	struct dmar_atsr_unit *atsru;
+
+	if (system_state >= SYSTEM_RUNNING && !intel_iommu_enabled)
+		return 0;
+
+	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
+	atsru = dmar_find_atsr(atsr);
+	if (atsru)
+		return 0;
+
+	atsru = kzalloc(sizeof(*atsru) + hdr->length, GFP_KERNEL);
+	if (!atsru)
+		return -ENOMEM;
+
+	/*
+	 * If memory is allocated from slab by ACPI _DSM method, we need to
+	 * copy the memory content because the memory buffer will be freed
+	 * on return.
+	 */
+	atsru->hdr = (void *)(atsru + 1);
+	memcpy(atsru->hdr, hdr, hdr->length);
+	atsru->include_all = atsr->flags & 0x1;
+	if (!atsru->include_all) {
+		atsru->devices = dmar_alloc_dev_scope((void *)(atsr + 1),
+				(void *)atsr + atsr->header.length,
+				&atsru->devices_cnt);
+		if (atsru->devices_cnt && !atsru->devices) {
+			kfree(atsru);
+			return -ENOMEM;
+		}
+	}
+
+	list_add_rcu(&atsru->list, &dmar_atsr_units);
+
+	return 0;
+}
+
+static int dmar_release_one_atsr(struct acpi_dmar_header *hdr, void *arg)
+{
+	struct acpi_dmar_atsr *atsr;
+	struct dmar_atsr_unit *atsru;
+
+	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
+	atsru = dmar_find_atsr(atsr);
+	if (atsru) {
+		list_del_rcu(&atsru->list);
+		synchronize_rcu();
+		dmar_free_dev_scope(&atsru->devices, &atsru->devices_cnt);
+		kfree(atsru);
+	}
+
+	return 0;
+}
+
+static int dmar_check_one_atsr(struct acpi_dmar_header *hdr, void *arg)
+{
+	int i;
+	struct device *dev;
+	struct acpi_dmar_atsr *atsr;
+	struct dmar_atsr_unit *atsru;
+
+	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
+	atsru = dmar_find_atsr(atsr);
+	if (!atsru)
+		return 0;
+
+	if (!atsru->include_all && atsru->devices && atsru->devices_cnt) {
+		for_each_active_dev_scope(atsru->devices, atsru->devices_cnt,
+					  i, dev)
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
+static struct dmar_satc_unit *dmar_find_satc(struct acpi_dmar_satc *satc)
+{
+	struct dmar_satc_unit *satcu;
+	struct acpi_dmar_satc *tmp;
+
+	list_for_each_entry_rcu(satcu, &dmar_satc_units, list,
+				dmar_rcu_check()) {
+		tmp = (struct acpi_dmar_satc *)satcu->hdr;
+		if (satc->segment != tmp->segment)
+			continue;
+		if (satc->header.length != tmp->header.length)
+			continue;
+		if (memcmp(satc, tmp, satc->header.length) == 0)
+			return satcu;
+	}
+
+	return NULL;
+}
+
+static int dmar_parse_one_satc(struct acpi_dmar_header *hdr, void *arg)
+{
+	struct acpi_dmar_satc *satc;
+	struct dmar_satc_unit *satcu;
+
+	if (system_state >= SYSTEM_RUNNING && !intel_iommu_enabled)
+		return 0;
+
+	satc = container_of(hdr, struct acpi_dmar_satc, header);
+	satcu = dmar_find_satc(satc);
+	if (satcu)
+		return 0;
+
+	satcu = kzalloc(sizeof(*satcu) + hdr->length, GFP_KERNEL);
+	if (!satcu)
+		return -ENOMEM;
+
+	satcu->hdr = (void *)(satcu + 1);
+	memcpy(satcu->hdr, hdr, hdr->length);
+	satcu->atc_required = satc->flags & 0x1;
+	satcu->devices = dmar_alloc_dev_scope((void *)(satc + 1),
+					      (void *)satc + satc->header.length,
+					      &satcu->devices_cnt);
+	if (satcu->devices_cnt && !satcu->devices) {
+		kfree(satcu);
+		return -ENOMEM;
+	}
+	list_add_rcu(&satcu->list, &dmar_satc_units);
+
+	return 0;
+}
+#else /* !CONFIG_INTEL_IOMMU: */
+#define	dmar_parse_one_rmrr		dmar_res_noop
+#define	dmar_parse_one_atsr		dmar_res_noop
+#define	dmar_check_one_atsr		dmar_res_noop
+#define	dmar_release_one_atsr		dmar_res_noop
+#define	dmar_parse_one_satc		dmar_res_noop
+#endif
+
+static void dmar_table_print_dmar_entry(struct acpi_dmar_header *header)
 {
 	struct acpi_dmar_hardware_unit *drhd;
 	struct acpi_dmar_reserved_memory *rmrr;
@@ -631,8 +840,7 @@ static inline int dmar_walk_dmar_table(struct acpi_table_dmar *dmar,
 /**
  * parse_dmar_table - parses the DMA reporting table
  */
-static int __init
-parse_dmar_table(void)
+static int __init parse_dmar_table(void)
 {
 	struct acpi_table_dmar *dmar;
 	int drhd_count = 0;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index b549172e88ef..3eb914798c18 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -280,39 +280,6 @@ static int hw_pass_through = 1;
 	for (idx = 0; idx < g_num_of_iommus; idx++)		\
 		if (domain->iommu_refcnt[idx])
 
-struct dmar_rmrr_unit {
-	struct list_head list;		/* list of rmrr units	*/
-	struct acpi_dmar_header *hdr;	/* ACPI header		*/
-	u64	base_address;		/* reserved base address*/
-	u64	end_address;		/* reserved end address */
-	struct dmar_dev_scope *devices;	/* target devices */
-	int	devices_cnt;		/* target device count */
-};
-
-struct dmar_atsr_unit {
-	struct list_head list;		/* list of ATSR units */
-	struct acpi_dmar_header *hdr;	/* ACPI header */
-	struct dmar_dev_scope *devices;	/* target devices */
-	int devices_cnt;		/* target device count */
-	u8 include_all:1;		/* include all ports */
-};
-
-struct dmar_satc_unit {
-	struct list_head list;		/* list of SATC units */
-	struct acpi_dmar_header *hdr;	/* ACPI header */
-	struct dmar_dev_scope *devices;	/* target devices */
-	struct intel_iommu *iommu;	/* the corresponding iommu */
-	int devices_cnt;		/* target device count */
-	u8 atc_required:1;		/* ATS is required */
-};
-
-static LIST_HEAD(dmar_atsr_units);
-static LIST_HEAD(dmar_rmrr_units);
-static LIST_HEAD(dmar_satc_units);
-
-#define for_each_rmrr_units(rmrr) \
-	list_for_each_entry(rmrr, &dmar_rmrr_units, list)
-
 /* bitmap for indexing intel_iommus */
 static int g_num_of_iommus;
 
@@ -3657,211 +3624,6 @@ static void __init init_iommu_pm_ops(void)
 static inline void init_iommu_pm_ops(void) {}
 #endif	/* CONFIG_PM */
 
-static int rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
-{
-	if (!IS_ALIGNED(rmrr->base_address, PAGE_SIZE) ||
-	    !IS_ALIGNED(rmrr->end_address + 1, PAGE_SIZE) ||
-	    rmrr->end_address <= rmrr->base_address ||
-	    arch_rmrr_sanity_check(rmrr))
-		return -EINVAL;
-
-	return 0;
-}
-
-int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
-{
-	struct acpi_dmar_reserved_memory *rmrr;
-	struct dmar_rmrr_unit *rmrru;
-
-	rmrr = (struct acpi_dmar_reserved_memory *)header;
-	if (rmrr_sanity_check(rmrr)) {
-		pr_warn(FW_BUG
-			   "Your BIOS is broken; bad RMRR [%#018Lx-%#018Lx]\n"
-			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
-			   rmrr->base_address, rmrr->end_address,
-			   dmi_get_system_info(DMI_BIOS_VENDOR),
-			   dmi_get_system_info(DMI_BIOS_VERSION),
-			   dmi_get_system_info(DMI_PRODUCT_VERSION));
-		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
-	}
-
-	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
-	if (!rmrru)
-		goto out;
-
-	rmrru->hdr = header;
-
-	rmrru->base_address = rmrr->base_address;
-	rmrru->end_address = rmrr->end_address;
-
-	rmrru->devices = dmar_alloc_dev_scope((void *)(rmrr + 1),
-				((void *)rmrr) + rmrr->header.length,
-				&rmrru->devices_cnt);
-	if (rmrru->devices_cnt && rmrru->devices == NULL)
-		goto free_rmrru;
-
-	list_add(&rmrru->list, &dmar_rmrr_units);
-
-	return 0;
-free_rmrru:
-	kfree(rmrru);
-out:
-	return -ENOMEM;
-}
-
-static struct dmar_atsr_unit *dmar_find_atsr(struct acpi_dmar_atsr *atsr)
-{
-	struct dmar_atsr_unit *atsru;
-	struct acpi_dmar_atsr *tmp;
-
-	list_for_each_entry_rcu(atsru, &dmar_atsr_units, list,
-				dmar_rcu_check()) {
-		tmp = (struct acpi_dmar_atsr *)atsru->hdr;
-		if (atsr->segment != tmp->segment)
-			continue;
-		if (atsr->header.length != tmp->header.length)
-			continue;
-		if (memcmp(atsr, tmp, atsr->header.length) == 0)
-			return atsru;
-	}
-
-	return NULL;
-}
-
-int dmar_parse_one_atsr(struct acpi_dmar_header *hdr, void *arg)
-{
-	struct acpi_dmar_atsr *atsr;
-	struct dmar_atsr_unit *atsru;
-
-	if (system_state >= SYSTEM_RUNNING && !intel_iommu_enabled)
-		return 0;
-
-	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
-	atsru = dmar_find_atsr(atsr);
-	if (atsru)
-		return 0;
-
-	atsru = kzalloc(sizeof(*atsru) + hdr->length, GFP_KERNEL);
-	if (!atsru)
-		return -ENOMEM;
-
-	/*
-	 * If memory is allocated from slab by ACPI _DSM method, we need to
-	 * copy the memory content because the memory buffer will be freed
-	 * on return.
-	 */
-	atsru->hdr = (void *)(atsru + 1);
-	memcpy(atsru->hdr, hdr, hdr->length);
-	atsru->include_all = atsr->flags & 0x1;
-	if (!atsru->include_all) {
-		atsru->devices = dmar_alloc_dev_scope((void *)(atsr + 1),
-				(void *)atsr + atsr->header.length,
-				&atsru->devices_cnt);
-		if (atsru->devices_cnt && atsru->devices == NULL) {
-			kfree(atsru);
-			return -ENOMEM;
-		}
-	}
-
-	list_add_rcu(&atsru->list, &dmar_atsr_units);
-
-	return 0;
-}
-
-static void intel_iommu_free_atsr(struct dmar_atsr_unit *atsru)
-{
-	dmar_free_dev_scope(&atsru->devices, &atsru->devices_cnt);
-	kfree(atsru);
-}
-
-int dmar_release_one_atsr(struct acpi_dmar_header *hdr, void *arg)
-{
-	struct acpi_dmar_atsr *atsr;
-	struct dmar_atsr_unit *atsru;
-
-	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
-	atsru = dmar_find_atsr(atsr);
-	if (atsru) {
-		list_del_rcu(&atsru->list);
-		synchronize_rcu();
-		intel_iommu_free_atsr(atsru);
-	}
-
-	return 0;
-}
-
-int dmar_check_one_atsr(struct acpi_dmar_header *hdr, void *arg)
-{
-	int i;
-	struct device *dev;
-	struct acpi_dmar_atsr *atsr;
-	struct dmar_atsr_unit *atsru;
-
-	atsr = container_of(hdr, struct acpi_dmar_atsr, header);
-	atsru = dmar_find_atsr(atsr);
-	if (!atsru)
-		return 0;
-
-	if (!atsru->include_all && atsru->devices && atsru->devices_cnt) {
-		for_each_active_dev_scope(atsru->devices, atsru->devices_cnt,
-					  i, dev)
-			return -EBUSY;
-	}
-
-	return 0;
-}
-
-static struct dmar_satc_unit *dmar_find_satc(struct acpi_dmar_satc *satc)
-{
-	struct dmar_satc_unit *satcu;
-	struct acpi_dmar_satc *tmp;
-
-	list_for_each_entry_rcu(satcu, &dmar_satc_units, list,
-				dmar_rcu_check()) {
-		tmp = (struct acpi_dmar_satc *)satcu->hdr;
-		if (satc->segment != tmp->segment)
-			continue;
-		if (satc->header.length != tmp->header.length)
-			continue;
-		if (memcmp(satc, tmp, satc->header.length) == 0)
-			return satcu;
-	}
-
-	return NULL;
-}
-
-int dmar_parse_one_satc(struct acpi_dmar_header *hdr, void *arg)
-{
-	struct acpi_dmar_satc *satc;
-	struct dmar_satc_unit *satcu;
-
-	if (system_state >= SYSTEM_RUNNING && !intel_iommu_enabled)
-		return 0;
-
-	satc = container_of(hdr, struct acpi_dmar_satc, header);
-	satcu = dmar_find_satc(satc);
-	if (satcu)
-		return 0;
-
-	satcu = kzalloc(sizeof(*satcu) + hdr->length, GFP_KERNEL);
-	if (!satcu)
-		return -ENOMEM;
-
-	satcu->hdr = (void *)(satcu + 1);
-	memcpy(satcu->hdr, hdr, hdr->length);
-	satcu->atc_required = satc->flags & 0x1;
-	satcu->devices = dmar_alloc_dev_scope((void *)(satc + 1),
-					      (void *)satc + satc->header.length,
-					      &satcu->devices_cnt);
-	if (satcu->devices_cnt && !satcu->devices) {
-		kfree(satcu);
-		return -ENOMEM;
-	}
-	list_add_rcu(&satcu->list, &dmar_satc_units);
-
-	return 0;
-}
-
 static int intel_iommu_add(struct dmar_drhd_unit *dmaru)
 {
 	int sp, ret;
@@ -3977,7 +3739,8 @@ static void intel_iommu_free_dmars(void)
 
 	list_for_each_entry_safe(atsru, atsr_n, &dmar_atsr_units, list) {
 		list_del(&atsru->list);
-		intel_iommu_free_atsr(atsru);
+		dmar_free_dev_scope(&atsru->devices, &atsru->devices_cnt);
+		kfree(atsru);
 	}
 	list_for_each_entry_safe(satcu, satc_n, &dmar_satc_units, list) {
 		list_del(&satcu->list);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
