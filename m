Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E724F25
	for <lists.iommu@lfdr.de>; Tue, 21 May 2019 14:47:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B2BFBC21;
	Tue, 21 May 2019 12:47:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A6B8B7D
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 133E77FB
	for <iommu@lists.linux-foundation.org>;
	Tue, 21 May 2019 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t44lpcwx19L5UDwyIPITlcCA4k6gsZYQdQG/sxyJ2pY=;
	b=DtBIhv9e08a1olEgFKggeYxbti
	geB3szMrp6RCfQBPsRqouPDWJUwaR4UJpQbqFLvhFts/wEOVUZE5dCsun1jtncXIr1Yycgkw876/q
	mFBaDK/Im1WBy7o3+qaN0h7z2Z2COsM+8YWqgwt4RycyhM3+E9KZUg+gSpSRoeixFHUz3K28rcoLO
	67mtIirk1i6ifdd10g5onXTj1PRrbCJsFkPEi8aUvf7P/autmFa08mXjasYDmTTf7aOAFI5lTB06v
	k4P7O/yPJeEd0rCppoBDcbpCiDXPHiWG6sYyid7mZxApTrH8FV5Ehajg/Uz0cxP3srmVPvBN/W3ec
	EGCtishQ==;
Received: from 089144214035.atnat0023.highway.a1.net ([89.144.214.35]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT4B7-0004Hu-5Q; Tue, 21 May 2019 12:47:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 1/2] dma-mapping: truncate dma masks to what dma_addr_t can
	hold
Date: Tue, 21 May 2019 14:47:28 +0200
Message-Id: <20190521124729.23559-2-hch@lst.de>
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

The dma masks in struct device are always 64-bits wide.  But for builds
using a 32-bit dma_addr_t we need to ensure we don't store an
unsupportable value.  Before Linux 5.0 this was handled at least by
the ARM dma mapping code by never allowing to set a larger dma_mask,
but these days we allow the driver to just set the largest supported
value and never fall back to a smaller one.  Ensure this always works
by truncating the value.

Fixes: 9eb9e96e97b3 ("Documentation/DMA-API-HOWTO: update dma_mask sections")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/mapping.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index f7afdadb6770..1f628e7ac709 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -317,6 +317,12 @@ void arch_dma_set_mask(struct device *dev, u64 mask);
 
 int dma_set_mask(struct device *dev, u64 mask)
 {
+	/*
+	 * Truncate the mask to the actually supported dma_addr_t width to
+	 * avoid generating unsupportable addresses.
+	 */
+	mask = (dma_addr_t)mask;
+
 	if (!dev->dma_mask || !dma_supported(dev, mask))
 		return -EIO;
 
@@ -330,6 +336,12 @@ EXPORT_SYMBOL(dma_set_mask);
 #ifndef CONFIG_ARCH_HAS_DMA_SET_COHERENT_MASK
 int dma_set_coherent_mask(struct device *dev, u64 mask)
 {
+	/*
+	 * Truncate the mask to the actually supported dma_addr_t width to
+	 * avoid generating unsupportable addresses.
+	 */
+	mask = (dma_addr_t)mask;
+
 	if (!dma_supported(dev, mask))
 		return -EIO;
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
