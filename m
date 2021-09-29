Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF741BCC9
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 04:33:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 565D140258;
	Wed, 29 Sep 2021 02:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuGlktx8Osn5; Wed, 29 Sep 2021 02:33:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E3DC740249;
	Wed, 29 Sep 2021 02:33:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFEDCC000D;
	Wed, 29 Sep 2021 02:33:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 818F2C000D
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 02:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EDB2827DD
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 02:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjaXgz_Y37V5 for <iommu@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 02:33:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C2CD82C7C
 for <iommu@lists.linux-foundation.org>; Wed, 29 Sep 2021 02:33:26 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id m21so1076334pgu.13
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUall3U24zYRMxZTLu8QMiLAqNLbI9ECfniKcDwoTIk=;
 b=U6WCe0JD5h2qhkJ++CB96pGEtGWB1/F87pkVQv21QiLs3xgSNc3aRewG0x/j3yWuQg
 yFY8/CtwyaDGgWdL2NN3UQMcUh/wWNnpYPRzzCx16GuzK9uoLeQ60BVKh7il8hYXZloN
 q+zVwprx99aqCYhM2jrLu3qaiB1yAo4tOxtc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUall3U24zYRMxZTLu8QMiLAqNLbI9ECfniKcDwoTIk=;
 b=7G6BbkvpmACBAOW/YQccYwdK6DkbYgS5reNLxmCv80gDNoD4WI8fKsFoM/biZ+RNRT
 MqQ/B+Q4UqhLlkxiL3STJlu74vdZSFzb5XZ7JX8mCMzXR0bYzXmWvUVrDM4s36/RDfPQ
 2JOL5vzCyaMP1DpAG6aUPcULPMLb4JLeEyb2oStz671gIzg/tzcXdN55HFQz34ZMLQEG
 C47IZUmvGTkdyxjL2AJI7UOYJRTFpCWCQxmmAnVS+ahKsG/aaEyrHz0A3qSW9NsNGu1u
 EtXSsGekf6/3VuoPUeqD1MHKTfpQTpUmhr2y92byel8vFkWRK2uvGj3oIwO75s1IxhdL
 GfbA==
X-Gm-Message-State: AOAM533lVGD3ZRPDZIiLuPdL1RZ9r8fcKPxKXT3Dd/BjOBH1sZk7msCA
 fPiKinLH5kMVBn4R0UR/6B0dPg==
X-Google-Smtp-Source: ABdhPJyaRXccGofSKYzMfOoRR3mP9Rg9/ZlL1e4fiIrckBhZWP0W8hFkn/6q2YxueaVpOnj1RhIArQ==
X-Received: by 2002:a63:b54b:: with SMTP id u11mr7492398pgo.163.1632882806082; 
 Tue, 28 Sep 2021 19:33:26 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f818:368:93ef:fa36])
 by smtp.gmail.com with UTF8SMTPSA id y15sm415897pfq.32.2021.09.28.19.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 19:33:25 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 4/7] dma-iommu: fold _swiotlb helpers into callers
Date: Wed, 29 Sep 2021 11:32:57 +0900
Message-Id: <20210929023300.335969-5-stevensd@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210929023300.335969-1-stevensd@google.com>
References: <20210929023300.335969-1-stevensd@google.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, David Stevens <stevensd@chromium.org>,
 Rajat Jain <rajatja@google.com>, Will Deacon <will@kernel.org>
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

From: David Stevens <stevensd@chromium.org>

Fold the _swiotlb helper functions into the respective _page functions,
since recent fixes have moved all logic from the _page functions to the
_swiotlb functions.

Signed-off-by: David Stevens <stevensd@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 135 +++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 76 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 027b489714b7..4f77c44eaf14 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -510,26 +510,6 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 	iommu_dma_free_iova(cookie, dma_addr, size, &iotlb_gather);
 }
 
-static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
-		size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
-	phys_addr_t phys;
-
-	phys = iommu_iova_to_phys(domain, dma_addr);
-	if (WARN_ON(!phys))
-		return;
-
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
-		arch_sync_dma_for_cpu(phys, size, dir);
-
-	__iommu_dma_unmap(dev, dma_addr, size);
-
-	if (unlikely(is_swiotlb_buffer(dev, phys)))
-		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
-}
-
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size_t size, int prot, u64 dma_mask)
 {
@@ -556,55 +536,6 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	return iova + iova_off;
 }
 
