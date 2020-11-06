Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EAA2A9BE6
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 19:20:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90E7B86A9E;
	Fri,  6 Nov 2020 18:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UkbbAgUDgQY; Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F43786AC1;
	Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C735C0889;
	Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 112F7C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0B87A86BF1
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YmCBd3pl6wNK for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 18:20:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3C99086B14
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IlFC5uLN53//nOw1snJqxiUukwasxjVCret8k23G090=; b=IAEdO1lB16SqRSTED4QBzz1owR
 AT3SIaxam9iY1i5Yrg3FtIfN0wR8diPLP6ewpqDHi9BMpuk6o7yzVZyXlyMw788yGOV/BFNo670Xi
 Xd3lVTAL6XX9Mv3nW5B5216lmekIRSMJXre+mMZsFeo8rZTxWTGJfdaR0zu0UQTbqv+DM0+f+u7JA
 A5dx8XjhXO3HT+rHVdryx7K3d7/fq8qhUHtx5d5MAdeDkTURN71v6XEVXGoo2K7gcDvmaXcl4SUvL
 Dvymnt2o9amdUaiz5MTxv8GmIEY5tZnGe2omjQs/HC4EjJOZLB/SrwmWgY90MC8Rd2BMaStZ7id1c
 r1+cr76g==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb6LD-0005fQ-Mg; Fri, 06 Nov 2020 18:20:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 09/10] PCI/P2PDMA: Cleanup __pci_p2pdma_map_sg a bit
Date: Fri,  6 Nov 2020 19:19:40 +0100
Message-Id: <20201106181941.1878556-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106181941.1878556-1-hch@lst.de>
References: <20201106181941.1878556-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
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
