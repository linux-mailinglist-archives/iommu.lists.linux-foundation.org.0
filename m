Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200724F28
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 14:47:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E4276C11;
	Tue, 21 May 2019 12:47:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF739C11
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7218C27B
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/aiXe/jC5lN34TP5XD5Q7pcHlvltKRr8rkGWhUFVRW4=;
	b=KhgjFWOZImtWTZ3aiFX+rf58JS
	1xHHEcNx9t4uxiFpoiYPAvFUCrkXwN49BxoJQy+pE7TfnTGxVylIgboWouG/GULIWcelbgQd9grOZ
	evZO3w2rnQkOyC6jwT6aE8mXLW4Wb06VURsdkg7CYLYWXGvl4Vb22Ufo34ntrzWXETnw1JS1txO5q
	BEVjR4dcPjYwRSu6QrNKivvjIYuPMfWOw8fMmNVb9pay0QsGrSM8ziDMWY1BH6cU0iHhgVMreOth/
	zP7TrAIk3uRnCSfw3ACOQh/UmH1HKi4QcLoGBU6tuMP3AwWqMHX5AgOCsX0VaPs3y7VNLY52qyMad
	/bl8ryag==;
Received: from 089144214035.atnat0023.highway.a1.net ([89.144.214.35]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT4BA-0004I9-LX; Tue, 21 May 2019 12:47:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 2/2] ARM: dma-mapping: allow larger DMA mask than supported
Date: Tue, 21 May 2019 14:47:29 +0200
Message-Id: <20190521124729.23559-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521124729.23559-1-hch@lst.de>
References: <20190521124729.23559-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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

Since Linux 5.1 we allow drivers to just set the largest DMA mask they
support instead of falling back to smaller ones.

When fixing up all the dma ops instances to allow for this behavior
the arm direct mapping code was missed.  Fix it up by removing the
sanity check, as all the actual mapping code handles this case just
fine.

Fixes: 9eb9e96e97b3 ("Documentation/DMA-API-HOWTO: update dma_mask sections")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 0a75058c11f3..bdf0d236aaee 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -219,25 +219,7 @@ EXPORT_SYMBOL(arm_coherent_dma_ops);
 
 static int __dma_supported(struct device *dev, u64 mask, bool warn)
 {
-	unsigned long max_dma_pfn;
-
-	/*
-	 * If the mask allows for more memory than we can address,
-	 * and we actually have that much memory, then we must
-	 * indicate that DMA to this device is not supported.
-	 */
-	if (sizeof(mask) != sizeof(dma_addr_t) &&
-	    mask > (dma_addr_t)~0 &&
-	    dma_to_pfn(dev, ~0) < max_pfn - 1) {
-		if (warn) {
-			dev_warn(dev, "Coherent DMA mask %#llx is larger than dma_addr_t allows\n",
-				 mask);
-			dev_warn(dev, "Driver did not use or check the return value from dma_set_coherent_mask()?\n");
-		}
-		return 0;
-	}
-
-	max_dma_pfn = min(max_pfn, arm_dma_pfn_limit);
+	unsigned long max_dma_pfn = min(max_pfn, arm_dma_pfn_limit);
 
 	/*
 	 * Translate the device's DMA mask to a PFN limit.  This
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
