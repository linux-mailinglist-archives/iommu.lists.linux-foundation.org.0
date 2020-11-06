Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AE12A9BE5
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 19:20:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 623AE86C78;
	Fri,  6 Nov 2020 18:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFXqcmCY3-c3; Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BB68786CAB;
	Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A48D3C0889;
	Fri,  6 Nov 2020 18:20:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA33EC1AD5
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 955BF86BCB
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpECw2enmiG0 for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 18:20:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F255486B21
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=opD+7yvl9wR6zoOBhy2iFdwJK1/Aiw1n4fvgSFwgxlM=; b=shOCniXrYBujUE+rm7U8l7fEqg
 aVSzGtrG4ebY9YxX2ypfZdb5EOe7W1JDOpsWz5FwRgV0r8SmavehbaX5HEW1T2KHTwpMLwcblEXr1
 JLz1rfrhmII1sVsRGnWGxyFQq+8jJ+dfFpJTuFURy+KP65N+8Bq+DaWn3CQk+478dgreZRZXWj2IK
 U9rxmhw+jO8OqrAdZphc198iSvGH75JCF5o9PW2JPd3dtplUBqTkYiCpPvclE+efqLZWgJ94H5ofR
 cwHerwUSPvR0JbBqeCG38opDaiNRoDiZNY6cnPPc3T+iso2RrQEwJTT3f6NQu9ltp/M1SVae/ILY6
 v67sBABw==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb6Ky-0005dg-4e; Fri, 06 Nov 2020 18:19:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH 02/10] RDMA/umem: use ib_dma_max_seg_size instead of
 dma_get_max_seg_size
Date: Fri,  6 Nov 2020 19:19:33 +0100
Message-Id: <20201106181941.1878556-3-hch@lst.de>
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
 iommu@lists.linux-foundation.org, Jason Gunthorpe <jgg@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Bernard Metzler <bmt@zurich.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>,
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

RDMA ULPs must not call DMA mapping APIs directly but instead use the
ib_dma_* wrappers.

Fixes: 0c16d9635e3a ("RDMA/umem: Move to allocate SG table from pages")
Reported-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/infiniband/core/umem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index e9fecbdf391bcc..0d4da44f30cd68 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -220,10 +220,10 @@ struct ib_umem *ib_umem_get(struct ib_device *device, unsigned long addr,
 
 		cur_base += ret * PAGE_SIZE;
 		npages -= ret;
-		sg = __sg_alloc_table_from_pages(
-			&umem->sg_head, page_list, ret, 0, ret << PAGE_SHIFT,
-			dma_get_max_seg_size(device->dma_device), sg, npages,
-			GFP_KERNEL);
+		sg = __sg_alloc_table_from_pages(&umem->sg_head, page_list, ret,
+				0, ret << PAGE_SHIFT,
+				ib_dma_max_seg_size(device), sg, npages,
+				GFP_KERNEL);
 		umem->sg_nents = umem->sg_head.nents;
 		if (IS_ERR(sg)) {
 			unpin_user_pages_dirty_lock(page_list, ret, 0);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
