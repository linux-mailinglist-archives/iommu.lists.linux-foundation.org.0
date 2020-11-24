Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4591A2C2CE4
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 17:29:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED819872A1;
	Tue, 24 Nov 2020 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BByXHhJYQ6Xf; Tue, 24 Nov 2020 16:29:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 10DDC872A0;
	Tue, 24 Nov 2020 16:29:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9853C0052;
	Tue, 24 Nov 2020 16:29:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2097C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 16:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DBD39859C2
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 16:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXTZLHwcGnMK for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 16:29:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8E9F584AB8
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 16:29:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A539E1396;
 Tue, 24 Nov 2020 08:29:25 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DCF93F71F;
 Tue, 24 Nov 2020 08:29:22 -0800 (PST)
Subject: Re: [PATCH 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To: Ricardo Ribalda <ribalda@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@google.com>
References: <20201124153845.132207-1-ribalda@chromium.org>
 <20201124153845.132207-5-ribalda@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f1055d12-8bde-80d0-29f3-dfbfbf59cc11@arm.com>
Date: Tue, 24 Nov 2020 16:29:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124153845.132207-5-ribalda@chromium.org>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-11-24 15:38, Ricardo Ribalda wrote:
> On architectures where the is no coherent caching such as ARM use the
> dma_alloc_noncontiguos API and handle manually the cache flushing using
> dma_sync_single().
> 
> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/usb/uvc/uvc_video.c | 74 ++++++++++++++++++++++++++-----
>   drivers/media/usb/uvc/uvcvideo.h  |  1 +
>   2 files changed, 63 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index a6a441d92b94..9e90b261428a 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -1490,6 +1490,11 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
>   	urb->transfer_buffer_length = stream->urb_size - len;
>   }
>   
> +static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
> +{
> +	return stream->dev->udev->bus->controller->parent;
> +}
> +
>   static void uvc_video_complete(struct urb *urb)
>   {
>   	struct uvc_urb *uvc_urb = urb->context;
> @@ -1539,6 +1544,11 @@ static void uvc_video_complete(struct urb *urb)
>   	 * Process the URB headers, and optionally queue expensive memcpy tasks
>   	 * to be deferred to a work queue.
>   	 */
> +	if (uvc_urb->pages)
> +		dma_sync_single_for_cpu(stream_to_dmadev(stream),
> +					urb->transfer_dma,
> +					urb->transfer_buffer_length,
> +					DMA_FROM_DEVICE);

This doesn't work. Even in iommu-dma, the streaming API still expects to 
work on physically-contiguous memory that could have been passed to 
dma_map_single() in the first place. As-is, this will invalidate 
transfer_buffer_length bytes from the start of the *first* physical 
page, and thus destroy random other data if lines from subsequent 
unrelated pages are dirty in caches.

The only feasible way to do a DMA sync on disjoint pages in a single 
call is with a scatterlist.

Robin.

>   	stream->decode(uvc_urb, buf, buf_meta);
>   
>   	/* If no async work is needed, resubmit the URB immediately. */
> @@ -1566,8 +1576,15 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>   			continue;
>   
>   #ifndef CONFIG_DMA_NONCOHERENT
> -		usb_free_coherent(stream->dev->udev, stream->urb_size,
> -				  uvc_urb->buffer, uvc_urb->dma);
> +		if (uvc_urb->pages) {
> +			vunmap(uvc_urb->buffer);
> +			dma_free_noncontiguous(stream_to_dmadev(stream),
> +					       stream->urb_size,
> +					       uvc_urb->pages, uvc_urb->dma);
> +		} else {
> +			usb_free_coherent(stream->dev->udev, stream->urb_size,
> +					  uvc_urb->buffer, uvc_urb->dma);
> +		}
>   #else
>   		kfree(uvc_urb->buffer);
>   #endif
> @@ -1577,6 +1594,47 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
>   	stream->urb_size = 0;
>   }
>   
> +#ifndef CONFIG_DMA_NONCOHERENT
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
> +
> +	if (!dma_can_alloc_noncontiguous(dma_dev)) {
> +		uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev,
> +						     stream->urb_size,
> +						     gfp_flags | __GFP_NOWARN,
> +						     &uvc_urb->dma);
> +		return uvc_urb->buffer != NULL;
> +	}
> +
> +	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> +						 &uvc_urb->dma,
> +						 gfp_flags | __GFP_NOWARN, 0);
> +	if (!uvc_urb->pages)
> +		return false;
> +
> +	uvc_urb->buffer = vmap(uvc_urb->pages,
> +			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> +			       VM_DMA_COHERENT, PAGE_KERNEL);
> +	if (!uvc_urb->buffer) {
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +#else
> +static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
> +				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
> +{
> +	uvc_urb->buffer = kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> +
> +	return uvc_urb->buffer != NULL;
> +}
> +#endif
> +
>   /*
>    * Allocate transfer buffers. This function can be called with buffers
>    * already allocated when resuming from suspend, in which case it will
> @@ -1607,19 +1665,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
>   
>   	/* Retry allocations until one succeed. */
>   	for (; npackets > 1; npackets /= 2) {
> +		stream->urb_size = psize * npackets;
>   		for (i = 0; i < UVC_URBS; ++i) {
>   			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
>   
> -			stream->urb_size = psize * npackets;
> -#ifndef CONFIG_DMA_NONCOHERENT
> -			uvc_urb->buffer = usb_alloc_coherent(
> -				stream->dev->udev, stream->urb_size,
> -				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
> -#else
> -			uvc_urb->buffer =
> -			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
> -#endif
> -			if (!uvc_urb->buffer) {
> +			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
>   				uvc_free_urb_buffers(stream);
>   				break;
>   			}
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index a3dfacf069c4..3e3ef1f1daa5 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -532,6 +532,7 @@ struct uvc_urb {
>   
>   	char *buffer;
>   	dma_addr_t dma;
> +	struct page **pages;
>   
>   	unsigned int async_operations;
>   	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
