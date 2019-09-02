Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6AA5875
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 15:54:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87481E98;
	Mon,  2 Sep 2019 13:54:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C7D23E0E
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:54:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4383F709
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:54:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCDDD337;
	Mon,  2 Sep 2019 06:54:27 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7683F59C;
	Mon,  2 Sep 2019 06:54:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu: Implement of_iommu_get_resv_regions()
To: Thierry Reding <thierry.reding@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
	<20190829111407.17191-2-thierry.reding@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0b7e050a-cec6-6ce7-9ed6-2146eabb2fe8@arm.com>
Date: Mon, 2 Sep 2019 14:54:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190829111407.17191-2-thierry.reding@gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
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

On 29/08/2019 12:14, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is an implementation that IOMMU drivers can use to obtain reserved
> memory regions from a device tree node. It uses the reserved-memory DT
> bindings to find the regions associated with a given device. These
> regions will be used to create 1:1 mappings in the IOMMU domain that
> the devices will be attached to.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/iommu/of_iommu.c | 39 +++++++++++++++++++++++++++++++++++++++
>   include/linux/of_iommu.h |  8 ++++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 614a93aa5305..0d47f626b854 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -9,6 +9,7 @@
>   #include <linux/iommu.h>
>   #include <linux/limits.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/of_iommu.h>
>   #include <linux/of_pci.h>
>   #include <linux/slab.h>
> @@ -225,3 +226,41 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>   
>   	return ops;
>   }
> +
> +/**
> + * of_iommu_get_resv_regions - reserved region driver helper for device tree
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * IOMMU drivers can use this to implement their .get_resv_regions() callback
> + * for memory regions attached to a device tree node. See the reserved-memory
> + * device tree bindings on how to use these:
> + *
> + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> + */
> +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_phandle_iterator it;
> +	int err;
> +
> +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
> +		struct iommu_resv_region *region;
> +		struct resource res;
> +
> +		err = of_address_to_resource(it.node, 0, &res);
> +		if (err < 0) {
> +			dev_err(dev, "failed to parse memory region %pOF: %d\n",
> +				it.node, err);
> +			continue;
> +		}

What if the device node has memory regions for other purposes, like 
private CMA carveouts? We wouldn't want to force mappings of those (and 
in the very worst case doing so could even render them unusable).

Robin.

> +
> +		region = iommu_alloc_resv_region(res.start, resource_size(&res),
> +						 IOMMU_READ | IOMMU_WRITE,
> +						 IOMMU_RESV_DIRECT_RELAXABLE);
> +		if (!region)
> +			continue;
> +
> +		list_add_tail(&region->list, list);
> +	}
> +}
> +EXPORT_SYMBOL(of_iommu_get_resv_regions);
> diff --git a/include/linux/of_iommu.h b/include/linux/of_iommu.h
> index f3d40dd7bb66..fa16b26f55bc 100644
> --- a/include/linux/of_iommu.h
> +++ b/include/linux/of_iommu.h
> @@ -15,6 +15,9 @@ extern int of_get_dma_window(struct device_node *dn, const char *prefix,
>   extern const struct iommu_ops *of_iommu_configure(struct device *dev,
>   					struct device_node *master_np);
>   
> +extern void of_iommu_get_resv_regions(struct device *dev,
> +				      struct list_head *list);
> +
>   #else
>   
>   static inline int of_get_dma_window(struct device_node *dn, const char *prefix,
> @@ -30,6 +33,11 @@ static inline const struct iommu_ops *of_iommu_configure(struct device *dev,
>   	return NULL;
>   }
>   
> +static inline void of_iommu_get_resv_regions(struct device *dev,
> +					     struct list_head *list)
> +{
> +}
> +
>   #endif	/* CONFIG_OF_IOMMU */
>   
>   #endif /* __OF_IOMMU_H */
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
