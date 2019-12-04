Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D68112C35
	for <lists.iommu@lfdr.de>; Wed,  4 Dec 2019 14:03:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CEE6879B1;
	Wed,  4 Dec 2019 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnSm4TP++JMi; Wed,  4 Dec 2019 13:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 187B787C6F;
	Wed,  4 Dec 2019 13:03:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FE12C1DD6;
	Wed,  4 Dec 2019 13:03:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 448F0C077D
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2CDDE87988
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGpkj4q8CBft for <iommu@lists.linux-foundation.org>;
 Wed,  4 Dec 2019 13:03:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7FF14874F7
 for <iommu@lists.linux-foundation.org>; Wed,  4 Dec 2019 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bsp64KSmEt23YRaXfKdUqcfbhoOeVUFI6KMtsCkAMJ0=; b=O02zHQzrKFO01+E9khYYAfSWTl
 sG0EHS77rxbJgE9iF5UQhyISJ9McxENpxxDdE8QKmD9iBEvNg7ywCw6eFSCCXq5G0kKAEeBOxtOf5
 HLqnyKvYW2Vk/9vSrrJhxB2YtTgSQrHJzv5DSh5J0X+7lrUlYZ7NcwQ4ttafjaZTHvJGYAU8n8pf3
 4aGKHqFN7/tJVfiDZdjwb4eZZUamhM/GquFxXt5FEWCofCgVYgj7blSK+1LeJGmMkM28WJ4U7VXgL
 oK9NyP+RoL51DgRcN2MlOXw6XPi5zqXBlX9pSeB2Zs7Gw9jzcdQ2I7gAaFSNeO8f9x2e9uiR1x7c8
 bkFk/VrQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icUJn-0004D1-C8; Wed, 04 Dec 2019 13:03:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Date: Wed,  4 Dec 2019 14:03:39 +0100
Message-Id: <20191204130339.22804-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204130339.22804-1-hch@lst.de>
References: <20191204130339.22804-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
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

Devices that are forced to DMA through swiotlb need to be treated as if
they are addressing limited.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-direct.h | 1 +
 kernel/dma/direct.c        | 8 ++++++--
 kernel/dma/mapping.c       | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..83aac21434c6 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -85,4 +85,5 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
 int dma_direct_supported(struct device *dev, u64 mask);
+bool dma_direct_addressing_limited(struct device *dev);
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 6af7ae83c4ad..450f3abe5cb5 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -497,11 +497,15 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	return mask >= __phys_to_dma(dev, min_mask);
 }
 
+bool dma_direct_addressing_limited(struct device *dev)
+{
+	return force_dma_unencrypted(dev) || swiotlb_force == SWIOTLB_FORCE;
+}
+
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active() &&
-	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+	if (is_swiotlb_active() && dma_addressing_limited(dev))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
 }
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 1dbe6d725962..ebc60633d89a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -416,6 +416,9 @@ EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
  */
 bool dma_addressing_limited(struct device *dev)
 {
+	if (dma_is_direct(get_dma_ops(dev)) &&
+	    dma_direct_addressing_limited(dev))
+		return true;
 	return min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
 			    dma_get_required_mask(dev);
 }
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
