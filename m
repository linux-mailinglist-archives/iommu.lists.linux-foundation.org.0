Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2130ACC0
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 17:37:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7BD558527F;
	Mon,  1 Feb 2021 16:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNyLFhX5eCJO; Mon,  1 Feb 2021 16:37:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B34438550D;
	Mon,  1 Feb 2021 16:37:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C60FC0174;
	Mon,  1 Feb 2021 16:37:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B79ADC013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 16:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A6A958499A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 16:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7FfoV3mLcEr for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 16:37:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5297584948
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 16:37:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C42486736F; Mon,  1 Feb 2021 17:37:26 +0100 (CET)
Date: Mon, 1 Feb 2021 17:37:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20210201163726.GA8279@lst.de>
References: <20210128145837.2250561-1-hch@lst.de>
 <20210128145837.2250561-7-hch@lst.de> <20210128150955.GA30563@lst.de>
 <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
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

On Thu, Jan 28, 2021 at 06:00:57PM +0100, Ricardo Ribalda wrote:
> > Given that we vmap the addresses this also needs
> > flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
> > VIVT architectures.
> 
> We only read from the device to the cpu. Then can we run only
> invalidate_kernel_vmap_range() ?
> 
> something like ?
> else {
>           dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt, DMA_FROM_DEVICE);
>            invalidate_kernel_vmap_range(uvc_urb->buffer,
> uvc_urb->stream->urb_size );
> }

Yes.  Right now we don't have a proper state machine for the
*_kernel_vmap_range, but we should probably add one once usage of this
grows.  Until then I need to respin my API patch to document how callers
need to use *_kernel_vmap_range, as well as adding the so far missing
dma-debug support.

As we're getting toward the end of the merge window I'll try to get this
done ASAP.

How should we plan to merge this code?  Do you have a tree you'd like
to pick up the whole thing for?  Or should I create a dma-mapping
tree branch that can be pulled in?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
