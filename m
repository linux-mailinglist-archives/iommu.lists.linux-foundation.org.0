Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9675714710C
	for <lists.iommu@lfdr.de>; Thu, 23 Jan 2020 19:47:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 292CE8765D;
	Thu, 23 Jan 2020 18:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYbWW8qmy+0M; Thu, 23 Jan 2020 18:47:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1365E876A2;
	Thu, 23 Jan 2020 18:47:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5A30C0174;
	Thu, 23 Jan 2020 18:47:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84359C0174
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jan 2020 18:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6049886256
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jan 2020 18:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IY3NXHasBWB for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jan 2020 18:47:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07CF98405F
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jan 2020 18:47:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55EF91FB;
 Thu, 23 Jan 2020 10:47:18 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A97A73F52E;
 Thu, 23 Jan 2020 10:47:16 -0800 (PST)
Subject: Re: [PATCH 2/3] iommu: Add Allwinner H6 IOMMU driver
To: Maxime Ripard <maxime@cerno.tech>, Joerg Roedel <joro@8bytes.org>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
 <fe383c3f6fa0db772c87d9d9080add97efe9ba1a.1579696927.git-series.maxime@cerno.tech>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a0bec2de-e87a-ddac-450e-b0f467158796@arm.com>
Date: Thu, 23 Jan 2020 18:47:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fe383c3f6fa0db772c87d9d9080add97efe9ba1a.1579696927.git-series.maxime@cerno.tech>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Maxime,

This looks like a pretty decent first cut of a driver, thanks! Plenty of 
comments, but overall it looks to be in mostly the right shape to begin 
with.

On 22/01/2020 12:44 pm, Maxime Ripard wrote:
> The Allwinner H6 has introduced an IOMMU for a few DMA controllers, mostly
> video related: the display engine, the video decoders / encoders, the
> camera capture controller, etc.
> 
> The design is pretty simple compared to other IOMMUs found in SoCs: there's
> a single instance, controlling all the masters, with a single address
> space.
> 
> It also features a performance monitoring unit that allows to retrieve
> various informations (per-master and global TLB accesses, hits and misses,
> access latency, etc) that isn't supported at the moment.

Yes, it sounds like that might ideally be a separate perf_events driver, 
but there's no need to get into the details of that until the basic 
IOMMU driver is baked.

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/iommu/Kconfig        |   10 +-
>   drivers/iommu/Makefile       |    1 +-
>   drivers/iommu/sun50i-iommu.c | 1126 +++++++++++++++++++++++++++++++++++-
>   3 files changed, 1137 insertions(+)
>   create mode 100644 drivers/iommu/sun50i-iommu.c
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0b9d78a0f3ac..5cbfa6f282e2 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -289,6 +289,16 @@ config ROCKCHIP_IOMMU
>   	  Say Y here if you are using a Rockchip SoC that includes an IOMMU
>   	  device.
>   
> +config SUN50I_IOMMU
> +	bool "Allwinner H6 IOMMU Support"
> +	depends on ARM || ARM64
> +	depends on ARCH_SUNXI

Surely ARCH_SUNXI implies "ARM || ARM64" anyway? Ideally there shouldn't 
be anything CPU-specific here, so supporting COMPILE_TEST as well would 
be nice.

> +	select ARM_DMA_USE_IOMMU
> +	select IOMMU_API
> +	select IOMMU_DMA
> +	help
> +	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
> +
>   config TEGRA_IOMMU_GART
>   	bool "Tegra GART IOMMU Support"
>   	depends on ARCH_TEGRA_2x_SOC
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 97814cc861ea..43740a755786 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_MTK_IOMMU_V1) += mtk_iommu_v1.o
>   obj-$(CONFIG_OMAP_IOMMU) += omap-iommu.o
>   obj-$(CONFIG_OMAP_IOMMU_DEBUG) += omap-iommu-debug.o
>   obj-$(CONFIG_ROCKCHIP_IOMMU) += rockchip-iommu.o
> +obj-$(CONFIG_SUN50I_IOMMU) += sun50i-iommu.o
>   obj-$(CONFIG_TEGRA_IOMMU_GART) += tegra-gart.o
>   obj-$(CONFIG_TEGRA_IOMMU_SMMU) += tegra-smmu.o
>   obj-$(CONFIG_EXYNOS_IOMMU) += exynos-iommu.o
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> new file mode 100644
> index 000000000000..ffca92628006
> --- /dev/null
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -0,0 +1,1126 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +// Copyright (C) 2016-2018, Allwinner Technology CO., LTD.
> +// Copyright (C) 2019-2020, Cerno
> +
> +#include <linux/bug.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-iommu.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/iopoll.h>
> +#include <linux/ioport.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#define IOMMU_RESET_REG			0x010
> +#define IOMMU_ENABLE_REG		0x020
> +#define IOMMU_ENABLE_ENABLE			BIT(0)
> +
> +#define IOMMU_BYPASS_REG		0x030
> +#define IOMMU_AUTO_GATING_REG		0x040
> +#define IOMMU_AUTO_GATING_ENABLE		BIT(0)
> +
> +#define IOMMU_WBUF_CTRL_REG		0x044
> +#define IOMMU_OOO_CTRL_REG		0x048
> +#define IOMMU_4KB_BDY_PRT_CTRL_REG	0x04c
> +#define IOMMU_TTB_REG			0x050
> +#define IOMMU_TLB_ENABLE_REG		0x060
> +#define IOMMU_TLB_PREFETCH_REG		0x070
> +#define IOMMU_TLB_PREFETCH_MASTER_ENABLE(m)	BIT(m)
> +
> +#define IOMMU_TLB_FLUSH_REG		0x080
> +#define IOMMU_TLB_FLUSH_PTW_CACHE		BIT(17)
> +#define IOMMU_TLB_FLUSH_MACRO_TLB		BIT(16)
> +#define IOMMU_TLB_FLUSH_MICRO_TLB(i)		(BIT(i) & GENMASK(5, 0))
> +
> +#define IOMMU_TLB_IVLD_ADDR_REG		0x090
> +#define IOMMU_TLB_IVLD_ADDR_MASK_REG	0x094
> +#define IOMMU_TLB_IVLD_ENABLE_REG	0x098
> +#define IOMMU_TLB_IVLD_ENABLE_ENABLE		BIT(0)
> +
> +#define IOMMU_PC_IVLD_ADDR_REG		0x0a0
> +#define IOMMU_PC_IVLD_ENABLE_REG	0x0a8
> +#define IOMMU_PC_IVLD_ENABLE_ENABLE		BIT(0)
> +
> +#define IOMMU_DM_AUT_CTRL_REG(d)	(0x0b0 + ((d) / 2) * 4)
> +#define IOMMU_DM_AUT_CTRL_RD_UNAVAIL(d, m)	(1 << (((d & 1) * 16) + ((m) * 2)))
> +#define IOMMU_DM_AUT_CTRL_RD_AVAIL(d, m)	(0 << (((d & 1) * 16) + ((m) * 2)))

