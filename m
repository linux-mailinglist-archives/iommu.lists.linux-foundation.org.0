Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D034005E7
	for <lists.iommu@lfdr.de>; Fri,  3 Sep 2021 21:37:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDCCC407FF;
	Fri,  3 Sep 2021 19:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT-KH0tsWMLJ; Fri,  3 Sep 2021 19:37:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC9E4407FE;
	Fri,  3 Sep 2021 19:37:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8159C0022;
	Fri,  3 Sep 2021 19:37:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C95BBC000E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B831D8330B
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2es4W0dRC48z for <iommu@lists.linux-foundation.org>;
 Fri,  3 Sep 2021 19:37:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D12832EB
 for <iommu@lists.linux-foundation.org>; Fri,  3 Sep 2021 19:37:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 830BA60F42;
 Fri,  3 Sep 2021 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630697835;
 bh=8pJXwbq8sr7AEftGFAhYt+EmsU9VO48MHi8Lzyl5ku4=;
 h=From:To:Cc:Subject:Date:From;
 b=iWniM8iiwgFevFvWVJMFl5vXAThH0ZAJxbrfWDF2oz8avYvzN2xml4BwZFCVJMw1r
 jg3HtCwlQ9EK6SWNi88GGxdHHZngL83WVYYmWZ5Zo1l/OkUbxptG6WmUVXuR1uSpxL
 nsvlfSP1rPL4d91i1q9vwhif63uj6yqjia+L2gYTdZmSyUkz+ht04iFu2MQpKiW+Wq
 n0oVZmtSGyL52XxfTFrICm6LRgUxJ5ZHm1B/e3OTrSWryOz4G14Sv4IVqDeXClLXOJ
 YyIoVYb8P5l6C9Ky6tgZP8ZZNmivIoNlbK/y36kZUR3VnAboZEZwUQ2HzwEeCOyCY1
 x3L9VLHELRHyw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/vt-d: Drop "0x" prefix from PCI bus & device addresses
Date: Fri,  3 Sep 2021 14:37:11 -0500
Message-Id: <20210903193711.483999-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Bjorn Helgaas <bhelgaas@google.com>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
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

From: Bjorn Helgaas <bhelgaas@google.com>

719a19335692 ("iommu/vt-d: Tweak the description of a DMA fault") changed
the DMA fault reason from hex to decimal.  It also added "0x" prefixes to
the PCI bus/device, e.g.,

  - DMAR: [INTR-REMAP] Request device [00:00.5]
  + DMAR: [INTR-REMAP] Request device [0x00:0x00.5]

These no longer match dev_printk() and other similar messages in
dmar_match_pci_path() and dmar_acpi_insert_dev_scope().

Drop the "0x" prefixes from the bus and device addresses.

Fixes: 719a19335692 ("iommu/vt-d: Tweak the description of a DMA fault")
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/iommu/intel/dmar.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index d66f79acd14d..8647a355dad0 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1944,18 +1944,18 @@ static int dmar_fault_do_one(struct intel_iommu *iommu, int type,
 	reason = dmar_get_fault_reason(fault_reason, &fault_type);
 
 	if (fault_type == INTR_REMAP)
-		pr_err("[INTR-REMAP] Request device [0x%02x:0x%02x.%d] fault index 0x%llx [fault reason 0x%02x] %s\n",
+		pr_err("[INTR-REMAP] Request device [%02x:%02x.%d] fault index 0x%llx [fault reason 0x%02x] %s\n",
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr >> 48,
 		       fault_reason, reason);
 	else if (pasid == INVALID_IOASID)
-		pr_err("[%s NO_PASID] Request device [0x%02x:0x%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
+		pr_err("[%s NO_PASID] Request device [%02x:%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write",
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr,
 		       fault_reason, reason);
 	else
-		pr_err("[%s PASID 0x%x] Request device [0x%02x:0x%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
+		pr_err("[%s PASID 0x%x] Request device [%02x:%02x.%d] fault addr 0x%llx [fault reason 0x%02x] %s\n",
 		       type ? "DMA Read" : "DMA Write", pasid,
 		       source_id >> 8, PCI_SLOT(source_id & 0xFF),
 		       PCI_FUNC(source_id & 0xFF), addr,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
