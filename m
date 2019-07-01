Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4F2A314
	for <lists.iommu@lfdr.de>; Sat, 25 May 2019 07:49:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B853FDB7;
	Sat, 25 May 2019 05:49:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0C7E1B65
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 955D46C5
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:49:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2019 22:49:07 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga006.fm.intel.com with ESMTP; 24 May 2019 22:49:04 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v4 10/15] iommu/vt-d: Probe DMA-capable ACPI name space devices
Date: Sat, 25 May 2019 13:41:31 +0800
Message-Id: <20190525054136.27810-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190525054136.27810-1-baolu.lu@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Some platforms may support ACPI name-space enumerated devices
that are capable of generating DMA requests. Platforms which
support DMA remapping explicitly declares any such DMA-capable
ACPI name-space devices in the platform through ACPI Name-space
Device Declaration (ANDD) structure and enumerate them through
the Device Scope of the appropriate remapping hardware unit.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index b7f5a6390be6..7f9cf9188f5f 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4816,6 +4816,48 @@ static int __init platform_optin_force_iommu(void)
 	return 1;
 }
 
+static int __init probe_acpi_namespace_devices(void)
+{
+	struct dmar_drhd_unit *drhd;
+	struct intel_iommu *iommu;
+	struct device *dev;
+	int i, ret = 0;
+
+	for_each_active_iommu(iommu, drhd) {
+		for_each_active_dev_scope(drhd->devices,
+					  drhd->devices_cnt, i, dev) {
+			struct acpi_device_physical_node *pn;
+			struct iommu_group *group;
+			struct acpi_device *adev;
+
+			if (dev->bus != &acpi_bus_type)
+				continue;
+
+			adev = to_acpi_device(dev);
+			mutex_lock(&adev->physical_node_lock);
+			list_for_each_entry(pn,
+					    &adev->physical_node_list, node) {
+				group = iommu_group_get(pn->dev);
+				if (group) {
+					iommu_group_put(group);
+					continue;
+				}
+
+				pn->dev->bus->iommu_ops = &intel_iommu_ops;
+				ret = iommu_probe_device(pn->dev);
+				if (ret)
+					break;
+			}
+			mutex_unlock(&adev->physical_node_lock);
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 int __init intel_iommu_init(void)
 {
 	int ret = -ENODEV;
@@ -4928,6 +4970,9 @@ int __init intel_iommu_init(void)
 	cpuhp_setup_state(CPUHP_IOMMU_INTEL_DEAD, "iommu/intel:dead", NULL,
 			  intel_iommu_cpu_dead);
 
+	if (probe_acpi_namespace_devices())
+		pr_warn("ACPI name space devices didn't probe correctly\n");
+
 	/* Finally, we enable the DMA remapping hardware. */
 	for_each_iommu(iommu, drhd) {
 		if (!translation_pre_enabled(iommu))
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
