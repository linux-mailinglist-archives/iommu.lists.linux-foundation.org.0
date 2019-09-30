Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E255C22D2
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 16:11:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2708819AE;
	Mon, 30 Sep 2019 14:11:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B78E19A6
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:11:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8C9D482C
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:11:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 439391570;
	Mon, 30 Sep 2019 07:11:14 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25AA03F706; 
	Mon, 30 Sep 2019 07:11:13 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH v2 1/3] iommu/io-pgtable-arm: Correct Mali attributes
Date: Mon, 30 Sep 2019 15:11:00 +0100
Message-Id: <fc6ce3e89ae85c9010b25b9303589be944ba3811.1569851517.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1569851517.git.robin.murphy@arm.com>
References: <cover.1569851517.git.robin.murphy@arm.com>
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

Whilst Midgard's MEMATTR follows a similar principle to the VMSA MAIR,
the actual attribute values differ, so although it currently appears to
work to some degree, we probably shouldn't be using our standard stage 1
MAIR for that. Instead, generate a reasonable MEMATTR with attribute
values borrowed from the kbase driver; at this point we'll be overriding
or ignoring pretty much all of the LPAE config, so just implement these
Mali details in a dedicated allocator instead of pretending to subclass
the standard VMSA format.

Fixes: d08d42de6432 ("iommu: io-pgtable: Add ARM Mali midgard MMU page table format")
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 53 +++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 4c91359057c5..90cb37af761c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -166,6 +166,9 @@
 #define ARM_MALI_LPAE_TTBR_READ_INNER	BIT(2)
 #define ARM_MALI_LPAE_TTBR_SHARE_OUTER	BIT(4)
 
+#define ARM_MALI_LPAE_MEMATTR_IMP_DEF	0x88ULL
+#define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL
+
 /* IOPTE accessors */
 #define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
 
@@ -1015,27 +1018,51 @@ arm_32_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 static struct io_pgtable *
 arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 {
-	struct io_pgtable *iop;
+	struct arm_lpae_io_pgtable *data;
+
+	/* No quirks for Mali (hopefully) */
+	if (cfg->quirks)
+		return NULL;
 
 	if (cfg->ias != 48 || cfg->oas > 40)
 		return NULL;
 
 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
-	iop = arm_64_lpae_alloc_pgtable_s1(cfg, cookie);
-	if (iop) {
-		u64 mair, ttbr;
 
-		/* Copy values as union fields overlap */
-		mair = cfg->arm_lpae_s1_cfg.mair[0];
-		ttbr = cfg->arm_lpae_s1_cfg.ttbr[0];
+	data = arm_lpae_alloc_pgtable(cfg);
+	if (!data)
+		return NULL;
 
-		cfg->arm_mali_lpae_cfg.memattr = mair;
-		cfg->arm_mali_lpae_cfg.transtab = ttbr |
-			ARM_MALI_LPAE_TTBR_READ_INNER |
-			ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
-	}
+	/*
+	 * MEMATTR: Mali has no actual notion of a non-cacheable type, so the
+	 * best we can do is mimic the out-of-tree driver and hope that the
+	 * "implementation-defined caching policy" is good enough. Similarly,
+	 * we'll use it for the sake of a valid attribute for our 'device'
+	 * index, although callers should never request that in practice.
+	 */
+	cfg->arm_mali_lpae_cfg.memattr =
+		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_NC)) |
+		(ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_CACHE)) |
+		(ARM_MALI_LPAE_MEMATTR_IMP_DEF
+		 << ARM_LPAE_MAIR_ATTR_SHIFT(ARM_LPAE_MAIR_ATTR_IDX_DEV));
 
-	return iop;
+	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
+	if (!data->pgd)
+		goto out_free_data;
+
+	/* Ensure the empty pgd is visible before TRANSTAB can be written */
+	wmb();
+
+	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
+					  ARM_MALI_LPAE_TTBR_READ_INNER |
+					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
+	return &data->iop;
+
+out_free_data:
+	kfree(data);
+	return NULL;
 }
 
 struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
