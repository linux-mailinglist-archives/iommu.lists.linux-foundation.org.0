Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A072F39AF
	for <lists.iommu@lfdr.de>; Tue, 12 Jan 2021 20:10:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CD301200E5;
	Tue, 12 Jan 2021 19:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J+prAC5Kcf15; Tue, 12 Jan 2021 19:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6E9FA20363;
	Tue, 12 Jan 2021 19:10:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51FE3C013A;
	Tue, 12 Jan 2021 19:10:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26081C0893
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A46020022
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kv61s7p5Gj+7 for <iommu@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 19:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id B6B261FE49
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:10:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 192781063;
 Tue, 12 Jan 2021 11:10:25 -0800 (PST)
Received: from [10.57.56.43] (unknown [10.57.56.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C4533F66E;
 Tue, 12 Jan 2021 11:10:23 -0800 (PST)
Subject: Re: [RFC PATCH V2 2/2] iommu: add Unisoc iommu basic driver
To: Chunyan Zhang <zhang.lyra@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20210108113851.354947-1-zhang.lyra@gmail.com>
 <20210108113851.354947-3-zhang.lyra@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <47f73502-15fe-5d65-6fc9-22eb078d7797@arm.com>
Date: Tue, 12 Jan 2021 19:10:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108113851.354947-3-zhang.lyra@gmail.com>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, Sheng Xu <sheng.xu@unisoc.com>,
 iommu@lists.linux-foundation.org, Kevin Tang <kevin.tang@unisoc.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>
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

On 2021-01-08 11:38, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> This patch only adds display iommu support, the driver was tested with sprd
> dpu.
> 
> The iommu support for others would be added once finished tests with those
> devices, such as Image codec(jpeg) processor, a few signal processors,
> including VSP(video), GSP(graphic), ISP(image), and camera CPP, etc.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>   drivers/iommu/Kconfig      |  12 +
>   drivers/iommu/Makefile     |   1 +
>   drivers/iommu/sprd-iommu.c | 546 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 559 insertions(+)
>   create mode 100644 drivers/iommu/sprd-iommu.c
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 192ef8f61310..3f8dcf070442 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -408,4 +408,16 @@ config VIRTIO_IOMMU
>   
>   	  Say Y here if you intend to run this kernel as a guest.
>   
> +config SPRD_IOMMU
> +	tristate "Unisoc IOMMU Support"
> +	depends on ARCH_SPRD

Any chance of COMPILE_TEST support too?

> +	select IOMMU_API
> +	help
> +	  Support for IOMMU on Unisoc's SoCs on which multi-media subsystems
> +	  need IOMMU, such as DPU, Image codec(jpeg) processor, and a few
> +	  signal processors, including VSP(video), GSP(graphic), ISP(image), and
> +	  CPP, etc.
> +
> +	  Say Y here if you want multi-media functions.
> +
>   endif # IOMMU_SUPPORT
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 61bd30cd8369..5925b6af2123 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
>   obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
>   obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
>   obj-$(CONFIG_IOMMU_SVA_LIB) += iommu-sva-lib.o
> +obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> new file mode 100644
> index 000000000000..a112b4d3cc23
> --- /dev/null
> +++ b/drivers/iommu/sprd-iommu.c
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Unisoc IOMMU driver
> + *
> + * Copyright (C) 2020 Unisoc, Inc.
> + * Author: Chunyan Zhang <chunyan.zhang@unisoc.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/dma-iommu.h>
> +#include <linux/errno.h>
> +#include <linux/iommu.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/slab.h>
> +
> +/* SPRD IOMMU page is 4K size alignment */
> +#define SPRD_IOMMU_PAGE_SHIFT	12
> +#define SPRD_IOMMU_PAGE_SIZE	SZ_4K
> +
> +#define SPRD_IOMMU_REG_OFFSET	0x800
> +#define SPRD_EX_CFG		(SPRD_IOMMU_REG_OFFSET + 0x0)
> +#define SPRD_IOMMU_VAOR_BYPASS	BIT(4)
> +#define SPRD_IOMMU_GATE_EN	BIT(1)
> +#define SPRD_IOMMU_EN		BIT(0)
> +#define SPRD_EX_UPDATE		(SPRD_IOMMU_REG_OFFSET + 0x4)
> +#define SPRD_EX_FIRST_VPN	(SPRD_IOMMU_REG_OFFSET + 0x8)
> +#define SPRD_EX_VPN_RANGE	(SPRD_IOMMU_REG_OFFSET + 0xc)
> +#define SPRD_EX_FIRST_PPN	(SPRD_IOMMU_REG_OFFSET + 0x10)
> +#define SPRD_EX_DEFAULT_PPN	(SPRD_IOMMU_REG_OFFSET + 0x14)
> +
> +#define SPRD_IOMMU_VERSION	(SPRD_IOMMU_REG_OFFSET + 0x0)
> +#define SPRD_VERSION_MASK	GENMASK(15, 8)
> +#define SPRD_VERSION_SHIFT	8
> +#define SPRD_VAU_CFG		(SPRD_IOMMU_REG_OFFSET + 0x4)
> +#define SPRD_VAU_UPDATE		(SPRD_IOMMU_REG_OFFSET + 0x8)
> +#define SPRD_VAU_AUTH_CFG	(SPRD_IOMMU_REG_OFFSET + 0xc)
> +#define SPRD_VAU_FIRST_PPN	(SPRD_IOMMU_REG_OFFSET + 0x10)
> +#define SPRD_VAU_DEFAULT_PPN_RD	(SPRD_IOMMU_REG_OFFSET + 0x14)
> +#define SPRD_VAU_DEFAULT_PPN_WR	(SPRD_IOMMU_REG_OFFSET + 0x18)
> +#define SPRD_VAU_FIRST_VPN	(SPRD_IOMMU_REG_OFFSET + 0x1c)
> +#define SPRD_VAU_VPN_RANGE	(SPRD_IOMMU_REG_OFFSET + 0x20)
> +
> +enum sprd_iommu_version {
> +	SPRD_IOMMU_EX,
> +	SPRD_IOMMU_VAU,
> +};
> +
> +/*
> + * struct sprd_iommu_match_data - sprd iommu configurations which serves
> + *				  for different master devices
> + *
> + * @iova_start:	the first address that can be mapped
> + * @iova_size:	the largest address range that can be mapped
> + *
> + * iova_start and iova_size are designed for debug purpose, that says different
> + * masters use different ranges of virtual address.
> + */
> +struct sprd_iommu_match_data {
> +	unsigned long iova_start;
> +	unsigned long iova_size;
> +};
> +
> +/*
> + * struct sprd_iommu_device - high-level sprd iommu device representation,
> + * including hardware information and configuration, also driver data, etc
> + *
> + * @mdata:	hardware configuration and information
> + * @ver:	sprd iommu device version
> + * @prot_page:	protect page base address, data would be written to here
> + *		while translation fault
> + * @base:	mapped base address for accessing registers
> + * @dev:	pointer to basic device structure
> + * @iommu:	IOMMU core representation
> + * @group:	IOMMU group
> + */
> +struct sprd_iommu_device {
> +	const struct sprd_iommu_match_data *mdata;
> +	enum sprd_iommu_version ver;
> +	phys_addr_t		prot_page;
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct iommu_device	iommu;
> +	struct iommu_group	*group;
> +};
> +
> +struct sprd_iommu_domain {
> +	spinlock_t		pgtlock; /* lock for page table */
> +	struct iommu_domain	domain;
> +	u32			*pgt_va; /* page table virtual address base */
> +	struct sprd_iommu_device	*sdev;
> +};
> +
> +static const struct iommu_ops sprd_iommu_ops;
> +
> +static struct sprd_iommu_domain *to_sprd_domain(struct iommu_domain *dom)
> +{
> +	return container_of(dom, struct sprd_iommu_domain, domain);
> +}
> +
> +static inline void
> +iommu_writel(struct sprd_iommu_device *sdev, unsigned int reg, u32 val)
> +{
> +	writel_relaxed(val, sdev->base + reg);
> +}
> +
> +static inline u32
> +iommu_readl(struct sprd_iommu_device *sdev, unsigned int reg)
> +{
> +	return readl_relaxed(sdev->base + reg);
> +}
> +
> +static inline void
> +iommu_update_bits(struct sprd_iommu_device *sdev, unsigned int reg,
> +		  u32 mask, u32 shift, u32 val)
> +{
> +	u32 t = iommu_readl(sdev, reg);
> +
> +	t = (t & (~(mask << shift))) | ((val & mask) << shift);
> +	iommu_writel(sdev, reg, t);
> +}

This doesn't seem to be used anywhere.

> +
> +static inline int
> +set_version(struct sprd_iommu_device *sdev)

Nit: isn't this more of a "get" operation rather than a "set" one? Also 
some of these function names seem a little too vague and generic, so 
could probably do with some better namespacing.

> +{
> +	sdev->ver = (iommu_readl(sdev, SPRD_IOMMU_VERSION) &
> +		     SPRD_VERSION_MASK) >> SPRD_VERSION_SHIFT;
> +
> +	if (sdev->ver != SPRD_IOMMU_EX &&
> +	    sdev->ver != SPRD_IOMMU_VAU)
> +		return -EINVAL;
> +
> +	return 0;

Given what this is doing, maybe consider implementing it as a switch 
statement?

> +}
> +
> +static dma_addr_t sprd_iommu_dma_addr(void *va)
> +{
> +	return (dma_addr_t)virt_to_phys(va);
> +}

Urgh, please don't copy this - I'll come back to that later...

> +
> +static unsigned long
> +sprd_iommu_pgt_size(const struct sprd_iommu_match_data *mdata)
> +{
> +	return (mdata->iova_size >> SPRD_IOMMU_PAGE_SHIFT) * 4;
> +}
> +
> +static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
> +{
> +	struct sprd_iommu_domain *dom;
> +
> +	if (domain_type != IOMMU_DOMAIN_DMA && domain_type != IOMMU_DOMAIN_UNMANAGED)
> +		return NULL;
> +
> +	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
> +	if (!dom)
> +		return NULL;
> +
> +	if (iommu_get_dma_cookie(&dom->domain)) {
> +		kfree(dom);
> +		return NULL;
> +	}
> +
> +	spin_lock_init(&dom->pgtlock);
> +
> +	return &dom->domain;
> +}
> +
> +static void sprd_iommu_domain_free(struct iommu_domain *domain)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	struct sprd_iommu_device *sdev = dom->sdev;
> +	size_t pgt_size = (size_t)sprd_iommu_pgt_size(sdev->mdata);

You cast this to size_t in both places it's used - just make the 
function return the appropriate type in the first place.

> +
> +	dma_free_coherent(sdev->dev, pgt_size, dom->pgt_va,
> +			  sprd_iommu_dma_addr(dom->pgt_va));

In principle a domain can be freed without any device ever having been 
attached, therefore this can go badly wrong if pgt_va is invalid. But 
there's a far bigger problem lurking here anyway...

> +	kfree(dom);
> +}
> +
> +static void sprd_iommu_first_vpn(struct sprd_iommu_device *sdev)
> +{
> +	u32 val = (u32)sdev->mdata->iova_start;

As above, if these mdata values inherently represent 32-bit values, then 
just make them u32 in the first place.

> +	unsigned int reg;
> +
> +	if (sdev->ver == SPRD_IOMMU_EX)
> +		reg = SPRD_EX_FIRST_VPN;
> +	else
> +		reg = SPRD_VAU_FIRST_VPN;
> +
> +	val = val >> SPRD_IOMMU_PAGE_SHIFT;

...however this makes me wonder whether the hardware really only works 
with 20-bit PFNs describing 32-bit addresses, or whether it's actually 
32-bit PFNs to cope with ~40-bit addresses and you've got the truncation 
in the wrong place.

> +
> +	iommu_writel(sdev, reg, val);
> +}
> +
> +static void sprd_iommu_vpn_range(struct sprd_iommu_device *sdev)
> +{
> +	u32 val = (u32)sdev->mdata->iova_size;
> +	unsigned int reg;
> +
> +	if (sdev->ver == SPRD_IOMMU_EX)
> +		reg = SPRD_EX_VPN_RANGE;
> +	else
> +		reg = SPRD_VAU_VPN_RANGE;
> +
> +	val = (val >> SPRD_IOMMU_PAGE_SHIFT) - 1;
> +
> +	iommu_writel(sdev, reg, val);
> +}
> +
> +static void sprd_iommu_first_ppn(struct sprd_iommu_domain *dom)
> +{
> +	u32 val = sprd_iommu_dma_addr(dom->pgt_va) >> SPRD_IOMMU_PAGE_SHIFT;
> +	struct sprd_iommu_device *sdev = dom->sdev;
> +	unsigned int reg;
> +
> +	if (sdev->ver == SPRD_IOMMU_EX)
> +		reg = SPRD_EX_FIRST_PPN;
> +	else
> +		reg = SPRD_VAU_FIRST_PPN;
> +
> +	iommu_writel(sdev, reg, val);
> +}
> +
> +static void sprd_iommu_default_ppn(struct sprd_iommu_device *sdev)
> +{
> +	u32 val = (u32)sdev->prot_page >> SPRD_IOMMU_PAGE_SHIFT;
> +
> +	if (sdev->ver == SPRD_IOMMU_EX) {
> +		iommu_writel(sdev, SPRD_EX_DEFAULT_PPN, val);
> +	} else if (sdev->ver == SPRD_IOMMU_VAU) {
> +		iommu_writel(sdev, SPRD_VAU_DEFAULT_PPN_RD, val);
> +		iommu_writel(sdev, SPRD_VAU_DEFAULT_PPN_WR, val);
> +	}
> +}
> +
> +static void sprd_iommu_hw_cfg(struct sprd_iommu_device *sdev)
> +{
> +	unsigned int reg_cfg, reg_update;
> +
> +	if (sdev->ver == SPRD_IOMMU_EX) {
> +		reg_cfg = SPRD_EX_CFG;
> +		reg_update = SPRD_EX_UPDATE;
> +	} else {
> +		reg_cfg = SPRD_VAU_CFG;
> +		reg_update = SPRD_VAU_UPDATE;
> +	}
> +
> +	/* enable mmu, clk gate, vaor bypass */
> +	iommu_writel(sdev, reg_cfg, SPRD_IOMMU_EN | SPRD_IOMMU_GATE_EN |
> +		     SPRD_IOMMU_VAOR_BYPASS);
> +
> +	/* clear iommu TLB buffer after page table updated */
> +	iommu_writel(sdev, reg_update, 0xffffffff);
> +}
> +
> +static int sprd_iommu_attach_device(struct iommu_domain *domain,
> +				    struct device *dev)
> +{
> +	struct sprd_iommu_device *sdev = dev_iommu_priv_get(dev);
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	size_t pgt_size = (size_t)sprd_iommu_pgt_size(sdev->mdata);
> +
> +	dom->pgt_va = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, get_order(pgt_size));

Combined with sprd_iommu_domain_free(), something is utterly broken - 
you can't allocate pgt_va from the page allocator and free it back to 
the DMA allocator later. Also as it is this has no guarantee of giving 
you something with a 32-bit physical address as assumed elsewhere (maybe 
the memory map of the relevant platforms makes that implicit, but that's 
still bad practice). Unless you have a very very good reason not to, you 
should be using the DMA allocator for this, not least so that you get a 
proper DMA address instead of abusing virt_to_phys() trickery.

Either way you'll also leak this if the device is detached from a domain 
and then reattached back (or if multiple devices are attached to the 
same domain; even if you intentionally don't support that case you also 
don't prevent it either).

> +	if (!dom->pgt_va) {
> +		dev_err(sdev->dev, "Fail to alloc pages.\n");
> +		return -ENOMEM;
> +	}
> +
> +	dom->domain.geometry.aperture_start = sdev->mdata->iova_start;
> +	dom->domain.geometry.aperture_end = sdev->mdata->iova_start +
> +					    sdev->mdata->iova_size - 1;
> +	dom->sdev = sdev;
> +
> +	sprd_iommu_first_ppn(dom);
> +	sprd_iommu_first_vpn(sdev);
> +	sprd_iommu_vpn_range(sdev);
> +	sprd_iommu_default_ppn(sdev);
> +	sprd_iommu_hw_cfg(sdev);
> +
> +	return 0;
> +}
> +
> +static void sprd_iommu_detach_device(struct iommu_domain *domain,
> +					     struct device *dev)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +
> +	dom->sdev = NULL;
> +}
> +
> +static int sprd_iommu_map(struct iommu_domain *domain, unsigned long iova,
> +			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	const struct sprd_iommu_match_data *mdata;
> +	unsigned int page_num = size >> SPRD_IOMMU_PAGE_SHIFT;
> +	unsigned long flags;
> +	unsigned int i;
> +	u32 *pgt_base_iova;
> +	u32 pabase = (u32)paddr;

Calling back to earlier, can there be 64-bit (or 32-bit LPAE) systems 
with more than 32 significant PA bits?

> +	int map_size = 0;
> +
> +	if (!dom->sdev) {
> +		pr_err("No sprd_iommu_device attached to the domain\n");
> +		return -EINVAL;
> +	}
> +
> +	mdata = dom->sdev->mdata;

Arguably you could make all these checks against the geometry of the 
domain you already have, rather than dredging up the original mdata again.

> +	if ((iova + size) > (mdata->iova_start + mdata->iova_size) ||
> +	    iova < mdata->iova_start) {
> +		dev_err(dom->sdev->dev, "(iova(0x%lx) + sixe(0x%lx)) are not in the range!\n",
> +			iova, size);
> +		return -EINVAL;
> +	}
> +
> +	pgt_base_iova = dom->pgt_va +
> +		((iova - mdata->iova_start) >> SPRD_IOMMU_PAGE_SHIFT);
> +
> +	spin_lock_irqsave(&dom->pgtlock, flags);
> +	for (i = 0; i < page_num; i++) {
> +		pgt_base_iova[i] = pabase >> SPRD_IOMMU_PAGE_SHIFT;

Out of curiosity, is the pagetable walker cache-coherent, or is this 
currently managing to work by pure chance and natural cache churn?

> +		pabase += SPRD_IOMMU_PAGE_SIZE;
> +		map_size += SPRD_IOMMU_PAGE_SIZE;
> +	}
> +	spin_unlock_irqrestore(&dom->pgtlock, flags);
> +
> +	return map_size == size ? 0 : -EEXIST;
> +}
> +
> +static size_t sprd_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
> +			size_t size, struct iommu_iotlb_gather *iotlb_gather)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	const struct sprd_iommu_match_data *mdata = dom->sdev->mdata;
> +	unsigned long flags;
> +	u32 *pgt_base_iova;
> +	unsigned int page_num = size >> SPRD_IOMMU_PAGE_SHIFT;
> +
> +	if ((iova + size) > (mdata->iova_start + mdata->iova_size) ||
> +	    iova < mdata->iova_start)
> +		return -EINVAL;
> +
> +	pgt_base_iova = dom->pgt_va +
> +		((iova - mdata->iova_start) >> SPRD_IOMMU_PAGE_SHIFT);
> +
> +	spin_lock_irqsave(&dom->pgtlock, flags);
> +	memset(pgt_base_iova, 0, page_num * sizeof(u32));
> +	spin_unlock_irqrestore(&dom->pgtlock, flags);

