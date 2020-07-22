Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 65038229B29
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 17:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A607204F6;
	Wed, 22 Jul 2020 15:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQfqKaslvTUf; Wed, 22 Jul 2020 15:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B90C204F3;
	Wed, 22 Jul 2020 15:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4500DC004C;
	Wed, 22 Jul 2020 15:19:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 336EDC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 13226204EC
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWRjBJshWAu0 for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 15:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 9F77C204E7
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 15:19:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x5so1715819wmi.2
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+UCvHRw9cSV1ire+wDJVVQA4haGd1GB0XoiKtbgnmTo=;
 b=mPWd+SgyIoM4lyYru9jltmu9xCLYTsfHwP43ZhqSTI3HRTjtBVPedMh8cO5+wfljZV
 Lxf8H6NT28UcH94uOz8FUO607ECu/zMFF/MPHa8vrnE8y+FANxATLTHXGsAo+2bA5GJI
 cNMGYH4iiHh3SM6/WdmeRgWdXbviPJlZXdBWNDTq7kD1YGxqEZnCuL5rIt4hSHLdaJhk
 4qChsu+0TuRImEAJ38wFhHF9zH9+OXOqNL7agZKc8njCEfIi1Q2qEJVdMQt/bpiNZNyJ
 +WJ5UGOG+bSeyuor+0i9DY+OTy+2kXU5EdPO8R5SQuOMOTN+D4hMhFlYXzMS/vMK+mib
 6Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+UCvHRw9cSV1ire+wDJVVQA4haGd1GB0XoiKtbgnmTo=;
 b=Xn/N9UnbuZERkaZthT7YJfWm4EAchjvmRCzYSzMKz2FT5U5R6rYoTVTRAbnX8G8rH7
 RO7C2hqdNwcbZGzTi5adWtn89UvYzOSkuApsxJl95PjVM+xPBM2vk1kA0DlMLV8IkKRo
 NRtzsACdtol9vb62TigLNcfsCU6IrC6oJEagacPa/k0dAq2a7iMXrVazXHUi0IOj02/Y
 Zh6X07ouHpPJ0+Msu6N4uRce7auzOlqilqM8x9KWI7xOQUMpYMu9CTpWZAG+xrr35JC/
 HcHUYxIEbGWxFtDvlA7i440h7NU1FVhGJh8i/cybpryZv0S0dtTZPguJtf9EszIIFthh
 KNxQ==
X-Gm-Message-State: AOAM532QE0zJsG+ExViNmSkpv5ct81/rtczUth4Uzk9bbM3QNa9SQmOS
 cBlHVUoPlknLb5K6e9gldrg=
X-Google-Smtp-Source: ABdhPJx4/91ssZDs9aLL0SlkfQcoKpepKepjDLz8KCMepuSrTFan2YjNbDmCoVfqBl8wRK0twYrstg==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr140355wmg.93.1595431174874;
 Wed, 22 Jul 2020 08:19:34 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id u20sm13204wmc.42.2020.07.22.08.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:19:34 -0700 (PDT)
Subject: Re: [PATCH v3] iommu/mediatek: check 4GB mode by reading infracfg
To: Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>
References: <20200722141925.14861-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <eb36fb32-9a90-2b63-bdc2-506c02a5cb07@gmail.com>
Date: Wed, 22 Jul 2020 17:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722141925.14861-1-miles.chen@mediatek.com>
Content-Language: en-US
Cc: wsd_upstream@mediatek.com, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Christoph Hellwig <hch@lst.de>,
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



On 22/07/2020 16:19, Miles Chen wrote:
> In previous discussion [1] and [2], we found that it is risky to
> use max_pfn or totalram_pages to tell if 4GB mode is enabled.
> 
> Check 4GB mode by reading infracfg register, remove the usage
> of the un-exported symbol max_pfn.
> 
> This is a step towards building mtk_iommu as a kernel module.
> 
> ---

That's wrong. The commit message would be cut after this '---' so we would loose 
the Cc and Signed-of-by tags.

> 
> Change since v2:
> - determine compatible string by m4u_plat
> - rebase to next-20200720
> - add "---"
> 
> Change since v1:
> - remove the phandle usage, search for infracfg instead [3]
> - use infracfg instead of infracfg_regmap
> - move infracfg definitaions to linux/soc/mediatek/infracfg.h
> - update enable_4GB only when has_4gb_mode
> 
> [1] https://lkml.org/lkml/2020/6/3/733
> [2] https://lkml.org/lkml/2020/6/4/136

