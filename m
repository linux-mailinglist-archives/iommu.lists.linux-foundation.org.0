Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2253DACA0
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 22:16:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB492401F0;
	Thu, 29 Jul 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEYTnZ89btCt; Thu, 29 Jul 2021 20:15:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BBA2940527;
	Thu, 29 Jul 2021 20:15:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A521AC0029;
	Thu, 29 Jul 2021 20:15:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD546C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 20:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCD240680
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 20:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZ0gZiyagGES for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 20:15:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 124014058B
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=H+Im41O7i4qTWPUG8nmhAyL/mhQK6e1NSTli9mmAHj8=; b=R6YCg3TpOKaR1Y4CrcmnaTxy33
 cL39gW2wQHn3/jHstlvcLcncw+hBAJ2Zh5HCUW9PHfwfvZc2ti77IDa5KY292K9h2fyHGv+1o1nkx
 kCrpnxFz1QXzehsvCE9BUIUIrHkD/7jmjkose2mCIJLyPUUEBJiAKDVdYYpLzmZBidXWFlg/zaVjP
 QaUN5OTrX2Sf1Jh292wu6GIXkZAauRIgBeTwCUNfxb8KlqGNp/Yj1IMMJgtWiOuSjZIcbEkiF+fjW
 YzW6uo4UYB0y6AtSw7fBxyl27xiJeTyzglR6RPGWURru8kUj8ommDOQS9qsec1F9eEDGg97TbTWpT
 UUhk46xg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRW-0008VL-N8; Thu, 29 Jul 2021 14:15:47 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1m9CRT-0001TS-Ke; Thu, 29 Jul 2021 14:15:43 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 29 Jul 2021 14:15:19 -0600
Message-Id: <20210729201539.5602-2-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com,
 martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v3 01/21] dma-mapping: Allow map_sg() ops to return negative
 error codes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Robin Murphy <robin.murphy@arm.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
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

Allow dma_map_sgtable() to pass errors from the map_sg() ops. This
will be required for returning appropriate error codes when mapping
P2PDMA memory.

Introduce __dma_map_sg_attrs() which will return the raw error code
from the map_sg operation (whether it be negative or zero). Then add a
dma_map_sg_attrs() wrapper to convert any negative errors to zero to
satisfy the existing calling convention.

dma_map_sgtable() defines three error codes that .map_sg implementations
are allowed to return: -EINVAL, -ENOMEM and -EIO. The latter of which
is a generic return for cases that are passing DMA_MAPPING_ERROR
through.

dma_map_sgtable() will convert a zero error return for old map_sg() ops
into a -EIO return and return any negative errors as reported.

This allows map_sg implementations to start returning multiple
negative error codes. Legacy map_sg implementations can continue
to return zero until they are all converted.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 include/linux/dma-map-ops.h |  5 ++-
 include/linux/dma-mapping.h | 35 ++++------------
 kernel/dma/mapping.c        | 84 +++++++++++++++++++++++++++++++++----
 3 files changed, 86 insertions(+), 38 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 0d53a96a3d64..2f842498c448 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -41,8 +41,9 @@ struct dma_map_ops {
 			size_t size, enum dma_data_direction dir,
 			unsigned long attrs);
 	/*
-	 * map_sg returns 0 on error and a value > 0 on success.
-	 * It should never return a value < 0.
+	 * map_sg should return a negative error code on error. See
+	 * dma_map_sgtable() for a list of appropriate error codes
+	 * and their meanings.
 	 */
 	int (*map_sg)(struct device *dev, struct scatterlist *sg, int nents,
 			enum dma_data_direction dir, unsigned long attrs);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 183e7103a66d..daa1e360f0ee 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -110,6 +110,8 @@ int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
 void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
 				      int nents, enum dma_data_direction dir,
 				      unsigned long attrs);
+int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+		enum dma_data_direction dir, unsigned long attrs);
 dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
@@ -174,6 +176,11 @@ static inline void dma_unmap_sg_attrs(struct device *dev,
 		unsigned long attrs)
 {
 }
+static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	return -EOPNOTSUPP;
+}
 static inline dma_addr_t dma_map_resource(struct device *dev,
 		phys_addr_t phys_addr, size_t size, enum dma_data_direction dir,
 		unsigned long attrs)
@@ -343,34 +350,6 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 	return dma_sync_single_for_device(dev, addr + offset, size, dir);
 }
 
