Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ACB396F6D
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 10:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1ECB83CE0;
	Tue,  1 Jun 2021 08:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSbQwgzL1jBU; Tue,  1 Jun 2021 08:48:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB85983CD7;
	Tue,  1 Jun 2021 08:48:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AA7FC0001;
	Tue,  1 Jun 2021 08:48:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5071C0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 08:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5AAB4044C
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 08:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0epfGBZwIPc for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 08:48:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2F7F40338
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 08:48:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C4F91FB;
 Tue,  1 Jun 2021 01:48:33 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE3B53F73D;
 Tue,  1 Jun 2021 01:48:30 -0700 (PDT)
Subject: Re: [PATCH 2/2] iommu: Drop unnecessary of_iommu.h includes
To: Rob Herring <robh@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20210527193710.1281746-1-robh@kernel.org>
 <20210527193710.1281746-2-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ba5f8bf7-9318-0325-bb97-a532d1cee76d@arm.com>
Date: Tue, 1 Jun 2021 09:48:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527193710.1281746-2-robh@kernel.org>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 iommu@lists.linux-foundation.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On 2021-05-27 20:37, Rob Herring wrote:
> The only place of_iommu.h is needed is in drivers/of/device.c. Remove it
> from everywhere else.

Of course, this was from the OF_IOMMU_DECLARE() business which is all is 
long gone now.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 -
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 1 -
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 1 -
>   drivers/iommu/exynos-iommu.c                | 1 -
>   drivers/iommu/ipmmu-vmsa.c                  | 1 -
>   drivers/iommu/msm_iommu.c                   | 1 -
>   drivers/iommu/mtk_iommu.c                   | 1 -
>   drivers/iommu/mtk_iommu_v1.c                | 1 -
>   drivers/iommu/omap-iommu.c                  | 1 -
>   drivers/iommu/rockchip-iommu.c              | 1 -
>   drivers/iommu/virtio-iommu.c                | 1 -
>   drivers/of/platform.c                       | 1 -
>   12 files changed, 12 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 54b2f27b81d4..2ddc3cd5a7d1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -23,7 +23,6 @@
>   #include <linux/msi.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_platform.h>
>   #include <linux/pci.h>
>   #include <linux/pci-ats.h>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..dba15f312cbd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -31,7 +31,6 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_device.h>
> -#include <linux/of_iommu.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4294abe389b2..021cf8f65ffc 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -25,7 +25,6 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_device.h>
> -#include <linux/of_iommu.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm.h>
>   #include <linux/pm_runtime.h>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 7623d8c371f5..d0fbf1d10e18 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -17,7 +17,6 @@
>   #include <linux/kmemleak.h>
>   #include <linux/list.h>
>   #include <linux/of.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index aaa6a4d59057..51ea6f00db2f 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -19,7 +19,6 @@
>   #include <linux/iommu.h>
>   #include <linux/of.h>
>   #include <linux/of_device.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/sizes.h>
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 7880f307cb2d..3a38352b603f 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -18,7 +18,6 @@
>   #include <linux/iommu.h>
>   #include <linux/clk.h>
>   #include <linux/err.h>
> -#include <linux/of_iommu.h>
>   
>   #include <asm/cacheflush.h>
>   #include <linux/sizes.h>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56..6f7c69688ce2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -19,7 +19,6 @@
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 5915d7b38211..778e66f5f1aa 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -22,7 +22,6 @@
>   #include <linux/list.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 26e517eb0dd3..91749654fd49 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -22,7 +22,6 @@
>   #include <linux/io.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/of.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/regmap.h>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 7a2932772fdf..bb50e015b1d5 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -21,7 +21,6 @@
>   #include <linux/mm.h>
>   #include <linux/init.h>
>   #include <linux/of.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 7c02481a81b4..d9f46f2c3058 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -14,7 +14,6 @@
>   #include <linux/interval_tree.h>
>   #include <linux/iommu.h>
>   #include <linux/module.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_platform.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 25d448f5af91..74afbb7a4f5e 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -17,7 +17,6 @@
>   #include <linux/slab.h>
>   #include <linux/of_address.h>
>   #include <linux/of_device.h>
> -#include <linux/of_iommu.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