It might just be personal opinion, but I think overly-complex ways of 
expressing 0 are usually better left entirely unsaid. Plus this makes 
sun50i_iommu_resume() appear to be doing a lot more than it really is - 
it seems sufficiently straightforward to me for the mere absence of 
"available" to imply "unavailable".

> +#define IOMMU_DM_AUT_CTRL_WR_UNAVAIL(d, m)	(1 << (((d & 1) * 16) + ((m) * 2) + 1))
> +#define IOMMU_DM_AUT_CTRL_WR_AVAIL(d, m)	(0 << (((d & 1) * 16) + ((m) * 2) + 1))
> +
> +#define IOMMU_DM_AUT_OVWT_REG		0x0d0
> +#define IOMMU_INT_ENABLE_REG		0x100
> +#define IOMMU_INT_CLR_REG		0x104
> +#define IOMMU_INT_STA_REG		0x108
> +#define IOMMU_INT_ERR_ADDR_REG(i)	(0x110 + (i) * 4)
> +#define IOMMU_INT_ERR_ADDR_L1_REG	0x130
> +#define IOMMU_INT_ERR_ADDR_L2_REG	0x134
> +#define IOMMU_INT_ERR_DATA_REG(i)	(0x150 + (i) * 4)
> +#define IOMMU_L1PG_INT_REG		0x0180
> +#define IOMMU_L2PG_INT_REG		0x0184
> +
> +#define IOMMU_INT_INVALID_L2PG			BIT(17)
> +#define IOMMU_INT_INVALID_L1PG			BIT(16)
> +#define IOMMU_INT_MASTER_PERMISSION(m)		BIT(m)
> +#define IOMMU_INT_MASTER_MASK			(IOMMU_INT_MASTER_PERMISSION(0) | \
> +						 IOMMU_INT_MASTER_PERMISSION(1) | \
> +						 IOMMU_INT_MASTER_PERMISSION(2) | \
> +						 IOMMU_INT_MASTER_PERMISSION(3) | \
> +						 IOMMU_INT_MASTER_PERMISSION(4) | \
> +						 IOMMU_INT_MASTER_PERMISSION(5))
> +#define IOMMU_INT_MASK				(IOMMU_INT_INVALID_L1PG | \
> +						 IOMMU_INT_INVALID_L2PG | \
> +						 IOMMU_INT_MASTER_MASK)
> +
> +#define PT_ENTRY_SIZE			sizeof(u32)
> +
> +#define NUM_DT_ENTRIES			4096
> +#define DT_SIZE				(NUM_DT_ENTRIES * PT_ENTRY_SIZE)
> +
> +#define NUM_PT_ENTRIES			256
> +#define PT_SIZE				(NUM_PT_ENTRIES * PT_ENTRY_SIZE)

Sigh, legacy ARM format strikes again... oh for nice logical 1024*1024 
instead of wonky 4096*256 :P

