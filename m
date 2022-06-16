Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F054DDBC
	for <lists.iommu@lfdr.de>; Thu, 16 Jun 2022 11:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B67441A4B;
	Thu, 16 Jun 2022 09:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFiW0e01qD_5; Thu, 16 Jun 2022 09:00:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E87341A51;
	Thu, 16 Jun 2022 09:00:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00132C0081;
	Thu, 16 Jun 2022 09:00:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42786C002D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 09:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ACD861116
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 09:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2L5krCHA2-z2 for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jun 2022 09:00:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1706260BFE
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jun 2022 09:00:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 509B512FC;
 Thu, 16 Jun 2022 02:00:02 -0700 (PDT)
Received: from [10.57.82.209] (unknown [10.57.82.209])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8203F7F5;
 Thu, 16 Jun 2022 01:59:59 -0700 (PDT)
Message-ID: <e2091397-b6e2-7296-1378-dc10b24c6ef4@arm.com>
Date: Thu, 16 Jun 2022 09:59:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
Content-Language: en-GB
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
 <20220616054203.11365-3-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220616054203.11365-3-yong.wu@mediatek.com>
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

On 2022-06-16 06:42, Yong Wu wrote:
> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
> larb is parsed fail(return -EINVAL), we should of_node_put for the 0..i
> larbs. In the fail path, one of_node_put matches with of_parse_phandle in
> it.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 3b2489e8a6dd..ab24078938bf 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1071,12 +1071,12 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   
>   		plarbdev = of_find_device_by_node(larbnode);
>   		if (!plarbdev) {
> -			of_node_put(larbnode);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto err_larbnode_put;
>   		}
>   		if (!plarbdev->dev.driver) {
> -			of_node_put(larbnode);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto err_larbnode_put;
>   		}
>   		data->larb_imu[id].dev = &plarbdev->dev;
>   
> @@ -1107,9 +1107,20 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>   	if (!link) {
>   		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_larbnode_put;
>   	}
>   	return 0;
> +
> +err_larbnode_put:
> +	while (i--) {
> +		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
> +		if (larbnode && of_device_is_available(larbnode)) {
> +			of_node_put(larbnode);
> +			of_node_put(larbnode);
> +		}

This looks a bit awkward - could we not just iterate through 
data->larb_imu and put dev->of_node for each valid dev?

Also, of_find_device_by_node() takes a reference on the struct device 
itself, so strictly we should be doing put_device() on those as well if 
we're bailing out.

Robin.

> +	}
> +	return ret;
>   }
>   
>   static int mtk_iommu_probe(struct platform_device *pdev)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
