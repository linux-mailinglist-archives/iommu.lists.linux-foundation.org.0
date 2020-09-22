Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8727435E
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 15:39:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0A9320385;
	Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sI+ISNv3h0J2; Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1D62D21511;
	Tue, 22 Sep 2020 13:39:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA26C0859;
	Tue, 22 Sep 2020 13:39:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02190C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F30988574B
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rr9kg8kWNKJ1 for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 13:39:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 59DA485751
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=949fIlFJxhHftxK0F0GIl/omAnloK0lrmH1lk+jzSZ8=; b=RbkWoWrCf5xaBUbunWQCzfjwUc
 oDOkMeUm6Z5seq7uxsDIBMWyWWt4jxGsX5okbeTWhUGZPFBmobf0GC5jFVxLOEWcnb3Rw/KTaQ6C2
 PkR2JzqlA4AHqgUPLtts1LY+dHW0J6jNKjAyVFNW5dW4y/YbqMgiInjuqywcxgPvgt9j159owP2b5
 N1vH6DrLidLzLEMC1pXnWUQCCo9tdbu7tIhLCVsS6OCksmbewe9q1FxhiHS0onuHN6EHQfq8AnVqw
 Y5iW0MJ513T2EHvvUcfAvt7Ublr95NFq9IbMf2dZX+D4BPPvUdtdBomp21JE6bSG7Mh27JUQ+L2I0
 4/wzcOUg==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKiW9-0005M2-S5; Tue, 22 Sep 2020 13:39:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/3] dma-mapping: remove DMA_MASK_NONE
Date: Tue, 22 Sep 2020 15:40:00 +0200
Message-Id: <20200922134002.1227279-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922134002.1227279-1-hch@lst.de>
References: <20200922134002.1227279-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-kernel@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>
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

This value is only used by a PCMCIA driver and not very useful.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pcmcia/ds.c         | 2 +-
 include/linux/dma-mapping.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pcmcia/ds.c b/drivers/pcmcia/ds.c
index 09d06b082f8b8c..72114907c0e4d2 100644
--- a/drivers/pcmcia/ds.c
+++ b/drivers/pcmcia/ds.c
@@ -516,7 +516,7 @@ static struct pcmcia_device *pcmcia_device_add(struct pcmcia_socket *s,
 	p_dev->dev.parent = s->dev.parent;
 	p_dev->dev.release = pcmcia_release_dev;
 	/* by default don't allow DMA */
-	p_dev->dma_mask = DMA_MASK_NONE;
+	p_dev->dma_mask = 0;
 	p_dev->dev.dma_mask = &p_dev->dma_mask;
 	dev_set_name(&p_dev->dev, "%d.%d", p_dev->socket->sock, p_dev->device_no);
 	if (!dev_name(&p_dev->dev))
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index bb138ac6f5e63e..e074588d753ff6 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -138,8 +138,6 @@ extern const struct dma_map_ops dma_dummy_ops;
 
 #define DMA_BIT_MASK(n)	(((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
 
-#define DMA_MASK_NONE	0x0ULL
-
 static inline int valid_dma_direction(int dma_direction)
 {
 	return ((dma_direction == DMA_BIDIRECTIONAL) ||
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
