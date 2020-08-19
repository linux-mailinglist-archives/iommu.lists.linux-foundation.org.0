Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAE24A132
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 16:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C56C68704A;
	Wed, 19 Aug 2020 14:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5L986QiO+0GY; Wed, 19 Aug 2020 14:07:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 829A986FBB;
	Wed, 19 Aug 2020 14:07:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C4C4C0051;
	Wed, 19 Aug 2020 14:07:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22204C0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 14:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 134F120017
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 14:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQZpiVtiqeLH for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 14:07:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 544872000B
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 14:07:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 671BB1045;
 Wed, 19 Aug 2020 07:07:14 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9DCD3F71F;
 Wed, 19 Aug 2020 07:07:07 -0700 (PDT)
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To: Tomasz Figa <tfiga@chromium.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
Date: Wed, 19 Aug 2020 15:07:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
Content-Language: en-GB
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
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

On 2020-08-19 13:49, Tomasz Figa wrote:
> On Wed, Aug 19, 2020 at 1:51 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> Hi Tomasz,
>>
>> On 2020-08-19 12:16, Tomasz Figa wrote:
>>> Hi Christoph,
>>>
>>> On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
>>>
>>> Could you explain what makes you think it's unused? It's a feature of
>>> the UAPI generally supported by the videobuf2 framework and relied on
>>> by Chromium OS to get any kind of reasonable performance when
>>> accessing V4L2 buffers in the userspace.
>>>
>>>> and causes
>>>> weird gymanstics with the DMA_ATTR_NON_CONSISTENT flag, which is
>>>> unimplemented except on PARISC and some MIPS configs, and about to be
>>>> removed.
>>>
>>> It is implemented by the generic DMA mapping layer [1], which is used
>>> by a number of architectures including ARM64 and supposed to be used
>>> by new architectures going forward.
>>
>> AFAICS all that V4L2_FLAG_MEMORY_NON_CONSISTENT does is end up
>> controling whether DMA_ATTR_NON_CONSISTENT is added to vb2_queue::dma_attrs.
>>
>> Please can you point to where DMA_ATTR_NON_CONSISTENT does anything at
>> all on arm64?
>>
> 
> With the default config it doesn't, but with
> CONFIG_DMA_NONCOHERENT_CACHE_SYNC enabled it makes dma_pgprot() keep
> the pgprot value as is, without enforcing coherence attributes.

How active are the PA-RISC and MIPS ports of Chromium OS?

Hacking CONFIG_DMA_NONCOHERENT_CACHE_SYNC into an architecture that 
doesn't provide dma_cache_sync() is wrong, since at worst it may break 
other drivers. If downstream is wildly misusing an API then so be it, 
but it's hardly a strong basis for an upstream argument.

>> Also, I posit that videobuf2 is not actually relying on
>> DMA_ATTR_NON_CONSISTENT anyway, since it's clearly not using it properly:
>>
>> "By using this API, you are guaranteeing to the platform
>> that you have all the correct and necessary sync points for this memory
>> in the driver should it choose to return non-consistent memory."
>>
>> $ git grep dma_cache_sync drivers/media
>> $
> 
> AFAIK dma_cache_sync() isn't the only way to perform the cache
> synchronization. The earlier patch series that I reviewed relied on
> dma_get_sgtable() and then dma_sync_sg_*() (which existed in the
> vb2-dc since forever [1]). However, it looks like with the final code
> the sgtable isn't acquired and the synchronization isn't happening, so
> you have a point.

Using the streaming sync calls on coherent allocations has also always 
been wrong per the API, regardless of the bodies of code that have 
happened to get away with it for so long.

> FWIW, I asked back in time what the plan is for non-coherent
> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> dma_sync_*() was supposed to be the right thing to go with. [2] The
> same thread also explains why dma_alloc_pages() isn't suitable for the
> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.

AFAICS even back then Christoph was implying getting rid of 
NON_CONSISTENT and *replacing* it with something streaming-API-based - 
i.e. this series - not encouraging mixing the existing APIs. It doesn't 
seem impossible to implement a remapping version of this new 
dma_alloc_pages() for IOMMU-backed ops if it's really warranted 
(although at that point it seems like "non-coherent" vb2-dc starts to 
have significant conceptual overlap with vb2-sg).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
