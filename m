Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DDC147608
	for <lists.iommu@lfdr.de>; Fri, 24 Jan 2020 02:17:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1886C221A9;
	Fri, 24 Jan 2020 01:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaKNw40Y0jvM; Fri, 24 Jan 2020 01:17:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B8DC20417;
	Fri, 24 Jan 2020 01:17:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE490C0174;
	Fri, 24 Jan 2020 01:17:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65192C0174
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 01:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5359822193
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 01:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeuTSrgp-HZ2 for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jan 2020 01:17:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 81FCC20417
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jan 2020 01:17:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1D202253D;
 Fri, 24 Jan 2020 01:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579828671;
 bh=5zkD8g7X0trOuWlFmb0GO+S7roKuMSJa0/veDwFR97M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oz4m/6/ACLcFQo8Ua1NgsCB2xhvb73R+5CVrhZyeRuZk4UuE4kTsr8+sJ5oye06FN
 nsgqCUcXp6PITr6A+dqr8QhzqTERS+oGIVcNNTJEOtwfTAQ89qbRYKo3AZhjlZNVVL
 X0casbu71e4ygwyOKWRNUbkesdbFirZlLRWuIGfo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/11] iommu/amd: Support multiple PCI DMA
 aliases in IRQ Remapping
Date: Thu, 23 Jan 2020 20:17:39 -0500
Message-Id: <20200124011747.18575-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124011747.18575-1-sashal@kernel.org>
References: <20200124011747.18575-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Logan Gunthorpe <logang@deltatee.com>
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

From: Logan Gunthorpe <logang@deltatee.com>

[ Upstream commit 3c124435e8dd516df4b2fc983f4415386fd6edae ]

Non-Transparent Bridge (NTB) devices (among others) may have many DMA
aliases seeing the hardware will send requests with different device ids
depending on their origin across the bridged hardware.

See commit ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi Switchtec
NTB") for more information on this.

The AMD IOMMU IRQ remapping functionality ignores all PCI aliases for
IRQs so if devices send an interrupt from one of their aliases they
will be blocked on AMD hardware with the IOMMU enabled.

To fix this, ensure IRQ remapping is enabled for all aliases with
MSI interrupts.

This is analogous to the functionality added to the Intel IRQ remapping
code in commit 3f0c625c6ae7 ("iommu/vt-d: Allow interrupts from the entire
bus for aliased devices")

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 9991386fb7000..c60c9829d37fd 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3707,7 +3707,20 @@ static void set_remap_table_entry(struct amd_iommu *iommu, u16 devid,
 	iommu_flush_dte(iommu, devid);
 }
 
-static struct irq_remap_table *alloc_irq_table(u16 devid)
+static int set_remap_table_entry_alias(struct pci_dev *pdev, u16 alias,
+				       void *data)
+{
+	struct irq_remap_table *table = data;
+
+	irq_lookup_table[alias] = table;
+	set_dte_irq_entry(alias, table);
+
+	iommu_flush_dte(amd_iommu_rlookup_table[alias], alias);
+
+	return 0;
+}
+
+static struct irq_remap_table *alloc_irq_table(u16 devid, struct pci_dev *pdev)
 {
 	struct irq_remap_table *table = NULL;
 	struct irq_remap_table *new_table = NULL;
@@ -3753,7 +3766,12 @@ static struct irq_remap_table *alloc_irq_table(u16 devid)
 	table = new_table;
 	new_table = NULL;
 
-	set_remap_table_entry(iommu, devid, table);
+	if (pdev)
+		pci_for_each_dma_alias(pdev, set_remap_table_entry_alias,
+				       table);
+	else
+		set_remap_table_entry(iommu, devid, table);
+
 	if (devid != alias)
 		set_remap_table_entry(iommu, alias, table);
 
@@ -3770,7 +3788,8 @@ static struct irq_remap_table *alloc_irq_table(u16 devid)
 	return table;
 }
 
-static int alloc_irq_index(u16 devid, int count, bool align)
+static int alloc_irq_index(u16 devid, int count, bool align,
+			   struct pci_dev *pdev)
 {
 	struct irq_remap_table *table;
 	int index, c, alignment = 1;
@@ -3780,7 +3799,7 @@ static int alloc_irq_index(u16 devid, int count, bool align)
 	if (!iommu)
 		return -ENODEV;
 
-	table = alloc_irq_table(devid);
+	table = alloc_irq_table(devid, pdev);
 	if (!table)
 		return -ENODEV;
 
@@ -4213,7 +4232,7 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		struct irq_remap_table *table;
 		struct amd_iommu *iommu;
 
-		table = alloc_irq_table(devid);
+		table = alloc_irq_table(devid, NULL);
 		if (table) {
 			if (!table->min_index) {
 				/*
@@ -4230,11 +4249,15 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		} else {
 			index = -ENOMEM;
 		}
-	} else {
+	} else if (info->type == X86_IRQ_ALLOC_TYPE_MSI ||
+		   info->type == X86_IRQ_ALLOC_TYPE_MSIX) {
 		bool align = (info->type == X86_IRQ_ALLOC_TYPE_MSI);
 
-		index = alloc_irq_index(devid, nr_irqs, align);
+		index = alloc_irq_index(devid, nr_irqs, align, info->msi_dev);
+	} else {
+		index = alloc_irq_index(devid, nr_irqs, false, NULL);
 	}
+
 	if (index < 0) {
 		pr_warn("Failed to allocate IRTE\n");
 		ret = index;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
