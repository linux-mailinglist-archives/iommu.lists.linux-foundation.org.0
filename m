Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A5307B2D
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 17:43:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F86186909;
	Thu, 28 Jan 2021 16:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LXb6dEHcDtW; Thu, 28 Jan 2021 16:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0BDBF868C7;
	Thu, 28 Jan 2021 16:43:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E2CC08A1;
	Thu, 28 Jan 2021 16:43:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C49ACC08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2B4C86E43
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 16:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZ2gDxebmqmO for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 16:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9661986C03
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 16:43:29 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id z18so5572506ile.9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=au/rWxVLXC+jhFOhYtTmIM0u2Qs05NxR7vYgq9rMjTg=;
 b=Mg4cII1XQ+Mj3Sw1csKsWnqF12MNlEnokkufPkrXXu7gJrxx02m3M+fDmUGTni+FI3
 QBHDdU156bpR33lm1BiGFqMeaaw3IU8MyoLDP6G3+Y4VKiLX1ALLM+b5bfqz5vBHGe3A
 /LLAfGUJx5Luyra6DHcApAVueuuWhwSPHnot4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=au/rWxVLXC+jhFOhYtTmIM0u2Qs05NxR7vYgq9rMjTg=;
 b=DyjkZ1la2YkW0L5V2sIY3sYphWhJprC+Da59A3Dhwjqg8eqJn+jEwfRhnAJp/V1xok
 BU1FPSC+hR+ejBcXKV1EnMJVuHHR+fdhlPgqlKtjNmRJkcqiK/bd7V8xUxLYCTYaR7Uk
 0zFpjgqxlELLvNBHsjEwvH76lyML+Vjgvhy3Y5EMe1hd7uOZufsPwUmwSWGlRQ8VCM9Y
 x+BEZW32+9IcXiCgTifDUnYgCyqs434kmMX0esCEwDXRzX3IbxZY7ZifL7k6rFtfZsh7
 hnH1GWqP1GHESG4WqekixiAGpbXkl08VXnuIxluxiDElOxwuKckzaHj0ITKSERQGFtSX
 w5uA==
X-Gm-Message-State: AOAM530EZHVfXksb7wr8KSC1e+F1nBD8AVdvK2X0zZ1dgLP1VEHQb1e+
 GI6wQfpchfg706zvIF2ufZueLnlbVCq2Eixr
X-Google-Smtp-Source: ABdhPJwpe+U6G8wzm/DXJRiTv5pfhdySpQm8bOrzsestr0EPhonNNuQL3VxWZTYt7uVNV9immN9crQ==
X-Received: by 2002:a05:6e02:18c9:: with SMTP id
 s9mr14582692ilu.265.1611852208669; 
 Thu, 28 Jan 2021 08:43:28 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
 by smtp.gmail.com with ESMTPSA id u9sm2611922iog.16.2021.01.28.08.43.27
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:43:27 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id y17so5810170ili.12
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 08:43:27 -0800 (PST)
X-Received: by 2002:a05:6e02:13c1:: with SMTP id
 v1mr13889942ilj.89.1611852206979; 
 Thu, 28 Jan 2021 08:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20210128145837.2250561-1-hch@lst.de>
 <20210128145837.2250561-7-hch@lst.de>
