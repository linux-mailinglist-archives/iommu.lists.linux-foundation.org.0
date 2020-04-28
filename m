Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B01BBF0E
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 15:21:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDE0F8733E;
	Tue, 28 Apr 2020 13:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKrheGLt6fZC; Tue, 28 Apr 2020 13:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E554D873C5;
	Tue, 28 Apr 2020 13:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D135FC0172;
	Tue, 28 Apr 2020 13:21:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48A2EC0863
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 13:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E8EE188163
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 13:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72thvzP2Cs-q for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 13:21:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D8BC78822A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 13:20:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200428132031euoutp01930deb9b3274d7d2e47681dfd3416ea0~J-l-kqC_31886418864euoutp01J
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 13:20:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200428132031euoutp01930deb9b3274d7d2e47681dfd3416ea0~J-l-kqC_31886418864euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588080031;
 bh=XjK7PdElnjik//SIRauxCKs0fCYgf1wkZQ2qNanDMnE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZ0o9HctZOmXioKTcOpUmlvxzQPBYmm3Z7tYKHVggrtFnYAa+NMdmpW0tOb7G1Bmj
 GGGJD6SYnZikWotu/FN6+25Oym0R6TpbOka1L8TIToqcfZaKQn3e05H4uHKISlfAiq
 /6nHUx9s4lVzTW8SMXZe4vPo/8ZuH+IkByehrPUo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200428132031eucas1p29a10eed363459cec631cd98e7f56068c~J-l-Wz4G62652226522eucas1p2c;
 Tue, 28 Apr 2020 13:20:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.26.60698.F9D28AE5; Tue, 28
 Apr 2020 14:20:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200428132030eucas1p11f977e77050b5e76f580255096bb94bf~J-l_9nKFI3064530645eucas1p1S;
 Tue, 28 Apr 2020 13:20:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200428132030eusmtrp205b9e9f7926a35ab08ede9d26e607918~J-l_86C0q2140321403eusmtrp2T;
 Tue, 28 Apr 2020 13:20:30 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-95-5ea82d9fb39b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F4.E3.07950.E9D28AE5; Tue, 28
 Apr 2020 14:20:30 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200428132030eusmtip244c7de477ac54b89db02bc19fa86ba12~J-l_TmtOo0625706257eusmtip2N;
 Tue, 28 Apr 2020 13:20:30 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [RFC 14/17] drm: vmwgfx: fix sg_table nents vs. orig_nents misuse
