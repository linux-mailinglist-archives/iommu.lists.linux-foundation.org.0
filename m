Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B219E3D7866
	for <lists.iommu@lfdr.de>; Tue, 27 Jul 2021 16:23:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45682607F1;
	Tue, 27 Jul 2021 14:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMTrslM5Ya0S; Tue, 27 Jul 2021 14:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3922607E6;
	Tue, 27 Jul 2021 14:23:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CC0BC001F;
	Tue, 27 Jul 2021 14:23:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2362C000E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 14:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3662607E6
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 14:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lXbFRiE4YqOE for <iommu@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 14:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B0D6607A8
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 14:23:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D719B1FB;
 Tue, 27 Jul 2021 07:23:26 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5612C3F66F;
 Tue, 27 Jul 2021 07:23:25 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: kmemleak when disable SRIOV.
To: "Zhou, Peng Ju" <PengJu.Zhou@amd.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20210722081629.7863-1-PengJu.Zhou@amd.com>
 <4b59b7ee-5258-a2ca-531c-b1b5d9c064e7@arm.com>
 <DM8PR12MB5478D90255FF1379E44AC51AF8E99@DM8PR12MB5478.namprd12.prod.outlook.com>
 <c86a8861-64b5-92dc-b664-b31402f23db3@arm.com>
 <DM8PR12MB5478DD7F296EB264848680EEF8E99@DM8PR12MB5478.namprd12.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e6675688-c5a7-448f-84f4-bba0217d99a6@arm.com>
Date: Tue, 27 Jul 2021 15:23:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5478DD7F296EB264848680EEF8E99@DM8PR12MB5478.namprd12.prod.outlook.com>
Content-Language: en-GB
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wang,
 Yin" <Yin.Wang@amd.com>, "will@kernel.org" <will@kernel.org>
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

On 2021-07-27 15:05, Zhou, Peng Ju wrote:
> [AMD Official Use Only]
> 
> Hi Robin
> The patch which add "head" :
> 
> commit 48a64dd561a53fb809e3f2210faf5dd442cfc56d
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Sat Jan 16 11:10:35 2021 +0000
> 
>      iommu/iova: Use bottom-up allocation for DMA32
> 
>      Since DMA32 allocations are currently allocated top-down from the 4G
>      boundary, this causes fragmentation and reduces the maximise allocation
>      size. On some systems, the dma address space may be extremely
>      constrained by PCIe windows, requiring a stronger anti-fragmentation
>      strategy.
> 
>      Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2929
>      Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

...which is not in mainline. I've never even seen it posted for review. 
In fact two search engines can't seem to find any trace of that SHA or 
patch subject on the internet at all.

By all means tell Chris that his patch, wherever you got it from, is 
broken, but once again there's nothing the upstream 
maintainers/reviewers can do about code which isn't upstream.

Thanks,
Robin.

