Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F315DC75
	for <lists.iommu@lfdr.de>; Fri, 14 Feb 2020 16:53:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8847522128;
	Fri, 14 Feb 2020 15:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KscCguCQ8G0X; Fri, 14 Feb 2020 15:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5DF612210F;
	Fri, 14 Feb 2020 15:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43220C0881;
	Fri, 14 Feb 2020 15:53:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B011EC0177
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9ED64866C8
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gx0AlvIoNugd for <iommu@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 15:53:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DCF11866C4
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 15:53:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED34B24681;
 Fri, 14 Feb 2020 15:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695625;
 bh=+QlcluC9QLk6waoQcGx030akdh5WEF/5dwtHWd7jK7U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E/ADpgKbujgfzYK31nqQTZLs24P3lQyivr9q3jOymNgoiiql2z6ESLupSVhZhPG2v
 8+KXc2hFK3Jl+95d41+5uHiZL/dXGv1Ptvc/JKqlzp16UTOR1/uF5+V+4IFu6KAs2m
 Q4n381Pf2ao60IJm1DdJm2XRFMvTC7qcE4YpYS+s=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 224/542] PCI: Add nr_devfns parameter to
 pci_add_dma_alias()
Date: Fri, 14 Feb 2020 10:43:36 -0500
Message-Id: <20200214154854.6746-224-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Bjorn Helgaas <bhelgaas@google.com>, iommu@lists.linux-foundation.org,
 linux-pci@vger.kernel.org, Sasha Levin <sashal@kernel.org>
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

From: James Sewart <jamessewart@arista.com>

[ Upstream commit 09298542cd891b43778db1f65aa3613aa5a562eb ]

Add a "nr_devfns" parameter to pci_add_dma_alias() so it can be used to
create DMA aliases for a range of devfns.

[bhelgaas: incorporate nr_devfns fix from James, update
quirk_pex_vca_alias() and setup_aliases()]
Signed-off-by: James Sewart <jamessewart@arista.com>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu.c |  7 ++-----
 drivers/pci/pci.c         | 22 +++++++++++++++++-----
 drivers/pci/quirks.c      | 23 +++++++++--------------
 include/linux/pci.h       |  2 +-
 4 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index bd25674ee4dba..7a6c056b9b9cc 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -230,11 +230,8 @@ static struct pci_dev *setup_aliases(struct device *dev)
 	 */
 	ivrs_alias = amd_iommu_alias_table[pci_dev_id(pdev)];
 	if (ivrs_alias != pci_dev_id(pdev) &&
-	    PCI_BUS_NUM(ivrs_alias) == pdev->bus->number) {
-		pci_add_dma_alias(pdev, ivrs_alias & 0xff);
-		pci_info(pdev, "Added PCI DMA alias %02x.%d\n",
-			PCI_SLOT(ivrs_alias), PCI_FUNC(ivrs_alias));
-	}
+	    PCI_BUS_NUM(ivrs_alias) == pdev->bus->number)
+		pci_add_dma_alias(pdev, ivrs_alias & 0xff, 1);
 
 	clone_aliases(pdev);
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7b5fa2eabe095..951099279192d 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5998,7 +5998,8 @@ EXPORT_SYMBOL_GPL(pci_pr3_present);
 /**
  * pci_add_dma_alias - Add a DMA devfn alias for a device
  * @dev: the PCI device for which alias is added
- * @devfn: alias slot and function
+ * @devfn_from: alias slot and function
+ * @nr_devfns: number of subsequent devfns to alias
  *
  * This helper encodes an 8-bit devfn as a bit number in dma_alias_mask
  * which is used to program permissible bus-devfn source addresses for DMA
@@ -6014,8 +6015,13 @@ EXPORT_SYMBOL_GPL(pci_pr3_present);
  * cannot be left as a userspace activity).  DMA aliases should therefore
  * be configured via quirks, such as the PCI fixup header quirk.
  */
