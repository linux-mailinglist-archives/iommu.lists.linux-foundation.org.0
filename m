Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B642A84B1
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 18:17:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 135AA866E6;
	Thu,  5 Nov 2020 17:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6QBOBVjmzd9; Thu,  5 Nov 2020 17:17:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1802D866BA;
	Thu,  5 Nov 2020 17:17:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDB82C1AD6;
	Thu,  5 Nov 2020 17:17:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E861C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 16:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 67C6E214FD
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 16:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-L8AOYhLny3 for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 16:11:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 3A99E204AF
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 16:11:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F66514BF;
 Thu,  5 Nov 2020 08:11:25 -0800 (PST)
Received: from [172.16.1.113] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A0BB3F718;
 Thu,  5 Nov 2020 08:11:17 -0800 (PST)
Subject: Re: [PATCH v6 1/7] arm64: mm: Move reserve_crashkernel() into
 mem_init()
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
References: <20201103173159.27570-1-nsaenzjulienne@suse.de>
 <20201103173159.27570-2-nsaenzjulienne@suse.de>
From: James Morse <james.morse@arm.com>
Message-ID: <e60d643e-4879-3fc3-737d-2c145332a6d7@arm.com>
Date: Thu, 5 Nov 2020 16:11:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201103173159.27570-2-nsaenzjulienne@suse.de>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 05 Nov 2020 17:17:11 +0000
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com, ardb@kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com, will@kernel.org,
 hch@lst.de, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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

Hi!

On 03/11/2020 17:31, Nicolas Saenz Julienne wrote:
> crashkernel might reserve memory located in ZONE_DMA. We plan to delay
> ZONE_DMA's initialization after unflattening the devicetree and ACPI's
> boot table initialization, so move it later in the boot process.
> Specifically into mem_init(), this is the last place crashkernel will be
> able to reserve the memory before the page allocator kicks in.

> There
> isn't any apparent reason for doing this earlier.

It's so that map_mem() can carve it out of the linear/direct map.
This is so that stray writes from a crashing kernel can't accidentally corrupt the kdump
kernel. We depend on this if we continue with kdump, but failed to offline all the other
CPUs. We also depend on this when skipping the checksum code in purgatory, which can be
exceedingly slow.

Grepping around, the current order is:

start_kernel()
-> setup_arch()
	-> arm64_memblock_init()	/* reserve */
	-> paging_init()
		-> map_mem()		/* carve out reservation */
[...]
	-> mm_init()
		-> mem_init()


I agree we should add comments to make this apparent!


Thanks,

James


> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 095540667f0f..fc4ab0d6d5d2 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -386,8 +386,6 @@ void __init arm64_memblock_init(void)
>  	else
>  		arm64_dma32_phys_limit = PHYS_MASK + 1;
>  
> -	reserve_crashkernel();
> -
>  	reserve_elfcorehdr();
>  
>  	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
> @@ -508,6 +506,8 @@ void __init mem_init(void)
>  	else
>  		swiotlb_force = SWIOTLB_NO_FORCE;
>  
> +	reserve_crashkernel();
> +
>  	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
>  
>  #ifndef CONFIG_SPARSEMEM_VMEMMAP
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
