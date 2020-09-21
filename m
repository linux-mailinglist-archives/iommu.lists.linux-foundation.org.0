Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E85271DF0
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 10:29:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 72817870BE;
	Mon, 21 Sep 2020 08:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTgya1+zxiPM; Mon, 21 Sep 2020 08:29:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A660A870C0;
	Mon, 21 Sep 2020 08:29:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F76C0051;
	Mon, 21 Sep 2020 08:29:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CDA7C0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 07:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44376871B3
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 07:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bT3OdOBZ5axS for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 07:17:44 +0000 (UTC)
X-Greylist: delayed 00:08:12 by SQLgrey-1.7.6
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39F2A871B5
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 07:17:43 +0000 (UTC)
Received: from localhost (unknown [159.226.5.99])
 by APP-01 (Coremail) with SMTP id qwCowABnffCoUWhf9ZquAA--.61621S2;
 Mon, 21 Sep 2020 15:09:28 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org
Subject: [PATCH] dma: debug: convert comma to semicolon
Date: Mon, 21 Sep 2020 07:09:26 +0000
Message-Id: <20200921070926.28791-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowABnffCoUWhf9ZquAA--.61621S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47JFWUXw4xJFb_yoWDZrgEyw
 4UZr1rGanxGryUKF47Ca93JFZag3yfWF48Wr1SqF9Fqa98Jw4DZw1DXrsaqrW5Cr97GFyr
 C3srXr90kr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
 CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHv3bUUU
 UU=
X-Originating-IP: [159.226.5.99]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCwUGA1z4jc0rwwAAsH
X-Mailman-Approved-At: Mon, 21 Sep 2020 08:29:23 +0000
Cc: linux-kernel@vger.kernel.org, Xu Wang <vulab@iscas.ac.cn>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Replace a comma between expression statements by a semicolon.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 kernel/dma/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 8e9f7b301c6d..126ada40ef09 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -1219,7 +1219,7 @@ void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
 	entry->dev       = dev;
 	entry->type      = dma_debug_single;
 	entry->pfn	 = page_to_pfn(page);
-	entry->offset	 = offset,
+	entry->offset	 = offset;
 	entry->dev_addr  = dma_addr;
 	entry->size      = size;
 	entry->direction = direction;
@@ -1310,7 +1310,7 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		entry->type           = dma_debug_sg;
 		entry->dev            = dev;
 		entry->pfn	      = page_to_pfn(sg_page(s));
-		entry->offset	      = s->offset,
+		entry->offset	      = s->offset;
 		entry->size           = sg_dma_len(s);
 		entry->dev_addr       = sg_dma_address(s);
 		entry->direction      = direction;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