-static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
-		size_t org_size, dma_addr_t dma_mask, bool coherent,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	int prot = dma_info_to_prot(dir, coherent, attrs);
-	struct iommu_domain *domain = iommu_get_dma_domain(dev);
-	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	struct iova_domain *iovad = &cookie->iovad;
-	size_t aligned_size = org_size;
-	void *padding_start;
-	size_t padding_size;
-	dma_addr_t iova;
-
-	/*
-	 * If both the physical buffer start address and size are
-	 * page aligned, we don't need to use a bounce page.
-	 */
-	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
-	    iova_offset(iovad, phys | org_size)) {
-		aligned_size = iova_align(iovad, org_size);
-		phys = swiotlb_tbl_map_single(dev, phys, org_size,
-					      aligned_size, dir, attrs);
-
-		if (phys == DMA_MAPPING_ERROR)
-			return DMA_MAPPING_ERROR;
-
-		/* Cleanup the padding area. */
-		padding_start = phys_to_virt(phys);
-		padding_size = aligned_size;
-
-		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-		    (dir == DMA_TO_DEVICE ||
-		     dir == DMA_BIDIRECTIONAL)) {
-			padding_start += org_size;
-			padding_size -= org_size;
-		}
-
-		memset(padding_start, 0, padding_size);
-	}
-
-	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		arch_sync_dma_for_device(phys, org_size, dir);
-
-	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
-	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
-		swiotlb_tbl_unmap_single(dev, phys, org_size, dir, attrs);
-	return iova;
-}
-
 static void __iommu_dma_free_pages(struct page **pages, int count)
 {
 	while (count--)
@@ -866,15 +797,68 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 {
 	phys_addr_t phys = page_to_phys(page) + offset;
 	bool coherent = dev_is_dma_coherent(dev);
+	int prot = dma_info_to_prot(dir, coherent, attrs);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+	size_t aligned_size = size;
+	dma_addr_t iova, dma_mask = dma_get_mask(dev);
+
+	/*
+	 * If both the physical buffer start address and size are
+	 * page aligned, we don't need to use a bounce page.
+	 */
+	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
+	    iova_offset(iovad, phys | size)) {
+		void *padding_start;
+		size_t padding_size;
+
+		aligned_size = iova_align(iovad, size);
+		phys = swiotlb_tbl_map_single(dev, phys, size,
+					      aligned_size, dir, attrs);
+
+		if (phys == DMA_MAPPING_ERROR)
+			return DMA_MAPPING_ERROR;
 
-	return __iommu_dma_map_swiotlb(dev, phys, size, dma_get_mask(dev),
-			coherent, dir, attrs);
+		/* Cleanup the padding area. */
+		padding_start = phys_to_virt(phys);
+		padding_size = aligned_size;
+
+		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+		    (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)) {
+			padding_start += size;
+			padding_size -= size;
+		}
+
+		memset(padding_start, 0, padding_size);
+	}
+
+	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		arch_sync_dma_for_device(phys, size, dir);
+
+	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
+	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
+		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
+	return iova;
 }
 
 static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	__iommu_dma_unmap_swiotlb(dev, dma_handle, size, dir, attrs);
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	phys_addr_t phys;
+
+	phys = iommu_iova_to_phys(domain, dma_handle);
+	if (WARN_ON(!phys))
+		return;
+
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) && !dev_is_dma_coherent(dev))
+		arch_sync_dma_for_cpu(phys, size, dir);
+
+	__iommu_dma_unmap(dev, dma_handle, size);
+
+	if (unlikely(is_swiotlb_buffer(dev, phys)))
+		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
 }
 
 /*
@@ -959,7 +943,7 @@ static void iommu_dma_unmap_sg_swiotlb(struct device *dev, struct scatterlist *s
 	int i;
 
 	for_each_sg(sg, s, nents, i)
-		__iommu_dma_unmap_swiotlb(dev, sg_dma_address(s),
+		iommu_dma_unmap_page(dev, sg_dma_address(s),
 				sg_dma_len(s), dir, attrs);
 }
 
@@ -970,9 +954,8 @@ static int iommu_dma_map_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 	int i;
 
 	for_each_sg(sg, s, nents, i) {
-		sg_dma_address(s) = __iommu_dma_map_swiotlb(dev, sg_phys(s),
-				s->length, dma_get_mask(dev),
-				dev_is_dma_coherent(dev), dir, attrs);
+		sg_dma_address(s) = iommu_dma_map_page(dev, sg_page(s),
+				s->offset, s->length, dir, attrs);
 		if (sg_dma_address(s) == DMA_MAPPING_ERROR)
 			goto out_unmap;
 		sg_dma_len(s) = s->length;
-- 
2.33.0.685.g46640cef36-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
