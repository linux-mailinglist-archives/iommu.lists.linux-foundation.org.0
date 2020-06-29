Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E220CE9E
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 15:04:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64DCC8939A;
	Mon, 29 Jun 2020 13:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ld9p69ebCcT; Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ADCF4893C5;
	Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9883CC0865;
	Mon, 29 Jun 2020 13:04:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B0FEC016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7663C88172
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Up3xRLvXMeKL for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:04:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B2BF8847A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=WyEJJJCgRVGRkU8WN9UhcfcVIsZ/sAYcYt3L52514pY=; b=qk1Cj7ldG0VpKJ1L7Ep/8xe7Pp
 9k8cZZkYCa9IL95hgfUKHEHwW5s0KAblbjeuqZsBnnI19CuvowPCfw1dTLPgKS3FkUrR2h/n+PY06
 97TcUIzDwgjb3IoJlyscKkAb+5yQbGTCnnbpdeI4EHtPTtcKUIydPZpk1bl3qU3VujBRKSjd6eZOE
 xa8Uy4g5ks9sala8WPuPI2bA+n2Uemvv63DHiSiJB2j0isoWOYVRwxxV9ATckd3YJ84tCER+b87zL
 98iF0nzBOOdoXt6wfFrzLO8gp5Is05eIxrkinodskxZv/6i5kYtNMdYJ5hn9S2090WmBMKAHWHzL+
 w/V6IeJQ==;
Received: from [2001:4bb8:184:76e3:c71:f334:376b:cf5f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptS8-0004XF-Gg; Mon, 29 Jun 2020 13:04:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>
Subject: [PATCH 2/4] xsk: replace the cheap_dma flag with a dma_need_sync flag
Date: Mon, 29 Jun 2020 15:03:57 +0200
Message-Id: <20200629130359.2690853-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629130359.2690853-1-hch@lst.de>
References: <20200629130359.2690853-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Lemon <jonathan.lemon@gmail.com>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>
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

Invert the polarity and better name the flag so that the use case is
properly documented.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/xsk_buff_pool.h | 6 +++---
 net/xdp/xsk_buff_pool.c     | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
index a4ff226505c99c..6842990e2712bd 100644
--- a/include/net/xsk_buff_pool.h
+++ b/include/net/xsk_buff_pool.h
@@ -40,7 +40,7 @@ struct xsk_buff_pool {
 	u32 headroom;
 	u32 chunk_size;
 	u32 frame_len;
-	bool cheap_dma;
+	bool dma_need_sync;
 	bool unaligned;
 	void *addrs;
 	struct device *dev;
@@ -80,7 +80,7 @@ static inline dma_addr_t xp_get_frame_dma(struct xdp_buff_xsk *xskb)
 void xp_dma_sync_for_cpu_slow(struct xdp_buff_xsk *xskb);
 static inline void xp_dma_sync_for_cpu(struct xdp_buff_xsk *xskb)
 {
-	if (xskb->pool->cheap_dma)
+	if (!xskb->pool->dma_need_sync)
 		return;
 
 	xp_dma_sync_for_cpu_slow(xskb);
@@ -91,7 +91,7 @@ void xp_dma_sync_for_device_slow(struct xsk_buff_pool *pool, dma_addr_t dma,
 static inline void xp_dma_sync_for_device(struct xsk_buff_pool *pool,
 					  dma_addr_t dma, size_t size)
 {
-	if (pool->cheap_dma)
+	if (!pool->dma_need_sync)
 		return;
 
 	xp_dma_sync_for_device_slow(pool, dma, size);
diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 540ed75e44821c..9fe84c797a7060 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -55,7 +55,6 @@ struct xsk_buff_pool *xp_create(struct page **pages, u32 nr_pages, u32 chunks,
 	pool->free_heads_cnt = chunks;
 	pool->headroom = headroom;
 	pool->chunk_size = chunk_size;
-	pool->cheap_dma = true;
 	pool->unaligned = unaligned;
 	pool->frame_len = chunk_size - headroom - XDP_PACKET_HEADROOM;
 	INIT_LIST_HEAD(&pool->free_list);
@@ -195,7 +194,7 @@ int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
 		xp_check_dma_contiguity(pool);
 
 	pool->dev = dev;
-	pool->cheap_dma = xp_check_cheap_dma(pool);
+	pool->dma_need_sync = !xp_check_cheap_dma(pool);
 	return 0;
 }
 EXPORT_SYMBOL(xp_dma_map);
@@ -280,7 +279,7 @@ struct xdp_buff *xp_alloc(struct xsk_buff_pool *pool)
 	xskb->xdp.data = xskb->xdp.data_hard_start + XDP_PACKET_HEADROOM;
 	xskb->xdp.data_meta = xskb->xdp.data;
 
-	if (!pool->cheap_dma) {
+	if (pool->dma_need_sync) {
 		dma_sync_single_range_for_device(pool->dev, xskb->dma, 0,
 						 pool->frame_len,
 						 DMA_BIDIRECTIONAL);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
