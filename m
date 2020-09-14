Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3F268EEE
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 17:04:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DF4F85A88;
	Mon, 14 Sep 2020 15:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9S5_b7r9BceT; Mon, 14 Sep 2020 15:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 68AAF860C2;
	Mon, 14 Sep 2020 15:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53FA4C0859;
	Mon, 14 Sep 2020 15:04:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0202BC0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DA5AE87225
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LqApKiGlujV for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 15:04:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F12CB87223
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=I03vZyMCQXixsKgB+vAi29QqwSDPgVkGV9+ViaS1CMg=; b=s2+O7HbRaaMGrNRetpOniwlx5p
 4zrt8B58bME1ofMoXH7Bu9HYSWDUmdmcRgtceEr3NgHfL3XugiyB2tqRvEfFRwg27Lt0NYX9qh7P/
 0FfTh+Xxrd4rzkb7xmi89hmk+KzUg4UvLAGmV2YAv6yTLygrJ/K8XL3YOzs+bEp3rmhADdd2weYNo
 HHdR9RQfuZrvLOwnfbM7kdAvrnB+v5trSodoIhNTg6ZIEdjTqirpBGnMwcJur9gkuPCb0BBGS0TQP
 WKw6O4lbPPpAxWpm0XDzc3CqrgG22CYBXJwRxiHYzL48GpVzTVwp/++JkQ2X5YyOCSA58sk9iA7eh
 UEvO26Tg==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHq1i-0002aX-Sy; Mon, 14 Sep 2020 15:04:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 08/17] dma-mapping: add a new dma_alloc_noncoherent API
Date: Mon, 14 Sep 2020 16:44:24 +0200
Message-Id: <20200914144433.1622958-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Add a new API to allocate and free memory that is guaranteed to be
addressable by a device, but which potentially is not cache coherent
for DMA.

To transfer ownership to and from the device, the existing streaming
DMA API calls dma_sync_single_for_device and dma_sync_single_for_cpu
must be used.

For now the new calls are implemented on top of dma_alloc_attrs just
like the old-noncoherent API, but once all drivers are switched to
the new API it will be replaced with a better working implementation
that is available on all architectures.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/core-api/dma-api.rst | 75 ++++++++++++++----------------
 include/linux/dma-mapping.h        | 12 +++++
 2 files changed, 48 insertions(+), 39 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 90239348b30f6f..ea0413276ddb70 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -516,48 +516,56 @@ routines, e.g.:::
 	}
 
 
-Part II - Advanced dma usage
-----------------------------
+Part II - Non-coherent DMA allocations
+--------------------------------------
 
-Warning: These pieces of the DMA API should not be used in the
-majority of cases, since they cater for unlikely corner cases that
-don't belong in usual drivers.
+These APIs allow to allocate pages in the kernel direct mapping that are
+guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
+virt_to_page can be called on the resulting address, and the resulting
+struct page can be used for everything a struct page is suitable for.
 
-If you don't understand how cache line coherency works between a
-processor and an I/O device, you should not be using this part of the
-API at all.
+If you don't understand how cache line coherency works between a processor and
+an I/O device, you should not be using this part of the API.
 
 ::
 
 	void *
-	dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
-			gfp_t flag, unsigned long attrs)
+	dma_alloc_noncoherent(struct device *dev, size_t size,
+			dma_addr_t *dma_handle, enum dma_data_direction dir,
+			gfp_t gfp)
 
-Identical to dma_alloc_coherent() except that when the
-DMA_ATTR_NON_CONSISTENT flags is passed in the attrs argument, the
-platform will choose to return either consistent or non-consistent memory
-as it sees fit.  By using this API, you are guaranteeing to the platform
-that you have all the correct and necessary sync points for this memory
-in the driver should it choose to return non-consistent memory.
+This routine allocates a region of <size> bytes of consistent memory.  It
+returns a pointer to the allocated region (in the processor's virtual address
+space) or NULL if the allocation failed.  The returned memory may or may not
+be in the kernels direct mapping.  Drivers must not call virt_to_page on
+the returned memory region.
 
-Note: where the platform can return consistent memory, it will
-guarantee that the sync points become nops.
+It also returns a <dma_handle> which may be cast to an unsigned integer the
+same width as the bus and given to the device as the DMA address base of
+the region.
 
-Warning:  Handling non-consistent memory is a real pain.  You should
-only use this API if you positively know your driver will be
-required to work on one of the rare (usually non-PCI) architectures
-that simply cannot make consistent memory.
+The dir parameter specified if data is read and/or written by the device,
+see dma_map_single() for details.
+
+The gfp parameter allows the caller to specify the ``GFP_`` flags (see
+kmalloc()) for the allocation, but rejects flags used to specify a memory
+zone such as GFP_DMA or GFP_HIGHMEM.
+
+Before giving the memory to the device, dma_sync_single_for_device() needs
+to be called, and before reading memory written by the device,
+dma_sync_single_for_cpu(), just like for streaming DMA mappings that are
+reused.
 
 ::
 
 	void
-	dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
-		       dma_addr_t dma_handle, unsigned long attrs)
+	dma_free_noncoherent(struct device *dev, size_t size, void *cpu_addr,
+			dma_addr_t dma_handle, enum dma_data_direction dir)
 
-Free memory allocated by the dma_alloc_attrs().  All common
-parameters must be identical to those otherwise passed to dma_free_coherent,
-and the attrs argument must be identical to the attrs passed to
-dma_alloc_attrs().
+Free a region of memory previously allocated using dma_alloc_noncoherent().
+dev, size and dma_handle and dir must all be the same as those passed into
+dma_alloc_noncoherent().  cpu_addr must be the virtual address returned by
+the dma_alloc_noncoherent().
 
 ::
 
@@ -575,17 +583,6 @@ memory or doing partial flushes.
 	into the width returned by this call.  It will also always be a power
 	of two for easy alignment.
 
-::
-
-	void
-	dma_cache_sync(struct device *dev, void *vaddr, size_t size,
-		       enum dma_data_direction direction)
-
-Do a partial sync of memory that was allocated by dma_alloc_attrs() with
-the DMA_ATTR_NON_CONSISTENT flag starting at virtual address vaddr and
-continuing on for size.  Again, you *must* observe the cache line
-boundaries when doing this.
-
 
 Part III - Debug drivers use of the DMA-API
 -------------------------------------------
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index df0bff2ea750e0..4e1de194b45cbf 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -389,6 +389,18 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 }
 #endif /* CONFIG_HAS_DMA */
 
+static inline void *dma_alloc_noncoherent(struct device *dev, size_t size,
+		dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp)
+{
+	return dma_alloc_attrs(dev, size, dma_handle, gfp,
+			DMA_ATTR_NON_CONSISTENT);
+}
+static inline void dma_free_noncoherent(struct device *dev, size_t size,
+		void *vaddr, dma_addr_t dma_handle, enum dma_data_direction dir)
+{
+	dma_free_attrs(dev, size, vaddr, dma_handle, DMA_ATTR_NON_CONSISTENT);
+}
+
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
