Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F203A41F7
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 14:26:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A5660ABF;
	Fri, 11 Jun 2021 12:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e9IC5fDzVv80; Fri, 11 Jun 2021 12:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A473A60753;
	Fri, 11 Jun 2021 12:26:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E726C000B;
	Fri, 11 Jun 2021 12:26:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C2FCC000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 12:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E02040255
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 12:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3Hsdp6117pX for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 12:26:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21461404C3
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 12:26:30 +0000 (UTC)
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G1frZ42Gpz6J9Yl;
 Fri, 11 Jun 2021 20:13:34 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 11 Jun 2021 14:26:27 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 13:26:24 +0100
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>
Subject: [PATCH v12 3/5] iommu/vt-d: Add support for IOMMU default DMA mode
 build options
Date: Fri, 11 Jun 2021 20:20:41 +0800
Message-ID: <1623414043-40745-4-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org
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

From: Zhen Lei <thunder.leizhen@huawei.com>

Make IOMMU_DEFAULT_LAZY default for when INTEL_IOMMU config is set,
as is current behaviour.

Also delete global flag intel_iommu_strict:
- In intel_iommu_setup(), call iommu_set_dma_strict(true) directly. The
  accompanying print is removed, as it replicates the print in
  iommu_subsys_init(), and, since called from __setup(), should before
  iommu_subsys_init() (so desired ordering).

- For cap_caching_mode() set in intel_iommu_setup(), call
  iommu_set_dma_strict(true) directly, and reword the accompanying print
  and add the missing '\n'.

- For Ironlake GPU, again call iommu_set_dma_strict(true) directly and
  keep the accompanying print.

Note that we should not conflict with iommu.strict param conflicting when
we set strict mode, as that param is not for x86.

[jpg: Remove intel_iommu_strict]
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/Kconfig       |  1 +
 drivers/iommu/intel/iommu.c | 15 ++++++---------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 2a71347611d4..4467353f981b 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -94,6 +94,7 @@ choice
 	prompt "IOMMU default DMA mode"
 	depends on IOMMU_DMA
 
+	default IOMMU_DEFAULT_LAZY if INTEL_IOMMU
 	default IOMMU_DEFAULT_STRICT
 	help
 	  This option allows an IOMMU DMA mode to be chosen at build time, to
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index be35284a2016..6763e516362c 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -360,7 +360,6 @@ int intel_iommu_enabled = 0;
 EXPORT_SYMBOL_GPL(intel_iommu_enabled);
 
 static int dmar_map_gfx = 1;
-static int intel_iommu_strict;
 static int intel_iommu_superpage = 1;
 static int iommu_identity_mapping;
 static int iommu_skip_te_disable;
@@ -453,8 +452,7 @@ static int __init intel_iommu_setup(char *str)
 			pr_warn("intel_iommu=forcedac deprecated; use iommu.forcedac instead\n");
 			iommu_dma_forcedac = true;
 		} else if (!strncmp(str, "strict", 6)) {
-			pr_info("Disable batched IOTLB flush\n");
-			intel_iommu_strict = 1;
+			iommu_set_dma_strict(true);
 		} else if (!strncmp(str, "sp_off", 6)) {
 			pr_info("Disable supported super page\n");
 			intel_iommu_superpage = 0;
@@ -4392,9 +4390,9 @@ int __init intel_iommu_init(void)
 		 * is likely to be much lower than the overhead of synchronizing
 		 * the virtual and physical IOMMU page-tables.
 		 */
-		if (!intel_iommu_strict && cap_caching_mode(iommu->cap)) {
-			pr_warn("IOMMU batching is disabled due to virtualization");
-			intel_iommu_strict = 1;
+		if (cap_caching_mode(iommu->cap)) {
+			pr_warn("IOMMU batching disallowed due to virtualization\n");
+			iommu_set_dma_strict(true);
 		}
 		iommu_device_sysfs_add(&iommu->iommu, NULL,
 				       intel_iommu_groups,
@@ -4403,7 +4401,6 @@ int __init intel_iommu_init(void)
 	}
 	up_read(&dmar_global_lock);
 
-	iommu_set_dma_strict(intel_iommu_strict);
 	bus_set_iommu(&pci_bus_type, &intel_iommu_ops);
 	if (si_domain && !hw_pass_through)
 		register_memory_notifier(&intel_iommu_memory_nb);
@@ -5666,8 +5663,8 @@ static void quirk_calpella_no_shadow_gtt(struct pci_dev *dev)
 	} else if (dmar_map_gfx) {
 		/* we have to ensure the gfx device is idle before we flush */
 		pci_info(dev, "Disabling batched IOTLB flush on Ironlake\n");
-		intel_iommu_strict = 1;
-       }
+		iommu_set_dma_strict(true);
+	}
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0040, quirk_calpella_no_shadow_gtt);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x0044, quirk_calpella_no_shadow_gtt);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