-void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
+void pci_add_dma_alias(struct pci_dev *dev, u8 devfn_from, unsigned nr_devfns)
 {
+	int devfn_to;
+
+	nr_devfns = min(nr_devfns, (unsigned) MAX_NR_DEVFNS - devfn_from);
+	devfn_to = devfn_from + nr_devfns - 1;
+
 	if (!dev->dma_alias_mask)
 		dev->dma_alias_mask = bitmap_zalloc(MAX_NR_DEVFNS, GFP_KERNEL);
 	if (!dev->dma_alias_mask) {
@@ -6023,9 +6029,15 @@ void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
 		return;
 	}
 
-	set_bit(devfn, dev->dma_alias_mask);
-	pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
-		 PCI_SLOT(devfn), PCI_FUNC(devfn));
+	bitmap_set(dev->dma_alias_mask, devfn_from, nr_devfns);
+
+	if (nr_devfns == 1)
+		pci_info(dev, "Enabling fixed DMA alias to %02x.%d\n",
+				PCI_SLOT(devfn_from), PCI_FUNC(devfn_from));
+	else if (nr_devfns > 1)
+		pci_info(dev, "Enabling fixed DMA alias for devfn range from %02x.%d to %02x.%d\n",
+				PCI_SLOT(devfn_from), PCI_FUNC(devfn_from),
+				PCI_SLOT(devfn_to), PCI_FUNC(devfn_to));
 }
 
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2)
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index c0b7aa4dc0f51..9aa590eb712fe 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3927,7 +3927,7 @@ int pci_dev_specific_reset(struct pci_dev *dev, int probe)
 static void quirk_dma_func0_alias(struct pci_dev *dev)
 {
 	if (PCI_FUNC(dev->devfn) != 0)
-		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 0));
+		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 0), 1);
 }
 
 /*
@@ -3941,7 +3941,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_RICOH, 0xe476, quirk_dma_func0_alias);
 static void quirk_dma_func1_alias(struct pci_dev *dev)
 {
 	if (PCI_FUNC(dev->devfn) != 1)
-		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 1));
+		pci_add_dma_alias(dev, PCI_DEVFN(PCI_SLOT(dev->devfn), 1), 1);
 }
 
 /*
@@ -4026,7 +4026,7 @@ static void quirk_fixed_dma_alias(struct pci_dev *dev)
 
 	id = pci_match_id(fixed_dma_alias_tbl, dev);
 	if (id)
-		pci_add_dma_alias(dev, id->driver_data);
+		pci_add_dma_alias(dev, id->driver_data, 1);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ADAPTEC2, 0x0285, quirk_fixed_dma_alias);
 
@@ -4067,9 +4067,9 @@ DECLARE_PCI_FIXUP_HEADER(0x8086, 0x244e, quirk_use_pcie_bridge_dma_alias);
  */
 static void quirk_mic_x200_dma_alias(struct pci_dev *pdev)
 {
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x10, 0x0));
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x11, 0x0));
-	pci_add_dma_alias(pdev, PCI_DEVFN(0x12, 0x3));
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x10, 0x0), 1);
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x11, 0x0), 1);
+	pci_add_dma_alias(pdev, PCI_DEVFN(0x12, 0x3), 1);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2260, quirk_mic_x200_dma_alias);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2264, quirk_mic_x200_dma_alias);
@@ -4093,13 +4093,8 @@ static void quirk_pex_vca_alias(struct pci_dev *pdev)
 	const unsigned int num_pci_slots = 0x20;
 	unsigned int slot;
 
-	for (slot = 0; slot < num_pci_slots; slot++) {
-		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x0));
-		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x1));
-		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x2));
-		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x3));
-		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x4));
-	}
+	for (slot = 0; slot < num_pci_slots; slot++)
+		pci_add_dma_alias(pdev, PCI_DEVFN(slot, 0x0), 5);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2954, quirk_pex_vca_alias);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2955, quirk_pex_vca_alias);
@@ -5334,7 +5329,7 @@ static void quirk_switchtec_ntb_dma_alias(struct pci_dev *pdev)
 			pci_dbg(pdev,
 				"Aliasing Partition %d Proxy ID %02x.%d\n",
 				pp, PCI_SLOT(devfn), PCI_FUNC(devfn));
-			pci_add_dma_alias(pdev, devfn);
+			pci_add_dma_alias(pdev, devfn, 1);
 		}
 	}
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index c393dff2d66f6..930fab2930736 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2310,7 +2310,7 @@ static inline struct eeh_dev *pci_dev_to_eeh_dev(struct pci_dev *pdev)
 }
 #endif
 
-void pci_add_dma_alias(struct pci_dev *dev, u8 devfn);
+void pci_add_dma_alias(struct pci_dev *dev, u8 devfn_from, unsigned nr_devfns);
 bool pci_devs_are_dma_aliases(struct pci_dev *dev1, struct pci_dev *dev2);
 int pci_for_each_dma_alias(struct pci_dev *pdev,
 			   int (*fn)(struct pci_dev *pdev,
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
