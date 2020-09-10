Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352826477A
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 15:52:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB5BF86C5D;
	Thu, 10 Sep 2020 13:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKR8xgfe8tFx; Thu, 10 Sep 2020 13:52:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D08286E4C;
	Thu, 10 Sep 2020 13:52:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD42C0051;
	Thu, 10 Sep 2020 13:52:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A4FEC0051
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7662A86C5D
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF1NVe01LvcF for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 13:51:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 787D586D77
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:51:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155C1113E;
 Thu, 10 Sep 2020 06:51:54 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BEE23F66E;
 Thu, 10 Sep 2020 06:51:51 -0700 (PDT)
Subject: Re: [PATCH 12/12] dma-mapping: move the dma_declare_coherent_memory
 documentation
To: Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-13-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <07c51b70-fb7d-cf44-b5c3-54e3148c11ae@arm.com>
Date: Thu, 10 Sep 2020 14:51:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-13-hch@lst.de>
Content-Language: en-GB
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 2020-09-08 17:47, Christoph Hellwig wrote:
> dma_declare_coherent_memory should not be in a DMA API guide aimed
> at driver writers (that is consumers of the API).  Move it to a comment
> near the function instead.

I still think there might be an occasional valid use for device-local 
memory outside the scope of platform code without the driver having to 
go full ZONE_DEVICE/HMM/TTM, e.g. with stuff like PCIe-based FPGA 
prototyping cards, but the kind of driver I'm imagining for that case 
would never be upstream anyway (if it were even written, rather than 
just using hard-coded hacks), so meh.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   Documentation/core-api/dma-api.rst | 24 ------------------------
>   kernel/dma/coherent.c              | 17 +++++++++++++++++
>   2 files changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 3b3abbbb4b9a6f..90239348b30f6f 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -586,30 +586,6 @@ the DMA_ATTR_NON_CONSISTENT flag starting at virtual address vaddr and
>   continuing on for size.  Again, you *must* observe the cache line
>   boundaries when doing this.
>   
> -::
> -
> -	int
> -	dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
> -				    dma_addr_t device_addr, size_t size);
> -
> -Declare region of memory to be handed out by dma_alloc_coherent() when
> -it's asked for coherent memory for this device.
> -
> -phys_addr is the CPU physical address to which the memory is currently
> -assigned (this will be ioremapped so the CPU can access the region).
> -
> -device_addr is the DMA address the device needs to be programmed
> -with to actually address this memory (this will be handed out as the
> -dma_addr_t in dma_alloc_coherent()).
> -
> -size is the size of the area (must be multiples of PAGE_SIZE).
> -
> -As a simplification for the platforms, only *one* such region of
> -memory may be declared per device.
> -
> -For reasons of efficiency, most platforms choose to track the declared
> -region only at the granularity of a page.  For smaller allocations,
> -you should use the dma_pool() API.
>   
>   Part III - Debug drivers use of the DMA-API
>   -------------------------------------------
> diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
> index 2a0c4985f38e41..f85d14bbfcbe03 100644
> --- a/kernel/dma/coherent.c
> +++ b/kernel/dma/coherent.c
> @@ -107,6 +107,23 @@ static int dma_assign_coherent_memory(struct device *dev,
>   	return 0;
>   }
>   
> +/*
> + * Declare a region of memory to be handed out by dma_alloc_coherent() when it
> + * is asked for coherent memory for this device.  This shall only be used
> + * from platform code, usually based on the device tree description.
> + *
> + * phys_addr is the CPU physical address to which the memory is currently
> + * assigned (this will be ioremapped so the CPU can access the region).
> + *
> + * device_addr is the DMA address the device needs to be programmed with to
> + * actually address this memory (this will be handed out as the dma_addr_t in
> + * dma_alloc_coherent()).
> + *
> + * size is the size of the area (must be a multiple of PAGE_SIZE).
> + *
> + * As a simplification for the platforms, only *one* such region of memory may
> + * be declared per device.
> + */
>   int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
>   				dma_addr_t device_addr, size_t size)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