> +struct sun50i_iommu {
> +	struct iommu_device iommu;
> +
> +	/* Lock to modify the IOMMU registers */
> +	spinlock_t iommu_lock;
> +
> +	struct device *dev;
> +	void __iomem *base;
> +	struct reset_control *reset;
> +	struct clk *clk;
> +
> +	struct iommu_domain *domain;
> +	struct iommu_group *group;
> +	struct kmem_cache *pt_pool;
> +};
> +
> +struct sun50i_iommu_domain {
> +	struct iommu_domain domain;
> +
> +	/* Lock to modify the Directory Table */
> +	spinlock_t dt_lock;
> +
> +	/* L1 Page Table */
> +	u32 *dt;
> +	dma_addr_t dt_dma;

AFAICS you never use this. More on that later...

> +	struct sun50i_iommu *iommu;
> +};
> +
> +static struct sun50i_iommu_domain *to_sun50i_domain(struct iommu_domain *domain)
> +{
> +	return container_of(domain, struct sun50i_iommu_domain, domain);
> +}
> +
> +static struct sun50i_iommu *sun50i_iommu_from_dev(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
> +	if (!fwspec)
> +		return NULL;

Strictly you should only need that check in .add_device and .attach_dev 
- if the other callbacks end up getting passed the wrong device then 
things have arguably gone crash-worthily wrong already.

> +	return fwspec->iommu_priv;
> +}
> +
> +static inline u32 iommu_read(struct sun50i_iommu *iommu, u32 offset)
> +{
> +	return readl(iommu->base + offset);
> +}
> +
> +static inline void iommu_write(struct sun50i_iommu *iommu,
> +			       u32 offset, u32 value)
> +{
> +	writel(value, iommu->base + offset);
> +}
> +
> +/*
> + * The Allwinner H6 IOMMU uses a 2-level page table.
> + *
> + * The first level is the usual Directory Table (DT), that consists of
> + * 4096 4-bytes Directory Table Entries (DTE), each pointing to a Page
> + * Table (PT).
> + *
> + * Each PT consits of 256 4-bytes Page Table Entries (PTE), each
> + * pointing to a 4kB page of physical memory.
> + *
> + * The IOMMU supports a single DT, pointed by the IOMMU_TTB_REG
> + * register that contains its physical address.
> + */
> +
> +#define SUN50I_IOVA_DTE_MASK	GENMASK(31, 20)
> +#define SUN50I_IOVA_DTE_SHIFT	20
> +#define SUN50I_IOVA_PTE_MASK	GENMASK(19, 12)
> +#define SUN50I_IOVA_PTE_SHIFT	12
> +#define SUN50I_IOVA_PAGE_MASK	GENMASK(11, 0)
> +#define SUN50I_IOVA_PAGE_SHIFT	0
> +
> +static u32 sun50i_iova_dte_index(dma_addr_t iova)
> +{
> +	return (u32)(iova & SUN50I_IOVA_DTE_MASK) >> SUN50I_IOVA_DTE_SHIFT;
> +}
> +
> +static u32 sun50i_iova_pte_index(dma_addr_t iova)
> +{
> +	return (u32)(iova & SUN50I_IOVA_PTE_MASK) >> SUN50I_IOVA_PTE_SHIFT;
> +}
> +
> +static u32 sun50i_iova_page_offset(dma_addr_t iova)
> +{
> +	return (u32)(iova & SUN50I_IOVA_PAGE_MASK) >> SUN50I_IOVA_PAGE_SHIFT;

A shift in a "page offset" calculation looks weird and surprising at the 
best of times, so a redundant one is *actively* confounding.

> +}
> +
> +/*
> + * Each Directory Table Entry has a Page Table address and a valid
> + * bit:
> +
> + * +---------------------+-----------+-+
> + * | PT address          | Reserved  |V|
> + * +---------------------+-----------+-+
> + *  31:10 - Page Table address
> + *   9:2  - Reserved
> + *   1:0  - 1 if the entry is valid
> + */
> +
> +#define SUN50I_DTE_PT_ADDRESS_MASK	GENMASK(31, 10)
> +#define SUN50I_DTE_PT_ATTRS		GENMASK(1, 0)
> +#define SUN50I_DTE_PT_VALID		BIT(0)
> +
> +static inline phys_addr_t sun50i_dte_pt_address(u32 dte)
> +{
> +	return (phys_addr_t)dte & SUN50I_DTE_PT_ADDRESS_MASK;
> +}
> +
> +static inline bool sun50i_dte_is_pt_valid(u32 dte)
> +{
> +	return (dte & SUN50I_DTE_PT_ATTRS) == SUN50I_DTE_PT_VALID;

If SUN50I_DTE_PT_ATTRS was being used consistently with an expectation 
that it might possibly grow in future, then it might deserve to stay, 
but right now I'd say just "return dte & SUN50I_DTE_PT_VALID" here to 
match the use below.

> +}
> +
> +static inline u32 sun50i_mk_dte(dma_addr_t pt_dma)
> +{
> +	return (pt_dma & SUN50I_DTE_PT_ADDRESS_MASK) | SUN50I_DTE_PT_VALID;
> +}
> +
> +/*
> + * Each PTE has a Page address, an authority index and a valid bit:
> + *
> + * +----------------+-----+-----+-----+---+-----+
> + * | Page address   | Rsv | ACI | Rsv | V | Rsv |
> + * +----------------+-----+-----+-----+---+-----+
> + *  31:12 - Page address
> + *  11:8  - Reserved
> + *   7:4  - Authority Control Index
> + *   3:2  - Reserved
> + *     1  - 1 if the entry is valid
> + *     0  - Reserved
> + *
> + * The way permissions work is that the IOMMU has 16 "domains" that
> + * can be configured to give each masters either read or write
> + * permissions through the IOMMU_DM_AUT_CTRL_REG registers. The domain
> + * 0 seems like the default domain, and its permissions in the
> + * IOMMU_DM_AUT_CTRL_REG are only read-only, so it's not really
> + * useful to enforce any particular permission.
> + *
> + * Each page entry willthen have a reference to the domain they are

Nit: missing space

> + * affected to, so that we can actually enforce them on a per-page
> + * basis.
> + *
> + * In order to make it work with the IOMMU framework, we will be using
> + * 4 different domains, starting at 1: RD_WR, RD, WR and NONE
> + * depending on the permission we want to enforce. Each domain will
> + * have each master setup in the same way, since the IOMMU framework
> + * doesn't seem to restrict page access on a per-device basis. And
> + * then we will use the relevant domain index when generating the page
> + * table entry depending on the permissions we want to be enforced.
> + */
> +
> +enum iommu_aci {
> +	IOMMU_ACI_DO_NOT_USE = 0,
> +	IOMMU_ACI_NONE,
> +	IOMMU_ACI_RD,
> +	IOMMU_ACI_WR,
> +	IOMMU_ACI_RD_WR,
> +};

The "iommu" namespace is already somewhat overloaded between the core 
API and amd-iommu - "sun50i_aci" might be nicer.

> +#define SUN50I_PTE_PAGE_ADDRESS_MASK	GENMASK(31, 12)
> +#define SUN50I_PTE_ACI_MASK		GENMASK(7, 4)
> +#define SUN50I_PTE_ACI_SHIFT		4
> +#define SUN50I_PTE_ACI(aci)		((aci) << SUN50I_PTE_ACI_SHIFT)
> +#define SUN50I_PTE_PAGE_VALID		BIT(1)
> +
> +static inline phys_addr_t sun50i_pte_page_address(u32 pte)
> +{
> +	return (phys_addr_t)pte & SUN50I_PTE_PAGE_ADDRESS_MASK;
> +}
> +
> +static inline enum iommu_aci sun50i_pte_aci(u32 pte)

Eww, "lowercase name does opposite of uppercase name" is a confusingly 
unfamiliar paradigm - can we have a clearer distinction between "get" 
and "set" operations please? Plus a bit more consistency in terms of 
macros vs. helper functions (maybe consider bitfield.h helpers too).

> +{
> +	return (pte & SUN50I_PTE_ACI_MASK) >> SUN50I_PTE_ACI_SHIFT;
> +}
> +
> +static inline bool sun50i_pte_is_page_valid(u32 pte)
> +{
> +	return pte & SUN50I_PTE_PAGE_VALID;
> +}

Furthermore this isn't a header so there's no need for explicit "inline" 
declarations - we can trust the compiler not to be a complete idiot.

