Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6316B070
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 20:45:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 54A9220525;
	Mon, 24 Feb 2020 19:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnQHefkCsYnu; Mon, 24 Feb 2020 19:45:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A49EA20523;
	Mon, 24 Feb 2020 19:45:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D12DC0177;
	Mon, 24 Feb 2020 19:45:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12EDAC0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C887870AD
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-901Rg8ZoLt for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:45:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7DDAE8700D
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iT1ha3vn/DgdTku/Bog5zuoB0xCormrXF5g8ca1iceU=; b=lHh+PMofvcXyNyuezdyJSne6LY
 IUHXC/XLvFMihtgmgz+iVUT16siWpc7/ZRb9jr/vW6Lnf3AH1RA2dcxTl21WL3ZdEfV2OKNg/hJ8S
 1n+RIHHlt/reHHiDPg5xRpEmer2cdqj/Nl+BcJ11Mw5I36fx+Fh9vVG7yFlztNBefW0whQGdwU2R/
 aolom250/RxHGNbdyXsEf/GxmcvfPZZvgJaCmVbaIrk9cl24Eb74HyA29en4bcOwHlsOQqyOyofhf
 MbNNajN3MoxTsh0oJfa/BOEsA/PMPrAB5ukZQeSgDAD17TIscJ91CjKqLZ4xfqft7dqrFklLKXJ3b
 kBMEIZfA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Jer-0006XE-BN; Mon, 24 Feb 2020 19:44:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 2/5] dma-direct: consolidate the error handling in
 dma_direct_alloc_pages
Date: Mon, 24 Feb 2020 11:44:42 -0800
Message-Id: <20200224194446.690816-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224194446.690816-1-hch@lst.de>
References: <20200224194446.690816-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Use a goto label to merge two error return cases.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index ac7956c38f69..9dfcc7be4903 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -157,11 +157,8 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		ret = dma_common_contiguous_remap(page, PAGE_ALIGN(size),
 				dma_pgprot(dev, PAGE_KERNEL, attrs),
 				__builtin_return_address(0));
-		if (!ret) {
-			dma_free_contiguous(dev, page, size);
-			return ret;
-		}
-
+		if (!ret)
+			goto out_free_pages;
 		memset(ret, 0, size);
 		goto done;
 	}
@@ -174,8 +171,7 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		 * so log an error and fail.
 		 */
 		dev_info(dev, "Rejecting highmem page from CMA.\n");
-		dma_free_contiguous(dev, page, size);
-		return NULL;
+		goto out_free_pages;
 	}
 
 	ret = page_address(page);
@@ -195,6 +191,9 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	else
 		*dma_handle = phys_to_dma(dev, page_to_phys(page));
 	return ret;
+out_free_pages:
+	dma_free_contiguous(dev, page, size);
+	return NULL;
 }
 
 void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
