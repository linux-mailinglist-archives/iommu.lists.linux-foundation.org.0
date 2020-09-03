Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBA25C062
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 13:34:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4B2F87399;
	Thu,  3 Sep 2020 11:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnIyxtib15B6; Thu,  3 Sep 2020 11:34:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 159B78738E;
	Thu,  3 Sep 2020 11:34:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE6ACC0051;
	Thu,  3 Sep 2020 11:34:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84F5EC0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 11:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79F6D86B7F
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 11:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQbdJIraUOjD for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 11:34:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id AD1FF86B3F
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 11:34:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2D07101E;
 Thu,  3 Sep 2020 04:34:11 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B4353F66F;
 Thu,  3 Sep 2020 04:34:11 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/dma: Remove broken huge page handling
Date: Thu,  3 Sep 2020 12:34:04 +0100
Message-Id: <e287dbe69aa0933abafd97c80631940fd188ddd1.1599132844.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Roman Gushchin <guro@fb.com>
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

The attempt to handle huge page allocations was originally added since
the comments around stripping __GFP_COMP in other implementations were
nonsensical, and we naively assumed that split_huge_page() could simply
be called equivalently to split_page(). It turns out that this doesn't
actually work correctly, so just get rid of it - there's little point
going to the effort of allocating huge pages if we're only going to
split them anyway.

Reported-by: Roman Gushchin <guro@fb.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 4959f5df21bd..9194088b088f 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -524,6 +524,9 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	/* IOMMU can map any pages, so himem can also be used here */
 	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
 
+	/* It makes no sense to muck about with huge pages */
+	gfp &= ~__GFP_COMP;
+
 	while (count) {
 		struct page *page = NULL;
 		unsigned int order_size;
@@ -544,15 +547,9 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 			page = alloc_pages_node(nid, alloc_flags, order);
 			if (!page)
 				continue;
-			if (!order)
-				break;
-			if (!PageCompound(page)) {
+			if (order)
 				split_page(page, order);
-				break;
-			} else if (!split_huge_page(page)) {
-				break;
-			}
-			__free_pages(page, order);
+			break;
 		}
 		if (!page) {
 			__iommu_dma_free_pages(pages, i);
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
