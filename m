Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF71E30A2
	for <lists.iommu@lfdr.de>; Tue, 26 May 2020 22:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A7FBB20479;
	Tue, 26 May 2020 20:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LugEE3Z8DhbR; Tue, 26 May 2020 20:54:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EA79A2038A;
	Tue, 26 May 2020 20:54:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE111C016F;
	Tue, 26 May 2020 20:54:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28AB9C016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 20:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16CFD877F4
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 20:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H3ERRmf5VEc0 for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 20:54:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BD1C3863D9
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 20:54:52 +0000 (UTC)
IronPort-SDR: IpzvTtGSS28haPX08M+wmwdHprCM251C91M7G+zECFFXYIDXGSE9zsbc5KGkXloPrujv8u/mLn
 M5SK9foDxMHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 13:54:52 -0700
IronPort-SDR: f3L56atARRLEE/U2lZMBHr2nLocFVXVdKnAmhBfTF32t3UGNYHpLKEGdVLFgMORNI544HNQKFZ
 ldzumOMBclpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="442238477"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 26 May 2020 13:54:46 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jdgb2-0094ug-CN; Tue, 26 May 2020 23:54:48 +0300
Date: Tue, 26 May 2020 23:54:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v2 09/14] device core: Add ability to handle multiple dma
 offsets
Message-ID: <20200526205448.GA1634618@smile.fi.intel.com>
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
 <20200526191303.1492-10-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526191303.1492-10-james.quinlan@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-pci@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Alan Stern <stern@rowland.harvard.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Corey Minyard <minyard@acm.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
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

