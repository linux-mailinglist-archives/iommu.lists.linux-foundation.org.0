Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABB45CAC7
	for <lists.iommu@lfdr.de>; Wed, 24 Nov 2021 18:22:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D3C404B5;
	Wed, 24 Nov 2021 17:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k4gq1W-mh89; Wed, 24 Nov 2021 17:21:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 64D09404B2;
	Wed, 24 Nov 2021 17:21:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 197CFC0036;
	Wed, 24 Nov 2021 17:21:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80B2EC0012
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 17:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67C3A4024B
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 17:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ExzBeCtBfjmU for <iommu@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 17:21:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5A6401FC
 for <iommu@lists.linux-foundation.org>; Wed, 24 Nov 2021 17:21:55 +0000 (UTC)
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Hznq50kqBz67vp0;
 Thu, 25 Nov 2021 01:21:21 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 18:21:51 +0100
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 24 Nov 2021 17:21:50 +0000
Subject: Re: [PATCH 0/9] iommu: Refactor flush queues into iommu-dma
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>
References: <cover.1637671820.git.robin.murphy@arm.com>
Message-ID: <7f7daf42-8aff-b9ed-0f48-d4158896012e@huawei.com>
Date: Wed, 24 Nov 2021 17:21:50 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <cover.1637671820.git.robin.murphy@arm.com>
Content-Language: en-US
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 willy@infradead.org
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
From: John Garry via iommu <iommu@lists.linux-foundation.org>
Reply-To: John Garry <john.garry@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 23/11/2021 14:10, Robin Murphy wrote:
> As promised, this series cleans up the flush queue code and streamlines
> it directly into iommu-dma. Since we no longer have per-driver DMA ops
> implementations, a lot of the abstraction is now no longer necessary, so
> there's a nice degree of simplification in the process. Un-abstracting
> the queued page freeing mechanism is also the perfect opportunity to
> revise which struct page fields we use so we can be better-behaved
> from the MM point of view, thanks to Matthew.
> 
> These changes should also make it viable to start using the gather
> freelist in io-pgtable-arm, and eliminate some more synchronous
> invalidations from the normal flow there, but that is proving to need a
> bit more careful thought than I have time for in this cycle, so I've
> parked that again for now and will revisit it in the new year.
> 
> For convenience, branch at:
>    https://gitlab.arm.com/linux-arm/linux-rm/-/tree/iommu/iova
> 
> I've build-tested for x86_64, and boot-tested arm64 to the point of
> confirming that put_pages_list() gets passed a valid empty list when
> flushing, while everything else still works.
My interest is in patches 2, 3, 7, 8, 9, and they look ok. I did a bit 
of testing for strict and non-strict mode on my arm64 system and no 
problems.

Apart from this, I noticed that one possible optimization could be to 
avoid so many reads of fq_flush_finish_cnt, as we seem to have a pattern 
of fq_flush_iotlb()->atomic64_inc(fq_flush_finish_cnt) followed by a 
read of fq_flush_finish_cnt in fq_ring_free(), so we could use 
atomic64_inc_return(fq_flush_finish_cnt) and reuse the value. I think 
that any racing in fq_flush_finish_cnt accesses are latent, but maybe 
there is a flaw in this. However I tried something along these lines and 
got a 2.4% throughput gain for my storage scenario.

Thanks,
John
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
