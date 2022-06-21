Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F6552BA2
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 09:19:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06EE418DE;
	Tue, 21 Jun 2022 07:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06EE418DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4R6-IOIWz-tT; Tue, 21 Jun 2022 07:18:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 922CC4199D;
	Tue, 21 Jun 2022 07:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922CC4199D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D79C8C0085;
	Tue, 21 Jun 2022 07:18:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6893C0082
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 07:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85A8C418DE
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 07:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A8C418DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pt2st3ffdbW2 for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 07:18:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B830418D9
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B830418D9
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 07:18:53 +0000 (UTC)
Received: from coburn.home.jannau.net (p579ad988.dip0.t-ipconnect.de
 [87.154.217.136])
 by soltyk.jannau.net (Postfix) with ESMTPSA id 1E53426ED1B;
 Tue, 21 Jun 2022 09:18:51 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 4/5] iommu/io-pgtable-dart: Add DART PTE support for t6000
Date: Tue, 21 Jun 2022 09:18:47 +0200
Message-Id: <20220621071848.14834-5-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621071848.14834-1-j@jannau.net>
References: <20220621071848.14834-1-j@jannau.net>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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

From: Sven Peter <sven@svenpeter.dev>

The DARTs present in the M1 Pro/Max/Ultra SoC use a diffent PTE format.
They support a 42bit physical address space by shifting the paddr and
extending its mask inside the PTE.
They also come with mandatory sub-page protection now which we just
configure to always allow access to the entire page. This feature is
already present but optional on the previous DARTs which allows to
unconditionally configure it.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>

---

Changes in v3:
- apply change to io-pgtable-dart.c
- handle pte <> paddr conversion based on the pte format instead of
  the output address size

Changes in v2:
- add APPLE_DART2 PTE format

 drivers/iommu/io-pgtable-dart.c | 51 +++++++++++++++++++++++++++------
 drivers/iommu/io-pgtable.c      |  1 +
 include/linux/io-pgtable.h      |  1 +
 3 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index fa8025c03bb5..9c3c2505f3dc 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -68,12 +68,19 @@
 #define APPLE_DART_PTE_SUBPAGE_END     GENMASK_ULL(51, 40)
 
 #define APPLE_DART1_PADDR_MASK	GENMASK_ULL(35, 12)
+#define APPLE_DART2_PADDR_MASK	GENMASK_ULL(37, 10)
+#define APPLE_DART2_PADDR_SHIFT	(4)
 
 /* Apple DART1 protection bits */
 #define APPLE_DART1_PTE_PROT_NO_READ	BIT(8)
 #define APPLE_DART1_PTE_PROT_NO_WRITE	BIT(7)
 #define APPLE_DART1_PTE_PROT_SP_DIS	BIT(1)
 
+/* Apple DART2 protection bits */
+#define APPLE_DART2_PTE_PROT_NO_READ	BIT(3)
+#define APPLE_DART2_PTE_PROT_NO_WRITE	BIT(2)
+#define APPLE_DART2_PTE_PROT_NO_CACHE	BIT(1)
+
 /* marks PTE as valid */
 #define APPLE_DART_PTE_VALID		BIT(0)
 
@@ -101,13 +108,31 @@ static inline bool iopte_leaf(dart_iopte pte, int lvl,
 static dart_iopte paddr_to_iopte(phys_addr_t paddr,
 				     struct dart_io_pgtable *data)
 {
-	return paddr & APPLE_DART1_PADDR_MASK;
+	dart_iopte pte;
+
+	if (data->iop.fmt == APPLE_DART)
+		return paddr & APPLE_DART1_PADDR_MASK;
+
+	/* format is APPLE_DART2 */
+	pte = paddr >> APPLE_DART2_PADDR_SHIFT;
+	pte &= APPLE_DART2_PADDR_MASK;
+
+	return pte;
 }
 
 static phys_addr_t iopte_to_paddr(dart_iopte pte,
 				  struct dart_io_pgtable *data)
 {
-	return pte & APPLE_DART1_PADDR_MASK;
+	u64 paddr;
+
+	if (data->iop.fmt == APPLE_DART)
+		return pte & APPLE_DART1_PADDR_MASK;
+
+	/* format is APPLE_DART2 */
+	paddr = pte & APPLE_DART2_PADDR_MASK;
+	paddr <<= APPLE_DART2_PADDR_SHIFT;
+
+	return paddr;
 }
 
 static void *__dart_alloc_pages(size_t size, gfp_t gfp,
@@ -139,7 +164,7 @@ static void __dart_init_pte(struct dart_io_pgtable *data,
 	size_t sz = DART_BLOCK_SIZE(lvl, data);
 	int i;
 
-	if (lvl == DART_MAX_LEVELS - 1)
+	if (lvl == DART_MAX_LEVELS - 1 && data->iop.fmt == APPLE_DART)
 		pte |= APPLE_DART1_PTE_PROT_SP_DIS;
 
 	pte |= APPLE_DART_PTE_VALID;
@@ -251,10 +276,20 @@ static dart_iopte dart_prot_to_pte(struct dart_io_pgtable *data,
 {
 	dart_iopte pte = 0;
 
-	if (!(prot & IOMMU_WRITE))
-		pte |= APPLE_DART1_PTE_PROT_NO_WRITE;
-	if (!(prot & IOMMU_READ))
-		pte |= APPLE_DART1_PTE_PROT_NO_READ;
+	if (data->iop.fmt == APPLE_DART) {
+		if (!(prot & IOMMU_WRITE))
+			pte |= APPLE_DART1_PTE_PROT_NO_WRITE;
+		if (!(prot & IOMMU_READ))
+			pte |= APPLE_DART1_PTE_PROT_NO_READ;
+	}
+	if (data->iop.fmt == APPLE_DART2) {
+		if (!(prot & IOMMU_WRITE))
+			pte |= APPLE_DART2_PTE_PROT_NO_WRITE;
+		if (!(prot & IOMMU_READ))
+			pte |= APPLE_DART2_PTE_PROT_NO_READ;
+		if (!(prot & IOMMU_CACHE))
+			pte |= APPLE_DART2_PTE_PROT_NO_CACHE;
+	}
 
 	return pte;
 }
@@ -536,7 +571,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	if (!cfg->coherent_walk)
 		return NULL;
 
-	if (cfg->oas > 36)
+	if (cfg->oas != 36 && cfg->oas != 42)
 		return NULL;
 
 	data = dart_alloc_pgtable(cfg);
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index e6edc6686859..a5d0f01afa7b 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -23,6 +23,7 @@ io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
 #endif
 #ifdef CONFIG_APPLE_DART
 	[APPLE_DART] = &io_pgtable_apple_dart_init_fns,
+	[APPLE_DART2] = &io_pgtable_apple_dart_init_fns,
 #endif
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
 	[ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 86af6f0a00a2..76b98511cbc8 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -17,6 +17,7 @@ enum io_pgtable_fmt {
 	ARM_MALI_LPAE,
 	AMD_IOMMU_V1,
 	APPLE_DART,
+	APPLE_DART2,
 	IO_PGTABLE_NUM_FMTS,
 };
 
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
