Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C16306050
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 16:56:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BBDA885F29;
	Wed, 27 Jan 2021 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnOrF8OFV5Gu; Wed, 27 Jan 2021 15:56:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC63785F33;
	Wed, 27 Jan 2021 15:56:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 988C6C013A;
	Wed, 27 Jan 2021 15:56:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E815DC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CED5986132
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ft7acrPuClwO for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 15:56:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9357686113
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:56:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5554C68AFE; Wed, 27 Jan 2021 16:56:08 +0100 (CET)
Date: Wed, 27 Jan 2021 16:56:08 +0100
From: ". Christoph Hellwig" <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20210127155608.GA20272@lst.de>
References: <20201201033658.GE3723071@google.com>
 <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
 <20210111083614.GA27589@lst.de>
 <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
 <20210126170659.GA9104@lst.de>
 <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, ". Christoph Hellwig" <hch@lst.de>
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

On Wed, Jan 27, 2021 at 12:29:08AM +0100, Ricardo Ribalda wrote:
> - Is there any platform where dma_alloc_noncontiguos can fail?
> This is, !ops->alloc_noncontiguous and !dev->coherent_dma_mask
> If yes then we need to add a function to let the driver know in
> advance that it has to use the coherent allocator (usb_alloc_coherent
> for uvc)

dev->coherent_dma_mask is set by the driver.  So the only reason why
dma_alloc_noncontiguos will fail is because is because it can't
allocate any memory.

> - In dma_alloc_noncontiguos, on the dma_alloc_pages fallback. If we
> have a device where the dma happens in only one direction, could not
> get more performance with DMA_FROM/TO_DEVICE instead of
> DMA_BIDIRECTIONAL ?

Yes, we could probably do that.

> 
> 
> Then I have tried to use the API, and I have encountered a problem: on
> uvcvideo the device passed to the memory allocator is different for
> DMA_PAGES and NON_CONTIGUOUS:
> https://github.com/ribalda/linux/blob/042cd497739f71c8d4a83a67ee970369e2baca4a/drivers/media/usb/uvc/uvc_video.c#L1236
> 
> I need to dig a bit tomorrow to figure out why this is, I have
> hardware to test both paths, so it should not be too difficult.

I always found the USB dma alloc API a little weird, but we might have
to follow the scheme of the usb coherent wrappers there.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
