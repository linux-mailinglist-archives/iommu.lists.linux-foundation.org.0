Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF26289F40
	for <lists.iommu@lfdr.de>; Sat, 10 Oct 2020 10:18:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2962B20442;
	Sat, 10 Oct 2020 08:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsOd5B7RJAG9; Sat, 10 Oct 2020 08:18:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B3C820451;
	Sat, 10 Oct 2020 08:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA5FC07FF;
	Sat, 10 Oct 2020 08:18:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DFD9C0051
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3010F875BB
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAQnBFhH2DEp for <iommu@lists.linux-foundation.org>;
 Sat, 10 Oct 2020 08:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ZXSHCAS2.zhaoxin.com (ZXSHCAS2.zhaoxin.com [203.148.12.82])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6689587805
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 08:18:14 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 10 Oct
 2020 16:02:56 +0800
Received: from localhost.localdomain (114.242.250.7) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sat, 10 Oct
 2020 16:02:55 +0800
From: FelixCuioc <FelixCui-oc@zhaoxin.com>
To: Joerg Roedel <joro@8bytes.org>, <iommu@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "Lu
 Baolu" <baolu.lu@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 <kbuild@lists.01.org>
Subject: [PATCH v3 1/2] iommu/vt-d:Add support for detecting ACPI device in
 RMRR
Date: Sat, 10 Oct 2020 04:02:40 -0400
Message-ID: <20201010080241.14642-2-FelixCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201010080241.14642-1-FelixCui-oc@zhaoxin.com>
References: <20201010080241.14642-1-FelixCui-oc@zhaoxin.com>
MIME-Version: 1.0
X-Originating-IP: [114.242.250.7]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
Cc: TonyWWang-oc@zhaoxin.com, CobeChen-oc@zhaoxin.com
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

Some ACPI devices need to issue dma requests to access
the reserved memory area.BIOS uses the device scope type
ACPI_NAMESPACE_DEVICE in RMRR to report these ACPI devices.
This patch add support for detecting ACPI devices in RMRR.

Signed-off-by: FelixCuioc <FelixCui-oc@zhaoxin.com>
---
 drivers/iommu/intel/dmar.c  | 76 +++++++++++++++++++++----------------
 drivers/iommu/intel/iommu.c | 23 ++++++++++-
 include/linux/dmar.h        | 12 +++++-
 3 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 54d790f75824..5ebe317280a6 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -215,7 +215,7 @@ static bool dmar_match_pci_path(struct dmar_pci_notify_info *info, int bus,
 }
 
 /* Return: > 0 if match found, 0 if no match found, < 0 if error happens */
