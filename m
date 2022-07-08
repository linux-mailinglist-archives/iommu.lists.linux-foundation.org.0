Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C656CD68
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA1460BA8;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA1460BA8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WHM1Atm4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLrsjODsK6JD; Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 29560607A4;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29560607A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EDDDC009B;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B7DCC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41F994168D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41F994168D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=WHM1Atm4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBCxUr84s0TH for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50C9F419F3
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50C9F419F3
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657269790; x=1688805790;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZL5aFr3l1jc3K8HSJ5uF7UCrQDZrFncEqq7wzvxfLVE=;
 b=WHM1Atm4y1NkvvsTNtqEX3h6AuG6jGK6EZNiu9uspkRpWL2qSm8J/BSS
 ikBFTA0p3rQNCzXfObiGQtQhGY3SMVsBlKXY1VJwfk/KOwVxicrJM5sUp
 u7ShF3i1fZijtxYGyVgfUJ9a9vm/9J5UV2tCKXcvzMxvBfDdVVL0Mj0yH
 C6yyEeZbU+100olNxdqNHbTrggZZCMPv3Eoh38V+PrddwiFW8XOBt6pMA
 DXOZ5zDheW6ev6foVC0xo5MFQrrJpDxSn9jFV0GWzwjnXR9iqpOiA6SNd
 ir5hNg9ZLo949oj5a/HjnD9rNlyZhNzBmw4re9YZJr38cv7LcarUdSelv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="264646317"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="264646317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:43:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621139616"
Received: from yanc1-mobl.ccr.corp.intel.com (HELO [10.255.28.91])
 ([10.255.28.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 01:43:06 -0700
Message-ID: <9973a21c-ac5e-7b16-e5bb-4242bcec1a82@linux.intel.com>
Date: Fri, 8 Jul 2022 16:43:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/4] iommu: remove the unused dev_has_feat method
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
 Sven Peter <sven@svenpeter.dev>, David Woodhouse <dwmw2@infradead.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-2-hch@lst.de>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220708080616.238833-2-hch@lst.de>
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
> This method is never actually called.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 -
>   include/linux/iommu.h                       | 4 +---
>   2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d9c1623ec1a9a..1b6c17dd81ee4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2853,7 +2853,6 @@ static struct iommu_ops arm_smmu_ops = {
>   	.of_xlate		= arm_smmu_of_xlate,
>   	.get_resv_regions	= arm_smmu_get_resv_regions,
>   	.put_resv_regions	= generic_iommu_put_resv_regions,
> -	.dev_has_feat		= arm_smmu_dev_has_feature,
>   	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
>   	.dev_enable_feat	= arm_smmu_dev_enable_feature,
>   	.dev_disable_feat	= arm_smmu_dev_disable_feature,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e6abd998dbe73..a3acdb46b9391 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -164,8 +164,7 @@ struct iommu_iort_rmr_data {
>    *			 supported, this feature must be enabled before and
>    *			 disabled after %IOMMU_DEV_FEAT_SVA.
>    *
> - * Device drivers query whether a feature is supported using
> - * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
> + * Device drivers enable a feature using iommu_dev_enable_feature().
>    */
>   enum iommu_dev_features {
>   	IOMMU_DEV_FEAT_SVA,
> @@ -248,7 +247,6 @@ struct iommu_ops {
>   	bool (*is_attach_deferred)(struct device *dev);
>   
>   	/* Per device IOMMU features */
> -	bool (*dev_has_feat)(struct device *dev, enum iommu_dev_features f);
>   	bool (*dev_feat_enabled)(struct device *dev, enum iommu_dev_features f);
>   	int (*dev_enable_feat)(struct device *dev, enum iommu_dev_features f);
>   	int (*dev_disable_feat)(struct device *dev, enum iommu_dev_features f);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
