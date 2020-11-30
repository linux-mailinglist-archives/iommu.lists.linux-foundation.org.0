Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C779F2C8000
	for <lists.iommu@lfdr.de>; Mon, 30 Nov 2020 09:34:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 749A187366;
	Mon, 30 Nov 2020 08:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6tLSzkuplqY; Mon, 30 Nov 2020 08:34:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD7158736A;
	Mon, 30 Nov 2020 08:34:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7B5FC0052;
	Mon, 30 Nov 2020 08:34:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3914CC0052
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 32E82868E2
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJMXycjMXPeq for <iommu@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 08:34:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C614868A5
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 08:34:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8685868AFE; Mon, 30 Nov 2020 09:34:10 +0100 (CET)
Date: Mon, 30 Nov 2020 09:34:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201130083410.GD32234@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125221917.150463-1-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

> +#ifndef CONFIG_DMA_NONCOHERENT

I think you need to drop this ifdef.  This code should work just fine
on noncoherent mips and sh platforms.

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
> +	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> +				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> +				stream->urb_size, GFP_KERNEL)) {
> +		vunmap(uvc_urb->buffer);
> +		dma_free_noncontiguous(dma_dev, stream->urb_size,
> +				       uvc_urb->pages, uvc_urb->dma);
> +		return false;
> +	}
> +
> +	return true;
> +}

I wonder if we should lift this into a helper.  On the one hand I had
proliferating struct scatterlist usage, on the other hand it is all over
the media and drm code anyway, and duplicating this doesn't help anyone.

Possibly including the fallback to the coherent allocating.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
