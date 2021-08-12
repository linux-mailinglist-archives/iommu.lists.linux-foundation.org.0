Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C9F3EA50C
	for <lists.iommu@lfdr.de>; Thu, 12 Aug 2021 15:02:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC41606EA;
	Thu, 12 Aug 2021 13:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6BW4VLYimz9S; Thu, 12 Aug 2021 13:01:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E436B60766;
	Thu, 12 Aug 2021 13:01:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACB04C0022;
	Thu, 12 Aug 2021 13:01:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 649B0C000E
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD8740597
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fu_MpkR5FARo for <iommu@lists.linux-foundation.org>;
 Thu, 12 Aug 2021 13:01:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 502D540517
 for <iommu@lists.linux-foundation.org>; Thu, 12 Aug 2021 13:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=uZzpkGNrGFrjMkCl1Lr0kKuqlToH9NC4jCzQFNPXdRQ=; b=C7yJSBMozyJ8h+XqW6uZpuxtOm
 u/HRwv33KLNo2Pa/XZBWiWZbrXaw93jWTMcaSzBGVNW6CB8BT5KxUW1mCq+OYAO0gvHiiIiikPyKX
 +JRYCwVq90Vxpoy4E2qNI/NiUv19bKzlb8IH2kaQYpvmYUOCxHyuma2116mX7T6JBjQMaQJspgrMz
 3aXS6x3lNXsQjJQQ2CkwIcsyN0fRkwyoTactpTvEZoqeE4S83piqzbIUIlwxeq9Gm84luo8SAjdDH
 WVHNyEFU0ahQiazA0DRBps/TBHq1NdVA8Ssn7bM1TKyOXd3jayJJJInUQ1S1RQ4eNi6PK9xjULjl2
 7DmvRoNA==;
Received: from 213-225-3-112.nat.highway.a1.net ([213.225.3.112]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEAKK-00EaFI-RY; Thu, 12 Aug 2021 13:01:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] dma-mapping: return an unsigned int from dma_map_sg{,_attrs}
Date: Thu, 12 Aug 2021 15:00:51 +0200
Message-Id: <20210812130051.36839-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: logang@deltatee.com
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

These can only return 0 for failure or the number of entries, so turn
the return value into an unsigned int.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h | 9 +++++----
 kernel/dma/mapping.c        | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index daa1e360f0ee..dca2b1355bb1 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -105,8 +105,8 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		unsigned long attrs);
 void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 		enum dma_data_direction dir, unsigned long attrs);
-int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
-		enum dma_data_direction dir, unsigned long attrs);
+unsigned int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
+		int nents, enum dma_data_direction dir, unsigned long attrs);
 void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
 				      int nents, enum dma_data_direction dir,
 				      unsigned long attrs);
@@ -166,8 +166,9 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 }
-static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
-		int nents, enum dma_data_direction dir, unsigned long attrs)
+static inline unsigned int dma_map_sg_attrs(struct device *dev,
+		struct scatterlist *sg, int nents, enum dma_data_direction dir,
+		unsigned long attrs)
 {
 	return 0;
 }
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 967b62692102..7ee5284bff58 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -219,7 +219,7 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
  * dma_unmap_sg_attrs() should be used to unmap the buffer with the
  * original sg and original nents (not the value returned by this funciton).
  */
-int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
+unsigned int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 		    int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	int ret;
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
