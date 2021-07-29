Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC33DA821
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 17:59:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E14BD40424;
	Thu, 29 Jul 2021 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5VK46Y142V-R; Thu, 29 Jul 2021 15:59:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 41D8C4037F;
	Thu, 29 Jul 2021 15:59:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 055F7C000E;
	Thu, 29 Jul 2021 15:59:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF433C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A482A4028C
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WjTfxX-bd7Q for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 15:59:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFECE40174
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:59:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 9F1DE1F43FB6
Subject: Re: [PATCH v7 3/4] iommu: rockchip: Add internal ops to handle
 variants
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, heiko@sntech.de, xxm@rock-chips.com,
 robin.murphy@arm.com, Ezequiel Garcia <ezequiel@collabora.com>
References: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
 <20210525121551.606240-4-benjamin.gaignard@collabora.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c6175f3d-a324-9fb5-bd39-cfe0447ee5e7@collabora.com>
Date: Thu, 29 Jul 2021 17:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210525121551.606240-4-benjamin.gaignard@collabora.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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



On 25.05.21 14:15, Benjamin Gaignard wrote:
> Add internal ops to be able to handle incoming variant v2.
> The goal is to keep the overall structure of the framework but
> to allow to add the evolution of this hardware block.
> 
> The ops are global for a SoC because iommu domains are not
> attached to a specific devices if they are for a virtuel device like
> drm. Use a global variable shouldn't be since SoC usually doesn't
> embedded different versions of the iommu hardware block.
> If that happen one day a WARN_ON will be displayed at probe time.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> version 7:
>   - Set DMA mask
>   - Add function to convert dma address to dte
> 
> version 6:
>   - Remove #include <module.h>
>   - Remove pt_address_mask field
>   - Only use once of_device_get_match_data
>   - Return an error if ops don't match
> 
> version 5:
>   - Use of_device_get_match_data()
>   - Add internal ops inside the driver
> 
>   drivers/iommu/rockchip-iommu.c | 86 +++++++++++++++++++++++++---------
>   1 file changed, 64 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 7a2932772fdf..bd2cf7f08c71 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -96,6 +96,15 @@ static const char * const rk_iommu_clocks[] = {
>   	"aclk", "iface",
>   };
>   
> +struct rk_iommu_ops {
> +	phys_addr_t (*pt_address)(u32 dte);
> +	u32 (*mk_dtentries)(dma_addr_t pt_dma);
> +	u32 (*mk_ptentries)(phys_addr_t page, int prot);
> +	phys_addr_t (*dte_addr_phys)(u32 addr);
> +	u32 (*dma_addr_dte)(dma_addr_t dt_dma);
> +	u64 dma_bit_mask;
> +};
> +
>   struct rk_iommu {
>   	struct device *dev;
>   	void __iomem **bases;
> @@ -116,6 +125,7 @@ struct rk_iommudata {
>   };
>   
>   static struct device *dma_dev;
> +static const struct rk_iommu_ops *rk_ops;
>   
>   static inline void rk_table_flush(struct rk_iommu_domain *dom, dma_addr_t dma,
>   				  unsigned int count)
> @@ -215,11 +225,6 @@ static inline u32 rk_mk_dte(dma_addr_t pt_dma)
>   #define RK_PTE_PAGE_READABLE      BIT(1)
>   #define RK_PTE_PAGE_VALID         BIT(0)
>   
> -static inline phys_addr_t rk_pte_page_address(u32 pte)
> -{
> -	return (phys_addr_t)pte & RK_PTE_PAGE_ADDRESS_MASK;
> -}
> -
>   static inline bool rk_pte_is_page_valid(u32 pte)
>   {
>   	return pte & RK_PTE_PAGE_VALID;
> @@ -448,10 +453,10 @@ static int rk_iommu_force_reset(struct rk_iommu *iommu)
>   	 * and verifying that upper 5 nybbles are read back.
>   	 */
>   	for (i = 0; i < iommu->num_mmu; i++) {
> -		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR, DTE_ADDR_DUMMY);
> +		dte_addr = rk_ops->pt_address(DTE_ADDR_DUMMY);
> +		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR, dte_addr);
>   
> -		dte_addr = rk_iommu_read(iommu->bases[i], RK_MMU_DTE_ADDR);
> -		if (dte_addr != (DTE_ADDR_DUMMY & RK_DTE_PT_ADDRESS_MASK)) {
> +		if (dte_addr != rk_iommu_read(iommu->bases[i], RK_MMU_DTE_ADDR)) {
>   			dev_err(iommu->dev, "Error during raw reset. MMU_DTE_ADDR is not functioning\n");
>   			return -EFAULT;
>   		}
> @@ -470,6 +475,16 @@ static int rk_iommu_force_reset(struct rk_iommu *iommu)
>   	return 0;
>   }
>   
> +static inline phys_addr_t rk_dte_addr_phys(u32 addr)
> +{
> +	return (phys_addr_t)addr;
> +}
> +
> +static inline u32 rk_dma_addr_dte(dma_addr_t dt_dma)
> +{
> +	return dt_dma;
> +}
> +
>   static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
>   {
>   	void __iomem *base = iommu->bases[index];
> @@ -489,7 +504,7 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
>   	page_offset = rk_iova_page_offset(iova);
>   
>   	mmu_dte_addr = rk_iommu_read(base, RK_MMU_DTE_ADDR);
> -	mmu_dte_addr_phys = (phys_addr_t)mmu_dte_addr;
> +	mmu_dte_addr_phys = rk_ops->dte_addr_phys(mmu_dte_addr);
>   
>   	dte_addr_phys = mmu_dte_addr_phys + (4 * dte_index);
>   	dte_addr = phys_to_virt(dte_addr_phys);
> @@ -498,14 +513,14 @@ static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
>   	if (!rk_dte_is_pt_valid(dte))
>   		goto print_it;
>   
> -	pte_addr_phys = rk_dte_pt_address(dte) + (pte_index * 4);
> +	pte_addr_phys = rk_ops->pt_address(dte) + (pte_index * 4);
>   	pte_addr = phys_to_virt(pte_addr_phys);
>   	pte = *pte_addr;
>   
>   	if (!rk_pte_is_page_valid(pte))
>   		goto print_it;
>   
> -	page_addr_phys = rk_pte_page_address(pte) + page_offset;
> +	page_addr_phys = rk_ops->pt_address(pte) + page_offset;
>   	page_flags = pte & RK_PTE_PAGE_FLAGS_MASK;
>   
>   print_it:
> @@ -601,13 +616,13 @@ static phys_addr_t rk_iommu_iova_to_phys(struct iommu_domain *domain,
>   	if (!rk_dte_is_pt_valid(dte))
>   		goto out;
>   
> -	pt_phys = rk_dte_pt_address(dte);
> +	pt_phys = rk_ops->pt_address(dte);
>   	page_table = (u32 *)phys_to_virt(pt_phys);
>   	pte = page_table[rk_iova_pte_index(iova)];
>   	if (!rk_pte_is_page_valid(pte))
>   		goto out;
>   
> -	phys = rk_pte_page_address(pte) + rk_iova_page_offset(iova);
> +	phys = rk_ops->pt_address(pte) + rk_iova_page_offset(iova);
>   out:
>   	spin_unlock_irqrestore(&rk_domain->dt_lock, flags);
>   
> @@ -679,14 +694,14 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> -	dte = rk_mk_dte(pt_dma);
> +	dte = rk_ops->mk_dtentries(pt_dma);
>   	*dte_addr = dte;
>   
>   	rk_table_flush(rk_domain, pt_dma, NUM_PT_ENTRIES);
>   	rk_table_flush(rk_domain,
>   		       rk_domain->dt_dma + dte_index * sizeof(u32), 1);
>   done:
> -	pt_phys = rk_dte_pt_address(dte);
> +	pt_phys = rk_ops->pt_address(dte);
>   	return (u32 *)phys_to_virt(pt_phys);
>   }
>   
> @@ -728,7 +743,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
>   		if (rk_pte_is_page_valid(pte))
>   			goto unwind;
>   
> -		pte_addr[pte_count] = rk_mk_pte(paddr, prot);
> +		pte_addr[pte_count] = rk_ops->mk_ptentries(paddr, prot);
>   
>   		paddr += SPAGE_SIZE;
>   	}
> @@ -750,7 +765,7 @@ static int rk_iommu_map_iova(struct rk_iommu_domain *rk_domain, u32 *pte_addr,
>   			    pte_count * SPAGE_SIZE);
>   
>   	iova += pte_count * SPAGE_SIZE;
> -	page_phys = rk_pte_page_address(pte_addr[pte_count]);
> +	page_phys = rk_ops->pt_address(pte_addr[pte_count]);
>   	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
>   	       &iova, &page_phys, &paddr, prot);
>   
> @@ -785,7 +800,8 @@ static int rk_iommu_map(struct iommu_domain *domain, unsigned long _iova,
>   	dte_index = rk_domain->dt[rk_iova_dte_index(iova)];
>   	pte_index = rk_iova_pte_index(iova);
>   	pte_addr = &page_table[pte_index];
> -	pte_dma = rk_dte_pt_address(dte_index) + pte_index * sizeof(u32);
> +
> +	pte_dma = rk_ops->pt_address(dte_index) + pte_index * sizeof(u32);
>   	ret = rk_iommu_map_iova(rk_domain, pte_addr, pte_dma, iova,
>   				paddr, size, prot);
>   
> @@ -821,7 +837,7 @@ static size_t rk_iommu_unmap(struct iommu_domain *domain, unsigned long _iova,
>   		return 0;
>   	}
>   
> -	pt_phys = rk_dte_pt_address(dte);
> +	pt_phys = rk_ops->pt_address(dte);
>   	pte_addr = (u32 *)phys_to_virt(pt_phys) + rk_iova_pte_index(iova);
>   	pte_dma = pt_phys + rk_iova_pte_index(iova) * sizeof(u32);
>   	unmap_size = rk_iommu_unmap_iova(rk_domain, pte_addr, pte_dma, size);
> @@ -879,7 +895,7 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>   
>   	for (i = 0; i < iommu->num_mmu; i++) {
>   		rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR,
> -			       rk_domain->dt_dma);
> +			       rk_ops->dma_addr_dte(rk_domain->dt_dma));

