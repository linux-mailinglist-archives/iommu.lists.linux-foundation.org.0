Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF0F14454B
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 20:41:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 94D67204DA;
	Tue, 21 Jan 2020 19:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HNwetWHqKK5; Tue, 21 Jan 2020 19:41:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DB1DE20528;
	Tue, 21 Jan 2020 19:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C873CC0174;
	Tue, 21 Jan 2020 19:41:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 344DCC0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 23B8A81DC1
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7P95nDWJpnY8 for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 19:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0262284F80
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 19:41:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 11:41:40 -0800
X-IronPort-AV: E=Sophos;i="5.70,347,1574150400"; d="scan'208";a="220070719"
Received: from nsgsw-rhel7p6.lm.intel.com ([10.232.116.83])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 11:41:40 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <linux-pci@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 7/7] x86/PCI: Remove X86_DEV_DMA_OPS
Date: Tue, 21 Jan 2020 06:37:51 -0700
Message-Id: <1579613871-301529-8-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579613871-301529-1-git-send-email-jonathan.derrick@intel.com>
References: <1579613871-301529-1-git-send-email-jonathan.derrick@intel.com>
Cc: iommu@lists.linux-foundation.org, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

From: Christoph Hellwig <hch@lst.de>

There are no users of X86_DEV_DMA_OPS left, so remove the code.

Reviewed-by: Jon Derrick <jonathan.derrick@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/Kconfig              |  3 ---
 arch/x86/include/asm/device.h | 10 ----------
 arch/x86/pci/common.c         | 38 --------------------------------------
 3 files changed, 51 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5e89499..77f9426 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2955,9 +2955,6 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
-config X86_DEV_DMA_OPS
-	bool
-
 source "drivers/firmware/Kconfig"
 
 source "arch/x86/kvm/Kconfig"
diff --git a/arch/x86/include/asm/device.h b/arch/x86/include/asm/device.h
index 5e12c63..7e31f7f 100644
--- a/arch/x86/include/asm/device.h
+++ b/arch/x86/include/asm/device.h
@@ -8,16 +8,6 @@ struct dev_archdata {
 #endif
 };
 
-#if defined(CONFIG_X86_DEV_DMA_OPS) && defined(CONFIG_PCI_DOMAINS)
-struct dma_domain {
-	struct list_head node;
-	const struct dma_map_ops *dma_ops;
-	int domain_nr;
-};
-void add_dma_domain(struct dma_domain *domain);
-void del_dma_domain(struct dma_domain *domain);
-#endif
-
 struct pdev_archdata {
 };
 
diff --git a/arch/x86/pci/common.c b/arch/x86/pci/common.c
index fe21a5c..df1d959 100644
--- a/arch/x86/pci/common.c
+++ b/arch/x86/pci/common.c
@@ -625,43 +625,6 @@ unsigned int pcibios_assign_all_busses(void)
 	return (pci_probe & PCI_ASSIGN_ALL_BUSSES) ? 1 : 0;
 }
 
-#if defined(CONFIG_X86_DEV_DMA_OPS) && defined(CONFIG_PCI_DOMAINS)
-static LIST_HEAD(dma_domain_list);
-static DEFINE_SPINLOCK(dma_domain_list_lock);
-
-void add_dma_domain(struct dma_domain *domain)
-{
-	spin_lock(&dma_domain_list_lock);
-	list_add(&domain->node, &dma_domain_list);
-	spin_unlock(&dma_domain_list_lock);
-}
-EXPORT_SYMBOL_GPL(add_dma_domain);
-
-void del_dma_domain(struct dma_domain *domain)
-{
-	spin_lock(&dma_domain_list_lock);
-	list_del(&domain->node);
-	spin_unlock(&dma_domain_list_lock);
-}
-EXPORT_SYMBOL_GPL(del_dma_domain);
-
-static void set_dma_domain_ops(struct pci_dev *pdev)
-{
-	struct dma_domain *domain;
-
-	spin_lock(&dma_domain_list_lock);
-	list_for_each_entry(domain, &dma_domain_list, node) {
-		if (pci_domain_nr(pdev->bus) == domain->domain_nr) {
-			pdev->dev.dma_ops = domain->dma_ops;
-			break;
-		}
-	}
-	spin_unlock(&dma_domain_list_lock);
-}
-#else
-static void set_dma_domain_ops(struct pci_dev *pdev) {}
-#endif
-
 static void set_dev_domain_options(struct pci_dev *pdev)
 {
 	if (is_vmd(pdev->bus))
@@ -697,7 +660,6 @@ int pcibios_add_device(struct pci_dev *dev)
 		pa_data = data->next;
 		memunmap(data);
 	}
-	set_dma_domain_ops(dev);
 	set_dev_domain_options(dev);
 	return 0;
 }
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