> +
> +static u32 sun50i_mk_pte(phys_addr_t page, int prot)
> +{
> +	enum iommu_aci aci;
> +	u32 flags = 0;
> +
> +	if (prot & (IOMMU_READ | IOMMU_WRITE))
> +		aci = IOMMU_ACI_RD_WR;
> +	else if (prot & IOMMU_READ)
> +		aci = IOMMU_ACI_RD;
> +	else if (prot & IOMMU_WRITE)
> +		aci = IOMMU_ACI_WR;
> +	else
> +		aci = IOMMU_ACI_NONE;
> +
> +	flags |= SUN50I_PTE_ACI(aci);
> +	page &= SUN50I_PTE_PAGE_ADDRESS_MASK;
> +	return page | flags | SUN50I_PTE_PAGE_VALID;
> +}
> +
> +static inline void sun50i_table_flush(struct sun50i_iommu_domain *sun50i_domain,
> +				      dma_addr_t dma, unsigned int count)
> +{
> +	struct sun50i_iommu *iommu = sun50i_domain->iommu;
> +	size_t size = count * PT_ENTRY_SIZE;

All but one callsite passes "virt_to_phys(...)" for the @dma argument 
here, so it's probably more sensible to fold that in here and take a PTE 
pointer as the argument.

> +
> +	dma_sync_single_for_device(iommu->dev, dma, size, DMA_TO_DEVICE);
> +}
> +
> +static int sun50i_iommu_flush_all_tlb(struct sun50i_iommu *iommu)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	assert_spin_locked(&iommu->iommu_lock);
> +
> +	iommu_write(iommu,
> +		    IOMMU_TLB_FLUSH_REG,
> +		    IOMMU_TLB_FLUSH_PTW_CACHE |
> +		    IOMMU_TLB_FLUSH_MACRO_TLB |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(5) |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(4) |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(3) |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(2) |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(1) |
> +		    IOMMU_TLB_FLUSH_MICRO_TLB(0));
> +
> +	ret = readl_poll_timeout(iommu->base + IOMMU_TLB_FLUSH_REG,
> +				 reg, !reg,
> +				 1, 2000);
> +	if (ret)
> +		dev_err(iommu->dev, "Enable flush all request timed out\n");
> +
> +	return ret;
> +}
> +
> +static int sun50i_iommu_tlb_invalidate(struct sun50i_iommu *iommu,
> +				       dma_addr_t iova)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	assert_spin_locked(&iommu->iommu_lock);
> +
> +	iommu_write(iommu, IOMMU_TLB_IVLD_ADDR_REG, iova);
> +	iommu_write(iommu, IOMMU_TLB_IVLD_ADDR_MASK_REG,
> +		    SUN50I_PTE_PAGE_ADDRESS_MASK);

Does this imply that the hardware might support power-of-two 
invalidations larger than a single page? No need to worry about it for 
the initial driver, but it could be worth investigating for future 
optimisation.

