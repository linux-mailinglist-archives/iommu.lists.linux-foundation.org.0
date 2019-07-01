Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF35BDAA
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 16:09:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7AA6B4C00;
	Mon,  1 Jul 2019 14:09:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 83E0EAD1
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 14:09:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1B344854
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 14:09:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D6E344;
	Mon,  1 Jul 2019 07:09:48 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82FB63F246;
	Mon,  1 Jul 2019 07:09:47 -0700 (PDT)
Subject: Re: DMA-API attr - DMA_ATTR_NO_KERNEL_MAPPING
To: Pankaj Suryawanshi <pankajssuryawanshi@gmail.com>,
	Christoph Hellwig <hch@infradead.org>
References: <CACDBo564RoWpi8y2pOxoddnn0s3f3sA-fmNxpiXuxebV5TFBJA@mail.gmail.com>
	<CACDBo55GfomD4yAJ1qaOvdm8EQaD-28=etsRHb39goh+5VAeqw@mail.gmail.com>
	<20190626175131.GA17250@infradead.org>
	<CACDBo56fNVxVyNEGtKM+2R0X7DyZrrHMQr6Yw4NwJ6USjD5Png@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c9fe4253-5698-a226-c643-32a21df8520a@arm.com>
Date: Mon, 1 Jul 2019 15:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACDBo56fNVxVyNEGtKM+2R0X7DyZrrHMQr6Yw4NwJ6USjD5Png@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Michal Hocko <mhocko@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 28/06/2019 17:29, Pankaj Suryawanshi wrote:
> On Wed, Jun 26, 2019 at 11:21 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, Jun 26, 2019 at 10:12:45PM +0530, Pankaj Suryawanshi wrote:
>>> [CC: linux kernel and Vlastimil Babka]
>>
>> The right list is the list for the DMA mapping subsystem, which is
>> iommu@lists.linux-foundation.org.  I've also added that.
>>
>>>> I am writing driver in which I used DMA_ATTR_NO_KERNEL_MAPPING attribute
>>>> for cma allocation using dma_alloc_attr(), as per kernel docs
>>>> https://www.kernel.org/doc/Documentation/DMA-attributes.txt  buffers
>>>> allocated with this attribute can be only passed to user space by calling
>>>> dma_mmap_attrs().
>>>>
>>>> how can I mapped in kernel space (after dma_alloc_attr with
>>>> DMA_ATTR_NO_KERNEL_MAPPING ) ?
>>
>> You can't.  And that is the whole point of that API.
> 
> 1. We can again mapped in kernel space using dma_remap() api , because
> when we are using  DMA_ATTR_NO_KERNEL_MAPPING for dma_alloc_attr it
> returns the page as virtual address(in case of CMA) so we can mapped
> it again using dma_remap().

No, you really can't. A caller of dma_alloc_attrs(..., 
DMA_ATTR_NO_KERNEL_MAPPING) cannot make any assumptions about the void* 
it returns, other than that it must be handed back to dma_free_attrs() 
later. The implementation is free to ignore the flag and give back a 
virtual mapping anyway. Any driver which depends on how one particular 
implementation on one particular platform happens to behave today is, 
essentially, wrong.

> 2. We can mapped in kernel space using vmap() as used for ion-cma
> https://github.com/torvalds/linux/tree/master/drivers/staging/android/ion
>   as used in function ion_heap_map_kernel().
> 
> Please let me know if i am missing anything.

If you want a kernel mapping, *don't* explicitly request not to have a 
kernel mapping in the first place. It's that simple.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
