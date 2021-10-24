Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E48438B09
	for <lists.iommu@lfdr.de>; Sun, 24 Oct 2021 19:40:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC574029A;
	Sun, 24 Oct 2021 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9JhRpj_t2gv; Sun, 24 Oct 2021 17:40:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB0940298;
	Sun, 24 Oct 2021 17:40:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1911EC0036;
	Sun, 24 Oct 2021 17:40:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46D72C000E
 for <iommu@lists.linux-foundation.org>; Sun, 24 Oct 2021 17:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B1640298
 for <iommu@lists.linux-foundation.org>; Sun, 24 Oct 2021 17:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvMGIpJfZmgy for <iommu@lists.linux-foundation.org>;
 Sun, 24 Oct 2021 17:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr
 [80.12.242.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058B340271
 for <iommu@lists.linux-foundation.org>; Sun, 24 Oct 2021 17:40:28 +0000 (UTC)
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id ehTsmakZrdmYbehTsmLbF2; Sun, 24 Oct 2021 19:40:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 24 Oct 2021 19:40:26 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH] dma-mapping: Use 'bitmap_zalloc()' when applicable
Date: Sun, 24 Oct 2021 19:40:23 +0200
Message-Id: <20976d6fd4af266dec589b40929b53dfddd64b75.1635097161.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

'dma_mem->bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify code,
improve the semantic and avoid some open-coded arithmetic in allocator
arguments.

Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
consistency.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/dma/coherent.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 25fc85a7aebe..375fb3c9538d 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -40,7 +40,6 @@ static struct dma_coherent_mem *dma_init_coherent_memory(phys_addr_t phys_addr,
 {
 	struct dma_coherent_mem *dma_mem;
 	int pages = size >> PAGE_SHIFT;
-	int bitmap_size = BITS_TO_LONGS(pages) * sizeof(long);
 	void *mem_base;
 
 	if (!size)
@@ -53,7 +52,7 @@ static struct dma_coherent_mem *dma_init_coherent_memory(phys_addr_t phys_addr,
 	dma_mem = kzalloc(sizeof(struct dma_coherent_mem), GFP_KERNEL);
 	if (!dma_mem)
 		goto out_unmap_membase;
-	dma_mem->bitmap = kzalloc(bitmap_size, GFP_KERNEL);
+	dma_mem->bitmap = bitmap_zalloc(pages, GFP_KERNEL);
 	if (!dma_mem->bitmap)
 		goto out_free_dma_mem;
 
@@ -81,7 +80,7 @@ static void dma_release_coherent_memory(struct dma_coherent_mem *mem)
 		return;
 
 	memunmap(mem->virt_base);
-	kfree(mem->bitmap);
+	bitmap_free(mem->bitmap);
 	kfree(mem);
 }
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
