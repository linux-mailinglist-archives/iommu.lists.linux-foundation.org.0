Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEAA54E29F
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 15:56:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E1BE8403D;
	Thu, 16 Jun 2022 13:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKVFSt9yOY7J; Thu, 16 Jun 2022 13:56:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7787B84035;
	Thu, 16 Jun 2022 13:56:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50917C002D;
	Thu, 16 Jun 2022 13:56:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EA00C002D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 13:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D19C41881
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 13:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfps9574MaiT for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 13:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B6F941879
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 13:56:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id q15so824634wmj.2
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m6uBZVuyEz2LJoe25N52zu3vkj3sZBGqGpB8uE3jv7A=;
 b=FCcdLGR8f+Nh4u2S5InboaIgmcQQkJa1/T5sIaER5b1erKLX9DvZqJNGD7loQo/q7C
 2952kKcUSS0KV+Y8KCAA2obrp6Y7UwwaB/Pq5FcS+zSpkx7tWMmapHDfShl4e/pt0Rxu
 /acX5/8UCfH0p0Kw9wexWShHNrRFe81xuW+3iCzpM6BLg34RyYTX8NwW/PmHwy7+joru
 O9lks34OHP+dOji5ulmU7tW46oqOySDujx/+lIOJwUWX+1sRiOxHGobuNE4qEL5zAjj9
 tGaXFzLgjYRHKA0q72nZauUDuqLWqwwLkD5RD9KB0TMTc+HrUsZ55yS61/GGqUt4DMhA
 uZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m6uBZVuyEz2LJoe25N52zu3vkj3sZBGqGpB8uE3jv7A=;
 b=GEyktUXhyLYHYXMxow+fAinuMWH9vbVbm0IFV2WmC0aFBD/G9uLmNR4OCZldjF+anw
 BAr8eToLWX6pkN2qMpqCegtlIcyj6W6oR8vBRvYY0LGR9EyxnmbA7uDwNTawt119cJL8
 KudeChvc434kYBq/1BAKwHOnKDqcpFoECJJExao/g3SbWhFYq8ynSWiZtEznQKlPP/ks
 BcMsokX3+RiaEiyPmnwZKjlQ7i9mKD26crTX9oBV9Sp4SCm8EBzCSkkxACyQ/qoiMdGv
 DhWogv6rO76GHlKt3LVS6LjCZwYD1DQdwQqrkUxnDmu0je/xpb/gzUeBsXdvHG/Iz8da
 D0rw==
X-Gm-Message-State: AJIora/vul+5OG8m0lm9LwCP8yQ9IY+CnmmwgGlo575Zi53FHopRBiWa
 DWwdpYo3xCELmffmcRhlETw=
X-Google-Smtp-Source: AGRyM1vaMBvDopUDTt0s4tdWKsT6HUNecCRsYk/m/z7HxI6lnV8qvwV44VhHPlGJhcCQclZE98LQ/Q==
X-Received: by 2002:a05:600c:34cf:b0:39c:4dfb:1398 with SMTP id
 d15-20020a05600c34cf00b0039c4dfb1398mr5161884wmq.133.1655387801411; 
 Thu, 16 Jun 2022 06:56:41 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b0039c811077d3sm2518057wmq.22.2022.06.16.06.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 06:56:40 -0700 (PDT)
Message-ID: <65ebee0a-391a-294f-13f1-bc039f0a748c@gmail.com>
Date: Thu, 16 Jun 2022 15:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 5/5] iommu/mediatek: Remove a unused "mapping" which is
 only for v1
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
 <20220616054203.11365-6-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616054203.11365-6-yong.wu@mediatek.com>
Cc: anan.sun@mediatek.com, chengci.xu@mediatek.com, xueqi.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, libo.kang@mediatek.com, yf.wang@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Guenter Roeck <groeck@chromium.org>,
 mingyuan.ma@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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



On 16/06/2022 07:42, Yong Wu wrote:
> Just remove a unused variable that only is for mtk_iommu_v1.
> 
> Fixes: 9485a04a5bb9 ("iommu/mediatek: Separate mtk_iommu_data for v1 and v2")

It does not fix a bug, so no fixes tag here needed.

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 5e86fd48928a..e65e705d9fc1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -221,10 +221,7 @@ struct mtk_iommu_data {
>   	struct device			*smicomm_dev;
>   
>   	struct mtk_iommu_bank_data	*bank;
> -
> -	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
>   	struct regmap			*pericfg;
> -
>   	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
>   
>   	/*
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
