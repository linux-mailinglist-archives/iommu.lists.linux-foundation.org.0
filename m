Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA3392CA2
	for <lists.iommu@lfdr.de>; Thu, 27 May 2021 13:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E674063B;
	Thu, 27 May 2021 11:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwMqbbs1ODzj; Thu, 27 May 2021 11:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464CE40627;
	Thu, 27 May 2021 11:26:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16E65C0001;
	Thu, 27 May 2021 11:26:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C2D5C0001
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 11:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 232D960793
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 11:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBTBvSj8KQ6h for <iommu@lists.linux-foundation.org>;
 Thu, 27 May 2021 11:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E482E6069C
 for <iommu@lists.linux-foundation.org>; Thu, 27 May 2021 11:25:58 +0000 (UTC)
Received: from dggeml706-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FrQPD27vgz1BFRR;
 Thu, 27 May 2021 19:21:20 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggeml706-chm.china.huawei.com (10.3.17.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 19:25:55 +0800
Received: from [10.174.185.220] (10.174.185.220) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 19:25:54 +0800
Subject: Re: [RFC PATCH v3 0/8] Add IOPF support for VFIO passthrough
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210409034420.1799-1-lushenming@huawei.com>
 <20210518125756.4c075300.alex.williamson@redhat.com>
 <accfb404-1d7b-8d73-6fb7-50011a3e546f@huawei.com>
 <20210524161136.03e9323d@x1.home.shazbot.org>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <159f0e59-b2cc-ca4b-9796-3ad134a29c1f@huawei.com>
Date: Thu, 27 May 2021 19:25:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210524161136.03e9323d@x1.home.shazbot.org>
Content-Language: en-US
X-Originating-IP: [10.174.185.220]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, linux-api@vger.kernel.org,
 wanghaibin.wang@huawei.com, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021/5/25 6:11, Alex Williamson wrote:
> On Fri, 21 May 2021 14:37:21 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> Hi Alex,
>>
>> On 2021/5/19 2:57, Alex Williamson wrote:
>>> On Fri, 9 Apr 2021 11:44:12 +0800
>>> Shenming Lu <lushenming@huawei.com> wrote:
>>>   
>>>> Hi,
>>>>
>>>> Requesting for your comments and suggestions. :-)
>>>>
>>>> The static pinning and mapping problem in VFIO and possible solutions
>>>> have been discussed a lot [1, 2]. One of the solutions is to add I/O
>>>> Page Fault support for VFIO devices. Different from those relatively
>>>> complicated software approaches such as presenting a vIOMMU that provides
>>>> the DMA buffer information (might include para-virtualized optimizations),
>>>> IOPF mainly depends on the hardware faulting capability, such as the PCIe
>>>> PRI extension or Arm SMMU stall model. What's more, the IOPF support in
>>>> the IOMMU driver has already been implemented in SVA [3]. So we add IOPF
>>>> support for VFIO passthrough based on the IOPF part of SVA in this series.  
>>>
>>> The SVA proposals are being reworked to make use of a new IOASID
>>> object, it's not clear to me that this shouldn't also make use of that
>>> work as it does a significant expansion of the type1 IOMMU with fault
>>> handlers that would duplicate new work using that new model.  
>>
>> It seems that the IOASID extension for guest SVA would not affect this series,
>> will we do any host-guest IOASID translation in the VFIO fault handler?
> 
> Surely it will, we don't currently have any IOMMU fault handling or
> forwarding of IOMMU faults through to the vfio bus driver, both of
> those would be included in an IOASID implementation.  I think Jason's
> vision is to use IOASID to deprecate type1 for all use cases, so even
> if we were to choose to implement IOPF in type1 we should agree on
> common interfaces with IOASID.