> +	iommu_write(iommu, IOMMU_TLB_IVLD_ENABLE_REG,
> +		    IOMMU_TLB_IVLD_ENABLE_ENABLE);
> +
> +	ret = readl_poll_timeout(iommu->base + IOMMU_TLB_IVLD_ENABLE_REG,
> +				 reg, !(reg & IOMMU_TLB_IVLD_ENABLE_ENABLE),
> +				 1, 2000);
> +	if (ret)
> +		dev_err(iommu->dev, "TLB Invalid timed out\n");
> +
> +	return ret;
> +}
> +
> +static int sun50i_iommu_ptw_invalidate(struct sun50i_iommu *iommu,
> +				       dma_addr_t iova)
> +{
> +	int ret;
> +	u32 reg;
> +
> +	assert_spin_locked(&iommu->iommu_lock);
> +
> +	iommu_write(iommu, IOMMU_PC_IVLD_ADDR_REG, iova);
> +	iommu_write(iommu, IOMMU_PC_IVLD_ENABLE_REG,
> +		    IOMMU_PC_IVLD_ENABLE_ENABLE);
> +
> +	ret = readl_poll_timeout(iommu->base + IOMMU_PC_IVLD_ENABLE_REG,
> +				 reg, !(reg & IOMMU_PC_IVLD_ENABLE_ENABLE),
> +				 1, 2000);
> +	if (ret)
> +		dev_err(iommu->dev, "PTW cache invalid timed out\n");
> +
> +	return ret;
> +}
> +
> +static u32 *sun50i_dte_get_page_table(struct sun50i_iommu_domain *sun50i_domain,
> +				      dma_addr_t iova)
> +{
> +	struct sun50i_iommu *iommu = sun50i_domain->iommu;
> +	u32 *page_table, *dte_addr;
> +	phys_addr_t pt_phys;
> +	dma_addr_t pt_dma;
> +	u32 dte_index, dte;
> +
> +	assert_spin_locked(&sun50i_domain->dt_lock);
> +
> +	dte_index = sun50i_iova_dte_index(iova);
> +	dte_addr = &sun50i_domain->dt[dte_index];
> +	dte = *dte_addr;
> +	if (sun50i_dte_is_pt_valid(dte))
> +		goto done;
> +
> +	page_table = kmem_cache_zalloc(iommu->pt_pool, GFP_ATOMIC);

Can you respect the new gfp argument from ->map() here, or is that one 
of those things that kmem_caches can be overly picky about?

> +	if (!page_table)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pt_dma = dma_map_single(iommu->dev, page_table, PT_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(iommu->dev, pt_dma)) {
> +		dev_err(iommu->dev, "Couldn't map L2 Page Table\n");
> +		kmem_cache_free(iommu->pt_pool, page_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* We rely on the physical address and DMA address being the same */
> +	WARN_ON(pt_dma != virt_to_phys(page_table));
> +
> +	dte = sun50i_mk_dte(pt_dma);
> +	*dte_addr = dte;
> +	sun50i_table_flush(sun50i_domain, pt_dma, PT_SIZE);
> +	sun50i_table_flush(sun50i_domain, virt_to_phys(dte_addr), 1);
> +
> +done:
> +	pt_phys = sun50i_dte_pt_address(dte);
> +	return (u32 *)phys_to_virt(pt_phys);

May as well just put the phys/virt dance in the early-out path and 
return page_table directly here.

> +}
> +
> +static int sun50i_iommu_map(struct iommu_domain *domain, unsigned long iova,
> +			    phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> +	struct sun50i_iommu *iommu = sun50i_domain->iommu;
> +	u32 pte_index;
> +	u32 *page_table, *pte_addr;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&sun50i_domain->dt_lock, flags);
> +	page_table = sun50i_dte_get_page_table(sun50i_domain, iova);
> +	if (IS_ERR(page_table)) {
> +		ret = PTR_ERR(page_table);
> +		goto out;
> +	}
> +
> +	pte_index = sun50i_iova_pte_index(iova);
> +	pte_addr = &page_table[pte_index];
> +	if (sun50i_pte_is_page_valid(*pte_addr)) {
> +		phys_addr_t page_phys = sun50i_pte_page_address(*pte_addr);
> +		dev_err(iommu->dev,
> +			"iova %pad already mapped to %pa cannot remap to %pa prot: %#x\n",
> +			&iova, &page_phys, &paddr, prot);
> +		ret = -EADDRINUSE;

I think that strictly refers to a *network* address - I'd be inclined to 
stick with boring old EBUSY.

> +		goto out;
> +	}
> +
> +	*pte_addr = sun50i_mk_pte(paddr, prot);
> +	sun50i_table_flush(sun50i_domain, virt_to_phys(pte_addr), 1);
> +
> +	spin_lock_irqsave(&iommu->iommu_lock, flags);
> +
> +	sun50i_iommu_tlb_invalidate(iommu, iova);
> +	sun50i_iommu_ptw_invalidate(iommu, iova);

Does the walk cache actually cache PTEs as well as DTEs? If it's really 
only the latter, the maintenance could perhaps be folded into pagetable 
allocation (being the only place that ever changes them).

> +
> +	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
> +
> +out:
> +	spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +	return ret;
> +}
> +
> +static size_t sun50i_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
> +				 size_t size, struct iommu_iotlb_gather *gather)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> +	struct sun50i_iommu *iommu = sun50i_domain->iommu;
> +	unsigned long flags;
> +	phys_addr_t pt_phys;
> +	dma_addr_t pte_dma;
> +	u32 *pte_addr;
> +	u32 dte;
> +
> +	spin_lock_irqsave(&sun50i_domain->dt_lock, flags);
> +
> +	dte = sun50i_domain->dt[sun50i_iova_dte_index(iova)];
> +	if (!sun50i_dte_is_pt_valid(dte)) {
> +		spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +		return 0;
> +	}
> +
> +	pt_phys = sun50i_dte_pt_address(dte);
> +	pte_addr = (u32 *)phys_to_virt(pt_phys) + sun50i_iova_pte_index(iova);
> +	pte_dma = pt_phys + sun50i_iova_pte_index(iova) * PT_ENTRY_SIZE;
> +
> +	if (!sun50i_pte_is_page_valid(*pte_addr)) {
> +		spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +		return 0;
> +	}
> +
> +	memset(pte_addr, 0, sizeof(*pte_addr));
> +	sun50i_table_flush(sun50i_domain, virt_to_phys(pte_addr), 1);
> +
> +	spin_lock(&iommu->iommu_lock);
> +	sun50i_iommu_tlb_invalidate(iommu, iova);
> +	sun50i_iommu_ptw_invalidate(iommu, iova);
> +	spin_unlock(&iommu->iommu_lock);
> +
> +	spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +
> +	return SZ_4K;
> +}
> +
> +static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
> +					     dma_addr_t iova)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> +	phys_addr_t pt_phys, phys = 0;
> +	unsigned long flags;
> +	u32 *page_table;
> +	u32 dte, pte;
> +
> +	spin_lock_irqsave(&sun50i_domain->dt_lock, flags);
> +
> +	dte = sun50i_domain->dt[sun50i_iova_dte_index(iova)];
> +	if (!sun50i_dte_is_pt_valid(dte))
> +		goto out;
> +
> +	pt_phys = sun50i_dte_pt_address(dte);
> +	page_table = (u32 *)phys_to_virt(pt_phys);
> +	pte = page_table[sun50i_iova_pte_index(iova)];
> +	if (!sun50i_pte_is_page_valid(pte))
> +		goto out;
> +
> +	phys = sun50i_pte_page_address(pte) + sun50i_iova_page_offset(iova);
> +
> +out:
> +	spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +	return phys;
> +}
> +
> +static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain;
> +
> +	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
> +		return NULL;
> +
> +	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
> +	if (!sun50i_domain)
> +		return NULL;
> +
> +	if (type == IOMMU_DOMAIN_DMA &&
> +	    iommu_get_dma_cookie(&sun50i_domain->domain))
> +		goto err_free_domain;
> +
> +	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL,
> +						    get_order(DT_SIZE));
> +	if (!sun50i_domain->dt)
> +		goto err_put_cookie;
> +	memset(sun50i_domain->dt, 0, DT_SIZE);
> +
> +	spin_lock_init(&sun50i_domain->dt_lock);
> +
> +	sun50i_domain->domain.geometry.aperture_start = 0;
> +	sun50i_domain->domain.geometry.aperture_end = DMA_BIT_MASK(32);
> +	sun50i_domain->domain.geometry.force_aperture = true;
> +
> +	return &sun50i_domain->domain;
> +
> +err_put_cookie:
> +	if (type == IOMMU_DOMAIN_DMA)
> +		iommu_put_dma_cookie(&sun50i_domain->domain);
> +
> +err_free_domain:
> +	kfree(sun50i_domain);
> +
> +	return NULL;
> +}
> +
> +static void sun50i_iommu_domain_free(struct iommu_domain *domain)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> +	struct sun50i_iommu *iommu = sun50i_domain->iommu;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&sun50i_domain->dt_lock, flags);
> +
> +	for (i = 0; i < NUM_DT_ENTRIES; i++) {
> +		phys_addr_t pt_phys;
> +		u32 *page_table;
> +		u32 *dte_addr;
> +		u32 dte;
> +
> +		dte_addr = &sun50i_domain->dt[i];
> +		dte = *dte_addr;
> +		if (!sun50i_dte_is_pt_valid(dte))
> +			continue;
> +
> +		memset(dte_addr, 0, sizeof(*dte_addr));
> +		sun50i_table_flush(sun50i_domain, virt_to_phys(dte_addr), 1);

This shouldn't be necessary - freeing a domain while it's still live is 
an incredibly very wrong thing to do, so the hardware should have 
already been programmed to no longer walk this table by this point.

> +
> +		pt_phys = sun50i_dte_pt_address(dte);
> +		dma_unmap_single(iommu->dev, pt_phys, PT_SIZE, DMA_TO_DEVICE);
> +
> +		page_table = phys_to_virt(pt_phys);
> +		kmem_cache_free(iommu->pt_pool, page_table);
> +	}
> +
> +	free_pages((unsigned long)sun50i_domain->dt, get_order(DT_SIZE));
> +	sun50i_domain->dt = NULL;
> +
> +	spin_lock(&iommu->iommu_lock);
> +	sun50i_iommu_flush_all_tlb(iommu);
> +	spin_unlock(&iommu->iommu_lock);

And this looks very out-of-place. I'd expect any invalidation to have 
happened at the point that translation was disabled, or be deferred 
until it is next reenabled. Consider that users are within their rights 
to call iommu_domain_alloc() 17 times in a row and immediately free them 
all again without ever attaching any devices; there should be no reason 
to ever touch the hardware in such a case.

