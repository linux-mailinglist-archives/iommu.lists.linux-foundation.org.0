Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4F268826
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 11:19:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1D5686991;
	Mon, 14 Sep 2020 09:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLQGcovdhoAB; Mon, 14 Sep 2020 09:19:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2E638696A;
	Mon, 14 Sep 2020 09:19:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C40C7C089E;
	Mon, 14 Sep 2020 09:19:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 403CBC0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 09:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2EE9C8696A
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 09:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usldxfRF97UT for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 09:19:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 34B1886016
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 09:19:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j2so17870284wrx.7
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wcF550GwyqliSCSyHw0Z/IDzm3K/ogaNto0zdoWfp60=;
 b=tiMPrN36G6dUn/kEUQVays/uU94aZcWuAZpt/Nvk7qqLpik+PvXRFUsv/Eiw4v+VXi
 nUPyrmVyWgm2X5NAZTkS2bjtga25N+GcOlP/8rgU3wlJRPFvOt6CD0D3XpoZb4zO7MJR
 RTb5xROBppfNI3+h3yXQO02cMDQH+vUyMhy7m2/bsQuWqO43t/T652wnp3ccQACIrruE
 w2NSQCEmAac+MPdWfdJqp47I7AkqnuRFn2K3zg5av1CmCkKi4fbhquKHLsLpy7oWEmTq
 1gCex1T5rtmEO45QL7sRyL/mFyhdzteRX3EgBCk5kCAKR8O3mBNDIkkYoFl359gSPulx
 sMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wcF550GwyqliSCSyHw0Z/IDzm3K/ogaNto0zdoWfp60=;
 b=niUxJQE0/dieDzL+u21CPUTCq+3eFn6r1QEsZM51Ye1AvA/IRi1plzHNZKGADGWawc
 Z1Xm91/h1yzBU6cuPrGXCEVeDLskCDl4ZAuCWm4ZOMUazQladjHx17J1FIsDcX+BiMj7
 zgLMmARYGLRGN7zryXCk9O/eLoUXHgrlGij5RJ7nwDLzogfMRsE1YAj5BNlS2sEpGqIs
 1+S+5Ry6Xo66AK0xkezZ5corkrtWDIqU4V+h2m8Uw4pO5sGsZZHBazM9r+UikZOexAb+
 hMTSnsJE7px58xLguRd/nvBjkgvaTJAr5wOChvr4qpPXDOoSIbn4TcP/8whJsksY2DO8
 3IZQ==
X-Gm-Message-State: AOAM533tMgwKSsY/q8t0anhG8ko1DYb5QfuBOv+94bABZvENnl7pzedV
 d70XiUnebso+VZYAf35RBUc=
X-Google-Smtp-Source: ABdhPJyiYN1HRm7fTUbCjsDnDAsfhonS+0cIoWKodJ2jQ+pGXmfjQNFD7P4TdRoi2iJM10fiR86oOA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr14605256wrt.267.1600075168623; 
 Mon, 14 Sep 2020 02:19:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id j7sm19884886wrs.11.2020.09.14.02.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 02:19:27 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/mediatek: add flag for legacy ivrp paddr
To: Fabien Parent <fparent@baylibre.com>, iommu@lists.linux-foundation.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20200907101649.1573134-1-fparent@baylibre.com>
 <20200907101649.1573134-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <cac92e0d-0789-64a4-729c-80ff5f34b6bb@gmail.com>
Date: Mon, 14 Sep 2020 11:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907101649.1573134-2-fparent@baylibre.com>
Content-Language: en-US
Cc: robh+dt@kernel.org, miles.chen@mediatek.com
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



On 07/09/2020 12:16, Fabien Parent wrote:
> Add a new flag in order to select which IVRP_PADDR format is used
> by an SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> v4: no change
> v3: set LEGACY_IVRP_PADDR as a flag instead of platform data
> v2: new patch
> 
> ---
>   drivers/iommu/mtk_iommu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 785b228d39a6..b1f85a7e9346 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -116,6 +116,7 @@
>   #define OUT_ORDER_WR_EN			BIT(4)
>   #define HAS_SUB_COMM			BIT(5)
>   #define WR_THROT_EN			BIT(6)
> +#define HAS_LEGACY_IVRP_PADDR		BIT(7)
>   
>   #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
>   		((((pdata)->flags) & (_x)) == (_x))
> @@ -582,7 +583,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>   		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
>   	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>   
> -	if (data->plat_data->m4u_plat == M4U_MT8173)
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
>   		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>   	else
>   		regval = lower_32_bits(data->protect_base) |
> @@ -818,7 +819,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>   
>   static const struct mtk_iommu_plat_data mt8173_data = {
>   	.m4u_plat     = M4U_MT8173,
> -	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI,
> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> +			HAS_LEGACY_IVRP_PADDR,
>   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
>   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
>   };
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
