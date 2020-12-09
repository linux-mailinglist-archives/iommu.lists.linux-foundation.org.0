Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4472D42A0
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 14:05:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6AE2D8706C;
	Wed,  9 Dec 2020 13:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZ5q2vQivUDT; Wed,  9 Dec 2020 13:05:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89E7C87048;
	Wed,  9 Dec 2020 13:05:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FCCBC1DA2;
	Wed,  9 Dec 2020 13:05:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0261FC013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB4C38784E
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IEH0Gp3sxB4z for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 13:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 54EB287822
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 13:05:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4AC31B;
 Wed,  9 Dec 2020 05:05:16 -0800 (PST)
Received: from [10.57.61.6] (unknown [10.57.61.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB3F73F66B;
 Wed,  9 Dec 2020 05:05:14 -0800 (PST)
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To: Christoph Hellwig <hch@lst.de>, Tomasz Figa <tfiga@chromium.org>
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com>
 <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201209111235.GA22806@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6b34596d-34c4-bd99-c5a7-5a4742c5b886@arm.com>
Date: Wed, 9 Dec 2020 13:05:11 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209111235.GA22806@lst.de>
Content-Language: en-GB
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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

On 2020-12-09 11:12, Christoph Hellwig wrote:
> On Tue, Dec 08, 2020 at 01:54:00PM +0900, Tomasz Figa wrote:
>> >From the media perspective, it would be good to have the vmap
>> optional, similarly to the DMA_ATTR_NO_KERNEL_MAPPING attribute for
>> coherent allocations. Actually, in the media drivers, the need to have
>> a kernel mapping of the DMA buffers corresponds to a minority of the
>> drivers. Most of them only need to map them to the userspace.
>>
>> Nevertheless, that minority actually happens to be quite widely used,
>> e.g. the uvcvideo driver, so we can't go to the other extreme and just
>> drop the vmap at all.
> 
> My main problem is that the DMA_ATTR_NO_KERNEL_MAPPING makes a mess
> of an API.  I'd much rather have low-level API that returns the
> discontiguous allocations and another one that vmaps them rather
> than starting to overload arguments like in dma_alloc_attrs with
> DMA_ATTR_NO_KERNEL_MAPPING.

Agreed - if iommu-dma's dma_alloc_coherent() ends up as little more than 
a thin wrapper around those two functions I think that would be a good 
sign. It also seems like it might be a good idea for this API to use 
scatterlists rather than page arrays as it's fundamental format, to help 
reduce impedance with dma-buf - if we can end up with a wider redesign 
that also gets rid of dma_get_sgtable(), all the better!

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