> +
> +	spin_unlock_irqrestore(&sun50i_domain->dt_lock, flags);
> +	iommu_put_dma_cookie(domain);
> +
> +	kfree(sun50i_domain);
> +}
> +
> +static void sun50i_iommu_detach_device(struct iommu_domain *domain,
> +				       struct device *dev)
> +{
> +	struct sun50i_iommu *iommu;
> +
> +	iommu = sun50i_iommu_from_dev(dev);
> +	if (!iommu)
> +		return;
> +
> +	dev_info(dev, "Detaching from IOMMU domain\n");

No.

> +
> +	if (iommu->domain != domain)
> +		return;
> +
> +	pm_runtime_put_sync(iommu->dev);
> +
> +	iommu->domain = NULL;
> +}
> +
> +static int sun50i_iommu_attach_device(struct iommu_domain *domain,
> +				      struct device *dev)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
> +	struct sun50i_iommu *iommu;
> +
> +	iommu = sun50i_iommu_from_dev(dev);
> +	if (!iommu)
> +		return -ENODEV;
> +
> +	dev_info(dev, "Attaching to IOMMU domain\n");

Also no.

> +
> +	if (iommu->domain == domain)
> +		return 0;
> +
> +	if (iommu->domain)
> +		sun50i_iommu_detach_device(iommu->domain, dev);
> +
> +	iommu->domain = domain;
> +	sun50i_domain->iommu = iommu;
> +
> +	return pm_runtime_get_sync(iommu->dev);

Deferring all the actual hardware pogramming to the suspend/resume hooks 
is a fiendishly clever idea that took me more than a moment to make 
sense of, but how well does it work when RPM is compiled out or 
runtime-inhibited?

Furthermore, basing RPM on having a domain attached means that you'll 
effectively never turn the IOMMU off, even when all the clients are 
idle. It would make more sene to use device links like most other 
drivers do to properly model the producer/consumer relationship.

