Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664E2A785C
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 08:55:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B785A21561;
	Thu,  5 Nov 2020 07:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozC-Qw9I9UmT; Thu,  5 Nov 2020 07:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99A4820767;
	Thu,  5 Nov 2020 07:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89ADAC1AD6;
	Thu,  5 Nov 2020 07:55:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 030B3C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EF99A20767
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pecUXmQlHXhi for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:55:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id EBB4720763
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IlFC5uLN53//nOw1snJqxiUukwasxjVCret8k23G090=; b=thrGW61kfNEXca0VM6wmSsxPVw
 4sflPwy0fsG8GsGaViZzQkNIt2AEuuSg9EZDEzmBk1FkDoOtceTiQaUw9qZ9W3KsNQCAFYEjSXXMg
 6ckGzoZEx1we1BkEd0jrpZ5j1aT5tutJcR9gdzvx0KhxWm+x1SnEBPYYDoKCdu9SC2uTNMbuiNxxH
 R36Kb75zMAZswBrT98Xh+N5p0AbOq0VbLT6PlS2stnEu2E2PTqZtBaVW/yvi8SNix9QnOwuhs2ych
 sxEV6M5ID1F6Ahdoaw/O2tLEXFbXEzWj0sPBGX2hWfdtHMByQtO78PlW+slo2xO4eV3zNVwsNk/4b
 KqImcfmw==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaa74-0005En-NN; Thu, 05 Nov 2020 07:55:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 5/6] PCI/P2PDMA: Cleanup __pci_p2pdma_map_sg a bit
Date: Thu,  5 Nov 2020 08:42:04 +0100
Message-Id: <20201105074205.1690638-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105074205.1690638-1-hch@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
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
