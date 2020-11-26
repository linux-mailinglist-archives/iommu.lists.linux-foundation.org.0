Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A112C5B9D
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 19:09:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C54FA87881;
	Thu, 26 Nov 2020 18:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW0XJ-JTmr3I; Thu, 26 Nov 2020 18:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE0AC8788C;
	Thu, 26 Nov 2020 18:09:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A000DC0052;
	Thu, 26 Nov 2020 18:09:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EED0C0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 18:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3821185F7F
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 18:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkJ4y4A8GYFG for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 18:09:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 055268626F
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 18:09:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4512431B;
 Thu, 26 Nov 2020 10:09:31 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D587E3F23F;
 Thu, 26 Nov 2020 10:09:27 -0800 (PST)
Subject: Re: [PATCH v8 4/9] of/iommu: Support dma-can-stall property
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, joro@8bytes.org,
 will@kernel.org, lorenzo.pieralisi@arm.com, robh+dt@kernel.org
References: <20201112125519.3987595-1-jean-philippe@linaro.org>
 <20201112125519.3987595-5-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d0a61d79-82fc-3af8-570e-e2ae3d485455@arm.com>
Date: Thu, 26 Nov 2020 18:09:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201112125519.3987595-5-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, guohanjun@huawei.com,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, vivek.gautam@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On 2020-11-12 12:55, Jean-Philippe Brucker wrote:
> Copy the dma-can-stall property into the fwspec structure.

Can't we just handle this as a regular device property? It's not part of 
the actual IOMMU specifier, it doesn't need to be translated in any way, 
and AFAICS it's used a grand total of once, in a slow path. Simply 
treating it as the per-device property that it is should require zero 
additional code for DT, and a simple device_add_properties() call for IORT.

TBH that appears to be true of pasid-num-bits as well.

Robin.

> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   include/linux/iommu.h    | 2 ++
>   drivers/iommu/of_iommu.c | 5 ++++-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index a1c78c4cdeb1..9076fb592c8f 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -572,6 +572,7 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
>    * @iommu_fwnode: firmware handle for this device's IOMMU
>    * @iommu_priv: IOMMU driver private data for this device
>    * @num_pasid_bits: number of PASID bits supported by this device
> + * @can_stall: the device is allowed to stall
>    * @num_ids: number of associated device IDs
>    * @ids: IDs which this device may present to the IOMMU
>    */
> @@ -579,6 +580,7 @@ struct iommu_fwspec {
>   	const struct iommu_ops	*ops;
>   	struct fwnode_handle	*iommu_fwnode;
>   	u32			num_pasid_bits;
> +	bool			can_stall;
>   	unsigned int		num_ids;
>   	u32			ids[];
>   };
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e505b9130a1c..d6255ca823d8 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -212,9 +212,12 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
>   		err = of_iommu_configure_device(master_np, dev, id);
>   
>   		fwspec = dev_iommu_fwspec_get(dev);
> -		if (!err && fwspec)
> +		if (!err && fwspec) {
>   			of_property_read_u32(master_np, "pasid-num-bits",
>   					     &fwspec->num_pasid_bits);
> +			fwspec->can_stall = of_property_read_bool(master_np,
> +								  "dma-can-stall");
> +		}
>   	}
>   
>   	/*
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