In-Reply-To: <20210128145837.2250561-7-hch@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Jan 2021 17:43:15 +0100
X-Gmail-Original-Message-ID: <CANiDSCvbfgpmPyMjKxLqcv4zzPaG2QLR+ipszy5e6ku==Mg8AA@mail.gmail.com>
Message-ID: <CANiDSCvbfgpmPyMjKxLqcv4zzPaG2QLR+ipszy5e6ku==Mg8AA@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jan 28, 2021 at 4:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Ricardo Ribalda <ribalda@chromium.org>
>
> On architectures where the is no coherent caching such as ARM use the
> dma_alloc_noncontiguos API and handle manually the cache flushing using
> dma_sync_sgtable().
>
> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().
>
> Eg: aarch64 with an external usb camera
>
> NON_CONTIGUOUS
> frames:  999
> packets: 999
> empty:   0 (0 %)
> errors:  0
> invalid: 0
> pts: 0 early, 0 initial, 999 ok
> scr: 0 count ok, 0 diff ok
> sof: 2048 <= sof <= 0, freq 0.000 kHz
> bytes 67034480 : duration 33303
> FPS: 29.99
> URB: 523446/4993 uS/qty: 104.836 avg 132.532 std 13.230 min 831.094 max (uS)
> header: 76564/4993 uS/qty: 15.334 avg 15.229 std 3.438 min 186.875 max (uS)
> latency: 468945/4992 uS/qty: 93.939 avg 132.577 std 9.531 min 824.010 max (uS)
> decode: 54161/4993 uS/qty: 10.847 avg 6.313 std 1.614 min 111.458 max (uS)
> raw decode speed: 9.931 Gbits/s
> raw URB handling speed: 1.025 Gbits/s
> throughput: 16.102 Mbits/s
> URB decode CPU usage 0.162600 %
>
> COHERENT
> frames:  999
> packets: 999
> empty:   0 (0 %)
> errors:  0
> invalid: 0
> pts: 0 early, 0 initial, 999 ok
> scr: 0 count ok, 0 diff ok
> sof: 2048 <= sof <= 0, freq 0.000 kHz
> bytes 54683536 : duration 33302
> FPS: 29.99
> URB: 1478135/4000 uS/qty: 369.533 avg 390.357 std 22.968 min 3337.865 max (uS)
> header: 79761/4000 uS/qty: 19.940 avg 18.495 std 1.875 min 336.719 max (uS)
> latency: 281077/4000 uS/qty: 70.269 avg 83.102 std 5.104 min 735.000 max (uS)
> decode: 1197057/4000 uS/qty: 299.264 avg 318.080 std 1.615 min 2806.667 max (uS)
> raw decode speed: 365.470 Mbits/s
> raw URB handling speed: 295.986 Mbits/s
> throughput: 13.136 Mbits/s
> URB decode CPU usage 3.594500 %
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 76 ++++++++++++++++++++++---------
>  drivers/media/usb/uvc/uvcvideo.h  |  4 +-
>  2 files changed, 57 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a6a441d92b9488..9c051b55dc7bc6 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/usb.h>
> +#include <linux/usb/hcd.h>
>  #include <linux/videodev2.h>
>  #include <linux/vmalloc.h>
>  #include <linux/wait.h>
> @@ -1097,6 +1098,23 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
>         return data[0];
>  }
>
> +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> +{
> +       return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
> +}
> +
> +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
> +{
> +       struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> +
> +       if (for_device)
> +               dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> +                                           DMA_FROM_DEVICE);
> +       else
> +               dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> +                                        DMA_FROM_DEVICE);
> +}
> +
>  /*
>   * uvc_video_decode_data_work: Asynchronous memcpy processing
>   *
> @@ -1118,6 +1136,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
>                 uvc_queue_buffer_release(op->buf);
>         }
>
> +       uvc_urb_dma_sync(uvc_urb, true);
> +
>         ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
>         if (ret < 0)
>                 uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
> @@ -1539,10 +1559,12 @@ static void uvc_video_complete(struct urb *urb)
>          * Process the URB headers, and optionally queue expensive memcpy tasks
>          * to be deferred to a work queue.
>          */
> +       uvc_urb_dma_sync(uvc_urb, false);
>         stream->decode(uvc_urb, buf, buf_meta);
>
>         /* If no async work is needed, resubmit the URB immediately. */
>         if (!uvc_urb->async_operations) {
> +               uvc_urb_dma_sync(uvc_urb, true);
>                 ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
>                 if (ret < 0)
>                         uvc_printk(KERN_ERR,
> @@ -1559,24 +1581,47 @@ static void uvc_video_complete(struct urb *urb)
>   */
>  static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>  {
> +       struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
>         struct uvc_urb *uvc_urb;
>
>         for_each_uvc_urb(uvc_urb, stream) {
>                 if (!uvc_urb->buffer)
>                         continue;
>
> -#ifndef CONFIG_DMA_NONCOHERENT
> -               usb_free_coherent(stream->dev->udev, stream->urb_size,
> -                                 uvc_urb->buffer, uvc_urb->dma);
> -#else
> -               kfree(uvc_urb->buffer);
> -#endif
> +               dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
> +               dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
> +                                      uvc_urb->dma, DMA_BIDIRECTIONAL);

Maybe DMA_FROM_DEVICE instead of DMA_BIDIRECTIONAL ?

> +
>                 uvc_urb->buffer = NULL;
>         }
>
>         stream->urb_size = 0;
>  }
>
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +                                struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +       struct device *dma_dev = stream_to_dmadev(stream);
> +
> +
> +       uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +                                              &uvc_urb->dma, DMA_BIDIRECTIONAL,
> +                                              gfp_flags);
> +       if (!uvc_urb->sgt)
> +               return false;
> +
> +       uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
> +                                                uvc_urb->sgt);
> +       if (!uvc_urb->buffer) {
> +               dma_free_noncontiguous(dma_dev, stream->urb_size,
> +                                      uvc_urb->sgt, uvc_urb->dma,
> +                                      DMA_BIDIRECTIONAL);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
>  /*
>   * Allocate transfer buffers. This function can be called with buffers
>   * already allocated when resuming from suspend, in which case it will
> @@ -1607,19 +1652,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>
>         /* Retry allocations until one succeed. */
>         for (; npackets > 1; npackets /= 2) {
> +               stream->urb_size = psize * npackets;
>                 for (i = 0; i < UVC_URBS; ++i) {
>                         struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
>
> -                       stream->urb_size = psize * npackets;
> -#ifndef CONFIG_DMA_NONCOHERENT
> -                       uvc_urb->buffer = usb_alloc_coherent(
> -                               stream->dev->udev, stream->urb_size,
> -                               gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
> -#else
> -                       uvc_urb->buffer =
> -                           kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> -#endif
> -                       if (!uvc_urb->buffer) {
> +                       if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
>                                 uvc_free_urb_buffers(stream);
>                                 break;
>                         }
> @@ -1728,12 +1765,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
>                 urb->context = uvc_urb;
>                 urb->pipe = usb_rcvisocpipe(stream->dev->udev,
>                                 ep->desc.bEndpointAddress);
> -#ifndef CONFIG_DMA_NONCOHERENT
>                 urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> -#else
> -               urb->transfer_flags = URB_ISO_ASAP;
> -#endif
>                 urb->interval = ep->desc.bInterval;
>                 urb->transfer_buffer = uvc_urb->buffer;
>                 urb->complete = uvc_video_complete;
> @@ -1793,10 +1826,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
>
>                 usb_fill_bulk_urb(urb, stream->dev->udev, pipe, uvc_urb->buffer,
>                                   size, uvc_video_complete, uvc_urb);
> -#ifndef CONFIG_DMA_NONCOHERENT
>                 urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>                 urb->transfer_dma = uvc_urb->dma;
> -#endif
>
>                 uvc_urb->urb = urb;
>         }
> @@ -1891,6 +1922,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
>
>         /* Submit the URBs. */
>         for_each_uvc_urb(uvc_urb, stream) {
> +               uvc_urb_dma_sync(uvc_urb, true);
>                 ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
>                 if (ret < 0) {
>                         uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c44d..a386114bd22999 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -521,7 +521,8 @@ struct uvc_copy_op {
>   * @urb: the URB described by this context structure
>   * @stream: UVC streaming context
>   * @buffer: memory storage for the URB
> - * @dma: DMA coherent addressing for the urb_buffer
> + * @dma: Allocated DMA handle
> + * @sgt: sgt_table with the urb locations in memory
>   * @async_operations: counter to indicate the number of copy operations
>   * @copy_operations: work descriptors for asynchronous copy operations
>   * @work: work queue entry for asynchronous decode
> @@ -532,6 +533,7 @@ struct uvc_urb {
>
>         char *buffer;
>         dma_addr_t dma;
> +       struct sg_table *sgt;
>
>         unsigned int async_operations;
>         struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
> --
> 2.29.2
>


-- 
Ricardo Ribalda
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