-/**
- * dma_map_sgtable - Map the given buffer for DMA
- * @dev:	The device for which to perform the DMA operation
- * @sgt:	The sg_table object describing the buffer
- * @dir:	DMA direction
- * @attrs:	Optional DMA attributes for the map operation
- *
- * Maps a buffer described by a scatterlist stored in the given sg_table
- * object for the @dir DMA operation by the @dev device. After success the
- * ownership for the buffer is transferred to the DMA domain.  One has to
- * call dma_sync_sgtable_for_cpu() or dma_unmap_sgtable() to move the
- * ownership of the buffer back to the CPU domain before touching the
- * buffer by the CPU.
- *
- * Returns 0 on success or -EINVAL on error during mapping the buffer.
- */
-static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	int nents;
-
-	nents = dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents <= 0)
-		return -EINVAL;
-	sgt->nents = nents;
-	return 0;
-}
-
 /**
  * dma_unmap_sgtable - Unmap the given buffer for DMA
  * @dev:	The device for which to perform the DMA operation
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 2b06a809d0b9..9f0bb56eb9aa 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -177,12 +177,8 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
 }
 EXPORT_SYMBOL(dma_unmap_page_attrs);
 
-/*
- * dma_maps_sg_attrs returns 0 on error and > 0 on success.
- * It should never return a value < 0.
- */
-int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
-		enum dma_data_direction dir, unsigned long attrs)
+static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
+	 int nents, enum dma_data_direction dir, unsigned long attrs)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	int ents;
@@ -197,13 +193,85 @@ int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
-	BUG_ON(ents < 0);
-	debug_dma_map_sg(dev, sg, nents, ents, dir);
+
+	if (ents > 0)
+		debug_dma_map_sg(dev, sg, nents, ents, dir);
+	else if (WARN_ON_ONCE(ents != -EINVAL && ents != -ENOMEM &&
+			      ents != -EIO && ents != 0))
+		return -EIO;
 
 	return ents;
 }
+
+/**
+ * dma_map_sg_attrs - Map the given buffer for DMA
+ * @dev:	The device for which to perform the DMA operation
+ * @sg:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ * @attrs:	Optional DMA attributes for the map operation
+ *
+ * Maps a buffer described by a scatterlist passed in the sg argument with
+ * nents segments for the @dir DMA operation by the @dev device.
+ *
+ * Returns the number of mapped entries (which can be less than nents)
+ * on success. Zero is returned for any error.
+ *
+ * dma_unmap_sg_attrs() should be used to unmap the buffer with the
+ * original sg and original nents (not the value returned by this funciton).
+ */
+int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
+		    int nents, enum dma_data_direction dir, unsigned long attrs)
+{
+	int ret;
+
+	ret = __dma_map_sg_attrs(dev, sg, nents, dir, attrs);
+	if (ret < 0)
+		ret = 0;
+
+	return ret;
+}
 EXPORT_SYMBOL(dma_map_sg_attrs);
 
+/**
+ * dma_map_sgtable - Map the given buffer for DMA
+ * @dev:	The device for which to perform the DMA operation
+ * @sgt:	The sg_table object describing the buffer
+ * @dir:	DMA direction
+ * @attrs:	Optional DMA attributes for the map operation
+ *
+ * Maps a buffer described by a scatterlist stored in the given sg_table
+ * object for the @dir DMA operation by the @dev device. After success, the
+ * ownership for the buffer is transferred to the DMA domain.  One has to
+ * call dma_sync_sgtable_for_cpu() or dma_unmap_sgtable() to move the
+ * ownership of the buffer back to the CPU domain before touching the
+ * buffer by the CPU.
+ *
+ * Returns 0 on success or a negative error code on error. The following
+ * error codes are supported with the given meaning:
+ *
+ *   -EINVAL - An invalid argument, unaligned access or other error
+ *	       in usage. Will not succeed if retried.
+ *   -ENOMEM - Insufficient resources (like memory or IOVA space) to
+ *	       complete the mapping. Should succeed if retried later.
+ *   -EIO    - Legacy error code with an unknown meaning. eg. this is
+ *	       returned if a lower level call returned DMA_MAPPING_ERROR.
+ */
+int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
+		    enum dma_data_direction dir, unsigned long attrs)
+{
+	int nents;
+
+	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
+	if (nents == 0)
+		return -EIO;
+	else if (nents < 0)
+		return nents;
+
+	sgt->nents = nents;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dma_map_sgtable);
+
 void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
 				      int nents, enum dma_data_direction dir,
 				      unsigned long attrs)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
