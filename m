Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838D314F58
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 13:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F1EDF872CC;
	Tue,  9 Feb 2021 12:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5W0TnpR-UrPd; Tue,  9 Feb 2021 12:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 41614872C8;
	Tue,  9 Feb 2021 12:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22906C013A;
	Tue,  9 Feb 2021 12:45:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A708C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 10BF9872CC
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BhDvZyR1raS for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 12:45:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97E75872C8
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 12:45:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE31EED1;
 Tue,  9 Feb 2021 04:45:13 -0800 (PST)
Received: from [10.57.49.26] (unknown [10.57.49.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85BFD3F73B;
 Tue,  9 Feb 2021 04:45:12 -0800 (PST)
Subject: Re: DMA direct mapping fix for 5.4 and earlier stable branches
To: Sumit Garg <sumit.garg@linaro.org>, Christoph Hellwig <hch@lst.de>
References: <CAFA6WYNazCmYN20irLdNV+2vcv5dqR+grvaY-FA7q2WOBMs__g@mail.gmail.com>
 <YCIym62vHfbG+dWf@kroah.com>
 <CAFA6WYM+xJ0YDKenWFPMHrTz4gLWatnog84wyk31Xy2dTiT2RA@mail.gmail.com>
 <YCJCDZGa1Dhqv6Ni@kroah.com>
 <27bbe35deacb4ca49f31307f4ed551b5@SOC-EX02V.e01.socionext.com>
 <YCJUgKDNVjJ4dUqM@kroah.com> <20210209093642.GA1006@lst.de>
 <CAFA6WYO59w=wif8W16sG6BnzSjFhaY6PmRUTdSCu9A+zA7gzBw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e36b8a7d-a999-da09-d7d9-cc26579a65d1@arm.com>
Date: Tue, 9 Feb 2021 12:45:11 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFA6WYO59w=wif8W16sG6BnzSjFhaY6PmRUTdSCu9A+zA7gzBw@mail.gmail.com>
Content-Language: en-GB
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>, obayashi.yoshimasa@socionext.com,
 stable <stable@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org
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

On 2021-02-09 12:36, Sumit Garg wrote:
> Hi Christoph,
> 
> On Tue, 9 Feb 2021 at 15:06, Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Tue, Feb 09, 2021 at 10:23:12AM +0100, Greg KH wrote:
>>>>    From the view point of ZeroCopy using DMABUF, is 5.4 not
>>>> mature enough, and is 5.10 enough mature ?
>>>>    This is the most important point for judging migration.
>>>
>>> How do you judge "mature"?
>>>
>>> And again, if a feature isn't present in a specific kernel version, why
>>> would you think that it would be a viable solution for you to use?
>>
>> I'm pretty sure dma_get_sgtable has been around much longer and was
>> supposed to work, but only really did work properly for arm32, and
>> for platforms with coherent DMA.  I bet he is using non-coherent arm64,
> 
> It's an arm64 platform using coherent DMA where device coherent DMA
> memory pool is defined in the DT as follows:
> 
>          reserved-memory {
>                  #address-cells = <2>;
>                  #size-cells = <2>;
>                  ranges;
> 
>                  <snip>
>                  encbuffer: encbuffer@0xb0000000 {
>                          compatible = "shared-dma-pool";
>                          reg = <0 0xb0000000 0 0x08000000>; // this
> area used with dma-coherent
>                          no-map;
>                  };
>                  <snip>
>          };
> 
> Device is dma-coherent as per following DT property:
> 
>                  codec {
>                          compatible = "socionext,uniphier-pxs3-codec";
>                          <snip>
>                          memory-region = <&encbuffer>;
>                          dma-coherent;
>                          <snip>
>                  };
> 
> And call chain to create device coherent DMA pool is as follows:
> 
> rmem_dma_device_init();
>    dma_init_coherent_memory();
>      memremap();
>        ioremap_wc();
> 
> which simply maps coherent DMA memory into vmalloc space on arm64.
> 
> The thing I am unclear is why this is called a new feature rather than
> a bug in dma_common_get_sgtable() which is failing to handle vmalloc
> addresses? While at the same time DMA debug APIs specifically handle
> vmalloc addresses [1].

It's not a bug, it's a fundamental design failure. dma_get_sgtable() has 
only ever sort-of-worked for DMA buffers that come from CMA or regular 
page allocations. In particular, a "no-map" DMA pool is not backed by 
kernel memory, so does not have any corresponding page structs, so it's 
impossible to generate a *valid* scatterlist to represent memory from 
that pool, regardless of what you might get away with provided you don't 
poke too hard at it.

It is not a good API...

Robin.

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/kernel/dma/debug.c?h=linux-5.4.y#n1462
> 
> -Sumit
> 
>> and it would be broken for other drivers there as well if people did
>> test them, which they apparently so far did not.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