On Tue, May 26, 2020 at 03:12:48PM -0400, Jim Quinlan wrote:
> The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> the use of multiple pfn offsets between cpu addrs and dma addrs.  It is
> similar to 'dma_pfn_offset' except that the offset chosen depends on the
> cpu or dma address involved.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/of/address.c        | 65 +++++++++++++++++++++++++++++++++++--
>  drivers/usb/core/message.c  |  3 ++
>  drivers/usb/core/usb.c      |  3 ++
>  include/linux/device.h      | 10 +++++-
>  include/linux/dma-direct.h  | 10 ++++--
>  include/linux/dma-mapping.h | 46 ++++++++++++++++++++++++++
>  kernel/dma/Kconfig          | 13 ++++++++
>  7 files changed, 144 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 96d8cfb14a60..a01afffcde7d 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -918,6 +918,47 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
>  }
>  EXPORT_SYMBOL(of_io_request_and_map);
>  
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +static int attach_dma_pfn_offset_map(struct device *dev,
> +				     struct device_node *node, int num_ranges)
> +{
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	size_t r_size = (num_ranges + 1)
> +		* sizeof(struct dma_pfn_offset_region);
> +	struct dma_pfn_offset_region *r;
> +

> +	r = devm_kzalloc(dev, r_size, GFP_KERNEL);

devm_?!

Looking at r_size it should be rather kcalloc().

> +	if (!r)
> +		return -ENOMEM;
> +	dev->dma_pfn_offset_map = r;
> +	of_dma_range_parser_init(&parser, node);
> +
> +	/*
> +	 * Record all info for DMA ranges array.  We could
> +	 * just use the of_range struct, but if we did that it
> +	 * would require more calculations for phys_to_dma and
> +	 * dma_to_phys conversions.
> +	 */
> +	for_each_of_range(&parser, &range) {
> +		r->cpu_beg = range.cpu_addr;
> +		r->cpu_end = r->cpu_beg + range.size;
> +		r->dma_beg = range.bus_addr;
> +		r->dma_end = r->dma_beg + range.size;
> +		r->pfn_offset = PFN_DOWN(range.cpu_addr)
> +			- PFN_DOWN(range.bus_addr);
> +		r++;
> +	}
> +	return 0;
> +}
> +#else
> +static int attach_dma_pfn_offset_map(struct device *dev,
> +				     struct device_node *node, int num_ranges)
> +{
> +	return 0;
> +}
> +#endif
> +
>  /**
>   * of_dma_get_range - Get DMA range info
>   * @dev:	device pointer; only needed for a corner case.
> @@ -947,6 +988,8 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
>  	struct of_range_parser parser;
>  	struct of_range range;
>  	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> +	bool dma_multi_pfn_offset = false;
> +	int num_ranges = 0;
>  
>  	while (node) {
>  		ranges = of_get_property(node, "dma-ranges", &len);
> @@ -977,10 +1020,19 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
>  		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
>  			 range.bus_addr, range.cpu_addr, range.size);
>  
> +		num_ranges++;
>  		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
> -			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
> -			/* Don't error out as we'd break some existing DTs */
> -			continue;
> +			if (!IS_ENABLED(CONFIG_DMA_PFN_OFFSET_MAP)) {
> +				pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
> +				pr_warn("Perhaps set DMA_PFN_OFFSET_MAP=y?\n");
> +				/*
> +				 * Don't error out as we'd break some existing
> +				 * DTs that are using configs w/o
> +				 * CONFIG_DMA_PFN_OFFSET_MAP set.
> +				 */
> +				continue;
> +			}
> +			dma_multi_pfn_offset = true;
>  		}
>  		dma_offset = range.cpu_addr - range.bus_addr;
>  
> @@ -991,6 +1043,13 @@ int of_dma_get_range(struct device *dev, struct device_node *np, u64 *dma_addr,
>  			dma_end = range.bus_addr + range.size;
>  	}
>  
> +	if (dma_multi_pfn_offset) {
> +		dma_offset = 0;
> +		ret = attach_dma_pfn_offset_map(dev, node, num_ranges);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (dma_start >= dma_end) {
>  		ret = -EINVAL;
>  		pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 6197938dcc2d..aaa3e58f5eb4 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1960,6 +1960,9 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  		 */
>  		intf->dev.dma_mask = dev->dev.dma_mask;
>  		intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +		intf->dev.dma_pfn_offset_map = dev->dev.dma_pfn_offset_map;
> +#endif
>  		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
>  		intf->minor = -1;
>  		device_initialize(&intf->dev);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index f16c26dc079d..d2ed4d90e56e 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -612,6 +612,9 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
>  	 */
>  	dev->dev.dma_mask = bus->sysdev->dma_mask;
>  	dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +	dev->dev.dma_pfn_offset_map = bus->sysdev->dma_pfn_offset_map;
> +#endif
>  	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
>  	dev->state = USB_STATE_ATTACHED;
>  	dev->lpm_disable_count = 1;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ac8e37cd716a..67a240ad4fc5 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -493,6 +493,8 @@ struct dev_links_info {
>   * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
>   *		DMA limit than the device itself supports.
>   * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> + * @dma_pfn_offset_map:	Like dma_pfn_offset but used when there are multiple
> + *		pfn offsets for multiple dma-ranges.
>   * @dma_parms:	A low level driver may set these to teach IOMMU code about
>   * 		segment limitations.
>   * @dma_pools:	Dma pools (if dma'ble device).
> @@ -578,7 +580,13 @@ struct device {
>  					     allocations such descriptors. */
>  	u64		bus_dma_limit;	/* upstream dma constraint */
>  	unsigned long	dma_pfn_offset;
> -
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +	const struct dma_pfn_offset_region *dma_pfn_offset_map;

> +					/* Like dma_pfn_offset, but for
> +					 * the unlikely case of multiple
> +					 * offsets. If non-null, dma_pfn_offset
> +					 * will be set to 0. */

A bit harder to read comment indented too much and located after the declared variable.

> +#endif
>  	struct device_dma_parameters *dma_parms;
>  
>  	struct list_head	dma_pools;	/* dma pools (if dma'ble) */
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index 24b8684aa21d..03110a57eabc 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -14,15 +14,21 @@ extern unsigned int zone_dma_bits;
>  static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
>  	dma_addr_t dev_addr = (dma_addr_t)paddr;
> +	/* The compiler should remove the 2nd term if !DMA_PFN_OFFSET_MAP */
> +	unsigned long dma_pfn_offset = dev->dma_pfn_offset
> +		+ dma_pfn_offset_from_phys_addr(dev, paddr);
>  
> -	return dev_addr - ((dma_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
> +	return dev_addr - ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
>  }
>  
>  static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
>  {
>  	phys_addr_t paddr = (phys_addr_t)dev_addr;
> +	/* The compiler should remove the 2nd term if !DMA_PFN_OFFSET_MAP */
> +	unsigned long dma_pfn_offset = dev->dma_pfn_offset
> +		+ dma_pfn_offset_from_dma_addr(dev, paddr);
>  
> -	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
> +	return paddr + ((phys_addr_t)dma_pfn_offset << PAGE_SHIFT);
>  }
>  #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
>  
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 330ad58fbf4d..91940bba2229 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -256,6 +256,52 @@ static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
>  size_t dma_direct_max_mapping_size(struct device *dev);
>  
>  #ifdef CONFIG_HAS_DMA
> +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> +struct dma_pfn_offset_region {

> +	phys_addr_t	cpu_beg;
> +	phys_addr_t	cpu_end;
> +	dma_addr_t	dma_beg;
> +	dma_addr_t	dma_end;

Perhaps
	s,beg,start,
in above names

> +	unsigned long	pfn_offset;
> +};
> +
> +static inline unsigned long dma_pfn_offset_from_dma_addr(struct device *dev,
> +							 dma_addr_t dma_addr)
> +{
> +	const struct dma_pfn_offset_region *m = dev->dma_pfn_offset_map;

> +	if (m)
> +		for (; m->cpu_end; m++)

Why not simple

	while (m) {
		...
	}

?


> +			if (dma_addr >= m->dma_beg && dma_addr < m->dma_end)
> +				return m->pfn_offset;
> +	return 0;
> +}
> +
> +static inline unsigned long dma_pfn_offset_from_phys_addr(struct device *dev,
> +							  phys_addr_t paddr)
> +{
> +	const struct dma_pfn_offset_region *m = dev->dma_pfn_offset_map;
> +

> +	if (m)
> +		for (; m->cpu_end; m++)

Ditto.

> +			if (paddr >= m->cpu_beg && paddr < m->cpu_end)
> +				return m->pfn_offset;
> +	return 0;
> +}
> +#else  /* CONFIG_DMA_PFN_OFFSET_MAP */
> +static inline unsigned long dma_pfn_offset_from_dma_addr(struct device *dev,
> +							 dma_addr_t dma_addr)
> +{
> +	return 0;
> +}
> +
> +static inline unsigned long dma_pfn_offset_from_phys_addr(struct device *dev,
> +							  phys_addr_t paddr)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_DMA_PFN_OFFSET_MAP */
> +
>  #include <asm/dma-mapping.h>
>  
>  static inline const struct dma_map_ops *get_dma_ops(struct device *dev)
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 4c103a24e380..ceb7e5e8f501 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -195,3 +195,16 @@ config DMA_API_DEBUG_SG
>  	  is technically out-of-spec.
>  
>  	  If unsure, say N.
> +
> +config DMA_PFN_OFFSET_MAP
> +	bool "Uses a DMA range map to calculate PFN offset"
> +	depends on PCIE_BRCMSTB

> +	default n

Redundant.

> +	help
> +	  Some devices have a dma-range that gets converted to
> +	  a dev->dma_pfn_offset value.  This option is for the
> +	  atypical case of there being multiple dma-ranges requiring
> +	  multiple pfn offsets, which are selected from when
> +	  converting to phys to dma and vice versa.
> +
> +	  If unsure, say N.
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
