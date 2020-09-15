Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA98926A700
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 16:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9433B86FB5;
	Tue, 15 Sep 2020 14:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBbagdMkBfkA; Tue, 15 Sep 2020 14:26:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F09FC87009;
	Tue, 15 Sep 2020 14:26:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC784C089E;
	Tue, 15 Sep 2020 14:26:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF1E6C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABF89863DD
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CWJdmIB2c2o for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 14:26:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 75EEF86398
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 14:26:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9107768BFE; Tue, 15 Sep 2020 16:26:25 +0200 (CEST)
Date: Tue, 15 Sep 2020 16:26:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Tai <thomas.tai@oracle.com>
Subject: Re: [PATCH] dma-direct: Fix potential NULL pointer dereference
Message-ID: <20200915142624.GA16005@lst.de>
References: <1600178594-22801-1-git-send-email-thomas.tai@oracle.com>
 <20200915140719.GA14831@lst.de>
 <f5cba632-421a-f375-3697-51a182a53a32@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5cba632-421a-f375-3697-51a182a53a32@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Tue, Sep 15, 2020 at 10:11:51AM -0400, Thomas Tai wrote:
>
>
> On 2020-09-15 10:07 a.m., Christoph Hellwig wrote:
>> On Tue, Sep 15, 2020 at 08:03:14AM -0600, Thomas Tai wrote:
>>> When booting the kernel v5.9-rc4 on a VM, the kernel would panic when
>>> printing a warning message in swiotlb_map(). It is because dev->dma_mask
>>> can potentially be a null pointer. Using the dma_get_mask() macro can
>>> avoid the NULL pointer dereference.
>>
>> dma_mask must not be zero.  This means drm is calling DMA API functions
>> on something weird.  This needs to be fixed in the caller.
>>
>
> Thanks, Christoph for your comment. The caller already fixed the null 
> pointer in the latest v5.9-rc5. I am thinking that if we had used the 
> dma_get_mask(), the kernel couldn't panic and could properly print out the 
> warning message.

If we want to solve this something like this patch is probably the
right way:



diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 6e87225600ae35..064870844f06c1 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -62,9 +62,6 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
 {
 	dma_addr_t end = addr + size - 1;
 
-	if (!dev->dma_mask)
-		return false;
-
 	if (is_ram && !IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
 	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
 		return false;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 0d129421e75fc8..2b01d8f7baf160 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -144,6 +144,10 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
+
+	if (WARN_ON_ONCE(!dev->dma_mask))
+		return DMA_MAPPING_ERROR;
+
 	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
 	else
@@ -179,6 +183,10 @@ int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
 	int ents;
 
 	BUG_ON(!valid_dma_direction(dir));
+
+	if (WARN_ON_ONCE(!dev->dma_mask))
+		return 0;
+
 	if (dma_map_direct(dev, ops))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
@@ -217,6 +225,9 @@ dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
 	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
 		return DMA_MAPPING_ERROR;
 
+	if (WARN_ON_ONCE(!dev->dma_mask))
+		return DMA_MAPPING_ERROR;
+
 	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
 	else if (ops->map_resource)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
