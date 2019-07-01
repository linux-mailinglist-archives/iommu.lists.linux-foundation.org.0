Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 270ABF4B4
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 12:54:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B7785FDF;
	Tue, 30 Apr 2019 10:53:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C7E8BF22
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 10:53:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp2.linuxfoundation.org (Postfix) with ESMTPS id 796DE1DD62
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o7kt/isoEsPLnj6OhjYv625lUxGmGplNlyGX+FIYFQo=;
	b=D3Jxfbc2AJF+KQ/BzrjLLoRJrI
	engbAa5Hq3COwgAO+LffH0LNZFk8tkKe5XwUyRw/WjNnr4UnfcAn/pu/rpPs1DDv3+EN++UYpf0aJ
	vfG+3YNEe/oJSoDUlPKqu738MPhmUNgRl0smsWpZ76Y1vdcITU4SH7PTFNRsLkat+jNiwKnhjq3/e
	3g/KjkF4fdMq7TjCWEM7snkkCwTNidLNGfkNzQL/f+O2mndkSMFNOsBxcB89PPCw7wVP7ptPGAPbW
	NVj/EgNkUayrC8h4jyuZGaRztYDKIzn+ce5e0K6v+ApuY75UqlmG8EkFjbvAcKnF2MqvD93sTFRMx
	JenMX2tA==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLQNt-0007qN-Vd; Tue, 30 Apr 2019 10:53:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 15/25] iommu/dma: Don't remap CMA unnecessarily
Date: Tue, 30 Apr 2019 06:52:04 -0400
Message-Id: <20190430105214.24628-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430105214.24628-1-hch@lst.de>
References: <20190430105214.24628-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

From: Robin Murphy <robin.murphy@arm.com>

Always remapping CMA allocations was largely a bodge to keep the freeing
logic manageable when it was split between here and an arch wrapper. Now
that it's all together and streamlined, we can relax that limitation.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 26f2d059873b..ccdd655bc03a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -954,7 +954,6 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 {
 	bool coherent = dev_is_dma_coherent(dev);
 	int ioprot = dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
-	pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
 	size_t iosize = size;
 	struct page *page;
 	void *addr;
@@ -1002,13 +1001,19 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (*handle == DMA_MAPPING_ERROR)
 		goto out_free_pages;
 
-	addr = dma_common_contiguous_remap(page, size, VM_USERMAP, prot,
-			__builtin_return_address(0));
-	if (!addr)
-		goto out_unmap;
+	if (!coherent || PageHighMem(page)) {
+		pgprot_t prot = arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs);
 
-	if (!coherent)
-		arch_dma_prep_coherent(page, iosize);
+		addr = dma_common_contiguous_remap(page, size, VM_USERMAP, prot,
+				__builtin_return_address(0));
+		if (!addr)
+			goto out_unmap;
+
+		if (!coherent)
+			arch_dma_prep_coherent(page, iosize);
+	} else {
+		addr = page_address(page);
+	}
 	memset(addr, 0, size);
 	return addr;
 out_unmap:
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
