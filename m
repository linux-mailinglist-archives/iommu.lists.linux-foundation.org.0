Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9193E20B116
	for <lists.iommu@lfdr.de>; Fri, 26 Jun 2020 14:02:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57D8D87631;
	Fri, 26 Jun 2020 12:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMTmLK2MWnhT; Fri, 26 Jun 2020 12:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA6318761B;
	Fri, 26 Jun 2020 12:02:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87557C016F;
	Fri, 26 Jun 2020 12:02:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA51C016F
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 12:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4667586311
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 12:02:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtMB8RUGi512 for <iommu@lists.linux-foundation.org>;
 Fri, 26 Jun 2020 12:02:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1E2B861A1
 for <iommu@lists.linux-foundation.org>; Fri, 26 Jun 2020 12:02:08 +0000 (UTC)
Received: from dggemi406-hub.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 9667551DE239E30D0C96;
 Fri, 26 Jun 2020 20:01:56 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.126]) by
 dggemi406-hub.china.huawei.com ([10.3.17.144]) with mapi id 14.03.0487.000;
 Fri, 26 Jun 2020 20:01:45 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Robin Murphy <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "will@kernel.org"
 <will@kernel.org>, "ganapatrao.kulkarni@cavium.com"
 <ganapatrao.kulkarni@cavium.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>
