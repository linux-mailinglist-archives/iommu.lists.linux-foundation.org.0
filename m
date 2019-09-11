Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 528B5AFF00
	for <lists.iommu@lfdr.de>; Wed, 11 Sep 2019 16:42:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C80BC139C;
	Wed, 11 Sep 2019 14:42:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF53D1382
	for <iommu@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 14:42:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 67335894
	for <iommu@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 14:42:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A1F1576;
	Wed, 11 Sep 2019 07:42:19 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6BA83F67D; 
	Wed, 11 Sep 2019 07:42:17 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Subject: [PATCH 2/3] iommu/io-pgtable-arm: Support more Mali configurations
Date: Wed, 11 Sep 2019 15:42:08 +0100
Message-Id: <69c934789ad2bf486b03682563ea2262ea6d9301.1568211045.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1568211045.git.robin.murphy@arm.com>
References: <cover.1568211045.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
	steven.price@arm.com, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

In principle, Midgard GPUs supporting smaller VA sizes should only
require 3-level pagetables, since the address bits resolved at level 0
(47:40) will never change. However, the kbase driver does not appear to
have any notion of a variable start level, and empirically T720 and T820
rapidly blow up with translation faults unless given a full 4-level
table, despite only supporting a 33-bit VA size.

The 'real' IAS value is still valuable in terms of validating addresses
on map/unmap, so tweak the allocator to allow smaller values while still
forcing the resultant tables to the full 4 levels.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 9e35cd991f06..77f41c9dd9be 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1022,7 +1022,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	if (cfg->quirks)
 		return NULL;
 
-	if (cfg->ias != 48 || cfg->oas > 40)
+	if (cfg->ias > 48 || cfg->oas > 40)
 		return NULL;
 
 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
@@ -1031,6 +1031,11 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	if (!data)
 		return NULL;
 
+	/* Mali seems to need a full 4-level table regardless of IAS */
+	if (data->levels < ARM_LPAE_MAX_LEVELS) {
+		data->levels = ARM_LPAE_MAX_LEVELS;
+		data->pgd_size = sizeof(arm_lpae_iopte);
+	}
 	/*
 	 * MEMATTR: Mali has no actual notion of a non-cacheable type, so the
 	 * best we can do is mimic the out-of-tree driver and hope that the
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
