Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E726532F194
	for <lists.iommu@lfdr.de>; Fri,  5 Mar 2021 18:44:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B31B43179;
	Fri,  5 Mar 2021 17:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3ais3qDo3BW; Fri,  5 Mar 2021 17:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6C443309;
	Fri,  5 Mar 2021 17:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F24E6C0010;
	Fri,  5 Mar 2021 17:44:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACBF6C0001
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 17:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B3460678
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 17:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gwQv58slCJ9 for <iommu@lists.linux-foundation.org>;
 Fri,  5 Mar 2021 17:43:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4B406062B
 for <iommu@lists.linux-foundation.org>; Fri,  5 Mar 2021 17:43:55 +0000 (UTC)
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DsZdv3rkwz67vV5;
 Sat,  6 Mar 2021 01:36:03 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Mar 2021 18:43:51 +0100
Received: from [10.47.8.182] (10.47.8.182) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 5 Mar 2021
 17:43:50 +0000
Subject: Re: [PATCH] iommu/dma: Resurrect the "forcedac" option
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>
References: <7eece8e0ea7bfbe2cd0e30789e0d46df573af9b0.1614961776.git.robin.murphy@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <76a931ab-fd2a-284e-61ef-9e26bceb4890@huawei.com>
Date: Fri, 5 Mar 2021 17:41:52 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <7eece8e0ea7bfbe2cd0e30789e0d46df573af9b0.1614961776.git.robin.murphy@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.8.182]
X-ClientProxiedBy: lhreml713-chm.china.huawei.com (10.201.108.64) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, murphyt7@tcd.ie,
 iommu@lists.linux-foundation.org, will@kernel.org
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

On 05/03/2021 16:32, Robin Murphy wrote:
> In converting intel-iommu over to the common IOMMU DMA ops, it quietly
> lost the functionality of its "forcedac" option. Since this is a handy
> thing both for testing and for performance optimisation on certain
> platforms, reimplement it under the common IOMMU parameter namespace.
> 
> For the sake of fixing the inadvertent breakage of the Intel-specific
> parameter, remove the dmar_forcedac remnants and hook it up as an alias
> while documenting the transition to the new common parameter.
> 

Do you think that having a kconfig option to control the default for 
this can help identify the broken platforms which rely on forcedac=0? 
But seems a bit trivial for that, though.

Or are we bothered (finding them)?

Thanks,
john

> Fixes: c588072bba6b ("iommu/vt-d: Convert intel iommu driver to the iommu ops")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 15 ++++++++-------
>   drivers/iommu/dma-iommu.c                       | 13 ++++++++++++-
>   drivers/iommu/intel/iommu.c                     |  5 ++---
>   include/linux/dma-iommu.h                       |  2 ++
>   4 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 04545725f187..835f810f2f26 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1869,13 +1869,6 @@
>   			bypassed by not enabling DMAR with this option. In
>   			this case, gfx device will use physical address for
>   			DMA.
> -		forcedac [X86-64]
> -			With this option iommu will not optimize to look
> -			for io virtual address below 32-bit forcing dual
> -			address cycle on pci bus for cards supporting greater
> -			than 32-bit addressing. The default is to look
> -			for translation below 32-bit and if not available
> -			then look in the higher range.
>   		strict [Default Off]
>   			With this option on every unmap_single operation will
>   			result in a hardware IOTLB flush operation as opposed
> @@ -1964,6 +1957,14 @@
>   		nobypass	[PPC/POWERNV]
>   			Disable IOMMU bypass, using IOMMU for PCI devices.
>   
> +	iommu.forcedac=	[ARM64, X86] Control IOVA allocation for PCI devices.
> +			Format: { "0" | "1" }
> +			0 - Try to allocate a 32-bit DMA address first, before
> +			  falling back to the full range if needed.
> +			1 - Allocate directly from the full usable range,
> +			  forcing Dual Address Cycle for PCI cards supporting
> +			  greater than 32-bit addressing.
> +
>   	iommu.strict=	[ARM64] Configure TLB invalidation behaviour
>   			Format: { "0" | "1" }
>   			0 - Lazy mode.
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 9ab6ee22c110..260bf3de1992 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -52,6 +52,17 @@ struct iommu_dma_cookie {
>   };
>   
>   static DEFINE_STATIC_KEY_FALSE(iommu_deferred_attach_enabled);
> +bool iommu_dma_forcedac __read_mostly;
> +
> +static int __init iommu_dma_forcedac_setup(char *str)
> +{
> +	int ret = kstrtobool(str, &iommu_dma_forcedac);
> +
> +	if (!ret && iommu_dma_forcedac)
> +		pr_info("Forcing DAC for PCI devices\n");
> +	return ret;
> +}
> +early_param("iommu.forcedac", iommu_dma_forcedac_setup);
>   
>   void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
>   		struct iommu_domain *domain)
> @@ -438,7 +449,7 @@ static dma_addr_t iommu_dma_alloc_iova(struct iommu_domain *domain,
>   		dma_limit = min(dma_limit, (u64)domain->geometry.aperture_end);
>   
>   	/* Try to get PCI devices a SAC address */
> -	if (dma_limit > DMA_BIT_MASK(32) && dev_is_pci(dev))
> +	if (dma_limit > DMA_BIT_MASK(32) && !iommu_dma_forcedac && dev_is_pci(dev))
>   		iova = alloc_iova_fast(iovad, iova_len,
>   				       DMA_BIT_MASK(32) >> shift, false);
>   
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index ee0932307d64..1c32522220bc 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -360,7 +360,6 @@ int intel_iommu_enabled = 0;
>   EXPORT_SYMBOL_GPL(intel_iommu_enabled);
>   
>   static int dmar_map_gfx = 1;
> -static int dmar_forcedac;
>   static int intel_iommu_strict;
>   static int intel_iommu_superpage = 1;
>   static int iommu_identity_mapping;
> @@ -451,8 +450,8 @@ static int __init intel_iommu_setup(char *str)
>   			dmar_map_gfx = 0;
>   			pr_info("Disable GFX device mapping\n");
>   		} else if (!strncmp(str, "forcedac", 8)) {
> -			pr_info("Forcing DAC for PCI devices\n");
> -			dmar_forcedac = 1;
> +			pr_warn("intel_iommu=forcedac deprecated; use iommu.forcedac instead\n");
> +			iommu_dma_forcedac = true;
>   		} else if (!strncmp(str, "strict", 6)) {
>   			pr_info("Disable batched IOTLB flush\n");
>   			intel_iommu_strict = 1;
> diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
> index 706b68d1359b..13d1f4c14d7b 100644
> --- a/include/linux/dma-iommu.h
> +++ b/include/linux/dma-iommu.h
> @@ -40,6 +40,8 @@ void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
>   void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
>   		struct iommu_domain *domain);
>   
> +extern bool iommu_dma_forcedac;
> +
>   #else /* CONFIG_IOMMU_DMA */
>   
>   struct iommu_domain;
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