Surely you need to do some TLB maintenance here, or implement 
->iotlb_sync? I refuse to believe that you've made the world's most 
backwards TLB which *only* caches invalid translations :)

> +
> +	return 0;
> +}
> +
> +static void sprd_iommu_sync_map(struct iommu_domain *domain)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	unsigned int reg;
> +
> +	if (dom->sdev->ver == SPRD_IOMMU_EX)
> +		reg = SPRD_EX_UPDATE;
> +	else
> +		reg = SPRD_VAU_UPDATE;
> +
> +	iommu_writel(dom->sdev, reg, 0xffffffff);
> +}
> +
> +static phys_addr_t sprd_iommu_iova_to_phys(struct iommu_domain *domain,
> +					   dma_addr_t iova)
> +{
> +	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
> +	const struct sprd_iommu_match_data *mdata = dom->sdev->mdata;
> +	unsigned long flags;
> +	phys_addr_t pa;
> +	unsigned long start = mdata->iova_start;
> +	unsigned long end = mdata->iova_start + mdata->iova_size - 1;
> +
> +	if (iova < start || iova > end)
> +		pr_err("iova (0x%llx) exceed the vpn range[0x%lx-0x%lx]!\n",
> +		       iova, start, end);
> +
> +	spin_lock_irqsave(&dom->pgtlock, flags);
> +	pa = *(dom->pgt_va + ((iova - mdata->iova_start) >> SPRD_IOMMU_PAGE_SHIFT));
> +	pa = pa << SPRD_IOMMU_PAGE_SHIFT;
> +	spin_unlock_irqrestore(&dom->pgtlock, flags);
> +
> +	return pa;
> +}
> +
> +static struct iommu_device *sprd_iommu_probe_device(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct sprd_iommu_device *sdev;
> +
> +	if (!fwspec || fwspec->ops != &sprd_iommu_ops)
> +		return ERR_PTR(-ENODEV);
> +
> +	sdev = dev_iommu_priv_get(dev);
> +
> +	return &sdev->iommu;
> +}
> +
> +static void sprd_iommu_release_device(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +	if (!fwspec || fwspec->ops != &sprd_iommu_ops)
> +		return;
> +
> +	iommu_fwspec_free(dev);
> +}
> +
> +static struct iommu_group *sprd_iommu_device_group(struct device *dev)
> +{
> +	struct sprd_iommu_device *sdev = dev_iommu_priv_get(dev);
> +
> +	if (!sdev)
> +		return ERR_PTR(-ENODEV);
> +
> +	/* All the client devices are in the same iommu-group */
> +	if (!sdev->group) {

If you only have a single iommu-wide group, you may as well just 
allocate it up-front at probe time.

> +		sdev->group = iommu_group_alloc();
> +		if (IS_ERR(sdev->group))
> +			dev_err(dev, "Failed to allocate IOMMU group\n");
> +	}
> +
> +	return sdev->group;

You should probably get the refcounting right either way, though.

> +}
> +
> +static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
> +{
> +	struct platform_device *pdev;
> +
> +	if (!dev_iommu_priv_get(dev)) {
> +		pdev = of_find_device_by_node(args->np);
> +		if (WARN_ON(!pdev))

It should be impossible for that to happen - the platform device has to 
exist for its driver to have bound and called iommu_register_device() 
for iommu_ops_from_fwnode() to find an of_xlate pointer to call at all.

> +			return -EINVAL;
> +
> +		dev_iommu_priv_set(dev, platform_get_drvdata(pdev));
> +	}
> +
> +	return iommu_fwspec_add_ids(dev, args->args, 1);

Why? The binding says you don't ever have any arguments :/

> +}
> +
> +
> +static const struct iommu_ops sprd_iommu_ops = {
> +	.domain_alloc	= sprd_iommu_domain_alloc,
> +	.domain_free	= sprd_iommu_domain_free,
> +	.attach_dev	= sprd_iommu_attach_device,
> +	.detach_dev	= sprd_iommu_detach_device,
> +	.map		= sprd_iommu_map,
> +	.unmap		= sprd_iommu_unmap,
> +	.iotlb_sync_map = sprd_iommu_sync_map,
> +	.iova_to_phys	= sprd_iommu_iova_to_phys,
> +	.probe_device	= sprd_iommu_probe_device,
> +	.release_device	= sprd_iommu_release_device,
> +	.device_group	= sprd_iommu_device_group,
> +	.of_xlate	= sprd_iommu_of_xlate,
> +	.pgsize_bitmap	= ~0UL << SPRD_IOMMU_PAGE_SHIFT,
> +};
> +
> +static const struct sprd_iommu_match_data sprd_iommu_disp = {
> +	.iova_start = 0x30000000,
> +	.iova_size = 0x10000000,
> +};
> +
> +static const struct of_device_id sprd_iommu_of_match[] = {
> +	{ .compatible = "sprd,iommu-disp",
> +	  .data = &sprd_iommu_disp },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sprd_iommu_of_match);
> +
> +static int sprd_iommu_probe(struct platform_device *pdev)
> +{
> +	struct sprd_iommu_device *sdev;
> +	struct device *dev = &pdev->dev;
> +	void *p;
> +	int ret;
> +
> +	sdev = devm_kzalloc(dev, sizeof(*sdev), GFP_KERNEL);
> +	if (!sdev)
> +		return -ENOMEM;
> +
> +	sdev->base = devm_platform_ioremap_resource(pdev, 0);
> +
> +	sdev->mdata = device_get_match_data(dev);
> +
> +	if (set_version(sdev)) {
> +		dev_err(dev, "iommu version(0x%x) is invalid.\n", sdev->ver);
> +		return -EINVAL;
> +	}
> +
> +	p = (void *)get_zeroed_page(GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +	sdev->prot_page = virt_to_phys(p);

No. This is a DMA buffer; use the DMA allocator and do it properly.

> +	sdev->dev = dev;
> +
> +	platform_set_drvdata(pdev, sdev);
> +
> +	ret = iommu_device_sysfs_add(&sdev->iommu, &pdev->dev, NULL,
> +				     dev_name(&pdev->dev));
> +	if (ret)
> +		return ret;
> +
> +	iommu_device_set_ops(&sdev->iommu, &sprd_iommu_ops);
> +	iommu_device_set_fwnode(&sdev->iommu, &pdev->dev.of_node->fwnode);

Lots of uses of "&pdev->dev" when you already have the local "dev" 
variable :/

> +
> +	ret = iommu_device_register(&sdev->iommu);
> +	if (ret)
> +		return ret;
> +
> +	if (!iommu_present(&platform_bus_type))
> +		bus_set_iommu(&platform_bus_type,  &sprd_iommu_ops);
> +
> +	return 0;
> +}
> +
> +static int sprd_iommu_remove(struct platform_device *pdev)
> +{
> +	struct sprd_iommu_device *sdev = platform_get_drvdata(pdev);
> +
> +	if (sdev->group)
> +		iommu_group_put(sdev->group);
> +
> +	bus_set_iommu(&platform_bus_type, NULL);
> +
> +	platform_set_drvdata(pdev, NULL);
> +	iommu_device_sysfs_remove(&sdev->iommu);
> +	iommu_device_unregister(&sdev->iommu);

You're leaking at least prot_page and group here.

> +
> +	return 0;
> +}
> +
> +static struct platform_driver sprd_iommu_driver = {
> +	.driver	= {
> +		.name		= "sprd-iommu",
> +		.of_match_table	= sprd_iommu_of_match,
> +
> +	},
> +	.probe	= sprd_iommu_probe,
> +	.remove	= sprd_iommu_remove,
> +};
> +module_platform_driver(sprd_iommu_driver);
> +
> +MODULE_DESCRIPTION("IOMMU driver for Unisoc SoCs");
> +MODULE_ALIAS("platform:sprd-iommu");
> +MODULE_LICENSE("GPL v2");

Overall, though, this looks in pleasingly good shape for an RFC driver. 
Even the major issues appear to be just simple oversights, and easily 
fixed; the overall design seems straightforward and sound. I guess it 
helps a lot that the hardware is apparently so wonderfully simple :)

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
