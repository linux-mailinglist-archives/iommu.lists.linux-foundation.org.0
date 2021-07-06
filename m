Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 877703BC876
	for <lists.iommu@lfdr.de>; Tue,  6 Jul 2021 11:22:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E01607D6;
	Tue,  6 Jul 2021 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iu2Cd6LJJTcS; Tue,  6 Jul 2021 09:22:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8596B60707;
	Tue,  6 Jul 2021 09:22:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60CDDC001F;
	Tue,  6 Jul 2021 09:22:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF08EC000E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F534040A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3E4LfJ0bW-sn for <iommu@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 09:22:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B2F6403CD
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 09:22:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6667531B;
 Tue,  6 Jul 2021 02:22:46 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78723F5A1;
 Tue,  6 Jul 2021 02:22:44 -0700 (PDT)
Subject: Re: [RFC PATCH 1/1] dma-debug: fix check_for_illegal_area() in
 debug_dma_map_sg()
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20210705185252.4074653-1-gerald.schaefer@linux.ibm.com>
 <20210705185252.4074653-2-gerald.schaefer@linux.ibm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3bb87b4c-f646-20fe-7cc5-c7449432811e@arm.com>
Date: Tue, 6 Jul 2021 10:22:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705185252.4074653-2-gerald.schaefer@linux.ibm.com>
Content-Language: en-GB
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>
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

On 2021-07-05 19:52, Gerald Schaefer wrote:
> The following warning occurred sporadically on s390:
> DMA-API: nvme 0006:00:00.0: device driver maps memory from kernel text or rodata [addr=0000000048cc5e2f] [len=131072]
> WARNING: CPU: 4 PID: 825 at kernel/dma/debug.c:1083 check_for_illegal_area+0xa8/0x138
> 
> It is a false-positive warning, due to a broken logic in debug_dma_map_sg().
> check_for_illegal_area() should check for overlay of sg elements with kernel
> text or rodata. It is called with sg_dma_len(s) instead of s->length as
> parameter. After the call to ->map_sg(), sg_dma_len() contains the length
> of possibly combined sg elements in the DMA address space, and not the
> individual sg element length, which would be s->length.
> 
> The check will then use the kernel start address of an sg element, and add
> the DMA length for overlap check, which can result in the false-positive
> warning because the DMA length can be larger than the actual single sg
> element length in kernel address space.
> 
> In addition, the call to check_for_illegal_area() happens in the iteration
> over mapped_ents, which will not include all individual sg elements if
> any of them were combined in ->map_sg().
> 
> Fix this by using s->length instead of sg_dma_len(s). Also put the call to
> check_for_illegal_area() in a separate loop, iterating over all the
> individual sg elements ("nents" instead of "mapped_ents").
> 
> Fixes: 884d05970bfb ("dma-debug: use sg_dma_len accessor")
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> ---
>   kernel/dma/debug.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 14de1271463f..d7d44b7fe7e2 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -1299,6 +1299,12 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	if (unlikely(dma_debug_disabled()))
>   		return;
>   
> +	for_each_sg(sg, s, nents, i) {
> +		if (!PageHighMem(sg_page(s))) {
> +			check_for_illegal_area(dev, sg_virt(s), s->length);
> +		}
> +	}
> +
>   	for_each_sg(sg, s, mapped_ents, i) {
>   		entry = dma_entry_alloc();
>   		if (!entry)
> @@ -1316,10 +1322,6 @@ void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   
>   		check_for_stack(dev, sg_page(s), s->offset);

Strictly this should probably be moved to the new loop as well, as it is 
similarly concerned with validating the source segments rather than the 
DMA mappings - I think with virtually-mapped stacks it might technically 
be possible for a stack page to be physically adjacent to a "valid" page 
such that it could get merged and overlooked if it were near the end of 
the list, although in fairness that would probably be indicative of 
something having gone far more fundamentally wrong. Otherwise, the 
overall reasoning looks sound to me.

Robin.

>   
> -		if (!PageHighMem(sg_page(s))) {
> -			check_for_illegal_area(dev, sg_virt(s), sg_dma_len(s));
> -		}
> -
>   		check_sg_segment(dev, s);
>   
>   		add_dma_entry(entry);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
