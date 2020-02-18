Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FC162EDE
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 19:42:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A33EA83957;
	Tue, 18 Feb 2020 18:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfTYmdF8qRDZ; Tue, 18 Feb 2020 18:42:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7583484B2D;
	Tue, 18 Feb 2020 18:42:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 569C3C013E;
	Tue, 18 Feb 2020 18:42:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D779C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2994C82019
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUckafIjDUBe for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 18:42:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F418F81F17
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=VQL9b0KCtYJf/wKA75fcrO7i0ZsCI/zdnz7C6Mgld9E=; b=dt3nhAKHFUYD4fQquR+byh0g+C
 LkOyIGy4cFbzqTwpGBti5+Pz050ibdUOBGlRrSyBVmNn4QD1kAGNyn78acwP29WxEfNdlelKTEXd5
 JhCWIZtnImkRmyS/+N10xgd1XLpHLP1qGTfyE6w+hQ4lptNNzvtDdRdFkpW/gvIE8qPw21y6bNHup
 HBdJCl7PXjDHgC1TnlnU+iVsGIBQ5sAOVyOnFjoibMECVFEiafa1BpEoEMPCCGhdMOPWlrXrQqIF9
 axGjpvGq704pw29Lp+edRAFFcbqCqI8RFLsTT/PTtt9bbXCrIPXSTH4sCngq36zvIeqN+lWXzoTz0
 uENcsp8w==;
Received: from [199.255.44.128] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j47oh-0002xO-K7; Tue, 18 Feb 2020 18:41:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH 2/3] ARM/dma-mapping: take the bus limit into account in
 __dma_alloc
Date: Tue, 18 Feb 2020 10:41:02 -0800
Message-Id: <20200218184103.35932-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200218184103.35932-1-hch@lst.de>
References: <20200218184103.35932-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
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

The DMA coherent allocator needs to take bus limits into account for
picking the zone that the memory is allocated from.

Reported-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/mm/dma-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 72ddc3d0f5eb..87aba505554a 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -658,7 +658,7 @@ static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
 			 gfp_t gfp, pgprot_t prot, bool is_coherent,
 			 unsigned long attrs, const void *caller)
 {
-	u64 mask = dev->coherent_dma_mask;
+	u64 mask = min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit);
 	struct page *page = NULL;
 	void *addr;
 	bool allowblock, cma;
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
