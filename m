Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F34E78DD
	for <lists.iommu@lfdr.de>; Fri, 25 Mar 2022 17:25:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACB6A40327;
	Fri, 25 Mar 2022 16:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1B7D9VtgNeg; Fri, 25 Mar 2022 16:25:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 87E014027F;
	Fri, 25 Mar 2022 16:25:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 463FEC0012;
	Fri, 25 Mar 2022 16:25:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72834C0012
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 16:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518204027F
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 16:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEiPW-ahEWdW for <iommu@lists.linux-foundation.org>;
 Fri, 25 Mar 2022 16:25:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DE40401D5
 for <iommu@lists.linux-foundation.org>; Fri, 25 Mar 2022 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1648225521; bh=CQVTQ0YWUyVqJTQIKyyy3fv+ewiFx6OvdfGg4mW6pTQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dY6s8FZcGbx4M3Ov5kHFWbz37pKFj65G1OC6fBB8z/tVV+am88ZfoF14ED65xxRfy
 fOLQlXZTlO9XnrrFbC9jdp9qP8CzWxIoIJ9tmfXHq2P/R5yHN396bTH6CKZYI5a8WW
 DD3bdPHqaN8gCGW78pwoabnJBY2snukIyApgMIoAqaA9Vdl2OUjDqBtuq40B49gIBc
 w+FVDx4iSZKjE/araq8XXw8Ex3/qMIjxUaNZ8Exy3fR+fRHCPfJikWMxuYW7fVYSRZ
 iv5BKTJDyv5nkS+fmdfKnF9fqjQ8Q5kgi4mjFJqFWUv15ynkDAsA+TI670+ZfI4GOK
 IWwWkpT3eVt0w==
To: mbizon@freebox.fr, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] Recent swiotlb DMA_FROM_DEVICE fixes break
 ath9k-based AP
In-Reply-To: <31434708dcad126a8334c99ee056dcce93e507f1.camel@freebox.fr>
References: <1812355.tdWV9SEqCh@natalenko.name>
 <f88ca616-96d1-82dc-1bc8-b17480e937dd@arm.com>
 <20220324055732.GB12078@lst.de> <4386660.LvFx2qVVIh@natalenko.name>
 <81ffc753-72aa-6327-b87b-3f11915f2549@arm.com> <878rsza0ih.fsf@toke.dk>
 <4be26f5d8725cdb016c6fdd9d05cfeb69cdd9e09.camel@freebox.fr>
 <20220324163132.GB26098@lst.de>
 <d8a1cbf4-a521-78ec-1560-28d855e0913e@arm.com> <871qyr9t4e.fsf@toke.dk>
 <CAHk-=whUQCCaQXJt3KUeQ8mtnLeVXEScNXCp+_DYh2SNY7EcEA@mail.gmail.com>
 <31434708dcad126a8334c99ee056dcce93e507f1.camel@freebox.fr>
Date: Fri, 25 Mar 2022 17:25:21 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87a6de80em.fsf@toke.dk>
MIME-Version: 1.0
Cc: Netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 stable <stable@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Halil Pasic <pasic@linux.ibm.com>, iommu <iommu@lists.linux-foundation.org>,
 Olha Cherevyk <olha.cherevyk@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= via iommu
 <iommu@lists.linux-foundation.org>
Reply-To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Maxime Bizon <mbizon@freebox.fr> writes:

> On Thu, 2022-03-24 at 12:26 -0700, Linus Torvalds wrote:
>
>> 
>> It's actually very natural in that situation to flush the caches from
>> the CPU side again. And so dma_sync_single_for_device() is a fairly
>> reasonable thing to do in that situation.
>> 
>
> In the non-cache-coherent scenario, and assuming dma_map() did an
> initial cache invalidation, you can write this:
>
> rx_buffer_complete_1(buf)
> {
> 	invalidate_cache(buf, size)
> 	if (!is_ready(buf))
> 		return;
> 	<proceed with receive>
> }
>
> or 
>
> rx_buffer_complete_2(buf)
> {
> 	if (!is_ready(buf)) {
> 		invalidate_cache(buf, size)
> 		return;
> 	}
> 	<proceed with receive>
> }
>
> The latter is preferred for performance because dma_map() did the
> initial invalidate.
>
> Of course you could write:
>
> rx_buffer_complete_3(buf)
> {
> 	invalidate_cache(buf, size)
> 	if
> (!is_ready(buf)) {
> 		invalidate_cache(buf, size)
> 		return;
> 	}
> 	
> <proceed with receive>
> }
>
>
> but it's a waste of CPU cycles
>
> So I'd be very cautious assuming sync_for_cpu() and sync_for_device()
> are both doing invalidation in existing implementation of arch DMA ops,
> implementers may have taken some liberty around DMA-API to avoid
> unnecessary cache operation (not to blame them).

I sense an implicit "and the driver can't (or shouldn't) influence
this" here, right?

> For example looking at arch/arm/mm/dma-mapping.c, for DMA_FROM_DEVICE
>
> sync_single_for_device()
>   => __dma_page_cpu_to_dev()
>     => dma_cache_maint_page(op=dmac_map_area)
>       => cpu_cache.dma_map_area()
>
> sync_single_for_cpu()
>   => __dma_page_dev_to_cpu()
>     =>
> __dma_page_cpu_to_dev(op=dmac_unmap_area)
>       =>
> cpu_cache.dma_unmap_area()
>
> dma_map_area() always does cache invalidate.
>
> But for a couple of CPU variant, dma_unmap_area() is a noop, so
> sync_for_cpu() does nothing.
>
> Toke's patch will break ath9k on those platforms (mostly silent
> breakage, rx corruption leading to bad performance)

Okay, so that would be bad obviously. So if I'm reading you correctly
(cf my question above), we can't fix this properly from the driver side,
and we should go with the partial SWIOTLB revert instead?

-Toke
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
