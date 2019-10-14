Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 02694D6078
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 12:45:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3776628DD;
	Mon, 14 Oct 2019 10:45:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A21428C1;
	Mon, 14 Oct 2019 10:29:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8627E14D;
	Mon, 14 Oct 2019 10:29:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDE68337;
	Mon, 14 Oct 2019 03:29:27 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3363F718;
	Mon, 14 Oct 2019 03:29:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: Add dma_addr_is_phys_addr()
To: David Gibson <david@gibson.dropbear.id.au>, Ram Pai <linuxram@us.ibm.com>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
	<20191014045139.GN4080@umbus.fritz.box>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <37609731-5539-b906-aa94-2ef0242795ac@arm.com>
Date: Mon, 14 Oct 2019 11:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191014045139.GN4080@umbus.fritz.box>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, mdroth@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
	mpe@ellerman.id.au, jasowang@redhat.com, aik@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	benh@kernel.crashing.org, sukadev@linux.vnet.ibm.com,
	linuxppc-dev@lists.ozlabs.org, hch@lst.de
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

On 14/10/2019 05:51, David Gibson wrote:
> On Fri, Oct 11, 2019 at 06:25:18PM -0700, Ram Pai wrote:
>> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>
>> In order to safely use the DMA API, virtio needs to know whether DMA
>> addresses are in fact physical addresses and for that purpose,
>> dma_addr_is_phys_addr() is introduced.
>>
>> cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> cc: David Gibson <david@gibson.dropbear.id.au>
>> cc: Michael Ellerman <mpe@ellerman.id.au>
>> cc: Paul Mackerras <paulus@ozlabs.org>
>> cc: Michael Roth <mdroth@linux.vnet.ibm.com>
>> cc: Alexey Kardashevskiy <aik@linux.ibm.com>
>> cc: Paul Burton <paul.burton@mips.com>
>> cc: Robin Murphy <robin.murphy@arm.com>
>> cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> cc: Christoph Hellwig <hch@lst.de>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> The change itself looks ok, so
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> However, I would like to see the commit message (and maybe the inline
> comments) expanded a bit on what the distinction here is about.  Some
> of the text from the next patch would be suitable, about DMA addresses
> usually being in a different address space but not in the case of
> bounce buffering.

Right, this needs a much tighter definition. "DMA address happens to be 
a valid physical address" is true of various IOMMU setups too, but I 
can't believe it's meaningful in such cases.

If what you actually want is "DMA is direct or SWIOTLB" - i.e. "DMA 
address is physical address of DMA data (not necessarily the original 
buffer)" - wouldn't dma_is_direct() suffice?

Robin.

>> ---
>>   arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
>>   arch/powerpc/platforms/pseries/Kconfig |  1 +
>>   include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
>>   kernel/dma/Kconfig                     |  3 +++
>>   4 files changed, 45 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/dma-mapping.h b/arch/powerpc/include/asm/dma-mapping.h
>> index 565d6f7..f92c0a4b 100644
>> --- a/arch/powerpc/include/asm/dma-mapping.h
>> +++ b/arch/powerpc/include/asm/dma-mapping.h
>> @@ -5,6 +5,8 @@
>>   #ifndef _ASM_DMA_MAPPING_H
>>   #define _ASM_DMA_MAPPING_H
>>   
>> +#include <asm/svm.h>
>> +
>>   static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
>>   {
>>   	/* We don't handle the NULL dev case for ISA for now. We could
>> @@ -15,4 +17,23 @@ static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
>>   	return NULL;
>>   }
>>   
>> +#ifdef CONFIG_ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +/**
>> + * dma_addr_is_phys_addr - check whether a device DMA address is a physical
>> + *		address
>> + * @dev:	device to check
>> + *
>> + * Returns %true if any DMA address for this device happens to also be a valid
>> + * physical address (not necessarily of the same page).
>> + */
>> +static inline bool dma_addr_is_phys_addr(struct device *dev)
>> +{
>> +	/*
>> +	 * Secure guests always use the SWIOTLB, therefore DMA addresses are
>> +	 * actually the physical address of the bounce buffer.
>> +	 */
>> +	return is_secure_guest();
>> +}
>> +#endif
>> +
>>   #endif	/* _ASM_DMA_MAPPING_H */
>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index 9e35cdd..0108150 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -152,6 +152,7 @@ config PPC_SVM
>>   	select SWIOTLB
>>   	select ARCH_HAS_MEM_ENCRYPT
>>   	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
>> +	select ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>>   	help
>>   	 There are certain POWER platforms which support secure guests using
>>   	 the Protected Execution Facility, with the help of an Ultravisor
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index f7d1eea..6df5664 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -693,6 +693,26 @@ static inline bool dma_addressing_limited(struct device *dev)
>>   			    dma_get_required_mask(dev);
>>   }
>>   
>> +#ifndef CONFIG_ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +/**
>> + * dma_addr_is_phys_addr - check whether a device DMA address is a physical
>> + *		address
>> + * @dev:	device to check
>> + *
>> + * Returns %true if any DMA address for this device happens to also be a valid
>> + * physical address (not necessarily of the same page).
>> + */
>> +static inline bool dma_addr_is_phys_addr(struct device *dev)
>> +{
>> +	/*
>> +	 * Except in very specific setups, DMA addresses exist in a different
>> +	 * address space from CPU physical addresses and cannot be directly used
>> +	 * to reference system memory.
>> +	 */
>> +	return false;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
>>   void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   		const struct iommu_ops *iommu, bool coherent);
>> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
>> index 9decbba..6209b46 100644
>> --- a/kernel/dma/Kconfig
>> +++ b/kernel/dma/Kconfig
>> @@ -51,6 +51,9 @@ config ARCH_HAS_DMA_MMAP_PGPROT
>>   config ARCH_HAS_FORCE_DMA_UNENCRYPTED
>>   	bool
>>   
>> +config ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +	bool
>> +
>>   config DMA_NONCOHERENT_CACHE_SYNC
>>   	bool
>>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
