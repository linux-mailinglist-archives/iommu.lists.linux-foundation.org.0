Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F7814E0
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 11:12:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6A960E5E;
	Mon,  5 Aug 2019 09:12:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A03CE5A
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 09:12:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1BA6782D
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zRn6JVJn4nNeK9wOHHuTKPsPuOuS2mnSYsSa9Gwz7Rk=;
	b=RG4oxykeFe0JQMLxGAJ/8S5At7
	GAA+923n7YeCeXJyTRg/ZL9Qyb+qPDEIyukrr+DcbOQq72koKv2qN+5j1CU6aIokVzQ4sVzvBcaiJ
	++jVLfUSymTseLXFVf6usBQU9aUsW7R0FxhIbLRtCrsmVz8LQgwJ2h4VX31/Ozvyyx21f60h2MbfJ
	CWwUfwJuwZHzEiXGtZ7U22+YZJWxrZr02eb2yC5TmivTYjwDHaczSqQXwDnYMVNCh9482Q9MSjCK8
	Uqnfuucwd7+du9IIxt0oItEHV40lhkfFXb38uyDMXjoCcwQxHlFnUp8mqXfI+3ot63ZjpR2ENbrpS
	Qlh3exXQ==;
Received: from [195.167.85.94] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1huZ2V-00058g-L3; Mon, 05 Aug 2019 09:12:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 7/7] dma-mapping: provide a better default ->get_required_mask
Date: Mon,  5 Aug 2019 12:11:59 +0300
Message-Id: <20190805091159.7826-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805091159.7826-1-hch@lst.de>
References: <20190805091159.7826-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Most dma_map_ops instances are IOMMUs that work perfectly fine in 32-bits
of IOVA space, and the generic direct mapping code already provides its
own routines that is intelligent based on the amount of memory actually
present.  Wire up the dma-direct routine for the ARM direct mapping code
as well, and otherwise default to the constant 32-bit mask.  This way
we only need to override it for the occasional odd IOMMU that requires
64-bit IOVA support, or IOMMU drivers that are more efficient if they
can fall back to the direct mapping.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/mm/dma-mapping.c               |  3 +++
 arch/powerpc/platforms/ps3/system-bus.c |  7 ------
 arch/x86/kernel/amd_gart_64.c           |  1 +
 kernel/dma/mapping.c                    | 30 +++++++++----------------
 4 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 4410af33c5c4..9c9a23e5600d 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -14,6 +14,7 @@
 #include <linux/list.h>
 #include <linux/init.h>
 #include <linux/device.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/dma-contiguous.h>
@@ -192,6 +193,7 @@ const struct dma_map_ops arm_dma_ops = {
 	.sync_sg_for_cpu	= arm_dma_sync_sg_for_cpu,
 	.sync_sg_for_device	= arm_dma_sync_sg_for_device,
 	.dma_supported		= arm_dma_supported,
+	.get_required_mask	= dma_direct_get_required_mask,
 };
 EXPORT_SYMBOL(arm_dma_ops);
 
@@ -212,6 +214,7 @@ const struct dma_map_ops arm_coherent_dma_ops = {
 	.map_sg			= arm_dma_map_sg,
 	.map_resource		= dma_direct_map_resource,
 	.dma_supported		= arm_dma_supported,
+	.get_required_mask	= dma_direct_get_required_mask,
 };
 EXPORT_SYMBOL(arm_coherent_dma_ops);
 
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 70fcc9736a8c..3542b7bd6a46 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -686,18 +686,12 @@ static int ps3_dma_supported(struct device *_dev, u64 mask)
 	return mask >= DMA_BIT_MASK(32);
 }
 
-static u64 ps3_dma_get_required_mask(struct device *_dev)
-{
-	return DMA_BIT_MASK(32);
-}
-
 static const struct dma_map_ops ps3_sb_dma_ops = {
 	.alloc = ps3_alloc_coherent,
 	.free = ps3_free_coherent,
 	.map_sg = ps3_sb_map_sg,
 	.unmap_sg = ps3_sb_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.get_required_mask = ps3_dma_get_required_mask,
 	.map_page = ps3_sb_map_page,
 	.unmap_page = ps3_unmap_page,
 	.mmap = dma_common_mmap,
@@ -710,7 +704,6 @@ static const struct dma_map_ops ps3_ioc0_dma_ops = {
 	.map_sg = ps3_ioc0_map_sg,
 	.unmap_sg = ps3_ioc0_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.get_required_mask = ps3_dma_get_required_mask,
 	.map_page = ps3_ioc0_map_page,
 	.unmap_page = ps3_unmap_page,
 	.mmap = dma_common_mmap,
diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index a65b4a9c7f87..d02662238b57 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -680,6 +680,7 @@ static const struct dma_map_ops gart_dma_ops = {
 	.dma_supported			= dma_direct_supported,
 	.mmap				= dma_common_mmap,
 	.get_sgtable			= dma_common_get_sgtable,
+	.get_required_mask		= dma_direct_get_required_mask,
 };
 
 static void gart_iommu_shutdown(void)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 47765c96fe09..96599f39f67a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -247,25 +247,6 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL(dma_mmap_attrs);
 
-static u64 dma_default_get_required_mask(struct device *dev)
-{
-	u32 low_totalram = ((max_pfn - 1) << PAGE_SHIFT);
-	u32 high_totalram = ((max_pfn - 1) >> (32 - PAGE_SHIFT));
-	u64 mask;
-
-	if (!high_totalram) {
-		/* convert to mask just covering totalram */
-		low_totalram = (1 << (fls(low_totalram) - 1));
-		low_totalram += low_totalram - 1;
-		mask = low_totalram;
-	} else {
-		high_totalram = (1 << (fls(high_totalram) - 1));
-		high_totalram += high_totalram - 1;
-		mask = (((u64)high_totalram) << 32) + 0xffffffff;
-	}
-	return mask;
-}
-
 u64 dma_get_required_mask(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
@@ -274,7 +255,16 @@ u64 dma_get_required_mask(struct device *dev)
 		return dma_direct_get_required_mask(dev);
 	if (ops->get_required_mask)
 		return ops->get_required_mask(dev);
-	return dma_default_get_required_mask(dev);
+
+	/*
+	 * We require every DMA ops implementation to at least support a 32-bit
+	 * DMA mask (and use bounce buffering if that isn't supported in
+	 * hardware).  As the direct mapping code has its own routine to
+	 * actually report an optimal mask we default to 32-bit here as that
+	 * is the right thing for most IOMMUs, and at least not actively
+	 * harmful in general.
+	 */
+	return DMA_BIT_MASK(32);
 }
 EXPORT_SYMBOL_GPL(dma_get_required_mask);
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
