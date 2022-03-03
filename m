Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A04CBE78
	for <lists.iommu@lfdr.de>; Thu,  3 Mar 2022 14:05:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70E35813EE;
	Thu,  3 Mar 2022 13:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zq_Va4DgFfOJ; Thu,  3 Mar 2022 13:05:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 621FC813FD;
	Thu,  3 Mar 2022 13:05:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3029CC0085;
	Thu,  3 Mar 2022 13:05:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18420C000B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 13:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3DA241582
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 13:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QELBilwknBB for <iommu@lists.linux-foundation.org>;
 Thu,  3 Mar 2022 13:05:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8DC94156F
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 13:05:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F005C1480;
 Thu,  3 Mar 2022 05:05:04 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94FC73F70D;
 Thu,  3 Mar 2022 05:05:02 -0800 (PST)
Message-ID: <c63267a4-31f1-720e-c0e7-22a58ed4577a@arm.com>
Date: Thu, 3 Mar 2022 13:04:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] iommu/iova: Reset max32_alloc_size after cleaning
Content-Language: en-GB
To: "yf.wang@mediatek.com" <yf.wang@medaitek.com>,
 Miles Chen <miles.chen@mediatek.com>
References: <ca208635-449b-2c94-7317-09ed8eb86a2c@arm.com>
 <20220302235238.13099-1-miles.chen@mediatek.com>
 <7a56546b6333cfac175080ff35c74415d35cd628.camel@medaitek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <7a56546b6333cfac175080ff35c74415d35cd628.camel@medaitek.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Libo.Kang@mediatek.com, yf.wang@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Ning.Li@mediatek.com,
 matthias.bgg@gmail.com, stable@vger.kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On 2022-03-03 03:43, yf.wang@mediatek.com wrote:
> On Thu, 2022-03-03 at 07:52 +0800, Miles Chen wrote:
>> Thanks for your explanation.
>>
>> YF showed me some numbers yesterday and maybe we can have a further
>> discussion in that test case. (It looks like that some iovas are
>> freed but
>> their pfn_lo(s) are less than cached_iova->pfn_lo, so
>> max32_alloc_size is not
>> reset. So there are enought free iovas but the allocation still
>> failed)
>>
>> __cached_rbnode_delete_update(struct iova_domain *iovad, struct iova
>> *free)
>> {
>> 	struct iova *cached_iova;
>>
>> 	cached_iova = to_iova(iovad->cached32_node);
>> 	if (free == cached_iova ||
>> 		(free->pfn_hi < iovad->dma_32bit_pfn &&
>> 		 free->pfn_lo >= cached_iova->pfn_lo)) {
>> 		iovad->cached32_node = rb_next(&free->node);
>> 		iovad->max32_alloc_size = iovad->dma_32bit_pfn;
>> 	}
>> 	...
>> }
>>
>> Hi YF,
>> Could your share your observation of the iova allocation failure you
>> hit?
>>
>> Thanks,
>> Miles
> 
> Hi Miles & Robin,
> 
> The scenario we encountered in our actual test:
> An iova domain with a 3GB iova region (0x4000_0000~0x1_0000_0000),
> only alloc iova total size 614788KB), then alloc iova size=0x731f000
> fail, and then the retry mechanism is free 300 cache iova at first,
> and then retry still fail, the reason for fail is blocked by the
> check condition (size >= iovad->max32_alloc_size) and goto iova32_full
> directly.
> 
> Why is no reset max32_alloc_size in __cached_rbnode_delete_update?
> Because of the pfn_lo of the freed cache iova is smaller than the
> current cached32_node's pfn_lo (free->pfn_lo < cached_iova->pfn_lo),
> so will not execute (iovad->max32_alloc_size = iovad->dma_32bit_pfn),
> is blocked by the check condition (free->pfn_lo >= cached_iova-
>> pfn_lo).
> 
> The issue observed during stress testing, when alloc fail reset
> max32_alloc_size to retry can help to allocate iova to those lower
> addresses.

Oh, now I see what's going on, thanks for clarifying. This is a 
wonderfully obscure corner case, but ultimately what comes out of it is 
that there's an assumption in __cached_rbnode_delete_update() which I 
think was OK at the time it was written (due to other limitations), but 
now deserves to be remedied.

The proper fix is simple to make, but I think I'll need to have my lunch 
before trying to write up the reasoning behind it for a patch... :)

Thanks,
Robin.

