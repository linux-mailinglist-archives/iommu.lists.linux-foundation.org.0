Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 800132614E6
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:40:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6B278735C;
	Tue,  8 Sep 2020 16:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fX7OQ9EjWnl5; Tue,  8 Sep 2020 16:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2485887349;
	Tue,  8 Sep 2020 16:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F8F5C0052;
	Tue,  8 Sep 2020 16:40:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C87C2C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B54902E0EF
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ehi-dalDi4-y for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 130E22D002
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OxIsEm34hqWWlO7UlTF9WRyaIN9V+8nCZWPZGcObNSo=; b=rGfEb0rkboiZLak5UguNypTlmU
 r5KDv5Q/RrAy/uki7u4w4ItsGqXXo1AmRHgbqzY2sO08pk7RjSJ25g48MMh9CklAbPev7FGHmK8hg
 /r9JqyGsuweVT8CzR0cSn6ZKRdydS3N+S3W1uDtC/5QhQbH7zY3pMzHOCqLRwzX3D3IK57e+aBu3d
 /5lMzc4vQnUlGZOTvwH0PK6nvwzpgLQ/gI4QSxkeGCj2HWMZONpaGCJAL4PPxijW0JBdEC5IGe0pH
 YO+PCrorrNWpk795D+bbx9rtlVWYKMEp/agMZiKm6mtgHOhtDddd71B6kgIou3mvMNvXu8AmMUlZ6
 t3r/eLmw==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgf5-0000s4-3r; Tue, 08 Sep 2020 16:40:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] dma-debug: remove all exports
Date: Tue,  8 Sep 2020 18:39:59 +0200
Message-Id: <20200908163959.3177173-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908163959.3177173-1-hch@lst.de>
References: <20200908163959.3177173-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>
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

Now that the main dma mapping entry points are out of line none
of these functions can be called from modular code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/debug.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 8e9f7b301c6d39..9e5370e3700c08 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -1199,7 +1199,6 @@ void debug_dma_map_single(struct device *dev, const void *addr,
 		err_printk(dev, NULL, "device driver maps memory from vmalloc area [addr=%p] [len=%lu]\n",
 			   addr, len);
 }
-EXPORT_SYMBOL(debug_dma_map_single);
 
 void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
 			size_t size, int direction, dma_addr_t dma_addr)
@@ -1235,7 +1234,6 @@ void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
 
 	add_dma_entry(entry);
 }
-EXPORT_SYMBOL(debug_dma_map_page);
 
 void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 {
@@ -1273,7 +1271,6 @@ void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 
 	put_hash_bucket(bucket, flags);
 }
-EXPORT_SYMBOL(debug_dma_mapping_error);
 
 void debug_dma_unmap_page(struct device *dev, dma_addr_t addr,
 			  size_t size, int direction)
@@ -1290,7 +1287,6 @@ void debug_dma_unmap_page(struct device *dev, dma_addr_t addr,
 		return;
 	check_unmap(&ref);
 }
-EXPORT_SYMBOL(debug_dma_unmap_page);
 
 void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		      int nents, int mapped_ents, int direction)
@@ -1328,7 +1324,6 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		add_dma_entry(entry);
 	}
 }
-EXPORT_SYMBOL(debug_dma_map_sg);
 
 static int get_nr_mapped_entries(struct device *dev,
 				 struct dma_debug_entry *ref)
@@ -1380,7 +1375,6 @@ void debug_dma_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		check_unmap(&ref);
 	}
 }
-EXPORT_SYMBOL(debug_dma_unmap_sg);
 
 void debug_dma_alloc_coherent(struct device *dev, size_t size,
 			      dma_addr_t dma_addr, void *virt)
@@ -1466,7 +1460,6 @@ void debug_dma_map_resource(struct device *dev, phys_addr_t addr, size_t size,
 
 	add_dma_entry(entry);
 }
-EXPORT_SYMBOL(debug_dma_map_resource);
 
 void debug_dma_unmap_resource(struct device *dev, dma_addr_t dma_addr,
 			      size_t size, int direction)
@@ -1484,7 +1477,6 @@ void debug_dma_unmap_resource(struct device *dev, dma_addr_t dma_addr,
 
 	check_unmap(&ref);
 }
-EXPORT_SYMBOL(debug_dma_unmap_resource);
 
 void debug_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 				   size_t size, int direction)
@@ -1503,7 +1495,6 @@ void debug_dma_sync_single_for_cpu(struct device *dev, dma_addr_t dma_handle,
 
 	check_sync(dev, &ref, true);
 }
-EXPORT_SYMBOL(debug_dma_sync_single_for_cpu);
 
 void debug_dma_sync_single_for_device(struct device *dev,
 				      dma_addr_t dma_handle, size_t size,
@@ -1523,7 +1514,6 @@ void debug_dma_sync_single_for_device(struct device *dev,
 
 	check_sync(dev, &ref, false);
 }
-EXPORT_SYMBOL(debug_dma_sync_single_for_device);
 
 void debug_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
 			       int nelems, int direction)
@@ -1556,7 +1546,6 @@ void debug_dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
 		check_sync(dev, &ref, true);
 	}
 }
-EXPORT_SYMBOL(debug_dma_sync_sg_for_cpu);
 
 void debug_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 				  int nelems, int direction)
@@ -1588,7 +1577,6 @@ void debug_dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 		check_sync(dev, &ref, false);
 	}
 }
-EXPORT_SYMBOL(debug_dma_sync_sg_for_device);
 
 static int __init dma_debug_driver_setup(char *str)
 {
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
