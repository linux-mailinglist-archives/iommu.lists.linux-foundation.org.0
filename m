Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 639433078FB
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 16:03:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 13EE92E0F7;
	Thu, 28 Jan 2021 15:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YzHhMgMTyAX; Thu, 28 Jan 2021 15:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A7C72E0F6;
	Thu, 28 Jan 2021 15:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16DAAC08A1;
	Thu, 28 Jan 2021 15:03:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99273C08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 860DE2E0F7
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Fe4A46uvfgr for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 15:03:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 81FDC2E0F6
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 15:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eiZd5dIZYgYJoMWDSUYX8Z74U1gzd1oU/fP92j3Q9zc=; b=D3X3loMwMeMbKGv8DQXGezqm9O
 /z8YgqLas0IsEcomGtpbOVByKZTH50d5WGHBxxrwRw2w6bkkhgT6iGpGtPIrLK1lMyzsvzQ5uO3QW
 3n2PTC79ddeVM8c3YT9hXWAA6jv2dC70JTDIdG07ilf8XPXQtbSiuSLIZ6bHf4RjVQIr5KxAeRt1F
 L395PraHSOjVaAMlaNkg7r0EpRu5Pttlf3FuNpcMlgMW01bAOXO4aujpI2AL4Rn3D9kpcn9SsMzpN
 MqqFMcDgiX2aoFXsSzxsv0y5RtlakYPBmJmQPnllCIvSHjUgkfGE1h2uaCrU5keF3BM3bUGPJ0WLm
 N2VkMjsQ==;
Received: from [2001:4bb8:18c:25a3:5b32:95f:aa1f:ea4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l58pO-008bMG-FZ; Thu, 28 Jan 2021 15:03:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Date: Thu, 28 Jan 2021 15:58:37 +0100
Message-Id: <20210128145837.2250561-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128145837.2250561-1-hch@lst.de>
References: <20210128145837.2250561-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-media@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

From: Ricardo Ribalda <ribalda@chromium.org>

On architectures where the is no coherent caching such as ARM use the
dma_alloc_noncontiguos API and handle manually the cache flushing using
dma_sync_sgtable().

With this patch on the affected architectures we can measure up to 20x
performance improvement in uvc_video_copy_data_work().

Eg: aarch64 with an external usb camera

NON_CONTIGUOUS
frames:  999
packets: 999
empty:   0 (0 %)
errors:  0
invalid: 0
pts: 0 early, 0 initial, 999 ok
scr: 0 count ok, 0 diff ok
sof: 2048 <= sof <= 0, freq 0.000 kHz
bytes 67034480 : duration 33303
FPS: 29.99
URB: 523446/4993 uS/qty: 104.836 avg 132.532 std 13.230 min 831.094 max (uS)
header: 76564/4993 uS/qty: 15.334 avg 15.229 std 3.438 min 186.875 max (uS)
latency: 468945/4992 uS/qty: 93.939 avg 132.577 std 9.531 min 824.010 max (uS)
decode: 54161/4993 uS/qty: 10.847 avg 6.313 std 1.614 min 111.458 max (uS)
raw decode speed: 9.931 Gbits/s
raw URB handling speed: 1.025 Gbits/s
throughput: 16.102 Mbits/s
URB decode CPU usage 0.162600 %

COHERENT
frames:  999
packets: 999
empty:   0 (0 %)
errors:  0
invalid: 0
pts: 0 early, 0 initial, 999 ok
scr: 0 count ok, 0 diff ok
sof: 2048 <= sof <= 0, freq 0.000 kHz
bytes 54683536 : duration 33302
FPS: 29.99
URB: 1478135/4000 uS/qty: 369.533 avg 390.357 std 22.968 min 3337.865 max (uS)
header: 79761/4000 uS/qty: 19.940 avg 18.495 std 1.875 min 336.719 max (uS)
latency: 281077/4000 uS/qty: 70.269 avg 83.102 std 5.104 min 735.000 max (uS)
decode: 1197057/4000 uS/qty: 299.264 avg 318.080 std 1.615 min 2806.667 max (uS)
raw decode speed: 365.470 Mbits/s
raw URB handling speed: 295.986 Mbits/s
throughput: 13.136 Mbits/s
URB decode CPU usage 3.594500 %

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/media/usb/uvc/uvc_video.c | 76 ++++++++++++++++++++++---------
 drivers/media/usb/uvc/uvcvideo.h  |  4 +-
 2 files changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b9488..9c051b55dc7bc6 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -1097,6 +1098,23 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	return data[0];
 }
 