> The following is the actual stress test log dump:
> ('pfn_lo', 'size' and 'pfn_hi' has iova_shift in dump log)
> size:                 0x731f000
> max32_alloc_size:     0x731f000
> cached_iova:          0xffffff814751a1c0
> cached_iova->pfn_lo:  0xf3500000
> cached_iova->pfn_hi:  0xf35ff000
> 
> 1.__alloc_and_insert_iova_range_fail
> [name:iova&]__alloc_and_insert_iova_range_fail:
> iovad:0xffffff80d5be2808
>    {granule:0x1000, start_pfn:0x40000, dma_32bit_pfn:0x100000,
>    max32_alloc_size:0x731f},size:0x731f
> 
> 2.dump all iova nodes of rbtree, contain cached iova:
> [name:iova&]dump_iova_rbtree start, iovad:0xffffff80d5be2808
>    {rbroot:0xffffff814751a4c0, cached_node:0xffffff80d5be2860,
>    cached32_node:0xffffff814751a1c0, granule:0x1000, start_pfn:0x40000,
>    dma_32bit_pfn:0x100000, max32_alloc_size:0x731f}
> 
> ('pfn_lo', 'size' and 'pfn_hi' has iova_shift in dump log)
> [name:iova&]index    iova_object       pfn_lo     size       pfn_hi
> [name:iova&]  1 0xffffff814751ae00  0x40800000  0x4c9000     0x40cc8000
> [name:iova&]  2 0xffffff807c960880  0x40d00000  0xc4000      0x40dc3000
>    ...322 lines of log are omitted here...
> [name:iova&]325 0xffffff814751a1c0  0xf3500000  0x100000     0xf35ff000
> [name:iova&]326 0xffffff8004552080  0xf3600000  0x100000     0xf36ff000
> [name:iova&]327 0xffffff80045524c0  0xf3700000  0xbc000      0xf37bb000
> [name:iova&]328 0xffffff814751a700  0xf3800000  0x265000     0xf3a64000
> [name:iova&]329 0xffffff8004552180  0xf3c00000  0xa13000     0xf4612000
> [name:iova&]330 0xffffff80c1b3eb40  0xf4800000  0xb400000    0xffbff000
> [name:iova&]331 0xffffff80d6e0b580  0xffcff000  0x1000       0xffcff000
> [name:iova&]332 0xffffff80c8395140  0xffd00000  0x80000      0xffd7f000
> [name:iova&]333 0xffffff80c8395000  0xffde0000  0x20000      0xffdff000
> [name:iova&]334 0xffffff80c8395380  0xffe00000  0x80000      0xffe7f000
> [name:iova&]335 0xffffff80c8395880  0xffec0000  0x20000      0xffedf000
> [name:iova&]336 0xffffff80c83957c0  0xffef9000  0x1000       0xffef9000
> [name:iova&]337 0xffffff80c83956c0  0xffefa000  0x1000       0xffefa000
> [name:iova&]338 0xffffff80c8395f40  0xffefb000  0x1000       0xffefb000
> [name:iova&]339 0xffffff80c8395a80  0xffefc000  0x4000       0xffeff000
> [name:iova&]340 0xffffff80c1b3e840  0xfff00000  0x100000     0xfffff000
> [name:iova&] 41 0xffffff80d5be2860  0xfffffffffffff000 0x1000
> 0xfffffffffffff000
> [name:iova&]dump_iova_rbtree done, iovad:0xffffff80d5be2808,
>    count:341, total_size:625876KB
> 
> 3.alloc fail, flushing rcache and retry.
> [name:iova&]alloc_iova_fast, flushing rcache and retry,
>    iovad:0xffffff80d5be2808, size:0x731f, limit_pfn:0xfffff
> 
> 4.retry is executed into the __alloc_and_insert_iova_range function:
> [name:iova&]__alloc_and_insert_iova_range fail goto iova32_full,
>    iovad:0xffffff80d5be2808 {granule:0x1000, start_pfn:0x40000,
>    dma_32bit_pfn:0x100000, max32_alloc_size:0x731f},size:0x731f
> 
> 5.dump all iova nodes of rbtree, current caches is already empty:
> [name:iova&]dump_iova_rbtree start, iovad:0xffffff80d5be2808
>    {rbroot:0xffffff80fe76da80, cached_node:0xffffff80d5be2860,
>    cached32_node:0xffffff814751a1c0, granule:0x1000, start_pfn:0x40000,
>    dma_32bit_pfn:0x100000, max32_alloc_size:0x731f}
> 
> ('pfn_lo', 'size' and 'pfn_hi' has iova_shift in dump log)
> [name:iova&]index    iova_object       pfn_lo     size       pfn_hi
> [name:iova&]  1 0xffffff814751ae00  0x40800000  0x4c9000     0x40cc8000
> [name:iova&]  2 0xffffff807c960880  0x40d00000  0xc4000      0x40dc3000
> [name:iova&]  3 0xffffff81487ce840  0x40e00000  0x37a000     0x41179000
> [name:iova&]  4 0xffffff80fe76d600  0x41200000  0x2400000    0x435ff000
> [name:iova&]  5 0xffffff8004552000  0x46800000  0x47e2000    0x4afe1000
> [name:iova&]  6 0xffffff807c960a40  0x50200000  0x400000     0x505ff000
> [name:iova&]  7 0xffffff818cdb5780  0x50600000  0x265000     0x50864000
> [name:iova&]  8 0xffffff814751a440  0x50a00000  0x2ae000     0x50cad000
> [name:iova&]  9 0xffffff818cdb5d40  0x50e00000  0x4c9000     0x512c8000
> [name:iova&] 10 0xffffff81487cef40  0x51400000  0x1a25000    0x52e24000
> [name:iova&] 11 0xffffff818cdb5140  0x53c00000  0x400000     0x53fff000
> [name:iova&] 12 0xffffff814751a7c0  0x54000000  0x400000     0x543ff000
> [name:iova&] 13 0xffffff80fe76d2c0  0x54500000  0xbc000      0x545bb000
> [name:iova&] 14 0xffffff81487ce0c0  0x54600000  0x400000     0x549ff000
> [name:iova&] 15 0xffffff80fe76d740  0x54a00000  0xbc000      0x54abb000
> [name:iova&] 16 0xffffff8004552440  0x54b00000  0xbc000      0x54bbb000
> [name:iova&] 17 0xffffff80fe76db80  0x54c00000  0x47e2000    0x593e1000
> [name:iova&] 18 0xffffff818cdb5440  0x65000000  0x400000     0x653ff000
> [name:iova&] 19 0xffffff8004552880  0x65400000  0x47e2000    0x69be1000
> [name:iova&] 20 0xffffff814751acc0  0x6c7e0000  0x20000      0x6c7ff000
> [name:iova&] 21 0xffffff80fe76d700  0x6c800000  0x47e2000    0x70fe1000
> //0x70fe1000 - 0xebc00000 = 0x7ac1f000:This free range is large enough
> [name:iova&] 22 0xffffff80fe76da80  0xebc00000  0x400000     0xebfff000
> [name:iova&] 23 0xffffff80045523c0  0xec000000  0x400000     0xec3ff000
> [name:iova&] 24 0xffffff8004552780  0xec400000  0x400000     0xec7ff000
> [name:iova&] 25 0xffffff814751a1c0  0xf3500000  0x100000     0xf35ff000
> [name:iova&] 26 0xffffff8004552080  0xf3600000  0x100000     0xf36ff000
> [name:iova&] 27 0xffffff80045524c0  0xf3700000  0xbc000      0xf37bb000
> [name:iova&] 28 0xffffff814751a700  0xf3800000  0x265000     0xf3a64000
> [name:iova&] 29 0xffffff8004552180  0xf3c00000  0xa13000     0xf4612000
> [name:iova&] 30 0xffffff80c1b3eb40  0xf4800000  0xb400000    0xffbff000
> [name:iova&] 31 0xffffff80d6e0b580  0xffcff000  0x1000       0xffcff000
> [name:iova&] 32 0xffffff80c8395140  0xffd00000  0x80000      0xffd7f000
> [name:iova&] 33 0xffffff80c8395000  0xffde0000  0x20000      0xffdff000
> [name:iova&] 34 0xffffff80c8395380  0xffe00000  0x80000      0xffe7f000
> [name:iova&] 35 0xffffff80c8395880  0xffec0000  0x20000      0xffedf000
> [name:iova&] 36 0xffffff80c83957c0  0xffef9000  0x1000       0xffef9000
> [name:iova&] 37 0xffffff80c83956c0  0xffefa000  0x1000       0xffefa000
> [name:iova&] 38 0xffffff80c8395f40  0xffefb000  0x1000       0xffefb000
> [name:iova&] 39 0xffffff80c8395a80  0xffefc000  0x4000       0xffeff000
> [name:iova&] 40 0xffffff80c1b3e840  0xfff00000  0x100000     0xfffff000
> [name:iova&] 41 0xffffff80d5be2860  0xfffffffffffff000 0x1000
> 0xfffffffffffff000
> [name:iova&]dump_iova_rbtree done, iovad:0xffffff80d5be2808,
> count:41, total_size:614788KB
> 
> Thanks,
> Yunfei.
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
