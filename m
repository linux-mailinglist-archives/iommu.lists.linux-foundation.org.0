Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8314FF770
	for <lists.iommu@lfdr.de>; Wed, 13 Apr 2022 15:11:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 031F640B69;
	Wed, 13 Apr 2022 13:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYQj0xzgx2HW; Wed, 13 Apr 2022 13:11:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 012824036F;
	Wed, 13 Apr 2022 13:11:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDA58C0088;
	Wed, 13 Apr 2022 13:11:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66B8FC002C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 13:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52858408AC
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 13:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OATlmoRk0exG for <iommu@lists.linux-foundation.org>;
 Wed, 13 Apr 2022 13:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA3E40880
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 13:11:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6446A12FC;
 Wed, 13 Apr 2022 06:11:02 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23AB13F73B;
 Wed, 13 Apr 2022 06:11:01 -0700 (PDT)
Message-ID: <4a993382-6a29-a0f4-4600-90ab60ad982a@arm.com>
Date: Wed, 13 Apr 2022 14:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] dma-direct: avoid redundant memory sync for swiotlb
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Chao Gao <chao.gao@intel.com>
References: <20220412113805.3210-1-chao.gao@intel.com>
 <e25fbb7e-a67e-5421-b7be-700fd0209b0d@arm.com>
 <20220413010157.GA10502@gao-cwp> <20220413045958.GA31209@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220413045958.GA31209@lst.de>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Wang Zhaoyang1 <zhaoyang1.wang@intel.com>, linux-kernel@vger.kernel.org,
 Gao Liang <liang.gao@intel.com>, iommu@lists.linux-foundation.org
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

On 2022-04-13 05:59, Christoph Hellwig wrote:
> On Wed, Apr 13, 2022 at 09:02:02AM +0800, Chao Gao wrote:
>> dma_direct_sync_single_for_cpu() also calls arch_sync_dma_for_cpu_all()
>> and arch_dma_mark_clean() in some cases. if SWIOTLB does sync internally,
>> should these two functions be called by SWIOTLB?
>>
>> Personally, it might be better if swiotlb can just focus on bounce buffer
>> alloc/free. Adding more DMA coherence logic into swiotlb will make it
>> a little complicated.
>>
>> How about an open-coded version of dma_direct_sync_single_for_cpu
>> in dma_direct_unmap_page with swiotlb_sync_single_for_cpu replaced by
>> swiotlb_tbl_unmap_single?
> 
> I don't think the swiotlb and non-coherent case ever fully worked.
> Before the merge of swiotlb into dma-direct they obviously were
> mutally exclusive, and even now all the cache maintainance is done
> on the physical address of the original data, not the swiotlb buffer.

Are you sure? AFAICS swiotlb_map() does the right thing, and 
dma_direct_{sync,unmap} are working off the DMA address, which is that 
of the bounce slot when SWIOTLB is involved (not least, how would the 
is_swiotlb_buffer() checks work otherwise?)

> If we want to fix that properly all the arch dma calls will need to
> move into swiotlb, but that is a much bigger patch.
> 
> So for now I'd be happy with the one liner presented here, but
> eventually the whole area could use an overhaul.

Sure, whoever gets round to tackling DMA_ATTR_NO_SNOOP first will need 
to go through all the cache maintenance hooks anyway, so happy to kick 
the can down the road until then.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
