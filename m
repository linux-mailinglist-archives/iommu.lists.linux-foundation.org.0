Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DCE31489A
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 07:22:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BADD87241;
	Tue,  9 Feb 2021 06:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1nqJElLxfCj; Tue,  9 Feb 2021 06:22:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A79486F96;
	Tue,  9 Feb 2021 06:22:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41E4FC013A;
	Tue,  9 Feb 2021 06:22:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85BD3C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8190985FE4
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9TIJap1IeHZ for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 06:22:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A910A85FD4
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 06:22:33 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id e9so1049020pjj.0
 for <iommu@lists.linux-foundation.org>; Mon, 08 Feb 2021 22:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfnwvtu6c4qFg17z3zRw+ngra3tQPiKaBNAeGu3kuys=;
 b=DN/xJ9zyoyOl7tww0sHqTDrXTmBoYAaQW/aAjyZF/ZQsZmPalMIFISuv8D920br2VA
 xieDVxUIBy4YAKQYRTVV+UeMH/2q7WluBpEAMNlCbAfhXUEH7XYvH0L98upfR63ITAPt
 zmL+fN06Y3KeFCHEmdSEQ7l08fSY4b6qEVcGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfnwvtu6c4qFg17z3zRw+ngra3tQPiKaBNAeGu3kuys=;
 b=ZUmiZM6p/YPVjLrZOnZmx/m4C7zFNRtqEzx2K1gim7JIxUgFGixNNkIrCVD3Jl8ekT
 pfkYk7oHSE/izbn4gasZxiPhPD1SZ0RSfTFObYbBtVYU1FbOfj2p4gU9v4nH9AG/DwJy
 UrkU+X+vpnXFtqeDRmPcIU7jE7kGLiA3rQCnGAK1Q2WKkdlDgl7UQRAz938okpbB4yJk
 LtIp3fqg2B03Nq/0XYqJysuFJyuRqnhDPW1M30H5kH1x2CJq5RvKVPt8jxC8DUQ+SrqQ
 Fv7ge0bS5FpHlCqUK9wrZ+dJUujkjsv54vc7l4aP8ptXWw+IbVV2mspi5pKkOHrWwbBg
 Y81w==
X-Gm-Message-State: AOAM530nOBNSa2KTugP2DgGCqMS0GZcW71a0T/kNH2KNpb5bF6uVvuBS
 hYzWl3Kl+FyyVxWerYFCZEXoTw==
X-Google-Smtp-Source: ABdhPJzsoA6NwKm+S4KZVPeR4zk76WKbIUMqYXifW3lINXvbVDJBj2JyDT2vUppUwxRx5/36CLZtuw==
X-Received: by 2002:a17:902:b40b:b029:df:cf31:2849 with SMTP id
 x11-20020a170902b40bb02900dfcf312849mr19548774plr.33.1612851753276; 
 Mon, 08 Feb 2021 22:22:33 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:a106:46e1:a999:81df])
 by smtp.gmail.com with UTF8SMTPSA id y3sm15909957pfr.125.2021.02.08.22.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 22:22:32 -0800 (PST)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 07/14] swiotlb: Update swiotlb API to gain a struct device
 argument
Date: Tue,  9 Feb 2021 14:21:24 +0800
Message-Id: <20210209062131.2300005-8-tientzu@chromium.org>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
MIME-Version: 1.0
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>
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

Introduce the get_swiotlb() getter and update all callers of
is_swiotlb_active(), is_swiotlb_buffer() and get_swiotlb_start() to gain
a struct device argument.

Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 drivers/iommu/dma-iommu.c | 12 ++++++------
 drivers/xen/swiotlb-xen.c |  4 ++--
 include/linux/swiotlb.h   | 10 +++++-----
 kernel/dma/direct.c       |  8 ++++----
 kernel/dma/direct.h       |  6 +++---
 kernel/dma/swiotlb.c      | 23 +++++++++++++++++------
 6 files changed, 37 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f659395e7959..abdbe14472cc 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -503,7 +503,7 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
 
 	__iommu_dma_unmap(dev, dma_addr, size);
 
-	if (unlikely(is_swiotlb_buffer(phys)))
+	if (unlikely(is_swiotlb_buffer(dev, phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size,
 				iova_align(iovad, size), dir, attrs);
 }
@@ -580,7 +580,7 @@ static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
 	}
 
 	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
-	if ((iova == DMA_MAPPING_ERROR) && is_swiotlb_buffer(phys))
+	if ((iova == DMA_MAPPING_ERROR) && is_swiotlb_buffer(dev, phys))
 		swiotlb_tbl_unmap_single(dev, phys, org_size,
 				aligned_size, dir, attrs);
 
@@ -753,7 +753,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu(phys, size, dir);
 
-	if (is_swiotlb_buffer(phys))
+	if (is_swiotlb_buffer(dev, phys))
 		swiotlb_tbl_sync_single(dev, phys, size, dir, SYNC_FOR_CPU);
 }
 
@@ -766,7 +766,7 @@ static void iommu_dma_sync_single_for_device(struct device *dev,
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-	if (is_swiotlb_buffer(phys))
+	if (is_swiotlb_buffer(dev, phys))
 		swiotlb_tbl_sync_single(dev, phys, size, dir, SYNC_FOR_DEVICE);
 
 	if (!dev_is_dma_coherent(dev))
@@ -787,7 +787,7 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
 
-		if (is_swiotlb_buffer(sg_phys(sg)))
+		if (is_swiotlb_buffer(dev, sg_phys(sg)))
 			swiotlb_tbl_sync_single(dev, sg_phys(sg), sg->length,
 						dir, SYNC_FOR_CPU);
 	}