Yeah, the guest IOPF(L1) handling may include the host-guest IOASID translation,
which can be placed in the IOASID layer (in fact it can be placed in many places
such as the vfio pci driver since it don't really handle the fault event, it just
transfers the event to the vIOMMU).
But the host IOPF(L2) has no relationship with IOASID at all, it needs to have a
knowledge of the vfio_dma ranges.
Could we add the host IOPF support to type1 first (integrate it within the MAP ioctl)?
And we may migrate the generic iommu controls (such as MAP/UNMAP...) from type1 to
IOASID in the future (it seems to be a huge work, I will be very happy if I could
help this)... :-)

>  
>>>> We have measured its performance with UADK [4] (passthrough an accelerator
>>>> to a VM(1U16G)) on Hisilicon Kunpeng920 board (and compared with host SVA):
>>>>
>>>> Run hisi_sec_test...
>>>>  - with varying sending times and message lengths
>>>>  - with/without IOPF enabled (speed slowdown)
>>>>
>>>> when msg_len = 1MB (and PREMAP_LEN (in Patch 4) = 1):
>>>>             slowdown (num of faults)
>>>>  times      VFIO IOPF      host SVA
>>>>  1          63.4% (518)    82.8% (512)
>>>>  100        22.9% (1058)   47.9% (1024)
>>>>  1000       2.6% (1071)    8.5% (1024)
>>>>
>>>> when msg_len = 10MB (and PREMAP_LEN = 512):
>>>>             slowdown (num of faults)
>>>>  times      VFIO IOPF
>>>>  1          32.6% (13)
>>>>  100        3.5% (26)
>>>>  1000       1.6% (26)  
>>>
>>> It seems like this is only an example that you can make a benchmark
>>> show anything you want.  The best results would be to pre-map
>>> everything, which is what we have without this series.  What is an
>>> acceptable overhead to incur to avoid page pinning?  What if userspace
>>> had more fine grained control over which mappings were available for
>>> faulting and which were statically mapped?  I don't really see what
>>> sense the pre-mapping range makes.  If I assume the user is QEMU in a
>>> non-vIOMMU configuration, pre-mapping the beginning of each RAM section
>>> doesn't make any logical sense relative to device DMA.  
>>
>> As you said in Patch 4, we can introduce full end-to-end functionality
>> before trying to improve performance, and I will drop the pre-mapping patch
>> in the current stage...
>>
>> Is there a need that userspace wants more fine grained control over which
>> mappings are available for faulting? If so, we may evolve the MAP ioctl
>> to support for specifying the faulting range.
> 
> You're essentially enabling this for a vfio bus driver via patch 7/8,
> pinning for selective DMA faulting.  How would a driver in userspace
> make equivalent requests?  In the case of performance, the user could
> mlock the page but they have no mechanism here to pre-fault it.  Should
> they?

Make sense.

It seems that we should additionally iommu_map the pages which are IOPF
enabled and pinned in vfio_iommu_type1_pin_pages, and there is no need
to add more tracking structures in Patch 7...

> 
>> As for the overhead of IOPF, it is unavoidable if enabling on-demand paging
>> (and page faults occur almost only when first accessing), and it seems that
>> there is a large optimization space compared to CPU page faulting.
> 
> Yes, there's of course going to be overhead in terms of latency for the
> page faults.  My point was more that when a host is not under memory
> pressure we should trend towards the performance of pinned, static
> mappings and we should be able to create arbitrarily large pre-fault
> behavior to show that.

Make sense.

> But I think what we really want to enable via IOPF is density, right?

density? Did you mean the proportion of the IOPF enabled mappings?

> Therefore how many more assigned device guests
> can you run on a host with IOPF?> How does the slope, plateau, and
> inflection point of their aggregate throughput compare to static
> pinning?  VM startup time is probably also a useful metric, ie. trading
> device latency for startup latency.  Thanks,

Yeah, these are what we have to consider and test later. :-)
And the slope, plateau, and inflection point of the aggregate throughput
may depend on the specific device driver's behavior (such as whether they
reuse the DMA buffer)...

Thanks,
Shenming

> 
> Alex
> 
> .
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
