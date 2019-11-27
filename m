Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15610B181
	for <lists.iommu@lfdr.de>; Wed, 27 Nov 2019 15:40:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2E4D8761F;
	Wed, 27 Nov 2019 14:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X75EQw6WRakJ; Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF9B6875D6;
	Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D49B3C0881;
	Wed, 27 Nov 2019 14:40:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8608EC0881
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 833DD86D2F
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iI5sWhwJFiwr for <iommu@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 14:40:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D8F3186E1A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=howc56bxTEyWXedb5RcS/cev28tOk9Lz2mtefx1HF+w=; b=uo3NQC8M7tVPEIZTbh3f/yeg/a
 1ohDdK9fsu6Jx5pkykl7Y4CnpzvLq3y67GfVai1JbgdtrZLrza/17IYN6R3L4/ZiW7b6ZIFuRNXdC
 xv7zTtRjjsiWfc8jTu4jsHsBTzzNCNiJd+E4CnWGba5IMlaywtDJ31GO4u8HrHfZ+NdXkK18ZsreS
 PHSZBGMHPP9VCXlqT/7BwYSOI17nsYTvtOnGeVE+63tsJOZWOj8PyVVVnVqHpz788SpA0I9MfBs1f
 0DAo7dknCRYaNVrBvA+EryacOtNeB2t9ZJcYoKD6RLG5aMdzwDxhHpaycRrUvVKEiH6TgV+i9nNxs
 z2QnEoWQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZyUF-0006rV-2E; Wed, 27 Nov 2019 14:40:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Date: Wed, 27 Nov 2019 15:40:06 +0100
Message-Id: <20191127144006.25998-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127144006.25998-1-hch@lst.de>
References: <20191127144006.25998-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
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

Devices that are forced to DMA through unencrypted bounce buffers
need to be treated as if they are addressing limited.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 1dbe6d725962..f6c35b53d996 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -416,6 +416,8 @@ EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
  */
 bool dma_addressing_limited(struct device *dev)
 {
+	if (force_dma_unencrypted(dev))
+		return true;
 	return min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
 			    dma_get_required_mask(dev);
 }
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
