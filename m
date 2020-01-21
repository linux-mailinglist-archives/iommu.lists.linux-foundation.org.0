Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5D143BC1
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 12:11:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 963C586378;
	Tue, 21 Jan 2020 11:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rb81IxTjoRLg; Tue, 21 Jan 2020 11:11:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3370186397;
	Tue, 21 Jan 2020 11:11:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28CC9C1D80;
	Tue, 21 Jan 2020 11:11:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EE39C0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 11:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 660B086378
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 11:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNciGoQoSSn1 for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 11:11:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB61F84540
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 11:11:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33E6A1FB;
 Tue, 21 Jan 2020 03:11:13 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 808883F6C4;
 Tue, 21 Jan 2020 03:11:12 -0800 (PST)
Subject: Re: [Patch v3 1/3] iommu: avoid unnecessary magazine allocations
To: Cong Wang <xiyou.wangcong@gmail.com>, iommu@lists.linux-foundation.org
References: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
 <20191218043951.10534-2-xiyou.wangcong@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <db1c7741-e280-7930-1659-2ca43e8aac15@arm.com>
Date: Tue, 21 Jan 2020 11:11:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218043951.10534-2-xiyou.wangcong@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org
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

On 18/12/2019 4:39 am, Cong Wang wrote:
> The IOVA cache algorithm implemented in IOMMU code does not
> exactly match the original algorithm described in the paper
> "Magazines and Vmem: Extending the Slab Allocator to Many
> CPUs and Arbitrary Resources".
> 
> Particularly, it doesn't need to free the loaded empty magazine
> when trying to put it back to global depot. To make it work, we
> have to pre-allocate magazines in the depot and only recycle them
> when all of them are full.
> 
> Before this patch, rcache->depot[] contains either full or
> freed entries, after this patch, it contains either full or
> empty (but allocated) entries.

How much additional memory overhead does this impose (particularly on 
systems that may have many domains mostly used for large, long-term 
mappings)? I'm wary that trying to micro-optimise for the "churn network 
packets as fast as possible" case may penalise every other case, 
potentially quite badly. Lower-end embedded systems are using IOMMUs in 
front of their GPUs, video codecs, etc. precisely because they *don't* 
have much memory to spare (and thus need to scrape together large 
buffers out of whatever pages they can find).

But on the other hand, if we were to go down this route, then why is 
there any dynamic allocation/freeing left at all? Once both the depot 
and the rcaches are preallocated, then AFAICS it would make more sense 
to rework the overflow case in __iova_rcache_insert() to just free the 
IOVAs and swap the empty mag around rather than destroying and 
recreating it entirely.

Perhaps there's a reasonable compromise wherein we don't preallocate, 
but still 'free' empty magazines back to the depot, such that busy 
domains will quickly reach a steady-state. In fact, having now dug up 
the paper at this point of writing this reply, that appears to be what 
fig. 3.1b describes anyway - I don't see any mention of preallocating 
the depot.

Robin.

> 
> Together with a few other changes to make it exactly match
> the pseudo code in the paper.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: John Garry <john.garry@huawei.com>
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> ---
>   drivers/iommu/iova.c | 45 +++++++++++++++++++++++++++-----------------
>   1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 41c605b0058f..cb473ddce4cf 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -862,12 +862,16 @@ static void init_iova_rcaches(struct iova_domain *iovad)
>   	struct iova_cpu_rcache *cpu_rcache;
>   	struct iova_rcache *rcache;
>   	unsigned int cpu;
> -	int i;
> +	int i, j;
>   
>   	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
>   		rcache = &iovad->rcaches[i];
>   		spin_lock_init(&rcache->lock);
>   		rcache->depot_size = 0;
> +		for (j = 0; j < MAX_GLOBAL_MAGS; ++j) {
> +			rcache->depot[j] = iova_magazine_alloc(GFP_KERNEL);
> +			WARN_ON(!rcache->depot[j]);
> +		}
>   		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
>   		if (WARN_ON(!rcache->cpu_rcaches))
>   			continue;
> @@ -900,24 +904,30 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
>   
>   	if (!iova_magazine_full(cpu_rcache->loaded)) {
>   		can_insert = true;
> -	} else if (!iova_magazine_full(cpu_rcache->prev)) {
> +	} else if (iova_magazine_empty(cpu_rcache->prev)) {
>   		swap(cpu_rcache->prev, cpu_rcache->loaded);
>   		can_insert = true;
>   	} else {
> -		struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
> +		spin_lock(&rcache->lock);
> +		if (rcache->depot_size < MAX_GLOBAL_MAGS) {
> +			swap(rcache->depot[rcache->depot_size], cpu_rcache->prev);
> +			swap(cpu_rcache->prev, cpu_rcache->loaded);
> +			rcache->depot_size++;
> +			can_insert = true;
> +		} else {
> +			mag_to_free = cpu_rcache->loaded;
> +		}
> +		spin_unlock(&rcache->lock);
> +
> +		if (mag_to_free) {
> +			struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
>   
> -		if (new_mag) {
> -			spin_lock(&rcache->lock);
> -			if (rcache->depot_size < MAX_GLOBAL_MAGS) {
> -				rcache->depot[rcache->depot_size++] =
> -						cpu_rcache->loaded;
> +			if (new_mag) {
> +				cpu_rcache->loaded = new_mag;
> +				can_insert = true;
>   			} else {
> -				mag_to_free = cpu_rcache->loaded;
> +				mag_to_free = NULL;
>   			}
> -			spin_unlock(&rcache->lock);
> -
> -			cpu_rcache->loaded = new_mag;
> -			can_insert = true;
>   		}
>   	}
>   
> @@ -963,14 +973,15 @@ static unsigned long __iova_rcache_get(struct iova_rcache *rcache,
>   
>   	if (!iova_magazine_empty(cpu_rcache->loaded)) {
>   		has_pfn = true;
> -	} else if (!iova_magazine_empty(cpu_rcache->prev)) {
> +	} else if (iova_magazine_full(cpu_rcache->prev)) {
>   		swap(cpu_rcache->prev, cpu_rcache->loaded);
>   		has_pfn = true;
>   	} else {
>   		spin_lock(&rcache->lock);
>   		if (rcache->depot_size > 0) {
> -			iova_magazine_free(cpu_rcache->loaded);
> -			cpu_rcache->loaded = rcache->depot[--rcache->depot_size];
> +			swap(rcache->depot[rcache->depot_size - 1], cpu_rcache->prev);
> +			swap(cpu_rcache->prev, cpu_rcache->loaded);
> +			rcache->depot_size--;
>   			has_pfn = true;
>   		}
>   		spin_unlock(&rcache->lock);
> @@ -1019,7 +1030,7 @@ static void free_iova_rcaches(struct iova_domain *iovad)
>   			iova_magazine_free(cpu_rcache->prev);
>   		}
>   		free_percpu(rcache->cpu_rcaches);
> -		for (j = 0; j < rcache->depot_size; ++j)
> +		for (j = 0; j < MAX_GLOBAL_MAGS; ++j)
>   			iova_magazine_free(rcache->depot[j]);
>   	}
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