Subject: RE: [PATCH v2 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Thread-Topic: [PATCH v2 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Thread-Index: AQHWSsSY8LnVWNMYkEmWpaJ1pqQoDKjoptmAgAIP9AA=
Date: Fri, 26 Jun 2020 12:01:45 +0000
Message-ID: <B926444035E5E2439431908E3842AFD2524A84@DGGEMI525-MBS.china.huawei.com>
References: <20200625074330.13668-1-song.bao.hua@hisilicon.com>
 <20200625074330.13668-2-song.bao.hua@hisilicon.com>
 <11672f20-6011-1a70-8def-fc662f52d50f@arm.com>
In-Reply-To: <11672f20-6011-1a70-8def-fc662f52d50f@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.204]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: Steve Capper <steve.capper@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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



> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org
> [mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Robin Murphy
> Sent: Thursday, June 25, 2020 11:11 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; hch@lst.de;
> m.szyprowski@samsung.com; will@kernel.org;
> ganapatrao.kulkarni@cavium.com; catalin.marinas@arm.com
> Cc: iommu@lists.linux-foundation.org; Linuxarm <linuxarm@huawei.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Jonathan
> Cameron <jonathan.cameron@huawei.com>; Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de>; Steve Capper <steve.capper@arm.com>; Andrew
> Morton <akpm@linux-foundation.org>; Mike Rapoport <rppt@linux.ibm.com>
> Subject: Re: [PATCH v2 1/2] dma-direct: provide the ability to reserve
> per-numa CMA
> 
> On 2020-06-25 08:43, Barry Song wrote:
> > This is useful for at least two scenarios:
> > 1. ARM64 smmu will get memory from local numa node, it can save its
> > command queues and page tables locally. Tests show it can decrease
> > dma_unmap latency at lot. For example, without this patch, smmu on
> > node2 will get memory from node0 by calling dma_alloc_coherent(),
> > typically, it has to wait for more than 560ns for the completion of
> > CMD_SYNC in an empty command queue; with this patch, it needs 240ns
> > only.
> > 2. when we set iommu passthrough, drivers will get memory from CMA,
> > local memory means much less latency.
> >
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Cc: Steve Capper <steve.capper@arm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Mike Rapoport <rppt@linux.ibm.com>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> > ---
> >   include/linux/dma-contiguous.h |  4 ++
> >   kernel/dma/Kconfig             | 10 ++++
> >   kernel/dma/contiguous.c        | 99
> ++++++++++++++++++++++++++++++----
> >   3 files changed, 104 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/dma-contiguous.h
> b/include/linux/dma-contiguous.h
> > index 03f8e98e3bcc..278a80a40456 100644
> > --- a/include/linux/dma-contiguous.h
> > +++ b/include/linux/dma-contiguous.h
> > @@ -79,6 +79,8 @@ static inline void dma_contiguous_set_default(struct
> cma *cma)
> >
> >   void dma_contiguous_reserve(phys_addr_t addr_limit);
> >
> > +void dma_pernuma_cma_reserve(void);
> > +
> >   int __init dma_contiguous_reserve_area(phys_addr_t size, phys_addr_t
> base,
> >   				       phys_addr_t limit, struct cma **res_cma,
> >   				       bool fixed);
> > @@ -128,6 +130,8 @@ static inline void dma_contiguous_set_default(struct
> cma *cma) { }
> >
> >   static inline void dma_contiguous_reserve(phys_addr_t limit) { }
> >
> > +static inline void dma_pernuma_cma_reserve(void) { }
> > +
> >   static inline int dma_contiguous_reserve_area(phys_addr_t size,
> phys_addr_t base,
> >   				       phys_addr_t limit, struct cma **res_cma,
> >   				       bool fixed)
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index d006668c0027..aeb976b1d21c 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -104,6 +104,16 @@ config DMA_CMA
> >   if  DMA_CMA
> >   comment "Default contiguous memory area size:"
> >
> > +config CMA_PERNUMA_SIZE_MBYTES
> > +	int "Size in Mega Bytes for per-numa CMA areas"
> > +	depends on NUMA
> > +	default 16 if ARM64
> > +	default 0
> > +	help
> > +	  Defines the size (in MiB) of the per-numa memory area for Contiguous
> > +	  Memory Allocator. Every numa node will get a separate CMA with this
> > +	  size. If the size of 0 is selected, per-numa CMA is disabled.
> > +
> 
> I think this needs to be cleverer than just a static config option.
> Pretty much everything else CMA-related is runtime-configurable to some
> degree, and doing any per-node setup when booting on a single-node
> system would be wasted effort.

I agree some dynamic configuration should be supported to set the size of cma.
It could be a kernel parameter bootargs, or leverage an existing parameter.

For a system with NUMA enabled, but with only one node or actually non-numa, 
the current dma_pernuma_cma_reserve() won't do anything:

void __init dma_pernuma_cma_reserve(void)
{
	int nid;

	if (!pernuma_size_bytes || nr_online_nodes <= 1)
		return;
}

> 
> Since this is conceptually very similar to the existing hugetlb_cma
> implementation I'm also wondering about inconsistency with respect to
> specifying per-node vs. total sizes.

For hugetlbcma, pernuma cma size is: total_size/the number of nodes
It is quite simple.

But for DMA, node0's CMA might support address limitation for old
devices which allocate memory by GFP_DMA(32).

> 
> Another thought, though, is that systems large enough to have multiple
> NUMA nodes tend not to be short on memory, so it might not be
> unreasonable to base this all on whatever size the default area is
> given, and simply have a binary on/off switch to control the per-node
> aspect.

I don't mind applying the default size to all NUMA nodes as generally a server
has larger memory than embedded system.
One issue is that the default global CMA is on node0, and if the code applies the default size to
every node, the default cma is better to also as node0's pernuma cma too. Otherwise, there
would be two CMA with same size on node0. 

So the code can bypass node0 while creating per-numa CMA.

On the other hand, only CMA on node0 support address limitation for old devices
as its memory is in low physical address.
That is probably why the cma of node0 still need to be handled separately.

So node0's CMA will be both default global CMA and per-NUMA CMA of node0.

> 
> >   config CMA_SIZE_MBYTES
> >   	int "Size in Mega Bytes"
> >   	depends on !CMA_SIZE_SEL_PERCENTAGE
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 15bc5026c485..bcbd53aead93 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -30,7 +30,14 @@
> >   #define CMA_SIZE_MBYTES 0
> >   #endif
> >
> > +#ifdef CONFIG_CMA_PERNUMA_SIZE_MBYTES
> > +#define CMA_SIZE_PERNUMA_MBYTES
> CONFIG_CMA_PERNUMA_SIZE_MBYTES
> > +#else
> > +#define CMA_SIZE_PERNUMA_MBYTES 0
> > +#endif
> > +
> >   struct cma *dma_contiguous_default_area;
> > +static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];
> >
> >   /*
> >    * Default global CMA area size can be defined in kernel's .config.
> > @@ -44,6 +51,8 @@ struct cma *dma_contiguous_default_area;
> >    */
> >   static const phys_addr_t size_bytes __initconst =
> >   	(phys_addr_t)CMA_SIZE_MBYTES * SZ_1M;
> > +static const phys_addr_t pernuma_size_bytes __initconst =
> > +	(phys_addr_t)CMA_SIZE_PERNUMA_MBYTES * SZ_1M;
> >   static phys_addr_t  size_cmdline __initdata = -1;
> >   static phys_addr_t base_cmdline __initdata;
> >   static phys_addr_t limit_cmdline __initdata;
> > @@ -96,6 +105,33 @@ static inline __maybe_unused phys_addr_t
> cma_early_percent_memory(void)
> >
> >   #endif
> >
> > +void __init dma_pernuma_cma_reserve(void)
> > +{
> > +	int nid;
> > +
> > +	if (!pernuma_size_bytes || nr_online_nodes <= 1)
> > +		return;
> > +
> > +	for_each_node_state(nid, N_ONLINE) {
> 
> Do we need/want notifiers to handle currently-offline nodes coming
> online later (I'm not sure off-hand how NUMA interacts with stuff like
> "maxcpus=n")?

I had a try.

For example, if the hardware has 4 numa nodes and each one has 24 CPUs.

Setting maxcpus=20 will result in:

4 numa nodes are all online after arm64_numa_init() ;
CPU0-19 is online;
CPU20-95 is offline;

$cat /sys/devices/system/cpu/cpu0/online 
1

$cat /sys/devices/system/cpu/cpu24/online 
0

$cat /sys/devices/system/cpu/cpu50/online 
0

But the printk still print 4 here:

--- a/arch/arm64/mm/init.c                                                                                                                                 
+++ b/arch/arm64/mm/init.c                                                                                                                                 
@@ -420,6 +420,8 @@ void __init bootmem_init(void)

        arm64_numa_init();                                                                                                                                 

+       printk("%s nr_online_node :%d\n", __func__, nr_online_nodes);
+
        /*                                                                                                                                                 
         * must be done after arm64_numa_init() which calls numa_init() to                                                                                 
         * initialize node_online_map that gets used in hugetlb_cma_reserve()    

> 
> > +		int ret;
> > +		char name[20];
> > +
> > +		snprintf(name, sizeof(name), "pernuma%d", nid);
> > +		ret = cma_declare_contiguous_nid(0, pernuma_size_bytes, 0, 0,
> > +						 0, false, name,
> > +						 &dma_contiguous_pernuma_area[nid],
> > +						 nid);
> > +		if (ret) {
> > +			pr_warn("%s: reservation failed: err %d, node %d", __func__,
> > +				ret, nid);
> > +			continue;
> > +		}
> > +
> > +		pr_debug("%s: reserved %llu MiB on node %d\n", __func__,
> > +			(unsigned long long)pernuma_size_bytes / SZ_1M, nid);
> > +	}
> > +}
> > +
> >   /**
> >    * dma_contiguous_reserve() - reserve area(s) for contiguous memory
> handling
> >    * @limit: End address of the reserved memory (optional, 0 for any).
> > @@ -222,22 +258,31 @@ bool dma_release_from_contiguous(struct device
> *dev, struct page *pages,
> >    * @gfp:   Allocation flags.
> >    *
> >    * This function allocates contiguous memory buffer for specified device.
> It
> > - * tries to use device specific contiguous memory area if available, or the
> > - * default global one.
> > + * tries to use device specific contiguous memory area if available, or it
> > + * tries to use per-numa cma, if the allocation fails, it will fallback to
> > + * try default global one.
> >    *
> > - * Note that it byapss one-page size of allocations from the global area as
> > - * the addresses within one page are always contiguous, so there is no need
> > - * to waste CMA pages for that kind; it also helps reduce fragmentations.
> > + * Note that it bypass one-page size of allocations from the per-numa and
> > + * global area as the addresses within one page are always contiguous, so
> > + * there is no need to waste CMA pages for that kind; it also helps reduce
> > + * fragmentations.
> >    */
> >   struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t
> gfp)
> >   {
> >   	size_t count = size >> PAGE_SHIFT;
> >   	struct page *page = NULL;
> >   	struct cma *cma = NULL;
> > +	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
> 
> dev should never be NULL here (the existing check below could be cleaned
> up if we're refactoring anyway).

It was not done in v1. But kernel test robot reported issue like 

"smatch warnings:
kernel/dma/contiguous.c:274 dma_alloc_contiguous() warn: variable dereferenced before \
check 'dev' (see line 272)"

https://marc.info/?l=linux-arm-kernel&m=159127076208780&w=2

> 
> > +	bool alloc_from_pernuma = false;
> >
> >   	if (dev && dev->cma_area)
> >   		cma = dev->cma_area;
> > -	else if (count > 1)
> > +	else if ((nid != NUMA_NO_NODE) &&
> dma_contiguous_pernuma_area[nid]
> > +		&& !(gfp & (GFP_DMA | GFP_DMA32))
> > +		&& (count > 1)) {
> > +		cma = dma_contiguous_pernuma_area[nid];
> > +		alloc_from_pernuma = true;
> > +	} else if (count > 1)
> 
> Well this is a big ugly mess... I'd suggest restructuring the whole
> function to bail out immediately if (count == 1 && !dev->cma_area), then
> try the per-device, per-node and default areas in turn until something
> works.

Agreed

> 
> >   		cma = dma_contiguous_default_area;
> >
> >   	/* CMA can be used only in the context which permits sleeping */
> > @@ -246,6 +291,11 @@ struct page *dma_alloc_contiguous(struct device
> *dev, size_t size, gfp_t gfp)
> >   		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
> >
> >   		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
> > +
> > +		/* fall back to default cma if failed in per-numa cma */
> > +		if (!page && alloc_from_pernuma)
> > +			page = cma_alloc(dma_contiguous_default_area, count,
> > +				cma_align, gfp & __GFP_NOWARN);
> >   	}
> >
> >   	return page;
> > @@ -264,9 +314,40 @@ struct page *dma_alloc_contiguous(struct device
> *dev, size_t size, gfp_t gfp)
> >    */
> >   void dma_free_contiguous(struct device *dev, struct page *page, size_t
> size)
> >   {
> > -	if (!cma_release(dev_get_cma_area(dev), page,
> > -			 PAGE_ALIGN(size) >> PAGE_SHIFT))
> > -		__free_pages(page, get_order(size));
> > +	/* if dev has its own cma, free page from there */
> > +	if (dev && dev->cma_area) {
> 
> Again, no new redundant NULL checks please.

Kernel test robot might report issue.

> 
> > +		if (cma_release(dev->cma_area, page, PAGE_ALIGN(size) >>
> PAGE_SHIFT))
> > +			return;
> > +	} else {
> > +		/*
> > +		 * otherwise, page is from either per-numa cma or default cma
> > +		 */
> > +		int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
> > +
> > +		if (nid != NUMA_NO_NODE) {
> > +			int i;
> > +
> > +			/*
> > +			 * Literally we only need to call cma_release() on pernuma cma
> of
> > +			 * node nid, howerver, a corner case is that users might write
> > +			 * /sys/devices/pci-x/numa_node to change node to
> workaround firmware
> > +			 * bug, so it might allocate memory from nodeA CMA, but free
> from nodeB
> > +			 * CMA.
> > +			 */
> 
> Why bother with this dance at all? You have the page, so you can't not
> know where it is. Just use page_to_nid() like hugetlb_cma does.

Cool.

> 
> Robin.
> 
> > +			for (i = 0; i < MAX_NUMNODES; i++) {
> > +				if (cma_release(dma_contiguous_pernuma_area[i], page,
> > +							PAGE_ALIGN(size) >> PAGE_SHIFT))
> > +					return;
> > +			}
> > +		}
> > +
> > +		if (cma_release(dma_contiguous_default_area, page,
> > +					PAGE_ALIGN(size) >> PAGE_SHIFT))
> > +			return;
> > +	}
> > +
> > +	/* not in any cma, free from buddy */
> > +	__free_pages(page, get_order(size));
> >   }

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
