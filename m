Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E634A496
	for <lists.iommu@lfdr.de>; Fri, 26 Mar 2021 10:37:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D62E2405D3;
	Fri, 26 Mar 2021 09:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWGPQJsXda7l; Fri, 26 Mar 2021 09:37:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F3B4024F;
	Fri, 26 Mar 2021 09:37:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D78C6C000F;
	Fri, 26 Mar 2021 09:37:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3201C000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD72E84B6D
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMHqIjysdV1F for <iommu@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 09:37:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FAB784B42
 for <iommu@lists.linux-foundation.org>; Fri, 26 Mar 2021 09:37:00 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR5pPzzPn9d;
 Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:49 +0800
From: Zhiqi Song <songzhiqi1@huawei.com>
To: <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
 <robdclark@gmail.com>
Subject: [PATCH 1/3] drivers: iommu - coding style fix
Date: Fri, 26 Mar 2021 17:37:15 +0800
Message-ID: <1616751437-59956-2-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
References: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 fanghao11@huawei.com, shenyang39@huawei.com
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

Fixed following checkpatch error:
- space required after ','

Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/iommu/io-pgtable-arm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 87def58..3bf880f 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -37,7 +37,7 @@
  * Calculate the right shift amount to get to the portion describing level l
  * in a virtual address mapped by the pagetable in d.
  */
-#define ARM_LPAE_LVL_SHIFT(l,d)						\
+#define ARM_LPAE_LVL_SHIFT(l, d)					\
 	(((ARM_LPAE_MAX_LEVELS - (l)) * (d)->bits_per_level) +		\
 	ilog2(sizeof(arm_lpae_iopte)))

@@ -50,15 +50,15 @@
  * Calculate the index at level l used to map virtual address a using the
  * pagetable in d.
  */
-#define ARM_LPAE_PGD_IDX(l,d)						\
+#define ARM_LPAE_PGD_IDX(l, d)						\
 	((l) == (d)->start_level ? (d)->pgd_bits - (d)->bits_per_level : 0)

-#define ARM_LPAE_LVL_IDX(a,l,d)						\
-	(((u64)(a) >> ARM_LPAE_LVL_SHIFT(l,d)) &			\
-	 ((1 << ((d)->bits_per_level + ARM_LPAE_PGD_IDX(l,d))) - 1))
+#define ARM_LPAE_LVL_IDX(a, l, d)					\
+	(((u64)(a) >> ARM_LPAE_LVL_SHIFT(l, d)) &			\
+	 ((1 << ((d)->bits_per_level + ARM_LPAE_PGD_IDX(l, d))) - 1))

 /* Calculate the block/page mapping size at level l for pagetable in d. */
-#define ARM_LPAE_BLOCK_SIZE(l,d)	(1ULL << ARM_LPAE_LVL_SHIFT(l,d))
+#define ARM_LPAE_BLOCK_SIZE(l, d)	(1ULL << ARM_LPAE_LVL_SHIFT(l, d))

 /* Page table bits */
 #define ARM_LPAE_PTE_TYPE_SHIFT		0
@@ -68,7 +68,7 @@
 #define ARM_LPAE_PTE_TYPE_TABLE		3
 #define ARM_LPAE_PTE_TYPE_PAGE		3

-#define ARM_LPAE_PTE_ADDR_MASK		GENMASK_ULL(47,12)
+#define ARM_LPAE_PTE_ADDR_MASK		GENMASK_ULL(47, 12)

 #define ARM_LPAE_PTE_NSTABLE		(((arm_lpae_iopte)1) << 63)
 #define ARM_LPAE_PTE_XN			(((arm_lpae_iopte)3) << 53)
@@ -128,7 +128,7 @@
 #define ARM_MALI_LPAE_MEMATTR_WRITE_ALLOC 0x8DULL

 /* IOPTE accessors */
-#define iopte_deref(pte,d) __va(iopte_to_paddr(pte, d))
+#define iopte_deref(pte, d) __va(iopte_to_paddr(pte, d))

 #define iopte_type(pte)					\
 	(((pte) >> ARM_LPAE_PTE_TYPE_SHIFT) & ARM_LPAE_PTE_TYPE_MASK)
--
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
