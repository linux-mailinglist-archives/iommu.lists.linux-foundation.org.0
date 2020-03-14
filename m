Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EF185313
	for <lists.iommu@lfdr.de>; Sat, 14 Mar 2020 01:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B687987A5F;
	Sat, 14 Mar 2020 00:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh6yA4FpxJUY; Sat, 14 Mar 2020 00:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D97487A62;
	Sat, 14 Mar 2020 00:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12D1BC0177;
	Sat, 14 Mar 2020 00:00:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A777DC0177
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 00:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 93572241C8
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 00:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9Q5EQqjADqV for <iommu@lists.linux-foundation.org>;
 Sat, 14 Mar 2020 00:00:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id BFBD0203C9
 for <iommu@lists.linux-foundation.org>; Sat, 14 Mar 2020 00:00:08 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id mj6so4838689pjb.5
 for <iommu@lists.linux-foundation.org>; Fri, 13 Mar 2020 17:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F1pA8I6qcaZlWcjwnRAs8TnrPPPQ0hCgFlpwmxQ+nAg=;
 b=DP89160wPxqR7NlCIDr3dcbuICiikU1SQ2Ihh9o7IH0D4jfoUJvpXD8Ur+TmEjBbp8
 57Y7LqM4tKCZTHpZUJ0Bt7C3NxH91QQISz4F74OF+Olo0yYV5xdrq8rh1zbrRb48cK2N
 sJiEkX4p4MHNFo33p05/nP2lDPqeSJ6r052KmbXs7vN5m8JbXUKi/6waPiM2wVZrH63c
 x1xwKUoWmy4HqRfCDhP/7qqpjFjObCnNyD5/Sy2xrKo7BZhRW4g2WzzKxqsGikIPU/jr
 sqO+mA16DoAOSpanmC+rtZjVLsqydrjSkzidDJ2VC1ICDxrDoy6xznXmeG9uUIPpwc08
 WYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F1pA8I6qcaZlWcjwnRAs8TnrPPPQ0hCgFlpwmxQ+nAg=;
 b=lznKX+1xJyn5vakqsK2yZ8He1b0dPmpe2KG63KfcM5AKIoRDNEG/KNAgItSpz63Pvg
 m1LNOC14q0QS/qEvH+Rp58IHU/lZhHA04DYEvqPS+lICE9SYlKjvHDG38yeELllV9Q+m
 GrVS2gO807Q6WLqO5HF8G1nYrHsvNFidMej3TzB8UMWRyzW7V/L2FDQZgCA78EbZiMVl
 +oDvCkgwXEfMqlKACid8aW7On4wQgpWBKggO5nenKmFRjt+j8PqR6unkmajmPLbZ4h2y
 Ll+yq6L+7UymXwnTEhGMy6RI8nukSd0HKtzQDp0u4wsPfIoIGSl+TELJN5esvb7m7i7m
 vw5Q==
X-Gm-Message-State: ANhLgQ0J4/1znexdpo3l3s2Ef2+3ETaXr98dQZSAXTgtiRcg9gtf5Vox
 lEF4DUrIRDRzPm/T4J4a7xI=
X-Google-Smtp-Source: ADFU+vs9FQC3C1QjAMHIEA/p8eRKRIlA9KNGtJyFYQfe8Mw8yp5WDzG7vbzV9YmfU6KzBAypnnkoBg==
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr15216856pln.185.1584144008118; 
 Fri, 13 Mar 2020 17:00:08 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e187sm7011450pfe.50.2020.03.13.17.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 17:00:07 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: robin.murphy@arm.com,
	m.szyprowski@samsung.com,
	hch@lst.de
Subject: [RFC][PATCH] dma-mapping: align default segment_boundary_mask with
 dma_mask
Date: Fri, 13 Mar 2020 17:00:07 -0700
Message-Id: <20200314000007.13778-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

More and more drivers set dma_masks above DMA_BIT_MAKS(32) while
only a handful of drivers call dma_set_seg_boundary(). This means
that most drivers have a 4GB segmention boundary because DMA API
returns DMA_BIT_MAKS(32) as a default value, though they might be
able to handle things above 32-bit.

This might result in a situation that iommu_map_sg() cuts an IOVA
region, larger than 4GB, into discontiguous pieces and creates a
faulty IOVA mapping that overlaps some physical memory being out
of the scatter list, which might lead to some random kernel panic
after DMA overwrites that faulty IOVA space.

We have CONFIG_DMA_API_DEBUG_SG in kernel/dma/debug.c that checks
such situations to prevent bad things from happening. However, it
is not a mandatory check. And one might not think of enabling it
when debugging a random kernel panic until figuring out that it's
related to iommu_map_sg().

A safer solution may be to align the default segmention boundary
with the configured dma_mask, so DMA API may create a contiguous
IOVA space as a device "expect" -- what tries to make sense is:
Though it's device driver's responsibility to set dma_parms, it
is not fair or even safe to apply a 4GB boundary here, which was
added a decade ago to work for up-to-4GB mappings at that time.

This patch updates the default segment_boundary_mask by aligning
it with dma_mask.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 include/linux/dma-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58fbf4d..0df0ee92eba1 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -736,7 +736,7 @@ static inline unsigned long dma_get_seg_boundary(struct device *dev)
 {
 	if (dev->dma_parms && dev->dma_parms->segment_boundary_mask)
 		return dev->dma_parms->segment_boundary_mask;
-	return DMA_BIT_MASK(32);
+	return (unsigned long)dma_get_mask(dev);
 }
 
 static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