-int dmar_insert_dev_scope(struct dmar_pci_notify_info *info,
+int dmar_pci_insert_dev_scope(struct dmar_pci_notify_info *info,
 			  void *start, void*end, u16 segment,
 			  struct dmar_dev_scope *devices,
 			  int devices_cnt)
@@ -304,7 +304,7 @@ static int dmar_pci_bus_add_dev(struct dmar_pci_notify_info *info)
 
 		drhd = container_of(dmaru->hdr,
 				    struct acpi_dmar_hardware_unit, header);
-		ret = dmar_insert_dev_scope(info, (void *)(drhd + 1),
+		ret = dmar_pci_insert_dev_scope(info, (void *)(drhd + 1),
 				((void *)drhd) + drhd->header.length,
 				dmaru->segment,
 				dmaru->devices, dmaru->devices_cnt);
@@ -697,47 +697,59 @@ dmar_find_matched_drhd_unit(struct pci_dev *dev)
 	return dmaru;
 }
 
-static void __init dmar_acpi_insert_dev_scope(u8 device_number,
-					      struct acpi_device *adev)
+/* Return: > 0 if match found, 0 if no match found */
+bool dmar_acpi_insert_dev_scope(u8 device_number,
+				struct acpi_device *adev,
+				void *start, void *end,
+				struct dmar_dev_scope *devices,
+				int devices_cnt)
 {
-	struct dmar_drhd_unit *dmaru;
-	struct acpi_dmar_hardware_unit *drhd;
 	struct acpi_dmar_device_scope *scope;
 	struct device *tmp;
 	int i;
 	struct acpi_dmar_pci_path *path;
 
+	for (; start < end; start += scope->length) {
+		scope = start;
+		if (scope->entry_type != ACPI_DMAR_SCOPE_TYPE_NAMESPACE)
+			continue;
+		if (scope->enumeration_id != device_number)
+			continue;
+		path = (void *)(scope + 1);
+		for_each_dev_scope(devices, devices_cnt, i, tmp)
+			if (tmp == NULL) {
+				devices[i].bus = scope->bus;
+				devices[i].devfn = PCI_DEVFN(path->device, path->function);
+				rcu_assign_pointer(devices[i].dev,
+						   get_device(&adev->dev));
+				return true;
+			}
+		WARN_ON(i >= devices_cnt);
+	}
+	return false;
+}
+
+static int dmar_acpi_bus_add_dev(u8 device_number, struct acpi_device *adev)
+{
+	struct dmar_drhd_unit *dmaru;
+	struct acpi_dmar_hardware_unit *drhd;
+	int ret;
+
 	for_each_drhd_unit(dmaru) {
 		drhd = container_of(dmaru->hdr,
 				    struct acpi_dmar_hardware_unit,
 				    header);
+		ret = dmar_acpi_insert_dev_scope(device_number, adev, (void *)(drhd+1),
+						((void *)drhd)+drhd->header.length,
+						dmaru->devices, dmaru->devices_cnt);
+		if (ret)
+			break;
+	}
+	if (ret > 0)
+		ret = dmar_rmrr_add_acpi_dev(device_number, adev);
 
-		for (scope = (void *)(drhd + 1);
-		     (unsigned long)scope < ((unsigned long)drhd) + drhd->header.length;
-		     scope = ((void *)scope) + scope->length) {
-			if (scope->entry_type != ACPI_DMAR_SCOPE_TYPE_NAMESPACE)
-				continue;
-			if (scope->enumeration_id != device_number)
-				continue;
+	return ret;
 
-			path = (void *)(scope + 1);
-			pr_info("ACPI device \"%s\" under DMAR at %llx as %02x:%02x.%d\n",
-				dev_name(&adev->dev), dmaru->reg_base_addr,
-				scope->bus, path->device, path->function);
-			for_each_dev_scope(dmaru->devices, dmaru->devices_cnt, i, tmp)
-				if (tmp == NULL) {
-					dmaru->devices[i].bus = scope->bus;
-					dmaru->devices[i].devfn = PCI_DEVFN(path->device,
-									    path->function);
-					rcu_assign_pointer(dmaru->devices[i].dev,
-							   get_device(&adev->dev));
-					return;
-				}
-			BUG_ON(i >= dmaru->devices_cnt);
-		}
-	}
-	pr_warn("No IOMMU scope found for ANDD enumeration ID %d (%s)\n",
-		device_number, dev_name(&adev->dev));
 }
 
 static int __init dmar_acpi_dev_scope_init(void)
@@ -766,7 +778,7 @@ static int __init dmar_acpi_dev_scope_init(void)
 				       andd->device_name);
 				continue;
 			}
-			dmar_acpi_insert_dev_scope(andd->device_number, adev);
+			dmar_acpi_bus_add_dev(andd->device_number, adev);
 		}
 	}
 	return 0;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 2485441445cf..594b2f29c043 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4553,6 +4553,25 @@ int dmar_find_matched_atsr_unit(struct pci_dev *dev)
 	return ret;
 }
 
