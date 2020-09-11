Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35226594E
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 08:25:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 169BB87184;
	Fri, 11 Sep 2020 06:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPlyoJZ_oiio; Fri, 11 Sep 2020 06:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DAF778716D;
	Fri, 11 Sep 2020 06:25:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA67CC0051;
	Fri, 11 Sep 2020 06:25:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A14CEC0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 06:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F48C204B3
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 06:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFPjIacfNJiU for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 06:25:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id F3B9B204A7
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 06:25:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9D35867373; Fri, 11 Sep 2020 08:25:12 +0200 (CEST)
Date: Fri, 11 Sep 2020 08:25:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] ARM/dma-mapping: move various helpers from
 dma-mapping.h to dma-direct.h
Message-ID: <20200911062512.GC21597@lst.de>
References: <20200910054038.324517-1-hch@lst.de>
 <20200910054038.324517-2-hch@lst.de>
 <42497691-ec93-1e93-d3e5-e841eaf8247a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42497691-ec93-1e93-d3e5-e841eaf8247a@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Jim Quinlan <james.quinlan@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Sep 10, 2020 at 07:02:23PM +0100, Robin Murphy wrote:
> On 2020-09-10 06:40, Christoph Hellwig wrote:
>> Move the helpers to translate to and from direct mapping DMA addresses
>> to dma-direct.h.  This not only is the most logical place, but the new
>> placement also avoids dependency loops with pending commits.
>
> For the straightforward move as it should be,
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>
> However I do wonder how much of this could be cleaned up further...
>> +
>> +#ifdef __arch_page_to_dma
>> +#error Please update to __arch_pfn_to_dma
>> +#endif
>
> This must be long, long dead by now.

Yeah.  I had a patch to remove this which lead me into the rabbit
hole your described later.  A few patches in I decided to give up
and just do the trivial move.  But it probably makes sense to pick
up at least the two trivial dead code removal patches..

>> +static inline unsigned long dma_to_pfn(struct device *dev, dma_addr_t addr)
>> +{
>> +	unsigned long pfn = __bus_to_pfn(addr);
>> +
>> +	if (dev)
>> +		pfn += dev->dma_pfn_offset;
>> +
>> +	return pfn;
>> +}
>
> These are only overridden for OMAP1510, and it looks like it wouldn't take 
> much for the platform code or ohci-omap driver to set up a generic DMA 
> offset for the relevant device.

I sent a ping to the omap maintainers earlier this week to ask for that :)

>> +static inline dma_addr_t virt_to_dma(struct device *dev, void *addr)
>> +{
>> +	if (dev)
>> +		return pfn_to_dma(dev, virt_to_pfn(addr));
>> +
>> +	return (dma_addr_t)__virt_to_bus((unsigned long)(addr));
>> +}
>
> And this is only used for some debug prints in dmabounce.
>
> Similarly the __bus_to_*()/__*_to_bus() calls themselves only appear 
> significant to mach-footbridge any more, and could probably also be evolved 
> into regular DMA offsets now that all API calls must have a non-NULL 
> device. I think I might come back and take a closer look at all this at 
> some point in future... :)

Yes,  pretty much all of this should eventually go away.  I just don't
want to bock the ranges work on all kinds of random arm cleanups..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
