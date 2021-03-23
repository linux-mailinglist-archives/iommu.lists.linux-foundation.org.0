Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 638B9345E69
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 13:45:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D55F983DC1;
	Tue, 23 Mar 2021 12:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiPrYlrFz2gN; Tue, 23 Mar 2021 12:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB11D83DE3;
	Tue, 23 Mar 2021 12:45:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B291AC0001;
	Tue, 23 Mar 2021 12:45:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE1DCC0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 12:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC92E6081A
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 12:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_TBXxlr3GCD for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 12:45:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9AF0606A5
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 12:45:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6F23D6E;
 Tue, 23 Mar 2021 05:45:32 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972D93F719;
 Tue, 23 Mar 2021 05:45:31 -0700 (PDT)
Subject: Re: [PATCH 1/3] iova: Add CPU hotplug handler to flush rcaches
To: John Garry <john.garry@huawei.com>, dwmw2@infradead.org,
 baolu.lu@linux.intel.com, joro@8bytes.org, will@kernel.org
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
 <1614600741-15696-2-git-send-email-john.garry@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7085b559-3d84-2bc1-5c36-8e034a66f8fc@arm.com>
Date: Tue, 23 Mar 2021 12:45:29 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1614600741-15696-2-git-send-email-john.garry@huawei.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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

On 2021-03-01 12:12, John Garry wrote:
> Like the intel IOMMU driver already does, flush the per-IOVA domain
> CPU rcache when a CPU goes offline - there's no point in keeping it.

Thanks John!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/iommu/iova.c       | 30 +++++++++++++++++++++++++++++-
>   include/linux/cpuhotplug.h |  1 +
>   include/linux/iova.h       |  1 +
>   3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index e6e2fa85271c..c78312560425 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -25,6 +25,17 @@ static void init_iova_rcaches(struct iova_domain *iovad);
>   static void free_iova_rcaches(struct iova_domain *iovad);
>   static void fq_destroy_all_entries(struct iova_domain *iovad);
>   static void fq_flush_timeout(struct timer_list *t);
> +
> +static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct iova_domain *iovad;
> +
> +	iovad = hlist_entry_safe(node, struct iova_domain, cpuhp_dead);
> +
> +	free_cpu_cached_iovas(cpu, iovad);
> +	return 0;
> +}
> +
>   static void free_global_cached_iovas(struct iova_domain *iovad);
>   
>   void
> @@ -51,6 +62,7 @@ init_iova_domain(struct iova_domain *iovad, unsigned long granule,
>   	iovad->anchor.pfn_lo = iovad->anchor.pfn_hi = IOVA_ANCHOR;
>   	rb_link_node(&iovad->anchor.node, NULL, &iovad->rbroot.rb_node);
>   	rb_insert_color(&iovad->anchor.node, &iovad->rbroot);
> +	cpuhp_state_add_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD, &iovad->cpuhp_dead);
>   	init_iova_rcaches(iovad);
>   }
>   EXPORT_SYMBOL_GPL(init_iova_domain);
> @@ -257,10 +269,21 @@ int iova_cache_get(void)
>   {
>   	mutex_lock(&iova_cache_mutex);
>   	if (!iova_cache_users) {
> +		int ret;
> +
> +		ret = cpuhp_setup_state_multi(CPUHP_IOMMU_IOVA_DEAD, "iommu/iova:dead", NULL,
> +					iova_cpuhp_dead);
> +		if (ret) {
> +			mutex_unlock(&iova_cache_mutex);
> +			pr_err("Couldn't register cpuhp handler\n");
> +			return ret;
> +		}
> +
>   		iova_cache = kmem_cache_create(
>   			"iommu_iova", sizeof(struct iova), 0,
>   			SLAB_HWCACHE_ALIGN, NULL);
>   		if (!iova_cache) {
> +			cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
>   			mutex_unlock(&iova_cache_mutex);
>   			pr_err("Couldn't create iova cache\n");
>   			return -ENOMEM;
> @@ -282,8 +305,10 @@ void iova_cache_put(void)
>   		return;
>   	}
>   	iova_cache_users--;
> -	if (!iova_cache_users)
> +	if (!iova_cache_users) {
> +		cpuhp_remove_multi_state(CPUHP_IOMMU_IOVA_DEAD);
>   		kmem_cache_destroy(iova_cache);
> +	}
>   	mutex_unlock(&iova_cache_mutex);
>   }
>   EXPORT_SYMBOL_GPL(iova_cache_put);
> @@ -606,6 +631,9 @@ void put_iova_domain(struct iova_domain *iovad)
>   {
>   	struct iova *iova, *tmp;
>   
> +	cpuhp_state_remove_instance_nocalls(CPUHP_IOMMU_IOVA_DEAD,
> +					    &iovad->cpuhp_dead);
> +
>   	free_iova_flush_queue(iovad);
>   	free_iova_rcaches(iovad);
>   	rbtree_postorder_for_each_entry_safe(iova, tmp, &iovad->rbroot, node)
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index f14adb882338..cedac9986557 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -58,6 +58,7 @@ enum cpuhp_state {
>   	CPUHP_NET_DEV_DEAD,
>   	CPUHP_PCI_XGENE_DEAD,
>   	CPUHP_IOMMU_INTEL_DEAD,
> +	CPUHP_IOMMU_IOVA_DEAD,
>   	CPUHP_LUSTRE_CFS_DEAD,
>   	CPUHP_AP_ARM_CACHE_B15_RAC_DEAD,
>   	CPUHP_PADATA_DEAD,
> diff --git a/include/linux/iova.h b/include/linux/iova.h
> index c834c01c0a5b..4be6c0ab4997 100644
> --- a/include/linux/iova.h
> +++ b/include/linux/iova.h
> @@ -95,6 +95,7 @@ struct iova_domain {
>   						   flush-queues */
>   	atomic_t fq_timer_on;			/* 1 when timer is active, 0
>   						   when not */
> +	struct hlist_node	cpuhp_dead;
>   };
>   
>   static inline unsigned long iova_size(struct iova *iova)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