Date: Tue, 28 Apr 2020 15:20:02 +0200
Message-Id: <20200428132005.21424-15-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428132005.21424-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSe0hTYRzlu3e797q2uk3LD5OERYLi24ILihUY3YpAoT/Cylp50ZWbuusj
 g0gNLacrrTA1S418z1zTzDTzgXOpMHxliorpNGqgWT4ik5nzqv13zvmd8/0OPz4CFbfyHQiZ
 IpZRKqSREkzAq+/8Y3QvdC8P9eorxii1sQuhSmqScep1bg2fSmnvxqi1+myUGlz6gVEVVXqE
 eppVi1BFLX7U4uAkQulMQ3xqoLEAo6o7xnGqbX6aT3WPL+BHd9Ga5xpANy8X8eixofcY/Xb5
 C5+eyDAgdO3L2/SoxYTSj4bLAN00koTR9+sqAb2g2x+0I0TgH8ZEyuIZpWfAZUHEnLkUiTYL
 b2TM/0KSgEmgAjYEJA/Bnz2PURUQEGKyHED1zCrGkUUAC6YzAEcWANRox/lbEZWGw2KyDMDf
 +nPbicVPeah1gJHeUDWrwqzYjkwF8KNaaDWhZD0Kp8s6cOvAljwF9SYNogIEwSMPwvI+N6ss
 IgNgg2Fkc5kTrNK2brxps66XTM1s1INkPw5T88woZwqEuuHOTWwLzYY6nMOOcO1dIcIF7gA4
 aazGOZIJ4EBKLuBcfnDMuIJZW6CkC6xp9OTkY1BnzAJWGZI74fDsbquMrsOH9U9QThbBe2li
 zu0M8w2vtte29fZv1qHhm689OHeg7PUK5gp+FnDK/7+sCIBKYM/EsfJwhvVVMAkerFTOxinC
 Pa5GyXVg/V/1WAxLDeDD6pV2QBJAIhRpheWhYr40nk2UtwNIoBI70VREaahYFCZNvMkooy4p
 4yIZth3sI3gSe5Hvi+8XxWS4NJa5zjDRjHJrihA2DkmgcaS3eY8weXTFN7zxtFzg0XRAev6b
 o9NJLLBYqe/Hs5/ZpE2ZoiVume4xzN1gSFhuWWS7gh1iAtgMfxdPWc6ZBK8Q4oF2Gb1w1jIx
 4j7WkL4s8alU/52UdclPuO5dm7tmWPHyDJIXHTYoPgc7t0D1LJruM3/8iCK9QMbkzEt4bITU
 2xVVstJ/s/BH/lMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7rzdFfEGaxv07DoPXeSyWLp+kZ2
 i40z1rNaNB06xWbxf9tEZosrX9+zWaxcfZTJYvaEzUwWC/ZbW3y58pDJYtPja6wWl3fNYbNY
 e+Quu8XBD09YLU7d/czuwO+xZt4aRo+93xaweNy5tofNY/u3B6we97uPM3lsXlLvcfvfY2aP
 yTeWM3rsvtnA5tG3ZRWjx+dNcgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFW
 RqZK+nY2Kak5mWWpRfp2CXoZ714tYyp4xVPR/eETUwPjY64uRk4OCQETia41d1m7GLk4hASW
 Mkp0f3zIBJGQkTg5rYEVwhaW+HOtiw2i6BOjxI2lU9hBEmwChhJdbyESIgKdjBLTuj+ygzjM
 AgeYJbrPnwQbJSzgJXH08Rogm4ODRUBVYsVFHZAwr4CdxI7jN6E2yEus3nCAGcTmBIovffSU
 DaRcSMBW4nJL7gRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo2fbsZ9bdjB2vQs+
 xCjAwajEw7uBZ0WcEGtiWXFl7iFGCQ5mJRHeRxnL4oR4UxIrq1KL8uOLSnNSiw8xmgKdNJFZ
 SjQ5HxjZeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGFv6+bob
 t39aInnkTqat/2HHWTe/T1dSvzTvtxz7MsXL2TyZBgdN2f5LC9l5rXvCwzTBMftJn++fiPp9
 5TP0T+8WbFps/0q1se5QY6/J6kqLvBon5frSDeKpuYzR3AfdJqyW2Jn35W2CTMym949NE1o+
 /bl9/uYjJXvv84e4T0p5PTeVe75MVImlOCPRUIu5qDgRAEn1m1S0AgAA
X-CMS-MailID: 20200428132030eucas1p11f977e77050b5e76f580255096bb94bf
X-Msg-Generator: CA
X-RootMTR: 20200428132030eucas1p11f977e77050b5e76f580255096bb94bf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200428132030eucas1p11f977e77050b5e76f580255096bb94bf
References: <20200428132005.21424-1-m.szyprowski@samsung.com>
 <CGME20200428132030eucas1p11f977e77050b5e76f580255096bb94bf@eucas1p1.samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index bf0bc46..a5fd128 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -362,7 +362,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
 	struct device *dev = vmw_tt->dev_priv->dev->dev;
 
-	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.nents,
+	dma_unmap_sg(dev, vmw_tt->sgt.sgl, vmw_tt->sgt.orig_nents,
 		DMA_BIDIRECTIONAL);
 	vmw_tt->sgt.nents = vmw_tt->sgt.orig_nents;
 }
@@ -449,10 +449,10 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		if (unlikely(ret != 0))
 			goto out_sg_alloc_fail;
 
-		if (vsgt->num_pages > vmw_tt->sgt.nents) {
+		if (vsgt->num_pages > vmw_tt->sgt.orig_nents) {
 			uint64_t over_alloc =
 				sgl_size * (vsgt->num_pages -
-					    vmw_tt->sgt.nents);
+					    vmw_tt->sgt.orig_nents);
 
 			ttm_mem_global_free(glob, over_alloc);
 			vmw_tt->sg_alloc_size -= over_alloc;
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
