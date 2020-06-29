Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D320CEA0
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 15:04:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A5728883F;
	Mon, 29 Jun 2020 13:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ioexh4+fvmyW; Mon, 29 Jun 2020 13:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3711E8939C;
	Mon, 29 Jun 2020 13:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18736C016E;
	Mon, 29 Jun 2020 13:04:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5956DC016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1CD3E20472
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 108kzEuQbItB for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 13:04:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A1FA220A9
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MUpR3vxb/3x7pTgYotaCnl85fDRP0t+XWiQf/ROkfg0=; b=DOW+nDlKUSsiGmK5DH33nDnu+G
 WQD2B/v3z8dljEfR8h8SR5xiWTW0ipG8Wiz7Gp4w3ZkYZAnLqHLVRsBh5RdKZ7JcCu+FqDm5lqGms
 WIOQU9BqRysseIn7+alAM3ekaP6gzbrQvU9qIyhm0sTrYtrdSrmbi7ys3nIZaieB7dkOdHIsGgvZ+
 i0ZxE45pWYhPHfkPiBOpqTXdf4I/frWWCsctA+aiESgiY8Mkw3YG/6U7BI0NIeKcFOb6LMXK8GLix
 gPLLcd1n+bfPSALMaQyoZB4IBXEZEXNxBWcAgu/4T+YMv0eHMzD5eCJbRYSF8BDoQW3wVUsCJgzWH
 +4JMo08Q==;
Received: from [2001:4bb8:184:76e3:c71:f334:376b:cf5f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptSA-0004Xh-2X; Mon, 29 Jun 2020 13:04:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>
Subject: [PATCH 3/4] xsk: remove a double pool->dev assignment in xp_dma_map
Date: Mon, 29 Jun 2020 15:03:58 +0200
Message-Id: <20200629130359.2690853-4-hch@lst.de>
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

->dev is already assigned at the top of the function, remove the duplicate
one at the end.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/xdp/xsk_buff_pool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 9fe84c797a7060..6733e2c59e4835 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -193,7 +193,6 @@ int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
 	if (pool->unaligned)
 		xp_check_dma_contiguity(pool);
 
-	pool->dev = dev;
 	pool->dma_need_sync = !xp_check_cheap_dma(pool);
 	return 0;
 }
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