> +}
> +
> +static int sun50i_iommu_add_device(struct device *dev)
> +{
> +	struct sun50i_iommu *iommu;
> +	struct iommu_group *group;
> +
> +	iommu = sun50i_iommu_from_dev(dev);
> +	if (!iommu)
> +		return -ENODEV;
> +
> +	group = iommu_group_get_for_dev(dev);
> +	if (IS_ERR(group))
> +		return PTR_ERR(group);
> +
> +	iommu_group_put(group);
> +
> +	return 0;
> +}
> +
> +static void sun50i_iommu_remove_device(struct device *dev)
> +{
> +	struct sun50i_iommu *iommu;
> +
> +	iommu = sun50i_iommu_from_dev(dev);
> +	if (!iommu)

By construction, that should be impossible - getting here requires 
dev->iommu_group to be non-NULL, which means the check in 
sun50i_iommu_add_device() passed.

> +		return;
> +
> +	iommu_group_remove_device(dev);
> +}
> +
> +static struct iommu_group *sun50i_iommu_device_group(struct device *dev)
> +{
> +	struct sun50i_iommu *iommu;
> +
> +	iommu = sun50i_iommu_from_dev(dev);
> +	if (!iommu)

Ditto - we should only ever be here from *within* sun50i_iommu_add_device().

> +		return NULL;
> +
> +	return iommu_group_ref_get(iommu->group);
> +}
> +
> +static int sun50i_iommu_of_xlate(struct device *dev,
> +				 struct of_phandle_args *args)
> +{
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct platform_device *iommu_pdev;
> +	unsigned id = args->args[0];
> +
> +	iommu_pdev = of_find_device_by_node(args->np);
> +	if (WARN_ON(!iommu_pdev))

Similarly, to be able to get here at all means that sun50i_iommu_probe() 
has called iommu_device_register() and ultimately succeeded, so a device 
must exist.

> +		return -EINVAL;
> +
> +	fwspec->iommu_priv = platform_get_drvdata(iommu_pdev);
> +
> +	return iommu_fwspec_add_ids(dev, &id, 1);
> +}
> +
> +static struct iommu_ops sun50i_iommu_ops = {
> +	.pgsize_bitmap = SZ_4K,
> +	.map  = sun50i_iommu_map,
> +	.unmap = sun50i_iommu_unmap,
> +	.domain_alloc = sun50i_iommu_domain_alloc,
> +	.domain_free = sun50i_iommu_domain_free,
> +	.attach_dev = sun50i_iommu_attach_device,
> +	.detach_dev = sun50i_iommu_detach_device,
> +	.add_device = sun50i_iommu_add_device,
> +	.remove_device = sun50i_iommu_remove_device,
> +	.device_group	= sun50i_iommu_device_group,
> +	.of_xlate = sun50i_iommu_of_xlate,
> +	.iova_to_phys = sun50i_iommu_iova_to_phys,
> +};
> +
> +static void sun50i_iommu_report_fault(struct sun50i_iommu *iommu,
> +				      unsigned master, phys_addr_t iova,
> +				      unsigned prot)
> +{
> +	dev_err(iommu->dev, "Page fault for %pad (master %d, dir %s)\n",
> +		&iova, master, (prot == IOMMU_FAULT_WRITE) ? "wr" : "rd");

If you're expecting an external handler to be able to do something 
useful with faults, then save the log spam for the case where it's 
actually failed.

> +
> +	if (iommu->domain)
> +		report_iommu_fault(iommu->domain, iommu->dev, iova, prot);
> +	else
> +		dev_err(iommu->dev, "Page fault while iommu not attached to any domain?\n");
> +}
> +
> +static phys_addr_t sun50i_iommu_handle_pt_irq(struct sun50i_iommu *iommu,
> +					      unsigned addr_reg,
> +					      unsigned blame_reg)
> +{
> +	phys_addr_t iova;
> +	unsigned master;
> +	u32 blame;
> +
> +	assert_spin_locked(&iommu->iommu_lock);
> +
> +	iova = iommu_read(iommu, addr_reg);
> +	blame = iommu_read(iommu, blame_reg);
> +	master = ilog2(blame & IOMMU_INT_MASTER_MASK);
> +
> +	/*
> +	 * If the address is not in the page table, we can't get what
> +	 * operation triggered the fault. Assume it's a read
> +	 * operation.
> +	 */
> +	sun50i_iommu_report_fault(iommu, master, iova, IOMMU_FAULT_READ);
> +
> +	return iova;
> +}
> +
> +static phys_addr_t sun50i_iommu_handle_perm_irq(struct sun50i_iommu *iommu)
> +{
> +	enum iommu_aci aci;
> +	phys_addr_t iova;
> +	unsigned master;
> +	unsigned dir;
> +	u32 blame;
> +
> +	assert_spin_locked(&iommu->iommu_lock);
> +
> +	blame = iommu_read(iommu, IOMMU_INT_STA_REG);
> +	master = ilog2(blame & IOMMU_INT_MASTER_MASK);
> +	iova = iommu_read(iommu, IOMMU_INT_ERR_ADDR_REG(master));
> +	aci = sun50i_pte_aci(iommu_read(iommu, IOMMU_INT_ERR_DATA_REG(master)));
> +
> +	switch (aci) {
> +		/*
> +		 * If we are in the read-only domain, then it means we
> +		 * tried to write.
> +		 */
> +	case IOMMU_ACI_RD:
> +		dir = IOMMU_FAULT_WRITE;
> +		break;
> +
> +		/*
> +		 * If we are in the write-only domain, then it means
> +		 * we tried to read.
> +		 */
> +	case IOMMU_ACI_WR:
> +
> +		/*
> +		 * If we are in the domain without any permission, we
> +		 * can't really tell. Let's default to a read
> +		 * operation.
> +		 */
> +	case IOMMU_ACI_NONE:
> +
> +		/* WTF? */
> +	case IOMMU_ACI_RD_WR:
> +	default:
> +		dir = IOMMU_FAULT_READ;
> +		break;
> +	}
> +
> +	/*
> +	 * If the address is not in the page table, we can't get what
> +	 * operation triggered the fault. Assume it's a read
> +	 * operation.
> +	 */
> +	sun50i_iommu_report_fault(iommu, master, iova, dir);
> +
> +	return iova;
> +}
> +
> +static irqreturn_t sun50i_iommu_irq(int irq, void *dev_id)
> +{
> +	struct sun50i_iommu *iommu = dev_id;
> +	phys_addr_t iova;
> +	u32 status;
> +
> +	spin_lock(&iommu->iommu_lock);
> +
> +	status = iommu_read(iommu, IOMMU_INT_STA_REG);
> +	if (!(status & IOMMU_INT_MASK)) {
> +		spin_unlock(&iommu->iommu_lock);
> +		return IRQ_NONE;
> +	}
> +
> +	if (status & IOMMU_INT_INVALID_L2PG)
> +		iova = sun50i_iommu_handle_pt_irq(iommu,
> +						  IOMMU_INT_ERR_ADDR_L2_REG,
> +						  IOMMU_L2PG_INT_REG);
> +	else if (status & IOMMU_INT_INVALID_L1PG)
> +		iova = sun50i_iommu_handle_pt_irq(iommu,
> +						  IOMMU_INT_ERR_ADDR_L1_REG,
> +						  IOMMU_L1PG_INT_REG);
> +	else
> +		iova = sun50i_iommu_handle_perm_irq(iommu);
> +
> +	sun50i_iommu_tlb_invalidate(iommu, iova);
> +	sun50i_iommu_ptw_invalidate(iommu, iova);

Yikes, does the hardware really somehow require that?

> +
> +	iommu_write(iommu, IOMMU_INT_CLR_REG, status);
> +
> +	iommu_write(iommu, IOMMU_RESET_REG, ~status);
> +	iommu_write(iommu, IOMMU_RESET_REG, status);
> +
> +	spin_unlock(&iommu->iommu_lock);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int sun50i_iommu_probe(struct platform_device *pdev)
> +{
> +	struct sun50i_iommu *iommu;
> +	struct resource *res;
> +	int ret, irq;
> +
> +	iommu = devm_kzalloc(&pdev->dev, sizeof(*iommu), GFP_KERNEL);
> +	if (!iommu)
> +		return -ENOMEM;
> +	spin_lock_init(&iommu->iommu_lock);
> +	platform_set_drvdata(pdev, iommu);
> +	iommu->dev = &pdev->dev;
> +
> +	iommu->pt_pool = kmem_cache_create(dev_name(&pdev->dev),
> +					   PT_SIZE, PT_SIZE,
> +					   SLAB_HWCACHE_ALIGN,
> +					   NULL);
> +	if (!iommu->pt_pool)
> +		return -ENOMEM;
> +
> +	iommu->group = iommu_group_alloc();
> +	if (IS_ERR(iommu->group)) {
> +		ret = PTR_ERR(iommu->group);
> +		goto err_free_cache;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	iommu->base = devm_ioremap_resource(&pdev->dev, res);

Watch out for the devm_platform_ioremap_resource() police :)

> +	if (!iommu->base) {
> +		ret = PTR_ERR(iommu->base);
> +		goto err_free_group;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret = irq;
> +		goto err_free_group;
> +	}
> +
> +	iommu->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(iommu->clk)) {
> +		dev_err(&pdev->dev, "Couldn't get our clock.\n");
> +		ret = PTR_ERR(iommu->clk);
> +		goto err_free_group;
> +	}
> +
> +	iommu->reset = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(iommu->reset)) {
> +		dev_err(&pdev->dev, "Couldn't get our reset line.\n");
> +		ret = PTR_ERR(iommu->reset);
> +		goto err_free_group;
> +	}
> +
> +	ret = iommu_device_sysfs_add(&iommu->iommu, &pdev->dev,
> +				     NULL, dev_name(&pdev->dev));
> +	if (ret)
> +		goto err_free_group;
> +
> +	iommu_device_set_ops(&iommu->iommu, &sun50i_iommu_ops);
> +	iommu_device_set_fwnode(&iommu->iommu, &pdev->dev.of_node->fwnode);
> +
> +	ret = iommu_device_register(&iommu->iommu);
> +	if (ret)
> +		goto err_remove_sysfs;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	ret = devm_request_irq(&pdev->dev, irq, sun50i_iommu_irq, 0,
> +			       dev_name(&pdev->dev), iommu);
> +	if (ret < 0)
> +		goto err_unregister;
> +
> +	bus_set_iommu(&platform_bus_type, &sun50i_iommu_ops);
> +
> +	return 0;
> +
> +err_unregister:
> +	iommu_device_unregister(&iommu->iommu);
> +
> +err_remove_sysfs:
> +	iommu_device_sysfs_remove(&iommu->iommu);
> +
> +err_free_group:
> +	iommu_group_put(iommu->group);
> +
> +err_free_cache:
> +	kmem_cache_destroy(iommu->pt_pool);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused sun50i_iommu_suspend(struct device *dev)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain;
> +	struct sun50i_iommu *iommu;
> +	unsigned long flags;
> +
> +	iommu = dev_get_drvdata(dev);
> +	if (!iommu->domain)
> +		return 0;
> +
> +	spin_lock_irqsave(&iommu->iommu_lock, flags);
> +
> +	iommu_write(iommu, IOMMU_ENABLE_REG, 0);
> +	iommu_write(iommu, IOMMU_TTB_REG, 0);
> +
> +	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
> +
> +	clk_disable_unprepare(iommu->clk);
> +	reset_control_assert(iommu->reset);
> +
> +	sun50i_domain = to_sun50i_domain(iommu->domain);
> +	dma_unmap_single(dev, virt_to_phys(sun50i_domain->dt), DT_SIZE,
> +			 DMA_TO_DEVICE);

