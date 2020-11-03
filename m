Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337B2A454F
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 13:35:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A42086AF3;
	Tue,  3 Nov 2020 12:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMNAVhn7QxwX; Tue,  3 Nov 2020 12:35:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 45E9886BDB;
	Tue,  3 Nov 2020 12:35:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22897C0889;
	Tue,  3 Nov 2020 12:35:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B658C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 138A520533
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wIPfXHN8a0xx for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 12:35:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 0A1902051D
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:35:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50202106F;
 Tue,  3 Nov 2020 04:35:22 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20EFF3F718;
 Tue,  3 Nov 2020 04:35:21 -0800 (PST)
Subject: Re: [PATCH v5 2/2] iommu/iova: Free global iova rcache on iova alloc
 failure
To: vjitta@codeaurora.org, joro@8bytes.org, iommu@lists.linux-foundation.org, 
 linux-kernel@vger.kernel.org
References: <1601451864-5956-1-git-send-email-vjitta@codeaurora.org>
 <1601451864-5956-2-git-send-email-vjitta@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ff318311-77e8-b235-37dd-7b1b5f5d8ed9@arm.com>
Date: Tue, 3 Nov 2020 12:35:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1601451864-5956-2-git-send-email-vjitta@codeaurora.org>
Content-Language: en-GB
Cc: vinmenon@codeaurora.org, kernel-team@android.com
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

On 2020-09-30 08:44, vjitta@codeaurora.org wrote:
> From: Vijayanand Jitta <vjitta@codeaurora.org>
> 
> When ever an iova alloc request fails we free the iova
> ranges present in the percpu iova rcaches and then retry
> but the global iova rcache is not freed as a result we could
> still see iova alloc failure even after retry as global
> rcache is holding the iova's which can cause fragmentation.
> So, free the global iova rcache as well and then go for the
> retry.

This looks reasonable to me - it's mildly annoying that we end up with 
so many similar-looking functions, but the necessary differences are 
right down in the middle of the loops so nothing can reasonably be 
factored out :(

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
> ---
>   drivers/iommu/iova.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index c3a1a8e..faf9b13 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -25,6 +25,7 @@ static void init_iova_rcaches(struct iova_domain *iovad);
>   static void free_iova_rcaches(struct iova_domain *iovad);
>   static void fq_destroy_all_entries(struct iova_domain *iovad);
>   static void fq_flush_timeout(struct timer_list *t);
> +static void free_global_cached_iovas(struct iova_domain *iovad);
>   
>   void
>   init_iova_domain(struct iova_domain *iovad, unsigned long granule,
> @@ -442,6 +443,7 @@ alloc_iova_fast(struct iova_domain *iovad, unsigned long size,
>   		flush_rcache = false;
>   		for_each_online_cpu(cpu)
>   			free_cpu_cached_iovas(cpu, iovad);
> +		free_global_cached_iovas(iovad);
>   		goto retry;
>   	}
>   
> @@ -1057,5 +1059,26 @@ void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
>   	}
>   }
>   
> +/*
> + * free all the IOVA ranges of global cache
> + */
> +static void free_global_cached_iovas(struct iova_domain *iovad)
> +{
> +	struct iova_rcache *rcache;
> +	unsigned long flags;
> +	int i, j;
> +
> +	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
> +		rcache = &iovad->rcaches[i];
> +		spin_lock_irqsave(&rcache->lock, flags);
> +		for (j = 0; j < rcache->depot_size; ++j) {
> +			iova_magazine_free_pfns(rcache->depot[j], iovad);
> +			iova_magazine_free(rcache->depot[j]);
> +			rcache->depot[j] = NULL;
> +		}
> +		rcache->depot_size = 0;
> +		spin_unlock_irqrestore(&rcache->lock, flags);
> +	}
> +}
>   MODULE_AUTHOR("Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>");
>   MODULE_LICENSE("GPL");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