I think using links to lore.kernel.org would make sure that the URL does not 
change over time. As the commit log will stay there for ever, but who konws what 
happens with lkml.org

> [3] https://lkml.org/lkml/2020/7/15/1147
> 
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

The formating should look like this:
In previous discussion [1] and [2], we found that it is risky to
use max_pfn or totalram_pages to tell if 4GB mode is enabled.

Check 4GB mode by reading infracfg register, remove the usage
of the un-exported symbol max_pfn.

This is a step towards building mtk_iommu as a kernel module.

[1] https://lkml.org/lkml/2020/6/3/733
[2] https://lkml.org/lkml/2020/6/4/136

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---

Change since v2:
- determine compatible string by m4u_plat
- rebase to next-20200720
- add "---"

Change since v1:
- remove the phandle usage, search for infracfg instead 
https://lkml.org/lkml/2020/7/15/1147
- use infracfg instead of infracfg_regmap
- move infracfg definitaions to linux/soc/mediatek/infracfg.h
- update enable_4GB only when has_4gb_mode



> ---
>   drivers/iommu/mtk_iommu.c             | 34 +++++++++++++++++++++++----
>   include/linux/soc/mediatek/infracfg.h |  3 +++
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 59e5a62a34db..9ec666168822 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -3,7 +3,6 @@
>    * Copyright (c) 2015-2016 MediaTek Inc.
>    * Author: Yong Wu <yong.wu@mediatek.com>
>    */
> -#include <linux/memblock.h>
>   #include <linux/bug.h>
>   #include <linux/clk.h>
>   #include <linux/component.h>
> @@ -15,13 +14,16 @@
>   #include <linux/iommu.h>
>   #include <linux/iopoll.h>
>   #include <linux/list.h>
> +#include <linux/mfd/syscon.h>
>   #include <linux/of_address.h>
>   #include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> +#include <linux/soc/mediatek/infracfg.h>
>   #include <asm/barrier.h>
>   #include <soc/mediatek/smi.h>
>   
> @@ -640,8 +642,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	struct resource         *res;
>   	resource_size_t		ioaddr;
>   	struct component_match  *match = NULL;
> +	struct regmap		*infracfg;
>   	void                    *protect;
>   	int                     i, larb_nr, ret;
> +	u32			val;
> +	char                    *p;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -655,10 +660,29 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
>   
> -	/* Whether the current dram is over 4GB */
> -	data->enable_4GB = !!(max_pfn > (BIT_ULL(32) >> PAGE_SHIFT));
> -	if (!MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
> -		data->enable_4GB = false;
> +	data->enable_4GB = false;
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
> +		switch (data->plat_data->m4u_plat) {
> +		case M4U_MT2712:
> +			p = "mediatek,mt2712-infracfg";
> +			break;
> +		case M4U_MT8173:
> +			p = "mediatek,mt8173-infracfg";
> +			break;
> +		default:
> +			p = NULL;
> +		}
> +
> +		infracfg = syscon_regmap_lookup_by_compatible(p);

	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE)) {
		switch (data->plat_data->m4u_plat) {
		case M4U_MT2712:
			infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt2712-infracfg");
			break;
		case M4U_MT8173:
			infracfg = syscon_regmap_lookup_by_compatible("mediatek,mt8173-infracfg");
			break;
		default:
			infracfg = -ENODEV;
		}
> +
> +		if (IS_ERR(infracfg))
> +			return PTR_ERR(infracfg);
> +
> +		ret = regmap_read(infracfg, REG_INFRA_MISC, &val);
> +		if (ret)
> +			return ret;
> +		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
> +	}
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	data->base = devm_ioremap_resource(dev, res);
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index fd25f0148566..233463d789c6 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -32,6 +32,9 @@
>   #define MT7622_TOP_AXI_PROT_EN_WB		(BIT(2) | BIT(6) | \
>   						 BIT(7) | BIT(8))
>   
> +#define REG_INFRA_MISC				0xf00
> +#define F_DDR_4GB_SUPPORT_EN			BIT(13)
> +
>   int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
>   		bool reg_update);
>   int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
