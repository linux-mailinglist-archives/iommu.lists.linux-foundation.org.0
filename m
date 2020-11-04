Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F682A610F
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 11:02:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A6678650A;
	Wed,  4 Nov 2020 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy8OC8Ty-Wck; Wed,  4 Nov 2020 10:02:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF919864EF;
	Wed,  4 Nov 2020 10:02:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87046C1AD7;
	Wed,  4 Nov 2020 10:02:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DC4AC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF1B52049E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jAHomClTYOir for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 10:01:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id A76E62043D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MWQ4wpYE4PesSUuuLcuPA53B6tTBBIP7EaIdrCoKVwY=; b=IojZGMZkDxGemm05TLzznPDSkH
 af7X9Ytwdo5g7izzmeEKXAKtpEVLBPhthWjGIvZUR2EivMCD+cierkvRvGB9WfD9sgqMP7aUz1QCU
 2uT9M77j9+OSRDS0j3QLIB5NPL2npieZDlhQH5lDh7zBT7D2q3F0tl2AX0H3ig20S2TaVZf4B+LMS
 JqkZeor/toY30CD3fuVaEE3s8Uh2LM74PnLhcFUjfmrflb30T+DiebhynU7GyBdgdyYYC/cxdMF9a
 s8Pm4Oj4zJEUH1pNmupEOUce3ns2vs4mu+4jSgmyHw24hCuSsPPlccJ3Nmr3pzUjtRY0pcLnyTJom
 N5JJF5yg==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaFc0-00036e-02; Wed, 04 Nov 2020 10:01:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 4/5] PCI/p2p: cleanup up __pci_p2pdma_map_sg a bit
Date: Wed,  4 Nov 2020 10:50:51 +0100
Message-Id: <20201104095052.1222754-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104095052.1222754-1-hch@lst.de>
References: <20201104095052.1222754-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-rdma@vger.kernel.org,
 iommu@lists.linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>,
 linux-pci@vger.kernel.org
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

Remove the pointless paddr variable that was only used once.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pci/p2pdma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index b07018af53876c..afd792cc272832 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -825,13 +825,10 @@ static int __pci_p2pdma_map_sg(struct pci_p2pdma_pagemap *p2p_pgmap,
 		struct device *dev, struct scatterlist *sg, int nents)
 {
 	struct scatterlist *s;
-	phys_addr_t paddr;
 	int i;
 
 	for_each_sg(sg, s, nents, i) {
-		paddr = sg_phys(s);
-
-		s->dma_address = paddr - p2p_pgmap->bus_offset;
+		s->dma_address = sg_phys(s) - p2p_pgmap->bus_offset;
 		sg_dma_len(s) = s->length;
 	}
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
