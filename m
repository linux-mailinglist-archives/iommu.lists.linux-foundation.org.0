Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D550996A
	for <lists.iommu@lfdr.de>; Thu, 21 Apr 2022 09:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B2984169;
	Thu, 21 Apr 2022 07:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaMkeM6SgyhU; Thu, 21 Apr 2022 07:42:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E306983E44;
	Thu, 21 Apr 2022 07:42:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B53D0C002C;
	Thu, 21 Apr 2022 07:42:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C669C002C
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 07:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A8DB83E44
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 07:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FseVjtU2wZTq for <iommu@lists.linux-foundation.org>;
 Thu, 21 Apr 2022 07:42:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 898218329D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Apr 2022 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3XWsLw7XbLsKzrc6VLS82YeuT6PlbB9RZPU5NoVdG9g=; b=L977qmM/5aJMfR4uFhTJH6gRJz
 7c76DaD6gfcnOv6m4T6gIwQYt/1+iY9CeYHIvFWbR2191Liee2wpDFFtXKK8pbO7vX5bZWHrc6Z8y
 zlI81nDmighw2kJgGhsWYb0gqcALgLulKjGVaeATIbnaQLA28ns/dU4m6ensXUOxHIr27Hr/1j0TZ
 N8NazqPelcjQGIRVdtG3Dr2sojBzApwHd0EUJ4M/wNf3nKDckbBkK/0Ot5xOu2VocDP/OpIwtnoGc
 wgK3yNXdVqsYwrTPppZRIVG2xzPe4PA/bySIu0vivL3716U0IrclzTZYOlKDsuojIKRmgbxNJvVwH
 BQt+FWmg==;
Received: from [2001:4bb8:191:364b:7b50:153f:5622:82f7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRS8-00C7TU-0m; Thu, 21 Apr 2022 07:42:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 2/7] ARM: remove dmabounce
Date: Thu, 21 Apr 2022 09:41:59 +0200
Message-Id: <20220421074204.1284072-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421074204.1284072-1-hch@lst.de>
References: <20220421074204.1284072-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Andrew Lunn <andrew@lunn.ch>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

Remove the now unused dmabounce code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/common/Kconfig            |   4 -
 arch/arm/common/Makefile           |   1 -
 arch/arm/common/dmabounce.c        | 582 -----------------------------
 arch/arm/include/asm/device.h      |   3 -
 arch/arm/include/asm/dma-mapping.h |  29 --
 5 files changed, 619 deletions(-)
 delete mode 100644 arch/arm/common/dmabounce.c

diff --git a/arch/arm/common/Kconfig b/arch/arm/common/Kconfig
index bc158fd227e12..d2fdb1796f488 100644
--- a/arch/arm/common/Kconfig
+++ b/arch/arm/common/Kconfig
@@ -3,10 +3,6 @@ config SA1111
 	bool
 	select ZONE_DMA if ARCH_SA1100
 
-config DMABOUNCE
-	bool
-	select ZONE_DMA
-
 config KRAIT_L2_ACCESSORS
 	bool
 
diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
index 8cd574be94cfe..7bae8cbaafe78 100644
--- a/arch/arm/common/Makefile
+++ b/arch/arm/common/Makefile
@@ -6,7 +6,6 @@
 obj-y				+= firmware.o
 
 obj-$(CONFIG_SA1111)		+= sa1111.o
-obj-$(CONFIG_DMABOUNCE)		+= dmabounce.o
 obj-$(CONFIG_KRAIT_L2_ACCESSORS) += krait-l2-accessors.o
 obj-$(CONFIG_SHARP_LOCOMO)	+= locomo.o
 obj-$(CONFIG_SHARP_PARAM)	+= sharpsl_param.o
