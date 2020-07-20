Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F00226B80
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 18:43:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 483248829F;
	Mon, 20 Jul 2020 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQcKKQOYp-3B; Mon, 20 Jul 2020 16:43:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9785F882A9;
	Mon, 20 Jul 2020 16:43:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CF07C016F;
	Mon, 20 Jul 2020 16:43:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABA1EC016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A1CE685487
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 16:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r84qqrePf_1p for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 16:43:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 85EFC84BAF
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 16:43:09 +0000 (UTC)
IronPort-SDR: hOEUFs3zQBduSivKEIMB14sN3fTvoGnCrSyWCbleaZvXgNlEIVIDyrLplMihXD8PiP9iFiZIqA
 fnfpo3hM0qEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="149111053"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="149111053"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 09:43:06 -0700
IronPort-SDR: d4PLIuEwn7c0OTzx6bO7SLAnEHKLtwtFBvlrqqp3K9C7F/ygYHygZcewVV6IJYkG5wc3JVAbLT
 ovlOs0gRdsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="318061857"
Received: from otc-nc-03.jf.intel.com ([10.54.39.25])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2020 09:43:06 -0700
From: Ashok Raj <ashok.raj@intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Joerg Roedel <joro@8bytes.org>, Lu Baolu <baolu.lu@intel.com>
Subject: [PATCH] PCI/ATS: PASID and PRI are only enumerated in PF devices.
Date: Mon, 20 Jul 2020 09:43:00 -0700
Message-Id: <1595263380-209956-1-git-send-email-ashok.raj@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: iommu@lists.linux-foundation.org, Ashok Raj <ashok.raj@intel.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
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

PASID and PRI capabilities are only enumerated in PF devices. VF devices
do not enumerate these capabilites. IOMMU drivers also need to enumerate
them before enabling features in the IOMMU. Extending the same support as
PASID feature discovery (pci_pasid_features) for PRI.

Signed-off-by: Ashok Raj <ashok.raj@intel.com>

To: Bjorn Helgaas <bhelgaas@google.com>
To: Joerg Roedel <joro@8bytes.com>
To: Lu Baolu <baolu.lu@intel.com>
Cc: stable@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: iommu@lists.linux-foundation.org
---
 drivers/iommu/intel/iommu.c |  2 +-
 drivers/pci/ats.c           | 14 ++++++++++++++
 include/linux/pci-ats.h     |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d759e7234e98..276452f5e6a7 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2560,7 +2560,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
 			}
 
 			if (info->ats_supported && ecap_prs(iommu->ecap) &&
-			    pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_PRI))
+			    pci_pri_supported(pdev))
 				info->pri_supported = 1;
 		}
 	}
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index b761c1f72f67..ffb4de8c5a77 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -461,6 +461,20 @@ int pci_pasid_features(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_pasid_features);
 
+/**
+ * pci_pri_supported - Check if PRI is supported.
+ * @pdev: PCI device structure
+ *
+ * Returns false when no PRI capability is present.
+ * Returns true if PRI feature is supported and enabled
+ */
+bool pci_pri_supported(struct pci_dev *pdev)
+{
+	/* VFs share the PF PRI configuration */
+	return !!(pci_physfn(pdev)->pri_cap);
+}
+EXPORT_SYMBOL_GPL(pci_pri_supported);
+
 #define PASID_NUMBER_SHIFT	8
 #define PASID_NUMBER_MASK	(0x1f << PASID_NUMBER_SHIFT)
 /**
diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index f75c307f346d..073d57292445 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -28,6 +28,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
 void pci_disable_pri(struct pci_dev *pdev);
 int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
+bool pci_pri_supported(struct pci_dev *pdev);
 #endif /* CONFIG_PCI_PRI */
 
 #ifdef CONFIG_PCI_PASID
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
