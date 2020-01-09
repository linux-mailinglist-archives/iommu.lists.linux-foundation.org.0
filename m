Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E701361D9
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 21:33:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 210D5878E3;
	Thu,  9 Jan 2020 20:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiWxIj0PpBbV; Thu,  9 Jan 2020 20:33:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 439B38827C;
	Thu,  9 Jan 2020 20:33:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27DEFC1D87;
	Thu,  9 Jan 2020 20:33:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B643C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B9EC286943
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DwK3M069vT7 for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 20:33:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E1F23868D0
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 20:33:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 12:33:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="396206723"
Received: from unknown (HELO nsgsw-rhel7p6.lm.intel.com) ([10.232.116.226])
 by orsmga005.jf.intel.com with ESMTP; 09 Jan 2020 12:33:44 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <iommu@lists.linux-foundation.org>,
	<linux-pci@vger.kernel.org>
Subject: [PATCH v2 5/5] x86/pci: Remove X86_DEV_DMA_OPS
Date: Thu,  9 Jan 2020 07:30:56 -0700
Message-Id: <1578580256-3483-6-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578580256-3483-1-git-send-email-jonathan.derrick@intel.com>
References: <1578580256-3483-1-git-send-email-jonathan.derrick@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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
index 565cc17..5a9fb00 100644
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
