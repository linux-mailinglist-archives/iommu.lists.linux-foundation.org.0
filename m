Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A044D151604
	for <lists.iommu@lfdr.de>; Tue,  4 Feb 2020 07:32:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58D4B8596F;
	Tue,  4 Feb 2020 06:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycTUKrD8GxdT; Tue,  4 Feb 2020 06:32:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D89538541F;
	Tue,  4 Feb 2020 06:32:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBC7BC1D81;
	Tue,  4 Feb 2020 06:32:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A83A4C0174
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8EBF4203F1
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbRvNpZYRCGV for <iommu@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 06:32:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 156E02014A
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 06:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=06oJs+qSvkBKP1a6Fng7k+OdEhPncDftAE9x8QQyTMY=; b=ddp0rjM+egXpQyb2Y6TEN7H9cE
 v+M3t3W3P2rrgpIDyqrMJaVdpHxktUORdcWZx7nes6kIZgCKWhsc7v/F4t5HCZI4bz8uWQEUugccK
 RTzFwOv/7bGdqBFRVBpmT0+j97wDymlpAX4Wq828LuOZ+PEuBhmrY+8a59rA3YHkYfCN+BQ1U7TQv
 JVqGiKl05rlRYrrwymHGcjy6E56ze+Ubv0WzC0jFSPeoKljumpykjo9pLSEYw97HGd9EikmV0USS1
 0i17z+otGd2stHVq2jxCNL+hsy4STuU55ejr00PYMaq9pjPK5ZtlThyGua5q7SXEZ1AIq17v9NC42
 eBtMVX7Q==;
Received: from [2001:4bb8:184:589f:5d35:7054:f1cc:c43d] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyrkq-00088h-D1; Tue, 04 Feb 2020 06:32:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 2/2] dma-direct: improve DMA mask overflow reporting
Date: Tue,  4 Feb 2020 07:32:05 +0100
Message-Id: <20200204063205.652456-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204063205.652456-1-hch@lst.de>
References: <20200204063205.652456-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org
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

Remove the unset dma_mask case as that won't get into mapping calls
anymore, and also report the other errors unconditonally and with a
slightly improved message.  Remove the now pointless report_addr helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 82ad50aaf42c..04f308a47fc3 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -23,18 +23,6 @@
  */
 unsigned int zone_dma_bits __ro_after_init = 24;
 
-static void report_addr(struct device *dev, dma_addr_t dma_addr, size_t size)
-{
-	if (!dev->dma_mask) {
-		dev_err_once(dev, "DMA map on device without dma_mask\n");
-	} else if (*dev->dma_mask >= DMA_BIT_MASK(32) || dev->bus_dma_limit) {
-		dev_err_once(dev,
-			"overflow %pad+%zu of DMA mask %llx bus limit %llx\n",
-			&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
-	}
-	WARN_ON_ONCE(1);
-}
-
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
 {
@@ -371,7 +359,10 @@ dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
 		if (swiotlb_force != SWIOTLB_NO_FORCE)
 			return swiotlb_map(dev, phys, size, dir, attrs);
 
-		report_addr(dev, dma_addr, size);
+		dev_err_once(dev,
+			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
+		WARN_ON_ONCE(1);
 		return DMA_MAPPING_ERROR;
 	}
 
@@ -409,7 +400,10 @@ dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 	dma_addr_t dma_addr = paddr;
 
 	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
-		report_addr(dev, dma_addr, size);
+		dev_err_once(dev,
+			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
+		WARN_ON_ONCE(1);
 		return DMA_MAPPING_ERROR;
 	}
 
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
