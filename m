Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258F56CD60
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D47813C5;
	Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D47813C5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6tNK2oY
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEMTiW6myWRR; Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C0375813AA;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0375813AA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B98F2C0035;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C78F5C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9072784110
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9072784110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqQ2QBJL5_Dd for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:47:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08448410F
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A08448410F
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657270072; x=1688806072;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lPN3tr4eh0tfXsjtQ0DQnavtXzaN0esQyO+xtoyOkig=;
 b=S6tNK2oYQol+9rU831xRYek/XSJqLCF+votJoJsodZZRkRIdFcX4V1+w
 xKIa6t9WguQYC+TLlUZ1a/lb1YURO/ZYMum7vkWr6mbustvwhaVJmYsNh
 aIbICF3rfGihWnhu94H5kYPhBSXoSEeonxpbxCJ7xANyFWv04Pu1lL8Np
 touxunA7BDzbHcx03p0hSl97z4t8rGKm+iN+kmJoX5X41u7KEm4aMW9K/
 AwC5U+zT8kjachbOSl4jAHSQnqVMWrNu7pZeR56y/dTkMmGwZoAnl6zWo
 B9uVMReWYpYs6Lkxqq0/CiH6lZ/KaeadycuKXauKHOfSprA2MQRIUzVdm A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="267264533"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="267264533"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:47:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621140950"
Received: from yanc1-mobl.ccr.corp.intel.com (HELO [10.255.28.91])
 ([10.255.28.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:47:49 -0700
Message-ID: <452e850f-c351-8718-d888-ce680d6c0237@linux.intel.com>
Date: Fri, 8 Jul 2022 16:47:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] iommu: remove iommu_dev_feature_enabled
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
 Sven Peter <sven@svenpeter.dev>, David Woodhouse <dwmw2@infradead.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-3-hch@lst.de>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220708080616.238833-3-hch@lst.de>
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 2022/7/8 16:06, Christoph Hellwig wrote:
> Remove the unused iommu_dev_feature_enabled function.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

A nit comment below, anyway

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  1 -
>   drivers/iommu/iommu.c                       | 13 -------------
>   include/linux/iommu.h                       |  9 ---------
>   3 files changed, 23 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 1b6c17dd81ee4..4d30a8d2bc236 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2853,7 +2853,6 @@ static struct iommu_ops arm_smmu_ops = {
>   	.of_xlate		= arm_smmu_of_xlate,
>   	.get_resv_regions	= arm_smmu_get_resv_regions,
>   	.put_resv_regions	= generic_iommu_put_resv_regions,
> -	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
>   	.dev_enable_feat	= arm_smmu_dev_enable_feature,
>   	.dev_disable_feat	= arm_smmu_dev_disable_feature,
>   	.sva_bind		= arm_smmu_sva_bind,
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0aa141646bdf4..1bb016a6a2aa1 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2760,19 +2760,6 @@ int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
>   }
>   EXPORT_SYMBOL_GPL(iommu_dev_disable_feature);
>   
> -bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
> -{
> -	if (dev->iommu && dev->iommu->iommu_dev) {
> -		const struct iommu_ops *ops = dev->iommu->iommu_dev->ops;
> -
> -		if (ops->dev_feat_enabled)
> -			return ops->dev_feat_enabled(dev, feat);
> -	}
> -
> -	return false;
> -}
> -EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
> -
>   /**
>    * iommu_sva_bind_device() - Bind a process address space to a device
>    * @dev: the device
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index a3acdb46b9391..0bc2eb14b0262 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -215,7 +215,6 @@ struct iommu_iotlb_gather {
>    *                      driver init to device driver init (default no)
>    * @dev_has/enable/disable_feat: per device entries to check/enable/disable
             ^^^

dev_has_feat() has been removed by the previous patch.

>    *                               iommu specific features.
> - * @dev_feat_enabled: check enabled feature
>    * @sva_bind: Bind process address space to device
>    * @sva_unbind: Unbind process address space from device
>    * @sva_get_pasid: Get PASID associated to a SVA handle
> @@ -247,7 +246,6 @@ struct iommu_ops {
>   	bool (*is_attach_deferred)(struct device *dev);
>   
>   	/* Per device IOMMU features */
> -	bool (*dev_feat_enabled)(struct device *dev, enum iommu_dev_features f);
>   	int (*dev_enable_feat)(struct device *dev, enum iommu_dev_features f);
>   	int (*dev_disable_feat)(struct device *dev, enum iommu_dev_features f);
>   
> @@ -670,7 +668,6 @@ void iommu_release_device(struct device *dev);
>   
>   int iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features f);
>   int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features f);
> -bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
>   
>   struct iommu_sva *iommu_sva_bind_device(struct device *dev,
>   					struct mm_struct *mm,
> @@ -997,12 +994,6 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>   	return NULL;
>   }
>   
> -static inline bool
> -iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
> -{
> -	return false;
> -}
> -
>   static inline int
>   iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
>   {

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
