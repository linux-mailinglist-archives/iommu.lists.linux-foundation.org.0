Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C227435D
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 15:39:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AFAE3870F7;
	Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elrhuYvYhGAQ; Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4C997872C1;
	Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 389CAC0859;
	Tue, 22 Sep 2020 13:39:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA6ACC0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 956B386FDB
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqBWu1ig2dgH for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 13:39:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94596870E6
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Dj0SE+agkMPt4RtgGrQDspMH2G8cNUOwicknqNk5yZA=; b=Qcrd+4KUpPW6lmO0FyhIU3+sBa
 wcNoL5YDdT1H4u8iBEIvwmObNtIoR1ZviLjJ8tXgpCye/WihOtGde4DhWNMNxHD13FMMAXE0sTTcZ
 auTQJKt3wq7plJ23hsuk5XTAR7DxcrqEjSVgG1xP9d7CTRWmaPQ5GiskA31NGC3ivN0ul1ceZ7OOH
 Fo+fEFx4PkPZihLWHcNDXtta+Od+ryR7qYyhKdFZEjl9QWZSvHg1fCjidzuZd6I+CPZwj8EjvfPMm
 dM7f57AEH6xyO0u1pgXUo5w9NFqN9iU5kP5TijIPzv/fT6fNXx8NMtHVWZxWwNm9MhQOm6vbF4KSN
 O1SgBZdg==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKiWC-0005MM-RC; Tue, 22 Sep 2020 13:39:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 3/3] dma-mapping: better document dma_addr_t and
 DMA_MAPPING_ERROR
Date: Tue, 22 Sep 2020 15:40:02 +0200
Message-Id: <20200922134002.1227279-4-hch@lst.de>
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

Move the comment documenting dma_addr_t away from the dma_map_ops
definition which isn't very related to it, and toward DMA_MAPPING_ERROR,
which is somewhat related.  Add a little blurb about DMA_MAPPING_ERROR
as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 51e93d44b826c8..c4395cf7e265dd 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -67,12 +67,6 @@
  */
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
 
-/*
- * A dma_addr_t can hold any valid DMA or bus address for the platform.
- * It can be given to a device to use as a DMA source or target.  A CPU cannot
- * reference a dma_addr_t directly because there may be translation between
- * its physical address space and the bus address space.
- */
 struct dma_map_ops {
 	void* (*alloc)(struct device *dev, size_t size,
 				dma_addr_t *dma_handle, gfp_t gfp,
@@ -131,6 +125,16 @@ struct dma_map_ops {
 	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
+/*
+ * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
+ * be given to a device to use as a DMA source or target.  A CPU cannot
+ * reference a dma_addr_t directly because there may be translation between its
+ * physical address space and the bus address space.
+ *
+ * DMA_MAPPING_ERROR is the magic error code if a mapping failed.  It should not
+ * be used directly in drivers, but checked for using dma_mapping_error()
+ * instead.
+ */
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
 
 extern const struct dma_map_ops dma_virt_ops;
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