@@ -804,7 +804,7 @@ static void iommu_dma_sync_sg_for_device(struct device *dev,
 		return;
 
 	for_each_sg(sgl, sg, nelems, i) {
-		if (is_swiotlb_buffer(sg_phys(sg)))
+		if (is_swiotlb_buffer(dev, sg_phys(sg)))
 			swiotlb_tbl_sync_single(dev, sg_phys(sg), sg->length,
 						dir, SYNC_FOR_DEVICE);
 
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 91f8c68d1a9b..f424d46756b1 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	/*
 	 * IO TLB memory already allocated. Just use it.
 	 */
-	if (is_swiotlb_active()) {
-		xen_io_tlb_start = phys_to_virt(get_swiotlb_start());
+	if (is_swiotlb_active(NULL)) {
+		xen_io_tlb_start = phys_to_virt(get_swiotlb_start(NULL));
 		goto end;
 	}
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 041611bf3c2a..f13a52a97382 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -71,16 +71,16 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
 #ifdef CONFIG_SWIOTLB
 extern enum swiotlb_force swiotlb_force;
 
-bool is_swiotlb_buffer(phys_addr_t paddr);
+bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr);
 void __init swiotlb_exit(void);
 unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
-bool is_swiotlb_active(void);
-phys_addr_t get_swiotlb_start(void);
+bool is_swiotlb_active(struct device *dev);
+phys_addr_t get_swiotlb_start(struct device *dev);
 void __init swiotlb_adjust_size(unsigned long new_size);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
-static inline bool is_swiotlb_buffer(phys_addr_t paddr)
+static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	return false;
 }
@@ -96,7 +96,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
 	return SIZE_MAX;
 }
 
-static inline bool is_swiotlb_active(void)
+static inline bool is_swiotlb_active(struct device *dev)
 {
 	return false;
 }
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 002268262c9a..30ccbc08e229 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -343,7 +343,7 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (unlikely(is_swiotlb_buffer(paddr)))
+		if (unlikely(is_swiotlb_buffer(dev, paddr)))
 			swiotlb_tbl_sync_single(dev, paddr, sg->length,
 					dir, SYNC_FOR_DEVICE);
 
@@ -369,7 +369,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
 
-		if (unlikely(is_swiotlb_buffer(paddr)))
+		if (unlikely(is_swiotlb_buffer(dev, paddr)))
 			swiotlb_tbl_sync_single(dev, paddr, sg->length, dir,
 					SYNC_FOR_CPU);
 
@@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active() &&
+	if (is_swiotlb_active(dev) &&
 	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
 		return swiotlb_max_mapping_size(dev);
 	return SIZE_MAX;
@@ -504,7 +504,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr)
 {
 	return !dev_is_dma_coherent(dev) ||
-		is_swiotlb_buffer(dma_to_phys(dev, dma_addr));
+		is_swiotlb_buffer(dev, dma_to_phys(dev, dma_addr));
 }
 
 /**
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index b98615578737..7b83b1595989 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -56,7 +56,7 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
 
-	if (unlikely(is_swiotlb_buffer(paddr)))
+	if (unlikely(is_swiotlb_buffer(dev, paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
 
 	if (!dev_is_dma_coherent(dev))
@@ -73,7 +73,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		arch_sync_dma_for_cpu_all();
 	}
 
-	if (unlikely(is_swiotlb_buffer(paddr)))
+	if (unlikely(is_swiotlb_buffer(dev, paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
 
 	if (dir == DMA_FROM_DEVICE)
@@ -113,7 +113,7 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
-	if (unlikely(is_swiotlb_buffer(phys)))
+	if (unlikely(is_swiotlb_buffer(dev, phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
 }
 #endif /* _KERNEL_DMA_DIRECT_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 3a17451c5981..e22e7ae75f1c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -107,6 +107,11 @@ struct swiotlb {
 };
 static struct swiotlb default_swiotlb;
 
+static inline struct swiotlb *get_swiotlb(struct device *dev)
+{
+	return &default_swiotlb;
+}
+
 /*
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
@@ -751,23 +756,29 @@ size_t swiotlb_max_mapping_size(struct device *dev)
 	return ((size_t)1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
 }
 
-bool is_swiotlb_active(void)
+bool is_swiotlb_active(struct device *dev)
 {
+	struct swiotlb *swiotlb = get_swiotlb(dev);
+
 	/*
 	 * When SWIOTLB is initialized, even if swiotlb->start points to
 	 * physical address zero, swiotlb->end surely doesn't.
 	 */
-	return default_swiotlb.end != 0;
+	return swiotlb->end != 0;
 }
 
-bool is_swiotlb_buffer(phys_addr_t paddr)
+bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
-	return paddr >= default_swiotlb.start && paddr < default_swiotlb.end;
+	struct swiotlb *swiotlb = get_swiotlb(dev);
+
+	return paddr >= swiotlb->start && paddr < swiotlb->end;
 }
 
-phys_addr_t get_swiotlb_start(void)
+phys_addr_t get_swiotlb_start(struct device *dev)
 {
-	return default_swiotlb.start;
+	struct swiotlb *swiotlb = get_swiotlb(dev);
+
+	return swiotlb->start;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.30.0.478.g8a0d178c01-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
