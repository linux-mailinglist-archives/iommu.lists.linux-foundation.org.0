Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A732A6108
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 10:59:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C391868E3;
	Wed,  4 Nov 2020 09:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1ICgLgixcgV; Wed,  4 Nov 2020 09:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 294E98690D;
	Wed,  4 Nov 2020 09:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B257C0051;
	Wed,  4 Nov 2020 09:59:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 134CDC0051
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0EE8D868E6
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-hV0dOHruHr for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 09:59:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 07798868E3
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LpmxBUNXR/vpd40lHrgIgh7P2vE+cTORJm1HTtvqYHU=; b=QSUSDnU2O7uL9HraDohm7gBLeN
 3tcosCM3gYYOkxAHYp1s+HuUUfa6RsnpJPaNye0dnnWsNZonTh0gxBdOEKLEYiL2303ykXXyACXpy
 cxeJi/bEIWhRlvXfPVLWfgUKGXUxhi6I3DAuJeSC/guXht7jVQJE8sl3PM0FQmulA1LE8U3LezYwA
 vKyFzlw4Wb6xCz5tPSCsvYx+NbNxg3m9eU4DHQmgg6nIZpehKB/o6zg39ba9wVLzp7D3rje1yGNIr
 wyswMAIG3wCS+oHu5lYxhWvNmNhR5c3Jn2zJ20PCqbd4fSAD/pWsrAhmxCx4GOt0W+FJLSsK9zUYC
 pPfJc2tQ==;
Received: from 089144208145.atnat0017.highway.a1.net ([89.144.208.145]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaFZs-0002lo-O6; Wed, 04 Nov 2020 09:59:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 3/5] PCI/p2p: remove the DMA_VIRT_OPS hacks
Date: Wed,  4 Nov 2020 10:50:50 +0100
Message-Id: <20201104095052.1222754-4-hch@lst.de>
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

Now that all users of dma_virt_ops are gone we can remove the workaround
for it in the PCIe peer to peer code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/pci/p2pdma.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index de1c331dbed43f..b07018af53876c 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -556,15 +556,6 @@ int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
 		return -1;
 
 	for (i = 0; i < num_clients; i++) {
-#ifdef CONFIG_DMA_VIRT_OPS
-		if (clients[i]->dma_ops == &dma_virt_ops) {
-			if (verbose)
-				dev_warn(clients[i],
-					 "cannot be used for peer-to-peer DMA because the driver makes use of dma_virt_ops\n");
-			return -1;
-		}
-#endif
-
 		pci_client = find_parent_pci_dev(clients[i]);
 		if (!pci_client) {
 			if (verbose)
@@ -837,17 +828,6 @@ static int __pci_p2pdma_map_sg(struct pci_p2pdma_pagemap *p2p_pgmap,
 	phys_addr_t paddr;
 	int i;
 
-	/*
-	 * p2pdma mappings are not compatible with devices that use
-	 * dma_virt_ops. If the upper layers do the right thing
-	 * this should never happen because it will be prevented
-	 * by the check in pci_p2pdma_distance_many()
-	 */
-#ifdef CONFIG_DMA_VIRT_OPS
-	if (WARN_ON_ONCE(dev->dma_ops == &dma_virt_ops))
-		return 0;
-#endif
-
 	for_each_sg(sg, s, nents, i) {
 		paddr = sg_phys(s);
 
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