+static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
+{
+	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
+}
+
+static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
+{
+	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
+
+	if (for_device)
+		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
+					    DMA_FROM_DEVICE);
+	else
+		dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
+					 DMA_FROM_DEVICE);
+}
+
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1118,6 +1136,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
+	uvc_urb_dma_sync(uvc_urb, true);
+
 	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
@@ -1539,10 +1559,12 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
+	uvc_urb_dma_sync(uvc_urb, false);
 	stream->decode(uvc_urb, buf, buf_meta);
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
+		uvc_urb_dma_sync(uvc_urb, true);
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			uvc_printk(KERN_ERR,
@@ -1559,24 +1581,47 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
+	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-#ifndef CONFIG_DMA_NONCOHERENT
-		usb_free_coherent(stream->dev->udev, stream->urb_size,
-				  uvc_urb->buffer, uvc_urb->dma);
-#else
-		kfree(uvc_urb->buffer);
-#endif
+		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
+		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
+				       uvc_urb->dma, DMA_BIDIRECTIONAL);
+
 		uvc_urb->buffer = NULL;
 	}
 
 	stream->urb_size = 0;
 }
 
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+{
+	struct device *dma_dev = stream_to_dmadev(stream);
+
+
+	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
+					       &uvc_urb->dma, DMA_BIDIRECTIONAL,
+					       gfp_flags);
+	if (!uvc_urb->sgt)
+		return false;
+
+	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
+						 uvc_urb->sgt);
+	if (!uvc_urb->buffer) {
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->sgt, uvc_urb->dma,
+				       DMA_BIDIRECTIONAL);
+		return false;
+	}
+
+	return true;
+}
+
 /*
  * Allocate transfer buffers. This function can be called with buffers
  * already allocated when resuming from suspend, in which case it will
@@ -1607,19 +1652,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 1; npackets /= 2) {
+		stream->urb_size = psize * npackets;
 		for (i = 0; i < UVC_URBS; ++i) {
 			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
 
-			stream->urb_size = psize * npackets;
-#ifndef CONFIG_DMA_NONCOHERENT
-			uvc_urb->buffer = usb_alloc_coherent(
-				stream->dev->udev, stream->urb_size,
-				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
-#else
-			uvc_urb->buffer =
-			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
-#endif
-			if (!uvc_urb->buffer) {
+			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
 				uvc_free_urb_buffers(stream);
 				break;
 			}
@@ -1728,12 +1765,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->context = uvc_urb;
 		urb->pipe = usb_rcvisocpipe(stream->dev->udev,
 				ep->desc.bEndpointAddress);
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
-#else
-		urb->transfer_flags = URB_ISO_ASAP;
-#endif
 		urb->interval = ep->desc.bInterval;
 		urb->transfer_buffer = uvc_urb->buffer;
 		urb->complete = uvc_video_complete;
@@ -1793,10 +1826,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 
 		usb_fill_bulk_urb(urb, stream->dev->udev, pipe,	uvc_urb->buffer,
 				  size, uvc_video_complete, uvc_urb);
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
-#endif
 
 		uvc_urb->urb = urb;
 	}
@@ -1891,6 +1922,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
+		uvc_urb_dma_sync(uvc_urb, true);
 		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c44d..a386114bd22999 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -521,7 +521,8 @@ struct uvc_copy_op {
  * @urb: the URB described by this context structure
  * @stream: UVC streaming context
  * @buffer: memory storage for the URB
- * @dma: DMA coherent addressing for the urb_buffer
+ * @dma: Allocated DMA handle
+ * @sgt: sgt_table with the urb locations in memory
  * @async_operations: counter to indicate the number of copy operations
  * @copy_operations: work descriptors for asynchronous copy operations
  * @work: work queue entry for asynchronous decode
@@ -532,6 +533,7 @@ struct uvc_urb {
 
 	char *buffer;
 	dma_addr_t dma;
+	struct sg_table *sgt;
 
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
