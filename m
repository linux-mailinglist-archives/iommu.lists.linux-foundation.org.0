Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E734F161833
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 17:46:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B9B8854C0;
	Mon, 17 Feb 2020 16:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVIRIzwAVBut; Mon, 17 Feb 2020 16:46:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 471F085209;
	Mon, 17 Feb 2020 16:46:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D8F0C013E;
	Mon, 17 Feb 2020 16:46:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8EAAC013E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2252852C7
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4gUchN2RBgR for <iommu@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 16:46:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A48685209
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 16:46:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6FF430E;
 Mon, 17 Feb 2020 08:46:16 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2853F68F;
 Mon, 17 Feb 2020 08:46:15 -0800 (PST)
Subject: Re: [RFC PATCH] iommu/iova: Support limiting IOVA alignment
To: Liam Mark <lmark@codeaurora.org>, Joerg Roedel <joro@8bytes.org>
References: <alpine.DEB.2.10.2002141223510.27047@lmark-linux.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e9ae618c-58d4-d245-be80-e62fbde4f907@arm.com>
Date: Mon, 17 Feb 2020 16:46:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.2002141223510.27047@lmark-linux.qualcomm.com>
Content-Language: en-GB
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 iommu@lists.linux-foundation.org, Pratik Patel <pratikp@codeaurora.org>,
 linux-kernel@vger.kernel.org
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

On 14/02/2020 8:30 pm, Liam Mark wrote:
> 
> When the IOVA framework applies IOVA alignment it aligns all
> IOVAs to the smallest PAGE_SIZE order which is greater than or
> equal to the requested IOVA size.
> 
> We support use cases that requires large buffers (> 64 MB in
> size) to be allocated and mapped in their stage 1 page tables.
> However, with this alignment scheme we find ourselves running
> out of IOVA space for 32 bit devices, so we are proposing this
> config, along the similar vein as CONFIG_CMA_ALIGNMENT for CMA
> allocations.

As per [1], I'd really like to better understand the allocation patterns 
that lead to such a sparsely-occupied address space to begin with, given 
that the rbtree allocator is supposed to try to maintain locality as far 
as possible, and the rcaches should further improve on that. Are you 
also frequently cycling intermediate-sized buffers which are smaller 
than 64MB but still too big to be cached?  Are there a lot of 
non-power-of-two allocations?

> Add CONFIG_IOMMU_LIMIT_IOVA_ALIGNMENT to limit the alignment of
> IOVAs to some desired PAGE_SIZE order, specified by
> CONFIG_IOMMU_IOVA_ALIGNMENT. This helps reduce the impact of
> fragmentation caused by the current IOVA alignment scheme, and
> gives better IOVA space utilization.

Even if the general change did prove reasonable, this IOVA allocator is 
not owned by the DMA API, so entirely removing the option of strict 
size-alignment feels a bit uncomfortable. Personally I'd replace the 
bool argument with an actual alignment value to at least hand the 
authority out to individual callers.

Furthermore, even in DMA API terms, is anyone really ever going to 
bother tuning that config? Since iommu-dma is supposed to be a 
transparent layer, arguably it shouldn't behave unnecessarily 
differently from CMA, so simply piggy-backing off CONFIG_CMA_ALIGNMENT 
would seem logical.

Robin.

[1] 
https://lore.kernel.org/linux-iommu/1581721602-17010-1-git-send-email-isaacm@codeaurora.org/

> Signed-off-by: Liam Mark <lmark@codeaurora.org>
> ---
>   drivers/iommu/Kconfig | 31 +++++++++++++++++++++++++++++++
>   drivers/iommu/iova.c  | 20 +++++++++++++++++++-
>   2 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index d2fade984999..9684a153cc72 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -3,6 +3,37 @@
>   config IOMMU_IOVA
>   	tristate
>   
> +if IOMMU_IOVA
> +
> +config IOMMU_LIMIT_IOVA_ALIGNMENT
> +	bool "Limit IOVA alignment"
> +	help
> +	  When the IOVA framework applies IOVA alignment it aligns all
> +	  IOVAs to the smallest PAGE_SIZE order which is greater than or
> +	  equal to the requested IOVA size. This works fine for sizes up
> +	  to several MiB, but for larger sizes it results in address
> +	  space wastage and fragmentation. For example drivers with a 4
> +	  GiB IOVA space might run out of IOVA space when allocating
> +	  buffers great than 64 MiB.
> +
> +	  Enable this option to impose a limit on the alignment of IOVAs.
> +
> +	  If unsure, say N.
> +
> +config IOMMU_IOVA_ALIGNMENT
> +	int "Maximum PAGE_SIZE order of alignment for IOVAs"
> +	depends on IOMMU_LIMIT_IOVA_ALIGNMENT
> +	range 4 9
> +	default 9
> +	help
> +	  With this parameter you can specify the maximum PAGE_SIZE order for
> +	  IOVAs. Larger IOVAs will be aligned only to this specified order.
> +	  The order is expressed a power of two multiplied by the PAGE_SIZE.
> +
> +	  If unsure, leave the default value "9".
> +
> +endif
> +
>   # The IOASID library may also be used by non-IOMMU_API users
>   config IOASID
>   	tristate
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 0e6a9536eca6..259884c8dbd1 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -177,6 +177,24 @@ int init_iova_flush_queue(struct iova_domain *iovad,
>   	rb_insert_color(&iova->node, root);
>   }
>   
> +#ifdef CONFIG_IOMMU_LIMIT_IOVA_ALIGNMENT
> +static unsigned long limit_align_shift(struct iova_domain *iovad,
> +				       unsigned long shift)
> +{
> +	unsigned long max_align_shift;
> +
> +	max_align_shift = CONFIG_IOMMU_IOVA_ALIGNMENT + PAGE_SHIFT
> +			- iova_shift(iovad);
> +	return min_t(unsigned long, max_align_shift, shift);
> +}
> +#else
> +static unsigned long limit_align_shift(struct iova_domain *iovad,
> +				       unsigned long shift)
> +{
> +	return shift;
> +}
> +#endif
> +
>   static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   		unsigned long size, unsigned long limit_pfn,
>   			struct iova *new, bool size_aligned)
> @@ -188,7 +206,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   	unsigned long align_mask = ~0UL;
>   
>   	if (size_aligned)
> -		align_mask <<= fls_long(size - 1);
> +		align_mask <<= limit_align_shift(iovad, fls_long(size - 1));
>   
>   	/* Walk the tree backwards */
>   	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
