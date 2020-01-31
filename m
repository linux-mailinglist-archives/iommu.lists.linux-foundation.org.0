Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B687814ED0D
	for <lists.iommu@lfdr.de>; Fri, 31 Jan 2020 14:14:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 465F688222;
	Fri, 31 Jan 2020 13:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YY7s568y2ZzU; Fri, 31 Jan 2020 13:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2705B8821F;
	Fri, 31 Jan 2020 13:14:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFB8C0171;
	Fri, 31 Jan 2020 13:14:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 245FFC0171
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 13:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 12289844FF
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 13:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRxOeQaDJB7M for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 13:14:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0720D844DA
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jan 2020 13:14:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E18C106F;
 Fri, 31 Jan 2020 05:14:35 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A4A63F67D;
 Fri, 31 Jan 2020 05:14:34 -0800 (PST)
Subject: Re: [PATCH] dma-debug: add a per-cpu cache to avoid lock contention
To: Eric Dumazet <edumazet@google.com>, Christoph Hellwig <hch@lst.de>,
 Joerg Roedel <jroedel@suse.de>
References: <20200130201451.253115-1-edumazet@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <87bde968-0103-c90d-380d-e0793cd39aa5@arm.com>
Date: Fri, 31 Jan 2020 13:14:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130201451.253115-1-edumazet@google.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <eric.dumazet@gmail.com>
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

On 2020-01-30 8:14 pm, Eric Dumazet via iommu wrote:
> Networking drivers very often have to replace one page with
> another for their RX ring buffers.
> 
> A multi-queue NIC will severly hit a contention point
> in dma-debug while grabbing free_entries_lock spinlock.
> 
> Adding a one entry per-cpu cache removes the need
> to grab this spinlock twice per page replacement.
> 
> Tested on a 40Gbit mlx4 NIC, with 16 RX queues and about
> 1,000,000 replacements per second.

Looks like a decent benefit for minimal collateral impact - from what 
I've seen, networking appears to be a particularly easy place to run 
into awkward races, so mitigating even a little of the debug-induced 
serialisation for the common case can only be good.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Thanks,
Robin.

> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/debug.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index a310dbb1515e92c081f8f3f9a7290dd5e53fc889..b7221426ef49cf640db5bcb261b0817d714a3033 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -97,6 +97,8 @@ static LIST_HEAD(free_entries);
>   /* Lock for the list above */
>   static DEFINE_SPINLOCK(free_entries_lock);
>   
> +static DEFINE_PER_CPU(struct dma_debug_entry *, dma_debug_entry_cache);
> +
>   /* Global disable flag - will be set in case of an error */
>   static bool global_disable __read_mostly;
>   
> @@ -676,6 +678,10 @@ static struct dma_debug_entry *dma_entry_alloc(void)
>   	struct dma_debug_entry *entry;
>   	unsigned long flags;
>   
> +	entry = this_cpu_xchg(dma_debug_entry_cache, NULL);
> +	if (entry)
> +		goto end;
> +
>   	spin_lock_irqsave(&free_entries_lock, flags);
>   	if (num_free_entries == 0) {
>   		if (dma_debug_create_entries(GFP_ATOMIC)) {
> @@ -690,7 +696,7 @@ static struct dma_debug_entry *dma_entry_alloc(void)
>   	entry = __dma_entry_alloc();
>   
>   	spin_unlock_irqrestore(&free_entries_lock, flags);
> -
> +end:
>   #ifdef CONFIG_STACKTRACE
>   	entry->stack_len = stack_trace_save(entry->stack_entries,
>   					    ARRAY_SIZE(entry->stack_entries),
> @@ -705,6 +711,9 @@ static void dma_entry_free(struct dma_debug_entry *entry)
>   
>   	active_cacheline_remove(entry);
>   
> +	if (!this_cpu_cmpxchg(dma_debug_entry_cache, NULL, entry))
> +		return;
> +
>   	/*
>   	 * add to beginning of the list - this way the entries are
>   	 * more likely cache hot when they are reallocated.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
