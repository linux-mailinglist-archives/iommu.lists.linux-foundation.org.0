Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B725E2A9BE1
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 19:20:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 61DC82E138;
	Fri,  6 Nov 2020 18:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDWE6-oSIcuT; Fri,  6 Nov 2020 18:20:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D9F872E119;
	Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB8A1C0893;
	Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 963E4C0893
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A1C92E119
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlIXsy-W-jyG for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 18:20:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 0662520386
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=L6cRLUhK//o9WewIZpiSJodvE7qCQTp6LO8uunrroR0=; b=IxUSXUM+yTi4uOdKjGZO9iKRa4
 nsWFNvEF5FwyWIxUbPlCLHAYqAJKe24e4ahZiJctdsBTCU2lGxR2+wsZ0UAtRdtiZD/8m56SyHSDn
 ll2FeM6HxZdmsKEwR9ZmitgRfn/NGBScM3XDQOQMCKCv9J4s8l5sr4zT6L+Ah06sMHykFOVrdhPzA
 wRihkMwFRRE1X4sWaAg//HWTCM2nyaomXLfNcq7xmPOnuFAS2LARlD3K66/THlDoZWjdKgbkcK01v
 kN/Vh6USoU5CXVaMtIs4gSEDMbex4tLR2BMPqmed2VnW47TCa1sOxXyDqOHISBDtha1PTooA3iLL2
 fV/OZSzw==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb6L7-0005eZ-0E; Fri, 06 Nov 2020 18:19:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 06/10] RDMA/core: remove ib_dma_{alloc,free}_coherent
Date: Fri,  6 Nov 2020 19:19:37 +0100
Message-Id: <20201106181941.1878556-7-hch@lst.de>
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

These two functions are entirely unused.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/rdma/ib_verbs.h | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 3257cc046e460f..453793d1d2225f 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -4098,35 +4098,6 @@ static inline void ib_dma_sync_single_for_device(struct ib_device *dev,
 	dma_sync_single_for_device(dev->dma_device, addr, size, dir);
 }
 
-/**
- * ib_dma_alloc_coherent - Allocate memory and map it for DMA
- * @dev: The device for which the DMA address is requested
- * @size: The size of the region to allocate in bytes
- * @dma_handle: A pointer for returning the DMA address of the region
- * @flag: memory allocator flags
- */
-static inline void *ib_dma_alloc_coherent(struct ib_device *dev,
-					   size_t size,
-					   dma_addr_t *dma_handle,
-					   gfp_t flag)
-{
-	return dma_alloc_coherent(dev->dma_device, size, dma_handle, flag);
-}
-
-/**
- * ib_dma_free_coherent - Free memory allocated by ib_dma_alloc_coherent()
- * @dev: The device for which the DMA addresses were allocated
- * @size: The size of the region
- * @cpu_addr: the address returned by ib_dma_alloc_coherent()
- * @dma_handle: the DMA address returned by ib_dma_alloc_coherent()
- */
-static inline void ib_dma_free_coherent(struct ib_device *dev,
-					size_t size, void *cpu_addr,
-					dma_addr_t dma_handle)
-{
-	dma_free_coherent(dev->dma_device, size, cpu_addr, dma_handle);
-}
-
 /* ib_reg_user_mr - register a memory region for virtual addresses from kernel
  * space. This function should be called when 'current' is the owning MM.
  */
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