diff --git a/arch/arm/common/dmabounce.c b/arch/arm/common/dmabounce.c
deleted file mode 100644
index 7996c04393d50..0000000000000
--- a/arch/arm/common/dmabounce.c
+++ /dev/null
@@ -1,582 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  arch/arm/common/dmabounce.c
- *
- *  Special dma_{map/unmap/dma_sync}_* routines for systems that have
- *  limited DMA windows. These functions utilize bounce buffers to
- *  copy data to/from buffers located outside the DMA region. This
- *  only works for systems in which DMA memory is at the bottom of
- *  RAM, the remainder of memory is at the top and the DMA memory
- *  can be marked as ZONE_DMA. Anything beyond that such as discontiguous
- *  DMA windows will require custom implementations that reserve memory
- *  areas at early bootup.
- *
- *  Original version by Brad Parker (brad@heeltoe.com)
- *  Re-written by Christopher Hoover <ch@murgatroid.com>
- *  Made generic by Deepak Saxena <dsaxena@plexity.net>
- *
- *  Copyright (C) 2002 Hewlett Packard Company.
- *  Copyright (C) 2004 MontaVista Software, Inc.
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/page-flags.h>
-#include <linux/device.h>
-#include <linux/dma-direct.h>
-#include <linux/dma-map-ops.h>
-#include <linux/dmapool.h>
-#include <linux/list.h>
-#include <linux/scatterlist.h>
-
-#include <asm/cacheflush.h>
-#include <asm/dma-iommu.h>
-
-#undef STATS
-
-#ifdef STATS
-#define DO_STATS(X) do { X ; } while (0)
-#else
-#define DO_STATS(X) do { } while (0)
-#endif
-
-/* ************************************************** */
-
-struct safe_buffer {
-	struct list_head node;
-
-	/* original request */
-	void		*ptr;
-	size_t		size;
-	int		direction;
-
-	/* safe buffer info */
-	struct dmabounce_pool *pool;
-	void		*safe;
-	dma_addr_t	safe_dma_addr;
-};
-
-struct dmabounce_pool {
-	unsigned long	size;
-	struct dma_pool	*pool;
-#ifdef STATS
-	unsigned long	allocs;
-#endif
-};
-
-struct dmabounce_device_info {
-	struct device *dev;
-	struct list_head safe_buffers;
-#ifdef STATS
-	unsigned long total_allocs;
-	unsigned long map_op_count;
-	unsigned long bounce_count;
-	int attr_res;
-#endif
-	struct dmabounce_pool	small;
-	struct dmabounce_pool	large;
-
-	rwlock_t lock;
-
-	int (*needs_bounce)(struct device *, dma_addr_t, size_t);
-};
-
-#ifdef STATS
-static ssize_t dmabounce_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct dmabounce_device_info *device_info = dev->archdata.dmabounce;
-	return sprintf(buf, "%lu %lu %lu %lu %lu %lu\n",
-		device_info->small.allocs,
-		device_info->large.allocs,
-		device_info->total_allocs - device_info->small.allocs -
-			device_info->large.allocs,
-		device_info->total_allocs,
-		device_info->map_op_count,
-		device_info->bounce_count);
-}
-
-static DEVICE_ATTR(dmabounce_stats, 0400, dmabounce_show, NULL);
-#endif
-
-
-/* allocate a 'safe' buffer and keep track of it */
-static inline struct safe_buffer *
-alloc_safe_buffer(struct dmabounce_device_info *device_info, void *ptr,
-		  size_t size, enum dma_data_direction dir)
-{
-	struct safe_buffer *buf;
-	struct dmabounce_pool *pool;
-	struct device *dev = device_info->dev;
-	unsigned long flags;
-
-	dev_dbg(dev, "%s(ptr=%p, size=%d, dir=%d)\n",
-		__func__, ptr, size, dir);
-
-	if (size <= device_info->small.size) {
-		pool = &device_info->small;
-	} else if (size <= device_info->large.size) {
-		pool = &device_info->large;
-	} else {
-		pool = NULL;
-	}
-
-	buf = kmalloc(sizeof(struct safe_buffer), GFP_ATOMIC);
-	if (buf == NULL) {
-		dev_warn(dev, "%s: kmalloc failed\n", __func__);
-		return NULL;
-	}
-
-	buf->ptr = ptr;
-	buf->size = size;
-	buf->direction = dir;
-	buf->pool = pool;
-
-	if (pool) {
-		buf->safe = dma_pool_alloc(pool->pool, GFP_ATOMIC,
-					   &buf->safe_dma_addr);
-	} else {
-		buf->safe = dma_alloc_coherent(dev, size, &buf->safe_dma_addr,
-					       GFP_ATOMIC);
-	}
-
-	if (buf->safe == NULL) {
-		dev_warn(dev,
-			 "%s: could not alloc dma memory (size=%d)\n",
-			 __func__, size);
-		kfree(buf);
-		return NULL;
-	}
-
-#ifdef STATS
-	if (pool)
-		pool->allocs++;
-	device_info->total_allocs++;
-#endif
-
-	write_lock_irqsave(&device_info->lock, flags);
-	list_add(&buf->node, &device_info->safe_buffers);
-	write_unlock_irqrestore(&device_info->lock, flags);
-
-	return buf;
-}
-
-/* determine if a buffer is from our "safe" pool */
-static inline struct safe_buffer *
-find_safe_buffer(struct dmabounce_device_info *device_info, dma_addr_t safe_dma_addr)
-{
-	struct safe_buffer *b, *rb = NULL;
-	unsigned long flags;
-
-	read_lock_irqsave(&device_info->lock, flags);
-
-	list_for_each_entry(b, &device_info->safe_buffers, node)
-		if (b->safe_dma_addr <= safe_dma_addr &&
-		    b->safe_dma_addr + b->size > safe_dma_addr) {
-			rb = b;
-			break;
-		}
-
-	read_unlock_irqrestore(&device_info->lock, flags);
-	return rb;
-}
-
-static inline void
-free_safe_buffer(struct dmabounce_device_info *device_info, struct safe_buffer *buf)
-{
-	unsigned long flags;
-
-	dev_dbg(device_info->dev, "%s(buf=%p)\n", __func__, buf);
-
-	write_lock_irqsave(&device_info->lock, flags);
-
-	list_del(&buf->node);
-
-	write_unlock_irqrestore(&device_info->lock, flags);
-
-	if (buf->pool)
-		dma_pool_free(buf->pool->pool, buf->safe, buf->safe_dma_addr);
-	else
-		dma_free_coherent(device_info->dev, buf->size, buf->safe,
-				    buf->safe_dma_addr);
-
-	kfree(buf);
-}
-
-/* ************************************************** */
-
-static struct safe_buffer *find_safe_buffer_dev(struct device *dev,
-		dma_addr_t dma_addr, const char *where)
-{
-	if (!dev || !dev->archdata.dmabounce)
-		return NULL;
-	if (dma_mapping_error(dev, dma_addr)) {
-		dev_err(dev, "Trying to %s invalid mapping\n", where);
-		return NULL;
-	}
-	return find_safe_buffer(dev->archdata.dmabounce, dma_addr);
-}
-
-static int needs_bounce(struct device *dev, dma_addr_t dma_addr, size_t size)
-{
-	if (!dev || !dev->archdata.dmabounce)
-		return 0;
-
-	if (dev->dma_mask) {
-		unsigned long limit, mask = *dev->dma_mask;
-
-		limit = (mask + 1) & ~mask;
-		if (limit && size > limit) {
-			dev_err(dev, "DMA mapping too big (requested %#x "
-				"mask %#Lx)\n", size, *dev->dma_mask);
-			return -E2BIG;
-		}
-
-		/* Figure out if we need to bounce from the DMA mask. */
-		if ((dma_addr | (dma_addr + size - 1)) & ~mask)
-			return 1;
-	}
-
-	return !!dev->archdata.dmabounce->needs_bounce(dev, dma_addr, size);
-}
-
-static inline dma_addr_t map_single(struct device *dev, void *ptr, size_t size,
-				    enum dma_data_direction dir,
-				    unsigned long attrs)
-{
-	struct dmabounce_device_info *device_info = dev->archdata.dmabounce;
-	struct safe_buffer *buf;
-
-	if (device_info)
-		DO_STATS ( device_info->map_op_count++ );
-
-	buf = alloc_safe_buffer(device_info, ptr, size, dir);
-	if (buf == NULL) {
-		dev_err(dev, "%s: unable to map unsafe buffer %p!\n",
-		       __func__, ptr);
-		return DMA_MAPPING_ERROR;
-	}
-
-	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr),
-		buf->safe, buf->safe_dma_addr);
-
-	if ((dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL) &&
-	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		dev_dbg(dev, "%s: copy unsafe %p to safe %p, size %d\n",
-			__func__, ptr, buf->safe, size);
-		memcpy(buf->safe, ptr, size);
-	}
-
-	return buf->safe_dma_addr;
-}
-
-static inline void unmap_single(struct device *dev, struct safe_buffer *buf,
-				size_t size, enum dma_data_direction dir,
-				unsigned long attrs)
-{
-	BUG_ON(buf->size != size);
-	BUG_ON(buf->direction != dir);
-
-	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr),
-		buf->safe, buf->safe_dma_addr);
-
-	DO_STATS(dev->archdata.dmabounce->bounce_count++);
-
-	if ((dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL) &&
-	    !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		void *ptr = buf->ptr;
-
-		dev_dbg(dev, "%s: copy back safe %p to unsafe %p size %d\n",
-			__func__, buf->safe, ptr, size);
-		memcpy(ptr, buf->safe, size);
-
-		/*
-		 * Since we may have written to a page cache page,
-		 * we need to ensure that the data will be coherent
-		 * with user mappings.
-		 */
-		__cpuc_flush_dcache_area(ptr, size);
-	}
-	free_safe_buffer(dev->archdata.dmabounce, buf);
-}
-
-/* ************************************************** */
-
-/*
- * see if a buffer address is in an 'unsafe' range.  if it is
- * allocate a 'safe' buffer and copy the unsafe buffer into it.
- * substitute the safe buffer for the unsafe one.
- * (basically move the buffer from an unsafe area to a safe one)
- */
-static dma_addr_t dmabounce_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	dma_addr_t dma_addr;
-	int ret;
-
-	dev_dbg(dev, "%s(page=%p,off=%#lx,size=%zx,dir=%x)\n",
-		__func__, page, offset, size, dir);
-
-	dma_addr = pfn_to_dma(dev, page_to_pfn(page)) + offset;
-
-	ret = needs_bounce(dev, dma_addr, size);
-	if (ret < 0)
-		return DMA_MAPPING_ERROR;
-
-	if (ret == 0) {
-		arm_dma_ops.sync_single_for_device(dev, dma_addr, size, dir);
-		return dma_addr;
-	}
-
-	if (PageHighMem(page)) {
-		dev_err(dev, "DMA buffer bouncing of HIGHMEM pages is not supported\n");
-		return DMA_MAPPING_ERROR;
-	}
-
-	return map_single(dev, page_address(page) + offset, size, dir, attrs);
-}
-
-/*
- * see if a mapped address was really a "safe" buffer and if so, copy
- * the data from the safe buffer back to the unsafe buffer and free up
- * the safe buffer.  (basically return things back to the way they
- * should be)
- */
-static void dmabounce_unmap_page(struct device *dev, dma_addr_t dma_addr, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct safe_buffer *buf;
-
-	dev_dbg(dev, "%s(dma=%#x,size=%d,dir=%x)\n",
-		__func__, dma_addr, size, dir);
-
-	buf = find_safe_buffer_dev(dev, dma_addr, __func__);
-	if (!buf) {
-		arm_dma_ops.sync_single_for_cpu(dev, dma_addr, size, dir);
-		return;
-	}
-
-	unmap_single(dev, buf, size, dir, attrs);
-}
-
-static int __dmabounce_sync_for_cpu(struct device *dev, dma_addr_t addr,
-		size_t sz, enum dma_data_direction dir)
-{
-	struct safe_buffer *buf;
-	unsigned long off;
-
-	dev_dbg(dev, "%s(dma=%#x,sz=%zx,dir=%x)\n",
-		__func__, addr, sz, dir);
-
-	buf = find_safe_buffer_dev(dev, addr, __func__);
-	if (!buf)
-		return 1;
-
-	off = addr - buf->safe_dma_addr;
-
-	BUG_ON(buf->direction != dir);
-
-	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x off=%#lx) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr), off,
-		buf->safe, buf->safe_dma_addr);
-
-	DO_STATS(dev->archdata.dmabounce->bounce_count++);
-
-	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL) {
-		dev_dbg(dev, "%s: copy back safe %p to unsafe %p size %d\n",
-			__func__, buf->safe + off, buf->ptr + off, sz);
-		memcpy(buf->ptr + off, buf->safe + off, sz);
-	}
-	return 0;
-}
-
-static void dmabounce_sync_for_cpu(struct device *dev,
-		dma_addr_t handle, size_t size, enum dma_data_direction dir)
-{
-	if (!__dmabounce_sync_for_cpu(dev, handle, size, dir))
-		return;
-
-	arm_dma_ops.sync_single_for_cpu(dev, handle, size, dir);
-}
-
-static int __dmabounce_sync_for_device(struct device *dev, dma_addr_t addr,
-		size_t sz, enum dma_data_direction dir)
-{
-	struct safe_buffer *buf;
-	unsigned long off;
-
-	dev_dbg(dev, "%s(dma=%#x,sz=%zx,dir=%x)\n",
-		__func__, addr, sz, dir);
-
-	buf = find_safe_buffer_dev(dev, addr, __func__);
-	if (!buf)
-		return 1;
-
-	off = addr - buf->safe_dma_addr;
-
-	BUG_ON(buf->direction != dir);
-
-	dev_dbg(dev, "%s: unsafe buffer %p (dma=%#x off=%#lx) mapped to %p (dma=%#x)\n",
-		__func__, buf->ptr, virt_to_dma(dev, buf->ptr), off,
-		buf->safe, buf->safe_dma_addr);
-
-	DO_STATS(dev->archdata.dmabounce->bounce_count++);
-
-	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL) {
-		dev_dbg(dev, "%s: copy out unsafe %p to safe %p, size %d\n",
-			__func__,buf->ptr + off, buf->safe + off, sz);
-		memcpy(buf->safe + off, buf->ptr + off, sz);
-	}
-	return 0;
-}
-
-static void dmabounce_sync_for_device(struct device *dev,
-		dma_addr_t handle, size_t size, enum dma_data_direction dir)
-{
-	if (!__dmabounce_sync_for_device(dev, handle, size, dir))
-		return;
-
-	arm_dma_ops.sync_single_for_device(dev, handle, size, dir);
-}
-
-static int dmabounce_dma_supported(struct device *dev, u64 dma_mask)
-{
-	if (dev->archdata.dmabounce)
-		return 0;
-
-	return arm_dma_ops.dma_supported(dev, dma_mask);
-}
-
-static const struct dma_map_ops dmabounce_ops = {
-	.alloc			= arm_dma_alloc,
-	.free			= arm_dma_free,
-	.mmap			= arm_dma_mmap,
-	.get_sgtable		= arm_dma_get_sgtable,
-	.map_page		= dmabounce_map_page,
-	.unmap_page		= dmabounce_unmap_page,
-	.sync_single_for_cpu	= dmabounce_sync_for_cpu,
-	.sync_single_for_device	= dmabounce_sync_for_device,
-	.map_sg			= arm_dma_map_sg,
-	.unmap_sg		= arm_dma_unmap_sg,
-	.sync_sg_for_cpu	= arm_dma_sync_sg_for_cpu,
-	.sync_sg_for_device	= arm_dma_sync_sg_for_device,
-	.dma_supported		= dmabounce_dma_supported,
-};
-
-static int dmabounce_init_pool(struct dmabounce_pool *pool, struct device *dev,
-		const char *name, unsigned long size)
-{
-	pool->size = size;
-	DO_STATS(pool->allocs = 0);
-	pool->pool = dma_pool_create(name, dev, size,
-				     0 /* byte alignment */,
-				     0 /* no page-crossing issues */);
-
-	return pool->pool ? 0 : -ENOMEM;
-}
-
-int dmabounce_register_dev(struct device *dev, unsigned long small_buffer_size,
-		unsigned long large_buffer_size,
-		int (*needs_bounce_fn)(struct device *, dma_addr_t, size_t))
-{
-	struct dmabounce_device_info *device_info;
-	int ret;
-
-	device_info = kmalloc(sizeof(struct dmabounce_device_info), GFP_ATOMIC);
-	if (!device_info) {
-		dev_err(dev,
-			"Could not allocated dmabounce_device_info\n");
-		return -ENOMEM;
-	}
-
-	ret = dmabounce_init_pool(&device_info->small, dev,
-				  "small_dmabounce_pool", small_buffer_size);
-	if (ret) {
-		dev_err(dev,
-			"dmabounce: could not allocate DMA pool for %ld byte objects\n",
-			small_buffer_size);
-		goto err_free;
-	}
-
-	if (large_buffer_size) {
-		ret = dmabounce_init_pool(&device_info->large, dev,
-					  "large_dmabounce_pool",
-					  large_buffer_size);
-		if (ret) {
-			dev_err(dev,
-				"dmabounce: could not allocate DMA pool for %ld byte objects\n",
-				large_buffer_size);
-			goto err_destroy;
-		}
-	}
-
-	device_info->dev = dev;
-	INIT_LIST_HEAD(&device_info->safe_buffers);
-	rwlock_init(&device_info->lock);
-	device_info->needs_bounce = needs_bounce_fn;
-
-#ifdef STATS
-	device_info->total_allocs = 0;
-	device_info->map_op_count = 0;
-	device_info->bounce_count = 0;
-	device_info->attr_res = device_create_file(dev, &dev_attr_dmabounce_stats);
-#endif
-
-	dev->archdata.dmabounce = device_info;
-	set_dma_ops(dev, &dmabounce_ops);
-
-	dev_info(dev, "dmabounce: registered device\n");
-
-	return 0;
-
- err_destroy:
-	dma_pool_destroy(device_info->small.pool);
- err_free:
-	kfree(device_info);
-	return ret;
-}
-EXPORT_SYMBOL(dmabounce_register_dev);
-
-void dmabounce_unregister_dev(struct device *dev)
-{
-	struct dmabounce_device_info *device_info = dev->archdata.dmabounce;
-
-	dev->archdata.dmabounce = NULL;
-	set_dma_ops(dev, NULL);
-
-	if (!device_info) {
-		dev_warn(dev,
-			 "Never registered with dmabounce but attempting"
-			 "to unregister!\n");
-		return;
-	}
-
-	if (!list_empty(&device_info->safe_buffers)) {
-		dev_err(dev,
-			"Removing from dmabounce with pending buffers!\n");
-		BUG();
-	}
-
-	if (device_info->small.pool)
-		dma_pool_destroy(device_info->small.pool);
-	if (device_info->large.pool)
-		dma_pool_destroy(device_info->large.pool);
-
-#ifdef STATS
-	if (device_info->attr_res == 0)
-		device_remove_file(dev, &dev_attr_dmabounce_stats);
-#endif
-
-	kfree(device_info);
-
-	dev_info(dev, "dmabounce: device unregistered\n");
-}
-EXPORT_SYMBOL(dmabounce_unregister_dev);
-
-MODULE_AUTHOR("Christopher Hoover <ch@hpl.hp.com>, Deepak Saxena <dsaxena@plexity.net>");
-MODULE_DESCRIPTION("Special dma_{map/unmap/dma_sync}_* routines for systems with limited DMA windows");
-MODULE_LICENSE("GPL");
diff --git a/arch/arm/include/asm/device.h b/arch/arm/include/asm/device.h
index be666f58bf7ae..8754c0f5fc904 100644
--- a/arch/arm/include/asm/device.h
+++ b/arch/arm/include/asm/device.h
@@ -6,9 +6,6 @@
 #define ASMARM_DEVICE_H
 
 struct dev_archdata {
-#ifdef CONFIG_DMABOUNCE
-	struct dmabounce_device_info *dmabounce;
-#endif
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
 	struct dma_iommu_mapping	*mapping;
 #endif
diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-mapping.h
index 77082246a5e12..1e015a7ad86aa 100644
--- a/arch/arm/include/asm/dma-mapping.h
+++ b/arch/arm/include/asm/dma-mapping.h
@@ -80,35 +80,6 @@ extern int arm_dma_mmap(struct device *dev, struct vm_area_struct *vma,
  *
  */
 
-/**
- * dmabounce_register_dev
- *
- * @dev: valid struct device pointer
- * @small_buf_size: size of buffers to use with small buffer pool
- * @large_buf_size: size of buffers to use with large buffer pool (can be 0)
- * @needs_bounce_fn: called to determine whether buffer needs bouncing
- *
- * This function should be called by low-level platform code to register
- * a device as requireing DMA buffer bouncing. The function will allocate
- * appropriate DMA pools for the device.
- */
-extern int dmabounce_register_dev(struct device *, unsigned long,
-		unsigned long, int (*)(struct device *, dma_addr_t, size_t));
-
-/**
- * dmabounce_unregister_dev
- *
- * @dev: valid struct device pointer
- *
- * This function should be called by low-level platform code when device
- * that was previously registered with dmabounce_register_dev is removed
- * from the system.
- *
- */
-extern void dmabounce_unregister_dev(struct device *);
-
-
-
 /*
  * The scatter list versions of the above methods.
  */
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