> ----------------------------------------------------------------------
> BW
> Pengju Zhou
> 
> 
> 
>> -----Original Message-----
>> From: Robin Murphy <robin.murphy@arm.com>
>> Sent: Tuesday, July 27, 2021 4:52 PM
>> To: Zhou, Peng Ju <PengJu.Zhou@amd.com>; iommu@lists.linux-
>> foundation.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Wang, Yin
>> <Yin.Wang@amd.com>; will@kernel.org
>> Subject: Re: [PATCH] iommu/iova: kmemleak when disable SRIOV.
>>
>> On 2021-07-27 05:46, Zhou, Peng Ju wrote:
>>> [AMD Official Use Only]
>>>
>>> Hi Robin
>>> 1. it is not a good manner to free a statically allocated object(in this case, it
>> is iovad->head) dynamically even though the free only occurred when shut
>> down the OS in most cases.
>>> 2. the kmemleak occurred when disable SRIOV(remove a PCIE device), I
>>> post the log in the following, in the log, the line:" kmemleak: Found
>>> object by alias at 0xffff9221ae647050" means the OS frees a not
>>> existing object(iovad->head) which added to RB_TREE in the function
>>> init_iova_domain
>>
>> Sure, it was apparent enough what the bug was; my point is that the bug
>> does not exist in mainline. This is the current mainline definition of struct
>> iova_domain:
>>
>>
>> /* holds all the iova translations for a domain */ struct iova_domain {
>> 	spinlock_t	iova_rbtree_lock; /* Lock to protect update of rbtree
>> */
>> 	struct rb_root	rbroot;		/* iova domain rbtree root */
>> 	struct rb_node	*cached_node;	/* Save last alloced node */
>> 	struct rb_node	*cached32_node; /* Save last 32-bit alloced node */
>> 	unsigned long	granule;	/* pfn granularity for this domain */
>> 	unsigned long	start_pfn;	/* Lower limit for this domain */
>> 	unsigned long	dma_32bit_pfn;
>> 	unsigned long	max32_alloc_size; /* Size of last failed allocation */
>> 	struct iova_fq __percpu *fq;	/* Flush Queue */
>>
>> 	atomic64_t	fq_flush_start_cnt;	/* Number of TLB flushes
>> that
>> 						   have been started */
>>
>> 	atomic64_t	fq_flush_finish_cnt;	/* Number of TLB flushes
>> that
>> 						   have been finished */
>>
>> 	struct iova	anchor;		/* rbtree lookup anchor */
>> 	struct iova_rcache rcaches[IOVA_RANGE_CACHE_MAX_SIZE];	/*
>> IOVA range caches */
>>
>> 	iova_flush_cb	flush_cb;	/* Call-Back function to flush IOMMU
>> 					   TLBs */
>>
>> 	iova_entry_dtor entry_dtor;	/* IOMMU driver specific destructor
>> for
>> 					   iova entry */
>>
>> 	struct timer_list fq_timer;		/* Timer to regularily empty
>> the
>> 						   flush-queues */
>> 	atomic_t fq_timer_on;			/* 1 when timer is active, 0
>> 						   when not */
>> 	struct hlist_node	cpuhp_dead;
>> };
>>
>>
>> Please point to where "head" exists either way ;)
>>
>> The mainline code already has a special case to avoid trying to free the
>> statically-allocated "anchor" node. Whoever modified your kernel has
>> apparently failed to preserve the equivalent behaviour.
>>
>> Robin.
>>
>>> The patch I sent out may don't meet IOMMU requirement because I have
>> no knowledge of the background of IOMMU, but this patch can fix this
>> kmemleak.
>>>
>>> The kmemleak log on my server:
>>> 316613 Jul 19 02:14:20 z-u18 kernel: [  108.967526] pci 0000:83:02.0:
>>> Removing from iommu group 108
>>> 316614 Jul 19 02:14:20 z-u18 kernel: [  108.969032] kmemleak: Found
>> object by alias at 0xffff9221ae647050
>>> 316615 Jul 19 02:14:20 z-u18 kernel: [  108.969037] CPU: 30 PID: 2768
>> Comm: modprobe Tainted: G           OE     5.11.0 #       12
>>> 316616 Jul 19 02:14:20 z-u18 kernel: [  108.969042] Hardware name:
>> Supermicro ...
>>> 316617 Jul 19 02:14:20 z-u18 kernel: [  108.969045] Call Trace:
>>> 316618 Jul 19 02:14:20 z-u18 kernel: [  108.969049]
>>> dump_stack+0x6d/0x88
>>> 316619 Jul 19 02:14:20 z-u18 kernel: [  108.969061]
>>> lookup_object+0x5f/0x70
>>> 316620 Jul 19 02:14:20 z-u18 kernel: [  108.969070]
>>> find_and_remove_object+0x29/0x80
>>> 316621 Jul 19 02:14:20 z-u18 kernel: [  108.969077]
>>> delete_object_full+0xc/0x20
>>> 316622 Jul 19 02:14:20 z-u18 kernel: [  108.969083]
>>> kmem_cache_free+0x22b/0x410
>>> 316623 Jul 19 02:14:20 z-u18 kernel: [  108.969097]
>>> free_iova_mem+0x22/0x60
>>> 316624 Jul 19 02:14:20 z-u18 kernel: [  108.969103]
>>> put_iova_domain+0x1b5/0x1e0
>>> 316625 Jul 19 02:14:20 z-u18 kernel: [  108.969108]
>>> iommu_put_dma_cookie+0x44/0xc0
>>> 316626 Jul 19 02:14:20 z-u18 kernel: [  108.969118]
>>> domain_exit+0xba/0xc0
>>> 316627 Jul 19 02:14:20 z-u18 kernel: [  108.969123]
>>> iommu_group_release+0x51/0x90
>>> 316628 Jul 19 02:14:20 z-u18 kernel: [  108.969129]
>>> kobject_put+0xa7/0x210
>>> 316629 Jul 19 02:14:20 z-u18 kernel: [  108.969140]
>>> iommu_release_device+0x41/0x80
>>> 316630 Jul 19 02:14:20 z-u18 kernel: [  108.969147]
>>> iommu_bus_notifier+0xa0/0xc0
>>> 316631 Jul 19 02:14:20 z-u18 kernel: [  108.969153]
>>> blocking_notifier_call_chain+0x63/0x90
>>> 316632 Jul 19 02:14:20 z-u18 kernel: [  108.969162]
>>> device_del+0x29c/0x3f0
>>> 316633 Jul 19 02:14:20 z-u18 kernel: [  108.969167]
>>> pci_remove_bus_device+0x77/0x100
>>> 316634 Jul 19 02:14:20 z-u18 kernel: [  108.969178]
>>> pci_iov_remove_virtfn+0xbc/0x110
>>> 316635 Jul 19 02:14:20 z-u18 kernel: [  108.969187]
>>> sriov_disable+0x2f/0xe0 ......
>>> 316651 Jul 19 02:14:20 z-u18 kernel: [  108.969629] RIP:
>> 0033:0x7f6d8ec45047
>>> 316652 Jul 19 02:14:20 z-u18 kernel: [  108.969634] Code: 73 01 c3 48 8b
>> 0d 41 8e 2c 00 f7 d8 64 89 01 48 83 c8 ff c3 66        2e 0f 1f 84 00 00 00 00
>> 00 0f 1f 44 00 00 b8 b0 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d
>> 11 8e 2c 00 f       7 d8 64 89 01 48
>>> 316653 Jul 19 02:14:20 z-u18 kernel: [  108.969638] RSP:
>> 002b:00007ffc18dafc48 EFLAGS: 00000206 ORIG_RAX: 00000000000000b
>> 0
>>> 316654 Jul 19 02:14:20 z-u18 kernel: [  108.969645] RAX:
>>> ffffffffffffffda RBX: 000055817f00adc0 RCX: 00007f6d8ec45047
>>> 316655 Jul 19 02:14:20 z-u18 kernel: [  108.969648] RDX:
>>> 0000000000000000 RSI: 0000000000000800 RDI: 000055817f00ae28
>>> 316656 Jul 19 02:14:20 z-u18 kernel: [  108.969651] RBP:
>>> 000055817f00adc0 R08: 00007ffc18daebf1 R09: 0000000000000000
>>> 316657 Jul 19 02:14:20 z-u18 kernel: [  108.969654] R10:
>>> 00007f6d8ecc1c40 R11: 0000000000000206 R12: 000055817f00ae28
>>> 316658 Jul 19 02:14:20 z-u18 kernel: [  108.969656] R13:
>>> 0000000000000001 R14: 000055817f00ae28 R15: 00007ffc18db1030
>>> 316659 Jul 19 02:14:20 z-u18 kernel: [  108.969661] kmemleak: Object
>> 0xffff9221ae647000 (size 2048):
>>> 316660 Jul 19 02:14:20 z-u18 kernel: [  108.969665] kmemleak:   comm
>> "gpu_init_thread", pid 2687, jiffies 4294911321
>>> 316661 Jul 19 02:14:20 z-u18 kernel: [  108.969669] kmemleak:
>> min_count = 1
>>> 316662 Jul 19 02:14:20 z-u18 kernel: [  108.969671] kmemleak:   count = 0
>>> 316663 Jul 19 02:14:20 z-u18 kernel: [  108.969672] kmemleak:   flags =
>> 0x1
>>> 316664 Jul 19 02:14:20 z-u18 kernel: [  108.969674] kmemleak:   checksum
>> = 0
>>> 316665 Jul 19 02:14:20 z-u18 kernel: [  108.969675] kmemleak:   backtrace:
>>> 316666 Jul 19 02:14:20 z-u18 kernel: [  108.969677]
>> cookie_alloc+0x1f/0x60
>>> 316667 Jul 19 02:14:20 z-u18 kernel: [  108.969682]
>> iommu_get_dma_cookie+0x17/0x30
>>> 316668 Jul 19 02:14:20 z-u18 kernel: [  108.969685]
>> intel_iommu_domain_alloc+0xa7/0xe0
>>> 316669 Jul 19 02:14:20 z-u18 kernel: [  108.969689]
>> iommu_group_alloc_default_domain+0x4c/0x160
>>> 316670 Jul 19 02:14:20 z-u18 kernel: [  108.969695]
>> iommu_probe_device+0xff/0x130
>>> 316671 Jul 19 02:14:20 z-u18 kernel: [  108.969702]
>> iommu_bus_notifier+0x7c/0xc0
>>> 316672 Jul 19 02:14:20 z-u18 kernel: [  108.969708]
>> blocking_notifier_call_chain+0x63/0x90
>>> 316673 Jul 19 02:14:20 z-u18 kernel: [  108.969713]
>> device_add+0x3f9/0x860
>>> 316674 Jul 19 02:14:20 z-u18 kernel: [  108.969717]
>> pci_device_add+0x2c3/0x6a0
>>> 316675 Jul 19 02:14:20 z-u18 kernel: [  108.969723]
>> pci_iov_add_virtfn+0x1b1/0x300
>>> 316676 Jul 19 02:14:20 z-u18 kernel: [  108.969729]
>> sriov_enable+0x254/0x410
>>>
>>>
>>> ----------------------------------------------------------------------
>>> BW
>>> Pengju Zhou
>>>
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Robin Murphy <robin.murphy@arm.com>
>>>> Sent: Thursday, July 22, 2021 10:59 PM
>>>> To: Zhou, Peng Ju <PengJu.Zhou@amd.com>; iommu@lists.linux-
>>>> foundation.org
>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Wang, Yin
>>>> <Yin.Wang@amd.com>; will@kernel.org
>>>> Subject: Re: [PATCH] iommu/iova: kmemleak when disable SRIOV.
>>>>
>>>> On 2021-07-22 09:16, Peng Ju Zhou via iommu wrote:
>>>>> the object iova->head allocated statically when enable SRIOV but
>>>>> freed dynamically when disable SRIOV which causing kmemleak.
>>>>> changing the allocation from statically to dynamically.
>>>>
>>>> Thanks for the glimpse into the kind of weird and wonderful things
>>>> people are doing to the IOVA allocator out-of-tree (the "holes" list
>>>> sounds like an idea I also thought about a long time ago), but
>>>> judging by the context this patch is clearly of no use to mainline ;)
>>>>
>>>> Robin.
>>>>
>>>>> Signed-off-by: Peng Ju Zhou <PengJu.Zhou@amd.com>
>>>>> ---
>>>>>     drivers/iommu/iova.c | 15 ++++++++-------
>>>>>     include/linux/iova.h |  4 ++--
>>>>>     2 files changed, 10 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c index
>>>>> 2371524796d3..505881d8d97f 100644
>>>>> --- a/drivers/iommu/iova.c
>>>>> +++ b/drivers/iommu/iova.c
>>>>> @@ -26,6 +26,8 @@ static void free_iova_rcaches(struct iova_domain
>>>> *iovad);
>>>>>     static void fq_destroy_all_entries(struct iova_domain *iovad);
>>>>>     static void fq_flush_timeout(struct timer_list *t);
>>>>>     static void free_global_cached_iovas(struct iova_domain *iovad);
>>>>> +static inline struct iova *alloc_and_init_iova(unsigned long pfn_lo,
>>>>> +					       unsigned long pfn_hi);
>>>>>
>>>>>     void
>>>>>     init_iova_domain(struct iova_domain *iovad, unsigned long
>>>>> granule, @@ -47,17 +49,16 @@ init_iova_domain(struct iova_domain
>>>>> *iovad, unsigned long granule,
>>>>>
>>>>>     	INIT_LIST_HEAD(&iovad->holes);
>>>>>
>>>>> -	iovad->head.pfn_lo = 0;
>>>>> -	iovad->head.pfn_hi = start_pfn;
>>>>> -	rb_link_node(&iovad->head.node, NULL, &iovad->rbroot.rb_node);
>>>>> -	rb_insert_color(&iovad->head.node, &iovad->rbroot);
>>>>> -	list_add(&iovad->head.hole, &iovad->holes);
>>>>> +	iovad->head = alloc_and_init_iova(0, start_pfn);
>>>>> +	rb_link_node(&iovad->head->node, NULL, &iovad->rbroot.rb_node);
>>>>> +	rb_insert_color(&iovad->head->node, &iovad->rbroot);
>>>>> +	list_add(&iovad->head->hole, &iovad->holes);
>>>>>
>>>>>     	iovad->tail.pfn_lo = IOVA_ANCHOR;
>>>>>     	iovad->tail.pfn_hi = IOVA_ANCHOR;
>>>>>     	rb_link_node(&iovad->tail.node,
>>>>> -		     &iovad->head.node,
>>>>> -		     &iovad->head.node.rb_right);
>>>>> +		     &iovad->head->node,
>>>>> +		     &iovad->head->node.rb_right);
>>>>>     	rb_insert_color(&iovad->tail.node, &iovad->rbroot);
>>>>>
>>>>>     	init_iova_rcaches(iovad);
>>>>> diff --git a/include/linux/iova.h b/include/linux/iova.h index
>>>>> 076eb6cfc613..553905ef41fe 100644
>>>>> --- a/include/linux/iova.h
>>>>> +++ b/include/linux/iova.h
>>>>> @@ -81,7 +81,7 @@ struct iova_domain {
>>>>>     						   have been finished */
>>>>>
>>>>>     	struct list_head holes;
>>>>> -	struct iova	head, tail;		/* rbtree lookup anchors */
>>>>> +	struct iova	*head, tail;		/* rbtree lookup anchors */
>>>>>     	struct iova_rcache rcaches[IOVA_RANGE_CACHE_MAX_SIZE];	/*
>>>> IOVA range caches */
>>>>>
>>>>>     	iova_flush_cb	flush_cb;	/* Call-Back function to flush IOMMU
>>>>> @@ -252,7 +252,7 @@ static inline void
>>>>> free_cpu_cached_iovas(unsigned int cpu,
>>>>>
>>>>>     static inline unsigned long iovad_start_pfn(struct iova_domain *iovad)
>>>>>     {
>>>>> -	return iovad->head.pfn_hi;
>>>>> +	return iovad->head->pfn_hi;
>>>>>     }
>>>>>
>>>>>     #endif
>>>>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
