Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 393173267E8
	for <lists.iommu@lfdr.de>; Fri, 26 Feb 2021 21:11:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D686E6F9D0;
	Fri, 26 Feb 2021 20:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoT_ifcm8S1C; Fri, 26 Feb 2021 20:11:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D65C36F9C7;
	Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF1CDC0012;
	Fri, 26 Feb 2021 20:11:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 151CAC0001
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F37C784343
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KT0MCIdvMCIz for <iommu@lists.linux-foundation.org>;
 Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28A46842CD
 for <iommu@lists.linux-foundation.org>; Fri, 26 Feb 2021 20:11:14 +0000 (UTC)
IronPort-SDR: 5rkywHyUJuo8l/4OkugOeRzx/JsD+EZFj13aV/Ql4Op1uVReNOO/imjNyEZ68vWyTbkP1gq5CH
 hQXalTOpFAXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="247407443"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="247407443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 12:11:12 -0800
IronPort-SDR: nqd1c2DrHAyAoYNdWmeu+9h9FxL/yedqJ6yNvbNjqce+r0FJsduGHC+XPoXtVhYueoBpzZeSR5
 nU0B0RDaqelw==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="405109434"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Feb 2021 12:11:12 -0800
From: Megha Dey <megha.dey@intel.com>
To: tglx@linutronix.de
Subject: [Patch V2 05/13] genirq/msi: Provide and use
 msi_domain_set_default_info_flags()
Date: Fri, 26 Feb 2021 12:11:09 -0800
Message-Id: <1614370277-23235-6-git-send-email-megha.dey@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
References: <1614370277-23235-1-git-send-email-megha.dey@intel.com>
Cc: alex.williamson@redhat.com, kevin.tian@intel.com, tony.luck@intel.com,
 dave.jiang@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 ravi.v.shankar@intel.com, maz@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jgg@mellanox.com, megha.dey@intel.com, linux-pci@vger.kernel.org,
 bhelgaas@google.com, dan.j.williams@intel.com, dwmw@amazon.co.uk
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

From: Thomas Gleixner <tglx@linutronix.de>

MSI interrupts have some common flags which should be set not only for
PCI/MSI interrupts.

Move the PCI/MSI flag setting into a common function so it can be reused.

Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Megha Dey <megha.dey@intel.com>
---
 drivers/pci/msi.c   |  7 +------
 include/linux/msi.h |  1 +
 kernel/irq/msi.c    | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 3162f88..20d2512 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1492,12 +1492,7 @@ struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
 		pci_msi_domain_update_chip_ops(info);
 
-	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
-	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
-		info->flags |= MSI_FLAG_MUST_REACTIVATE;
-
-	/* PCI-MSI is oneshot-safe */
-	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+	msi_domain_set_default_info_flags(info);
 
 	domain = msi_create_irq_domain(fwnode, info, parent);
 	if (!domain)
diff --git a/include/linux/msi.h b/include/linux/msi.h
index f3e54d2..f6e52de 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -454,6 +454,7 @@ int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
 void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
 			      unsigned int nvec);
 void *platform_msi_get_host_data(struct irq_domain *domain);
+void msi_domain_set_default_info_flags(struct msi_domain_info *info);
 #endif /* CONFIG_GENERIC_MSI_IRQ_DOMAIN */
 
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index b338d62..c54316d 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -70,6 +70,30 @@ void get_cached_msi_msg(unsigned int irq, struct msi_msg *msg)
 EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
+void msi_domain_set_default_info_flags(struct msi_domain_info *info)
+{
+	/* Required so that a device latches a valid MSI message on startup */
+	info->flags |= MSI_FLAG_ACTIVATE_EARLY;
+
+	/*
+	 * Interrupt reservation mode allows to stear the MSI message of an
+	 * inactive device to a special (usually spurious interrupt) target.
+	 * This allows to prevent interrupt vector exhaustion e.g. on x86.
+	 * But (PCI)MSI interrupts are activated early - see above - so the
+	 * interrupt request/startup sequence would not try to allocate a
+	 * usable vector which means that the device interrupts would end
+	 * up on the special vector and issue spurious interrupt messages.
+	 * Setting the reactivation flag ensures that when the interrupt
+	 * is requested the activation is invoked again so that a real
+	 * vector can be allocated.
+	 */
+	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
+		info->flags |= MSI_FLAG_MUST_REACTIVATE;
+
+	/* MSI is oneshot-safe at least in theory */
+	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
+}
+
 static inline void irq_chip_write_msi_msg(struct irq_data *data,
 					  struct msi_msg *msg)
 {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
