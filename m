Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 075962A0A34
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 16:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF80C8731F;
	Fri, 30 Oct 2020 15:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3yyoQnA1KsH; Fri, 30 Oct 2020 15:48:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ECC248731B;
	Fri, 30 Oct 2020 15:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD536C0051;
	Fri, 30 Oct 2020 15:48:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDC71C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 15:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC6E485F7C
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 15:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8NlUFJ9tyE9 for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 15:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B9DFD85F45
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 15:48:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1720B1435;
 Fri, 30 Oct 2020 08:48:06 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C47C3F719;
 Fri, 30 Oct 2020 08:48:04 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: add benchmark support for streaming DMA
 APIs
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
References: <20201027035330.29612-1-song.bao.hua@hisilicon.com>
 <20201027035330.29612-2-song.bao.hua@hisilicon.com>
 <f9aebee4-5081-da8c-930c-c36617ab57c4@arm.com>
 <8fe90795064d4373b4af32959c4e9781@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <472cf21a-5196-dbb5-caef-c1c0d982fe1c@arm.com>
Date: Fri, 30 Oct 2020 15:48:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8fe90795064d4373b4af32959c4e9781@hisilicon.com>
Content-Language: en-GB
Cc: "shuah@kernel.org" <shuah@kernel.org>, "will@kernel.org" <will@kernel.org>,
 Linuxarm <linuxarm@huawei.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
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

On 2020-10-29 21:39, Song Bao Hua (Barry Song) wrote:
[...]
>>> +struct map_benchmark {
>>> +	__u64 map_nsec;
>>> +	__u64 unmap_nsec;
>>> +	__u32 threads; /* how many threads will do map/unmap in parallel */
>>> +	__u32 seconds; /* how long the test will last */
>>> +	int node; /* which numa node this benchmark will run on */
>>> +	__u64 expansion[10];	/* For future use */
>>> +};
>>
>> I'm no expert on userspace ABIs (and what little experience I do have is
>> mostly of Win32...), so hopefully someone else will comment if there's
>> anything of concern here. One thing I wonder is that there's a fair
>> likelihood of functionality evolving here over time, so might it be
>> appropriate to have some sort of explicit versioning parameter for
>> robustness?
> 
> I copied that from gup_benchmark. There is no this kind of code to
> compare version.
> I believe there is a likelihood that kernel module is changed but users
> are still using old userspace tool, this might lead to the incompatible
> data structure.
> But not sure if it is a big problem :-)

Yeah, like I say I don't really have a good feeling for what would be 
best here, I'm just thinking of what I do know and wary of the potential 
for a "640 bits ought to be enough for anyone" issue ;)

>>> +struct map_benchmark_data {
>>> +	struct map_benchmark bparam;
>>> +	struct device *dev;
>>> +	struct dentry  *debugfs;
>>> +	atomic64_t total_map_nsecs;
>>> +	atomic64_t total_map_loops;
>>> +	atomic64_t total_unmap_nsecs;
>>> +	atomic64_t total_unmap_loops;
>>> +};
>>> +
>>> +static int map_benchmark_thread(void *data)
>>> +{
>>> +	struct page *page;
>>> +	dma_addr_t dma_addr;
>>> +	struct map_benchmark_data *map = data;
>>> +	int ret = 0;
>>> +
>>> +	page = alloc_page(GFP_KERNEL);
>>> +	if (!page)
>>> +		return -ENOMEM;
>>> +
>>> +	while (!kthread_should_stop())  {
>>> +		ktime_t map_stime, map_etime, unmap_stime, unmap_etime;
>>> +
>>> +		map_stime = ktime_get();
>>> +		dma_addr = dma_map_page(map->dev, page, 0, PAGE_SIZE,
>> DMA_BIDIRECTIONAL);
>>
>> Note that for a non-coherent device, this will give an underestimate of
>> the real-world overhead of BIDIRECTIONAL or TO_DEVICE mappings, since
>> the page will never be dirty in the cache (except possibly the very
>> first time through).
> 
> Agreed. I'd like to add a DIRECTION parameter like "-d 0", "-d 1" after we have
> this basic framework.

That wasn't so much about the direction itself, just that if it's 
anything other than FROM_DEVICE, we should probably do something to 
dirty the buffer by a reasonable amount before each map. Otherwise the 
measured performance is going to be unrealistic on many systems.

[...]
>>> +		atomic64_add((long long)ktime_to_ns(ktime_sub(unmap_etime,
>> unmap_stime)),
>>> +				&map->total_unmap_nsecs);
>>> +		atomic64_inc(&map->total_map_loops);
>>> +		atomic64_inc(&map->total_unmap_loops);
>>
>> I think it would be worth keeping track of the variances as well - it
>> can be hard to tell if a reasonable-looking average is hiding terrible
>> worst-case behaviour.
> 
> This is a sensible requirement. I believe it is better to be handled by the
> existing kernel tracing method.
> 
> Maybe we need a histogram like:
> Delay   sample count
> 1-2us   1000              ***
> 2-3us   2000              *******
> 3-4us   100               *
> .....
> This will be more precise than the maximum latency in the worst
> case.
> 
> I'd believe this can be handled by:
> tracepoint  A
> Map
> Tracepoint  B
> 
> Tracepoint   C
> Unmap
> Tracepoint   D
> 
> Let the userspace ebpf to draw the histogram for the delta of B-A and D-C.
> 
> So I am planning to put this requirement into todo list and write an userspace
> ebpf/bcc script for histogram and put in tools/ directory.
> 
> Please give your comments on this.

Right, I wasn't suggesting trying to homebrew a full data collection 
system here - I agree there are better tools for that already - just 
that it's basically free to track a sum of squares alongside a sum, so 
that we can trivially calculate a useful variance (or standard 
deviation) figure alongside the mean at the end.

[...]
>>> +	for (i = 0; i < threads; i++) {
>>> +		tsk[i] = kthread_create_on_node(map_benchmark_thread, map,
>>> +				map->bparam.node, "dma-map-benchmark/%d", i);
>>> +		if (IS_ERR(tsk[i])) {
>>> +			dev_err(map->dev, "create dma_map thread failed\n");
>>> +			return PTR_ERR(tsk[i]);
>>> +		}
>>> +
>>> +		if (node != NUMA_NO_NODE && node_online(node))
>>> +			kthread_bind_mask(tsk[i], cpu_mask);
>>> +
>>> +		wake_up_process(tsk[i]);
>>
>> Might it be better to create all the threads first, *then* start kicking
>> them?
> 
> The difficulty is that we don't know how many threads we should create as
> the thread number is a parameter to test the contention of IOMMU driver.
> In my test case, I'd like to test things like
> One thread
> Two threads
> ....
> 8 threads
> 12 threads
> 16 threads...
> 
> On the other hand, I think it is better to drop the memory of task_struct of those
> test threads while we are not testing dma map.

I simply meant splitting the loop here into two - one to create the 
threads and set their affinity, then another to wake them all up - so we 
don't start unnecessarily thrashing the system while we're still trying 
to set up the rest of the test ;)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
