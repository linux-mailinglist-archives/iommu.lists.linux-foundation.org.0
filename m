Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A70445EF7D
	for <lists.iommu@lfdr.de>; Fri, 26 Nov 2021 14:56:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E704882A4F;
	Fri, 26 Nov 2021 13:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orr6OeohYzEX; Fri, 26 Nov 2021 13:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C1C2382A3B;
	Fri, 26 Nov 2021 13:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96823C000A;
	Fri, 26 Nov 2021 13:56:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E00DC000A
 for <iommu@lists.linux-foundation.org>; Fri, 26 Nov 2021 13:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07BB54034C
 for <iommu@lists.linux-foundation.org>; Fri, 26 Nov 2021 13:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTAjyXAVgAJB for <iommu@lists.linux-foundation.org>;
 Fri, 26 Nov 2021 13:56:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C2F540160
 for <iommu@lists.linux-foundation.org>; Fri, 26 Nov 2021 13:56:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222538560"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="222538560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="651106582"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2021 05:55:59 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 2/2] iommu/vt-d: Fix unmap_pages support
Date: Fri, 26 Nov 2021 21:55:56 +0800
Message-Id: <20211126135556.397932-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126135556.397932-1-baolu.lu@linux.intel.com>
References: <20211126135556.397932-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

From: Alex Williamson <alex.williamson@redhat.com>

When supporting only the .map and .unmap callbacks of iommu_ops,
the IOMMU driver can make assumptions about the size and alignment
used for mappings based on the driver provided pgsize_bitmap.  VT-d
previously used essentially PAGE_MASK for this bitmap as any power
of two mapping was acceptably filled by native page sizes.

However, with the .map_pages and .unmap_pages interface we're now
getting page-size and count arguments.  If we simply combine these
as (page-size * count) and make use of the previous map/unmap
functions internally, any size and alignment assumptions are very
different.

As an example, a given vfio device assignment VM will often create
a 4MB mapping at IOVA pfn [0x3fe00 - 0x401ff].  On a system that
does not support IOMMU super pages, the unmap_pages interface will
ask to unmap 1024 4KB pages at the base IOVA.  dma_pte_clear_level()
will recurse down to level 2 of the page table where the first half
of the pfn range exactly matches the entire pte level.  We clear the
pte, increment the pfn by the level size, but (oops) the next pte is
on a new page, so we exit the loop an pop back up a level.  When we
then update the pfn based on that higher level, we seem to assume
that the previous pfn value was at the start of the level.  In this
case the level size is 256K pfns, which we add to the base pfn and
get a results of 0x7fe00, which is clearly greater than 0x401ff,
so we're done.  Meanwhile we never cleared the ptes for the remainder
of the range.  When the VM remaps this range, we're overwriting valid
ptes and the VT-d driver complains loudly, as reported by the user
report linked below.

The fix for this seems relatively simple, if each iteration of the
loop in dma_pte_clear_level() is assumed to clear to the end of the
level pte page, then our next pfn should be calculated from level_pfn
rather than our working pfn.

Fixes: 3f34f1259776 ("iommu/vt-d: Implement map/unmap_pages() iommu_ops callback")
Reported-by: Ajay Garg <ajaygargnsit@gmail.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
Tested-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
Link: https://lore.kernel.org/all/20211002124012.18186-1-ajaygargnsit@gmail.com/
Link: https://lore.kernel.org/r/163659074748.1617923.12716161410774184024.stgit@omen
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0bde0c8b4126..b6a8f3282411 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1339,13 +1339,11 @@ static struct page *dma_pte_clear_level(struct dmar_domain *domain, int level,
 	pte = &pte[pfn_level_offset(pfn, level)];
 
 	do {
-		unsigned long level_pfn;
+		unsigned long level_pfn = pfn & level_mask(level);
 
 		if (!dma_pte_present(pte))
 			goto next;
 
-		level_pfn = pfn & level_mask(level);
-
 		/* If range covers entire pagetable, free it */
 		if (start_pfn <= level_pfn &&
 		    last_pfn >= level_pfn + level_size(level) - 1) {
@@ -1366,7 +1364,7 @@ static struct page *dma_pte_clear_level(struct dmar_domain *domain, int level,
 						       freelist);
 		}
 next:
-		pfn += level_size(level);
+		pfn = level_pfn + level_size(level);
 	} while (!first_pte_in_page(++pte) && pfn <= last_pfn);
 
 	if (first_pte)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
