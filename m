Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1EE338443
	for <lists.iommu@lfdr.de>; Fri, 12 Mar 2021 04:09:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 498918449C;
	Fri, 12 Mar 2021 03:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GL7cEIHZFtJm; Fri, 12 Mar 2021 03:09:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AB4484497;
	Fri, 12 Mar 2021 03:09:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D82FC000C;
	Fri, 12 Mar 2021 03:09:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1024C0001
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 02:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 820294ED21
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 02:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wyN9eohjA4HH for <iommu@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 02:27:05 +0000 (UTC)
X-Greylist: delayed 00:07:39 by SQLgrey-1.8.0
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4402E4ED20
 for <iommu@lists.linux-foundation.org>; Fri, 12 Mar 2021 02:27:05 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id E11D740018F;
 Fri, 12 Mar 2021 10:19:16 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] include: fix inconsistent indenting in dma_alloc_coherent()
Date: Fri, 12 Mar 2021 10:19:12 +0800
Message-Id: <1615515552-1432-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSUtDGU8ZGU9PGkIeVkpNSk5OSk5OTkxJS0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6Igw6Qj8TNQIpDzEDE0o1
 MTNPCiNVSlVKTUpOTkpOTk5DT01LVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFKTk5ONwY+
X-HM-Tid: 0a78243b1cfad991kuwse11d740018f
X-Mailman-Approved-At: Fri, 12 Mar 2021 03:09:56 +0000
Cc: Wang Qing <wangqing@vivo.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

fix inconsistent indenting in dma_alloc_coherent()

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 include/linux/dma-mapping.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index fbfa3f5..6e4d513
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -401,7 +401,6 @@ static inline void dma_sync_sgtable_for_device(struct device *dev,
 static inline void *dma_alloc_coherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
-
 	return dma_alloc_attrs(dev, size, dma_handle, gfp,
 			(gfp & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0);
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
