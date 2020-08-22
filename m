Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A273D24E875
	for <lists.iommu@lfdr.de>; Sat, 22 Aug 2020 18:02:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B73787F86;
	Sat, 22 Aug 2020 16:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqj30kCohXBz; Sat, 22 Aug 2020 16:02:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 655D588093;
	Sat, 22 Aug 2020 16:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47BD5C0051;
	Sat, 22 Aug 2020 16:02:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BF87C0051
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24A03880C1
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4IvAGOvE7Rx for <iommu@lists.linux-foundation.org>;
 Sat, 22 Aug 2020 16:02:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E6ABE87CD6
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:02:36 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 22208727-1500050 
 for multiple; Sat, 22 Aug 2020 17:02:11 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/intel: Handle 36b addressing for x86-32
Date: Sat, 22 Aug 2020 17:02:09 +0100
Message-Id: <20200822160209.28512-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
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

Beware that the address size for x86-32 may exceed unsigned long.

[    0.368971] UBSAN: shift-out-of-bounds in drivers/iommu/intel/iommu.c:128:14
[    0.369055] shift exponent 36 is too large for 32-bit type 'long unsigned int'

If we don't handle the wide addresses, the pages are mismapped and the
device read/writes go astray, detected as DMAR faults and leading to
device failure. The behaviour changed (from working to broken) in commit
fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer"), but
the error looks older.

Fixes: fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: James Sewart <jamessewart@arista.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <jroedel@suse.de>
Cc: <stable@vger.kernel.org> # v5.3+
---
 drivers/iommu/intel/iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 2e9c8c3d0da4..ba78a2e854f9 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -123,29 +123,29 @@ static inline unsigned int level_to_offset_bits(int level)
 	return (level - 1) * LEVEL_STRIDE;
 }
 
-static inline int pfn_level_offset(unsigned long pfn, int level)
+static inline int pfn_level_offset(u64 pfn, int level)
 {
 	return (pfn >> level_to_offset_bits(level)) & LEVEL_MASK;
 }
 
-static inline unsigned long level_mask(int level)
+static inline u64 level_mask(int level)
 {
-	return -1UL << level_to_offset_bits(level);
+	return -1ULL << level_to_offset_bits(level);
 }
 
-static inline unsigned long level_size(int level)
+static inline u64 level_size(int level)
 {
-	return 1UL << level_to_offset_bits(level);
+	return 1ULL << level_to_offset_bits(level);
 }
 
-static inline unsigned long align_to_level(unsigned long pfn, int level)
+static inline u64 align_to_level(u64 pfn, int level)
 {
 	return (pfn + level_size(level) - 1) & level_mask(level);
 }
 
 static inline unsigned long lvl_to_nr_pages(unsigned int lvl)
 {
-	return  1 << min_t(int, (lvl - 1) * LEVEL_STRIDE, MAX_AGAW_PFN_WIDTH);
+	return 1UL << min_t(int, (lvl - 1) * LEVEL_STRIDE, MAX_AGAW_PFN_WIDTH);
 }
 
 /* VT-d pages must always be _smaller_ than MM pages. Otherwise things
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
