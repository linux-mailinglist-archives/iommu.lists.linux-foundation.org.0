Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB4210B180
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 15:40:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47D3186DD6;
	Wed, 27 Nov 2019 14:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGA-mZnMOlLp; Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6F7387527;
	Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA6AC0881;
	Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05D93C0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E90B2204A5
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CE8YN8987C9V for <iommu@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 14:40:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id CD69C2047C
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CZV3OYfpH1AK9pBqBZAdN+dUDGtEBZRBkTDFRY9k6uk=; b=bMOqtrlMh4aH68BYjeNt4pp+XA
 uaxEoWQVzB0IswnzUl4OdLcTF8zSAtQZIPqUPnFIKqnlCXzfbr4hhR1VjqvQ8SeEbl7pCnDQp0h/g
 c5Oh6rcdZLfOLhh7o3dkErRf3xwf4h+SeVcEQ8KC7JMkIbE9Vcg4PW8D4pwUCERnhvepg3FSaqmdN
 4MoDQ83K6tE924fszzWssocdbGxClsNtfvkFhs0L4CxqN1vmN4C0XYyCbvLSQZWw0CbeUy6qXdi57
 Wn9hcGtv4OIYJaMEISnUkoUguzqlQHn8sAP9GecvQ989DOmCIXEMr8DEDxopv8Eic/tQYVF+/0hEZ
 vmxIJwDg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZyUC-0006gj-Sk; Wed, 27 Nov 2019 14:40:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH 1/2] dma-mapping: move dma_addressing_limited out of line
Date: Wed, 27 Nov 2019 15:40:05 +0100
Message-Id: <20191127144006.25998-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127144006.25998-1-hch@lst.de>
References: <20191127144006.25998-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
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

This function isn't used in the fast path, and moving it out of line
will reduce include clutter with the next change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h | 14 +-------------
 kernel/dma/mapping.c        | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index c4d8741264bd..94ef74ecd18a 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -687,19 +687,7 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
 	return dma_set_mask_and_coherent(dev, mask);
 }
 
-/**
- * dma_addressing_limited - return if the device is addressing limited
- * @dev:	device to check
- *
- * Return %true if the devices DMA mask is too small to address all memory in
- * the system, else %false.  Lack of addressing bits is the prime reason for
- * bounce buffering, but might not be the only one.
- */
-static inline bool dma_addressing_limited(struct device *dev)
-{
-	return min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
-			    dma_get_required_mask(dev);
-}
+bool dma_addressing_limited(struct device *dev);
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 12ff766ec1fa..1dbe6d725962 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -405,3 +405,18 @@ unsigned long dma_get_merge_boundary(struct device *dev)
 	return ops->get_merge_boundary(dev);
 }
 EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
+
+/**
+ * dma_addressing_limited - return if the device is addressing limited
+ * @dev:	device to check
+ *
+ * Return %true if the devices DMA mask is too small to address all memory in
+ * the system, else %false.  Lack of addressing bits is the prime reason for
+ * bounce buffering, but might not be the only one.
+ */
+bool dma_addressing_limited(struct device *dev)
+{
+	return min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
+			    dma_get_required_mask(dev);
+}
+EXPORT_SYMBOL_GPL(dma_addressing_limited);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
