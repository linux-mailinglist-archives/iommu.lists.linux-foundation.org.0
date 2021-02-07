Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE33125BF
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:04:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79F7F855EF;
	Sun,  7 Feb 2021 16:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lY45OCzPIHnp; Sun,  7 Feb 2021 16:04:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3A9285579;
	Sun,  7 Feb 2021 16:04:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90534C0891;
	Sun,  7 Feb 2021 16:04:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF302C013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BD36820418
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzoqWM2eRNad for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:04:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 10A1520431
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=F24Liqgf8qiF463t7oAeygk27So981Fko2Wbpc6bT9g=; b=pnnqZpwoJ6QCs7bs7Tx4x3pas9
 JbwBXQWGNDkycE+dS6c+jkh9yaXRc8JYObbH2HRv6/UcaP2GHabkSJvL0sjXKl8JxAo2mOmYqm19a
 Sj0G1SfYq2GEeOiWvaklju2MvGwHJS0l4+mpnAkoYdEs3hsyX5lCyONYs7tnuDjckJJBPLGfz1Rfk
 IjtyAfL+h536s8gp2758mJIX4OpOuPhKQjTghX2mJVEJEyGPOHApBSugxp+Q6ua8iPHHn0R2NsAoR
 Z+hXHuHBFitIsgCdt2LJej9R9E/0bGqFc0OZFSxj/H8aHDK+ifFzY0TiDEosv7fm/X3gOgutzekxe
 zos02m+A==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mXP-004tOt-Qy; Sun, 07 Feb 2021 16:03:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: jxgao@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 7/9] swiotlb: don't modify orig_addr in swiotlb_tbl_sync_single
Date: Sun,  7 Feb 2021 17:03:25 +0100
Message-Id: <20210207160327.2955490-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160327.2955490-1-hch@lst.de>
References: <20210207160327.2955490-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

swiotlb_tbl_map_single currently nevers sets a tlb_addr that is not
aligned to the tlb bucket size.  But we're going to add such a case
soon, for which this adjustment would be bogus.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 381c24ef1ac1d0..8eb84c337fe90c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -660,7 +660,6 @@ void swiotlb_tbl_sync_single(struct device *hwdev, phys_addr_t tlb_addr,
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
-	orig_addr += (unsigned long)tlb_addr & (IO_TLB_SIZE - 1);
 
 	switch (target) {
 	case SYNC_FOR_CPU:
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
