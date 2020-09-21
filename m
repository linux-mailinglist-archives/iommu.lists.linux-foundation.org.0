Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE1272985
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 17:08:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DEED868C3;
	Mon, 21 Sep 2020 15:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdS37ySizR3R; Mon, 21 Sep 2020 15:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F210867DF;
	Mon, 21 Sep 2020 15:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 301F9C0859;
	Mon, 21 Sep 2020 15:08:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E543FC0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 15:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DB29C85EA5
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 15:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvH3sZmdydRF for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 15:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1B26A85DE6
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 15:08:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E11147A;
 Mon, 21 Sep 2020 08:08:09 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 821353F718;
 Mon, 21 Sep 2020 08:08:08 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de
Subject: [PATCH] iommu/io-pgtable-arm: Clean up faulty sanity check
Date: Mon, 21 Sep 2020 16:08:01 +0100
Message-Id: <daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, james.quinlan@broadcom.com,
 will@kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Checking for a nonzero dma_pfn_offset was a quick shortcut to validate
whether the DMA == phys assumption could hold at all. Checking for a
non-NULL dma_range_map is not quite equivalent, since a map may be
present to describe a limited DMA window even without an offset, and
thus this check can now yield false positives.

However, it only ever served to short-circuit going all the way through
to __arm_lpae_alloc_pages(), failing the canonical test there, and
having a bit more to clean up. As such, we can simply remove it without
loss of correctness.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index d77e881516a4..f87cbb822a3d 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -751,11 +751,6 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	if (!selftest_running && cfg->iommu_dev->dma_range_map) {
-		dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU page tables\n");
-		return NULL;
-	}
-
 	data = kmalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return NULL;
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