+int dmar_rmrr_add_acpi_dev(u8 device_number, struct acpi_device *adev)
+{
+	int ret;
+	struct dmar_rmrr_unit *rmrru;
+	struct acpi_dmar_reserved_memory *rmrr;
+
+	list_for_each_entry(rmrru, &dmar_rmrr_units, list) {
+		rmrr = container_of(rmrru->hdr,
+				struct acpi_dmar_reserved_memory,
+				header);
+		ret = dmar_acpi_insert_dev_scope(device_number, adev, (void *)(rmrr + 1),
+						((void *)rmrr) + rmrr->header.length,
+						rmrru->devices, rmrru->devices_cnt);
+		if (ret)
+			break;
+	}
+	return 0;
+}
+
 int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info)
 {
 	int ret;
@@ -4568,7 +4587,7 @@ int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info)
 		rmrr = container_of(rmrru->hdr,
 				    struct acpi_dmar_reserved_memory, header);
 		if (info->event == BUS_NOTIFY_ADD_DEVICE) {
-			ret = dmar_insert_dev_scope(info, (void *)(rmrr + 1),
+			ret = dmar_pci_insert_dev_scope(info, (void *)(rmrr + 1),
 				((void *)rmrr) + rmrr->header.length,
 				rmrr->segment, rmrru->devices,
 				rmrru->devices_cnt);
@@ -4586,7 +4605,7 @@ int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info)
 
 		atsr = container_of(atsru->hdr, struct acpi_dmar_atsr, header);
 		if (info->event == BUS_NOTIFY_ADD_DEVICE) {
-			ret = dmar_insert_dev_scope(info, (void *)(atsr + 1),
+			ret = dmar_pci_insert_dev_scope(info, (void *)(atsr + 1),
 					(void *)atsr + atsr->header.length,
 					atsr->segment, atsru->devices,
 					atsru->devices_cnt);
diff --git a/include/linux/dmar.h b/include/linux/dmar.h
index 65565820328a..d0981d35d3c9 100644
--- a/include/linux/dmar.h
+++ b/include/linux/dmar.h
@@ -113,10 +113,14 @@ extern int dmar_parse_dev_scope(void *start, void *end, int *cnt,
 				struct dmar_dev_scope **devices, u16 segment);
 extern void *dmar_alloc_dev_scope(void *start, void *end, int *cnt);
 extern void dmar_free_dev_scope(struct dmar_dev_scope **devices, int *cnt);
-extern int dmar_insert_dev_scope(struct dmar_pci_notify_info *info,
+extern int dmar_pci_insert_dev_scope(struct dmar_pci_notify_info *info,
 				 void *start, void*end, u16 segment,
 				 struct dmar_dev_scope *devices,
 				 int devices_cnt);
+extern bool dmar_acpi_insert_dev_scope(u8 device_number,
+				struct acpi_device *adev, void *start, void *end,
+				struct dmar_dev_scope *devices, int devices_cnt);
+
 extern int dmar_remove_dev_scope(struct dmar_pci_notify_info *info,
 				 u16 segment, struct dmar_dev_scope *devices,
 				 int count);
@@ -140,6 +144,7 @@ extern int dmar_parse_one_atsr(struct acpi_dmar_header *header, void *arg);
 extern int dmar_check_one_atsr(struct acpi_dmar_header *hdr, void *arg);
 extern int dmar_release_one_atsr(struct acpi_dmar_header *hdr, void *arg);
 extern int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert);
+extern int dmar_rmrr_add_acpi_dev(u8 device_number, struct acpi_device *adev);
 extern int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info);
 #else /* !CONFIG_INTEL_IOMMU: */
 static inline int intel_iommu_init(void) { return -ENODEV; }
@@ -150,6 +155,11 @@ static inline void intel_iommu_shutdown(void) { }
 #define	dmar_check_one_atsr		dmar_res_noop
 #define	dmar_release_one_atsr		dmar_res_noop
 
+static inline int dmar_rmrr_add_acpi_dev(u8 device_number, struct acpi_device *adev)
+{
+	return 0;
+}
+
 static inline int dmar_iommu_notify_scope_dev(struct dmar_pci_notify_info *info)
 {
 	return 0;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
