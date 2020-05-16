Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48A1D61F5
	for <lists.iommu@lfdr.de>; Sat, 16 May 2020 17:24:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E320E20522;
	Sat, 16 May 2020 15:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLDmxR98H5OP; Sat, 16 May 2020 15:24:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A8B3B203E4;
	Sat, 16 May 2020 15:24:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 913F8C016F;
	Sat, 16 May 2020 15:24:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D90AFC016F
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 10:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C862E85039
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 10:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qt4B67XVxvDG for <iommu@lists.linux-foundation.org>;
 Sat, 16 May 2020 10:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29B33860E0
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 10:09:53 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7DC1A5D1BEDB315367B0;
 Sat, 16 May 2020 18:09:49 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.237) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 16 May 2020 18:09:38 +0800
To: Christoph Hellwig <hch@lst.de>, <m.szyprowski@samsung.com>,
 <robin.murphy@arm.com>, <iommu@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>
From: Yunfeng Ye <yeyunfeng@huawei.com>
Subject: [PATCH] dma-coherent: switch to bitmap_zalloc() in
 dma_init_coherent_memory()
Message-ID: <1b02b07b-617e-bc5c-8619-7a46fba5a512@huawei.com>
Date: Sat, 16 May 2020 18:09:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.166.215.237]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 16 May 2020 15:24:12 +0000
Cc: Shiyuan Hu <hushiyuan@huawei.com>, Hewenliang <hewenliang4@huawei.com>
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

Switch to bitmap_zalloc() to show clearly in dma_init_coherent_memory().

No functional change.

Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
---
 kernel/dma/coherent.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a0c4985f38e..794b31e61ca0 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -44,7 +44,6 @@ static int dma_init_coherent_memory(phys_addr_t phys_addr,
 	struct dma_coherent_mem *dma_mem = NULL;
 	void *mem_base = NULL;
 	int pages = size >> PAGE_SHIFT;
-	int bitmap_size = BITS_TO_LONGS(pages) * sizeof(long);
 	int ret;

 	if (!size) {
@@ -62,7 +61,7 @@ static int dma_init_coherent_memory(phys_addr_t phys_addr,
 		ret = -ENOMEM;
 		goto out;
 	}
-	dma_mem->bitmap = kzalloc(bitmap_size, GFP_KERNEL);
+	dma_mem->bitmap = bitmap_zalloc(pages, GFP_KERNEL);
 	if (!dma_mem->bitmap) {
 		ret = -ENOMEM;
 		goto out;
@@ -90,7 +89,7 @@ static void dma_release_coherent_memory(struct dma_coherent_mem *mem)
 		return;

 	memunmap(mem->virt_base);
-	kfree(mem->bitmap);
+	bitmap_free(mem->bitmap);
 	kfree(mem);
 }

-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
