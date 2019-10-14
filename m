Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FCD64B8
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 16:05:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 019431430;
	Mon, 14 Oct 2019 14:05:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59CCB1389
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 13:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E74FC5D3
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 13:55:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0982A337;
	Mon, 14 Oct 2019 06:55:00 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224D83F68E;
	Mon, 14 Oct 2019 06:54:59 -0700 (PDT)
Subject: Re: [BUG] dma-ranges, reserved memory regions, dma_alloc_coherent:
	possible bug?
To: Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Vladimir Murzin <vladimir.murzin@arm.com>
References: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d983cf57-f13d-a680-21c4-09b5ca93bc64@arm.com>
Date: Mon, 14 Oct 2019 14:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>
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

On 13/10/2019 15:28, Daniele Alessandrelli wrote:
> Hi,
> 
> It looks like dma_alloc_coherent() is setting the dma_handle output
> parameter to the memory physical address and not the device bus
> address when the device is using reserved memory regions for DMA
> allocation. This is despite using 'dma_ranges' in the device tree to
> describe the DMA memory mapping. Is this expected behavior or a bug?

That does sound like a bug :(

> Here is a reduced version of the device tree I'm using:
> \ {
>          reserved-memory {
>                  #address-cells = <2>;
>                  #size-cells = <2>;
>                  ranges;
>                  mydev_rsvd: rsvd_mem@494800000 {
>                          compatible = "shared-dma-pool";
>                          reg = <0x4 0x94800000 0x0 0x200000>;
>                          no-map;
>                  };
>          };
>          soc {
>                  compatible = "simple-bus";
>                  #address-cells = <2>;
>                  #size-cells = <2>;
>                  ranges;
>                  dma_ranges;
> 
>                  mybus {
>                          ranges = <>;
>                          dma-ranges = <>;
>                          compatible = "simple-bus";
>                          #address-cells = <2>;
>                          #size-cells = <2>;
>                          ranges =     <0x0 0x0  0x0 0x0  0x0 0x80000000>;
>                          dma-ranges = <0x0 0x80000000  0x4 0x80000000
> 0x0 0x80000000>;
> 
>                          mydevice {
>                                  compatible = "my-compatible-string";
>                                  memory-region = <&mydev_rsvd>;
>                          }
>                  }
>          }
> };
> 
> It looks like this issue was previously fixed by commit c41f9ea998f3
> ("drivers: dma-coherent: Account dma_pfn_offset when used with device
> tree") which introduced a new function ('dma_get_device_base()') to
> return the reserved memory address as seen by the device. However,
> such a function, even if still there, is not used anymore in latest
> code (as of v5.4-rc2). Was that done for a specific reason? Or is it
> just a mistake?

Hmm, it looks like 43fc509c3efb ("dma-coherent: introduce interface for 
default DMA pool") removed the caller of dma_get_device_base() in the 
alloc path shortly after it was introduced, which certainly appears as 
if it may have been unintentional - Vladimir?

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