Hi,
This is not related to that patch, I was wondring why are all mmu devices initialized
with the same dt_dma?
I see for example that the isp0_mmu in rk3399.dtsi has two resources. Can't each resource
be initialized with different dt_dma and this way there are two dt tables instead of the two mmus pointing
to the same dt table.

Thanks,
Dafna

>   		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
>   		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
>   	}
> @@ -1037,7 +1053,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
>   	for (i = 0; i < NUM_DT_ENTRIES; i++) {
>   		u32 dte = rk_domain->dt[i];
>   		if (rk_dte_is_pt_valid(dte)) {
> -			phys_addr_t pt_phys = rk_dte_pt_address(dte);
> +			phys_addr_t pt_phys = rk_ops->pt_address(dte);
>   			u32 *page_table = phys_to_virt(pt_phys);
>   			dma_unmap_single(dma_dev, pt_phys,
>   					 SPAGE_SIZE, DMA_TO_DEVICE);
> @@ -1127,6 +1143,7 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct rk_iommu *iommu;
>   	struct resource *res;
> +	const struct rk_iommu_ops *ops;
>   	int num_res = pdev->num_resources;
>   	int err, i;
>   
> @@ -1138,6 +1155,17 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   	iommu->dev = dev;
>   	iommu->num_mmu = 0;
>   
> +	ops = of_device_get_match_data(dev);
> +	if (!rk_ops)
> +		rk_ops = ops;
> +
> +	/*
> +	 * That should not happen unless different versions of the
> +	 * hardware block are embedded the same SoC
> +	 */
> +	if (WARN_ON(rk_ops != ops))
> +		return -EINVAL;
> +
>   	iommu->bases = devm_kcalloc(dev, num_res, sizeof(*iommu->bases),
>   				    GFP_KERNEL);
>   	if (!iommu->bases)
> @@ -1226,6 +1254,8 @@ static int rk_iommu_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	dma_set_mask_and_coherent(dev, rk_ops->dma_bit_mask);
> +
>   	return 0;
>   err_remove_sysfs:
>   	iommu_device_sysfs_remove(&iommu->iommu);
> @@ -1277,8 +1307,20 @@ static const struct dev_pm_ops rk_iommu_pm_ops = {
>   				pm_runtime_force_resume)
>   };
>   
> +static struct rk_iommu_ops iommu_data_ops_v1 = {
> +	.pt_address = &rk_dte_pt_address,
> +	.mk_dtentries = &rk_mk_dte,
> +	.mk_ptentries = &rk_mk_pte,
> +	.dte_addr_phys = &rk_dte_addr_phys,
> +	.dma_addr_dte = &rk_dma_addr_dte,
> +	.dma_bit_mask = DMA_BIT_MASK(32),
> +};
> +
> +
>   static const struct of_device_id rk_iommu_dt_ids[] = {
> -	{ .compatible = "rockchip,iommu" },
> +	{	.compatible = "rockchip,iommu",
> +		.data = &iommu_data_ops_v1,
> +	},
>   	{ /* sentinel */ }
>   };
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
