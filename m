Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C591E3EB1C4
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 09:42:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C3780E89;
	Fri, 13 Aug 2021 07:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSXIJJFAs3QA; Fri, 13 Aug 2021 07:42:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 621C580E79;
	Fri, 13 Aug 2021 07:42:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E451C000E;
	Fri, 13 Aug 2021 07:42:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 218D9C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 07:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E446606EA
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 07:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iiX0Tw669Kun for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 07:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EAD0605E4
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 07:42:38 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so19514174pjr.1
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 00:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjVCAvnl6PUy5EY4yV2b37TCvoOV7plfescupRYCqI4=;
 b=lx+qGECuMb2tdJm9D4k5cNvLxbwpPISDiQgcbMhVM9Lo63AniUT6x8HxtkKUAGcCz9
 YazgX36am4EkZMecUhX06P1Z6SVKDKaeYZhCCz1PxktYeTcyvNFGeZZAVv49t9ZPcTcH
 E2lQ28NvrKiRLXqLWJ2gACn2U0MloGsATLWlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjVCAvnl6PUy5EY4yV2b37TCvoOV7plfescupRYCqI4=;
 b=VUe9a6oqxdSvSIn5uQHiz5rkwn76Qw+jP1yH0txIljDiJTSAX5XlLLM4MGEk9fTOjY
 aZM50VDphDuVRE8iBtxgDQ0pn+YrHeGUjWfdrlwiX2C8lHl6yyK24UeX2LLMilnUSHzp
 xtzNWnWGuHRz6XlyEH8X8olZSZl5SxkxYAWNtiy2NXkZxd18A6hsbk/7Q80SlMPSQrJc
 vOmgFxZs2dlYK6hAnfbbfZL9s7hcYOu4GMwXjHRssxyAnHGsHoLZleH1OcxOtZuWV2Tv
 eSvU7l3wG8ZyxnVcNYjaD6f6tLZu/8ElixBGYsMEYxtR1b8X0b9prnkfcQXDg4vl7WQq
 QVMA==
X-Gm-Message-State: AOAM532O379OirRgvYISkpyD+L1wj5+9GYHl8rt/jRJbQo4okyU8N1Ua
 wc++LdaeBRiAFGZdQ9b6TZWzkQ==
X-Google-Smtp-Source: ABdhPJzdQU4uWpopc/R6CXnmuwVAtJOqkPHcpsQCBadSYGthl9aCy1sahQINdjqtgv229ObctMjiGA==
X-Received: by 2002:aa7:93cd:0:b029:3e0:e283:9c45 with SMTP id
 y13-20020aa793cd0000b02903e0e2839c45mr1163463pff.53.1628840557654; 
 Fri, 13 Aug 2021 00:42:37 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:cbc8:5998:527e:5f43])
 by smtp.gmail.com with UTF8SMTPSA id y8sm1158540pfe.162.2021.08.13.00.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 00:42:36 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 1/6] dma-iommu: fix sync_sg with swiotlb
Date: Fri, 13 Aug 2021 16:38:34 +0900
Message-Id: <20210813073839.1562438-2-stevensd@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813073839.1562438-1-stevensd@google.com>
References: <20210813073839.1562438-1-stevensd@google.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, David Stevens <stevensd@chromium.org>,
 Will Deacon <will@kernel.org>
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

The is_swiotlb_buffer function takes the physical address of the swiotlb
buffer, not the physical address of the original buffer. The sglist
contains the physical addresses of the original buffer, so for the
sync_sg functions to work properly when a bounce buffer might have been
used, we need to use iommu_iova_to_phys to look up the physical address.
This is what sync_single does, so call that function on each sglist
segment.

The previous code mostly worked because swiotlb does the transfer on map
and unmap. However, any callers which use DMA_ATTR_SKIP_CPU_SYNC with
sglists or which call sync_sg would not have had anything copied to the
bounce buffer.

Fixes: 82612d66d51d ("iommu: Allow the dma-iommu api to use bounce buffers")
Signed-off-by: David Stevens <stevensd@chromium.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 98ba927aee1a..968e0150c95e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -810,17 +810,13 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
 	struct scatterlist *sg;
 	int i;
 
-	if (dev_is_dma_coherent(dev) && !dev_is_untrusted(dev))
-		return;
-
-	for_each_sg(sgl, sg, nelems, i) {
-		if (!dev_is_dma_coherent(dev))
+	if (dev_is_untrusted(dev))
+		for_each_sg(sgl, sg, nelems, i)
+			iommu_dma_sync_single_for_cpu(dev, sg_dma_address(sg),
+						      sg->length, dir);
+	else if (!dev_is_dma_coherent(dev))
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
-
-		if (is_swiotlb_buffer(sg_phys(sg)))
-			swiotlb_sync_single_for_cpu(dev, sg_phys(sg),
-						    sg->length, dir);
-	}
 }
 
 static void iommu_dma_sync_sg_for_device(struct device *dev,
@@ -830,17 +826,14 @@ static void iommu_dma_sync_sg_for_device(struct device *dev,
 	struct scatterlist *sg;
 	int i;
 
-	if (dev_is_dma_coherent(dev) && !dev_is_untrusted(dev))
-		return;
-
-	for_each_sg(sgl, sg, nelems, i) {
-		if (is_swiotlb_buffer(sg_phys(sg)))
-			swiotlb_sync_single_for_device(dev, sg_phys(sg),
-						       sg->length, dir);
-
-		if (!dev_is_dma_coherent(dev))
+	if (dev_is_untrusted(dev))
+		for_each_sg(sgl, sg, nelems, i)
+			iommu_dma_sync_single_for_device(dev,
+							 sg_dma_address(sg),
+							 sg->length, dir);
+	else if (!dev_is_dma_coherent(dev))
+		for_each_sg(sgl, sg, nelems, i)
 			arch_sync_dma_for_device(sg_phys(sg), sg->length, dir);
-	}
 }
 
 static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
-- 
2.33.0.rc1.237.g0d66db33f3-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
