Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A844D201
	for <lists.iommu@lfdr.de>; Thu, 11 Nov 2021 07:50:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 372B0404EB;
	Thu, 11 Nov 2021 06:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tgkpn0wGG8CR; Thu, 11 Nov 2021 06:50:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 36521404EA;
	Thu, 11 Nov 2021 06:50:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4112C001E;
	Thu, 11 Nov 2021 06:50:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76CD5C0020
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71A5F40111
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fci0Aep69JAd for <iommu@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 06:50:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A658B400C9
 for <iommu@lists.linux-foundation.org>; Thu, 11 Nov 2021 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Jbe5hT1tcXEoL5HRPK7nEscDtw/ee5r1v5qPyVXSZz8=; b=g7v/WHqLoH42tyhcsB62DI5RTv
 I1rghs0Lac4s5ES/qvgvwtRihS+C0TM/1WWsyn0+SrI/Ezqk0lmIainlQA6Xs/37VdcwQM7cEeWEP
 46lYLlbiocl9vEF+HOL17Pgg2KWS+s3O+ca/uuPpCTM18Yc4VUDKolqA6xChFmW64l8Pmknp4lnRd
 tRyUeocrkhiwOBVbgdXq9Cvd91yVYyFPE1KU8LKktSTWIYKzXWdVkOLDfdGCE5DFEGHLFY+IJmql0
 ZH89scKnRheEl1KglDUxHbH4gKXywmNQNrfieFnq5R8gfZrJgGvZVeigJhrApGuacRQvaIlHNREdk
 ygHwNixg==;
Received: from [2001:4bb8:19a:7ee7:dc25:8b64:278b:ff22] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml3uo-002Vx0-Pe; Thu, 11 Nov 2021 06:50:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 02/11] dma-direct: don't call dma_set_decrypted for remapped
 allocations
Date: Thu, 11 Nov 2021 07:50:18 +0100
Message-Id: <20211111065028.32761-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211111065028.32761-1-hch@lst.de>
References: <20211111065028.32761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
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

Remapped allocations handle the encrypted bit through the pgprot passed
to vmap, so there is no call dma_set_decrypted.  Note that this case is
currently entirely theoretical as no valid kernel configuration supports
remapped allocations and memory encryption currently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index d4d54af31a341..996ba4edb2fa3 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -229,8 +229,6 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 				__builtin_return_address(0));
 		if (!ret)
 			goto out_free_pages;
-		if (dma_set_decrypted(dev, ret, size))
-			goto out_free_pages;
 		memset(ret, 0, size);
 		goto done;
 	}
@@ -304,12 +302,13 @@ void dma_direct_free(struct device *dev, size_t size,
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
 		return;
 
-	dma_set_encrypted(dev, cpu_addr, 1 << page_order);
-
-	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr))
+	if (IS_ENABLED(CONFIG_DMA_REMAP) && is_vmalloc_addr(cpu_addr)) {
 		vunmap(cpu_addr);
-	else if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
-		arch_dma_clear_uncached(cpu_addr, size);
+	} else {
+		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
+			arch_dma_clear_uncached(cpu_addr, size);
+		dma_set_encrypted(dev, cpu_addr, 1 << page_order);
+	}
 
 	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
 }
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