Why? The only time you should need to do this is when freeing the table.

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sun50i_iommu_resume(struct device *dev)
> +{
> +	struct sun50i_iommu_domain *sun50i_domain;
> +	struct sun50i_iommu *iommu;
> +	unsigned long flags;
> +	dma_addr_t dt_dma;
> +	int ret;
> +
> +	iommu = dev_get_drvdata(dev);
> +	if (!iommu->domain)
> +		return 0;
> +
> +	sun50i_domain = to_sun50i_domain(iommu->domain);
> +	dt_dma = dma_map_single(dev, sun50i_domain->dt, DT_SIZE, DMA_TO_DEVICE);

As above. The power state of the IOMMU should be enitrely irrelevant to 
the contents of RAM.

> +	if (dma_mapping_error(dev, dt_dma)) {
> +		dev_err(dev, "Couldn't map L1 Page Table\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = reset_control_deassert(iommu->reset);
> +	if (ret)
> +		goto err_unmap;
> +
> +	ret = clk_prepare_enable(iommu->clk);
> +	if (ret)
> +		goto err_reset_assert;
> +
> +	/* We rely on the physical address and DMA address being the same */
> +	WARN_ON(dt_dma != virt_to_phys(sun50i_domain->dt));

If you made proper use of both iommu->dt and iommu->dt_dma you wouldn't 
actually need that invariant at this level, which I think would be a 
good thing. The phys_to_virt() dance is somewhat justifiable for the 
second-level tables to save maintaining an additional dma_addr_t[4096] 
array; far less so for the single top-level address.

> +
> +	spin_lock_irqsave(&iommu->iommu_lock, flags);
> +
> +	iommu_write(iommu, IOMMU_TTB_REG, dt_dma);
> +	iommu_write(iommu, IOMMU_TLB_PREFETCH_REG,
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(0) |
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(1) |
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(2) |
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(3) |
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(4) |
> +		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(5));
> +	iommu_write(iommu, IOMMU_INT_ENABLE_REG, IOMMU_INT_MASK);
> +	iommu_write(iommu, IOMMU_DM_AUT_CTRL_REG(IOMMU_ACI_NONE),
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 0) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 0) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 1) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 1) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 2) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 2) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 3) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 3) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 4) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 4) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_NONE, 5) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_NONE, 5));
> +
> +	iommu_write(iommu, IOMMU_DM_AUT_CTRL_REG(IOMMU_ACI_RD),
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 0) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 1) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 2) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 3) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 4) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD, 5) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 0) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 1) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 2) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 3) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 4) |
> +		    IOMMU_DM_AUT_CTRL_WR_UNAVAIL(IOMMU_ACI_RD, 5));
> +
> +	iommu_write(iommu, IOMMU_DM_AUT_CTRL_REG(IOMMU_ACI_WR),
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 0) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 1) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 2) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 3) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 4) |
> +		    IOMMU_DM_AUT_CTRL_RD_UNAVAIL(IOMMU_ACI_WR, 5) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 0) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 1) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 2) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 3) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 4) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_WR, 5));
> +
> +	iommu_write(iommu, IOMMU_DM_AUT_CTRL_REG(IOMMU_ACI_RD_WR),
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 0) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 0) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 1) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 1) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 2) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 2) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 3) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 3) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 4) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 4) |
> +		    IOMMU_DM_AUT_CTRL_RD_AVAIL(IOMMU_ACI_RD_WR, 5) |
> +		    IOMMU_DM_AUT_CTRL_WR_AVAIL(IOMMU_ACI_RD_WR, 5));
> +
> +	ret = sun50i_iommu_flush_all_tlb(iommu);
> +	if (ret) {
> +		spin_unlock_irqrestore(&iommu->iommu_lock, flags);
> +		goto err_clk_disable;
> +	}
> +
> +	iommu_write(iommu, IOMMU_AUTO_GATING_REG, IOMMU_AUTO_GATING_ENABLE);
> +	iommu_write(iommu, IOMMU_ENABLE_REG, IOMMU_ENABLE_ENABLE);

As mentioned, although you obviously do need to reprogram the hardware 
on resume, the fact that the *only* references to most of the control 
registers are from "__maybe_unused" functions is a big red flag.

> +
> +	spin_unlock_irqrestore(&iommu->iommu_lock, flags);
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(iommu->clk);
> +
> +err_reset_assert:
> +	reset_control_assert(iommu->reset);
> +
> +err_unmap:
> +	sun50i_domain = to_sun50i_domain(iommu->domain);
> +	dma_unmap_single(dev, dt_dma, DT_SIZE, DMA_TO_DEVICE);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops sun50i_iommu_pm_ops = {
> +	SET_RUNTIME_PM_OPS(sun50i_iommu_suspend, sun50i_iommu_resume, NULL)

In principle you should be able to support system PM with the same 
resume callback.

> +};
> +
> +static const struct of_device_id sun50i_iommu_dt[] = {
> +	{ .compatible = "allwinner,sun50i-h6-iommu", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, sun50i_iommu_dt);
> +
> +static struct platform_driver sun50i_iommu_driver = {
> +	.probe		= sun50i_iommu_probe,
> +	.driver		= {
> +		.name			= "sun50i-iommu",
> +		.of_match_table 	= sun50i_iommu_dt,
> +		.pm			= &sun50i_iommu_pm_ops,
> +		.suppress_bind_attrs	= true,
> +	}
> +};
> +
> +static int __init sun50i_iommu_init(void)
> +{
> +	return platform_driver_register(&sun50i_iommu_driver);
> +}
> +subsys_initcall(sun50i_iommu_init);

Regular device_initcall() (or just a *_platform_driver() helper) should 
be sufficient these days.

Robin.

> +MODULE_DESCRIPTION("Allwinner H6 IOMMU driver");
> +MODULE_AUTHOR("Maxime Ripard <maxime@cerno.tech>");
> +MODULE_AUTHOR("zhuxianbin <zhuxianbin@allwinnertech.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
