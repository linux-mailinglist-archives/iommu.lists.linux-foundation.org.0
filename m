Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D03C807A
	for <lists.iommu@lfdr.de>; Wed, 14 Jul 2021 10:44:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 346F060A72;
	Wed, 14 Jul 2021 08:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sc1rQTaATvNm; Wed, 14 Jul 2021 08:44:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2374F60A6E;
	Wed, 14 Jul 2021 08:44:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7274C000E;
	Wed, 14 Jul 2021 08:44:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E1D9C000E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D63540114
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lAJFRsVBXcI for <iommu@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 08:44:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0808F4021A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 08:44:08 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42F781F42B41;
 Wed, 14 Jul 2021 09:44:04 +0100 (BST)
Subject: Re: [PATCH v6 06/11] drm/mediatek: Add pm runtime support for ovl and
 rdma
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-7-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
Date: Wed, 14 Jul 2021 10:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-7-yong.wu@mediatek.com>
Content-Language: en-US
Cc: Xia Jiang <xia.jiang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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



On 14.07.21 04:56, Yong Wu wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Prepare for smi cleaning up "mediatek,larb".
> 
> Display use the dispsys device to call pm_rumtime_get_sync before.
> This patch add pm_runtime_xx with ovl and rdma device whose nodes has
> "iommus" property, then display could help pm_runtime_get for smi via
> ovl or rdma device.
> 
> CC: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> (Yong: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync)
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  9 ++++++++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  9 ++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 12 +++++++++++-
>   3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index fa9d79963cd3..ea5760f856ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -11,6 +11,7 @@
>   #include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk_disp_drv.h"
> @@ -414,15 +415,21 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	pm_runtime_enable(dev);
> +
>   	ret = component_add(dev, &mtk_disp_ovl_component_ops);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>   		dev_err(dev, "Failed to add component: %d\n", ret);
> +	}
>   
>   	return ret;
>   }
>   
>   static int mtk_disp_ovl_remove(struct platform_device *pdev)
>   {
> +	pm_runtime_disable(&pdev->dev);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 705f28ceb4dd..0f31d1c8e37c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -9,6 +9,7 @@
>   #include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk_disp_drv.h"
> @@ -327,9 +328,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, priv);
>   
> +	pm_runtime_enable(dev);
> +
>   	ret = component_add(dev, &mtk_disp_rdma_component_ops);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>   		dev_err(dev, "Failed to add component: %d\n", ret);
> +	}
>   
>   	return ret;
>   }
> @@ -338,6 +343,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
>   
> +	pm_runtime_disable(&pdev->dev);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 474efb844249..08e3f352377d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -557,9 +557,15 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   		return;
>   	}
>   
> +	ret = pm_runtime_resume_and_get(comp->dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> +			      ret);

shouldn't the code return in case of failure here?

Thanks,
Dafna

> +
>   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
>   	if (ret) {
>   		mtk_smi_larb_put(comp->larb_dev);
> +		pm_runtime_put(comp->dev);
>   		return;
>   	}
>   
> @@ -572,7 +578,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   {
>   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>   	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> -	int i;
> +	int i, ret;
>   
>   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>   	if (!mtk_crtc->enabled)
> @@ -596,6 +602,10 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   	drm_crtc_vblank_off(crtc);
>   	mtk_crtc_ddp_hw_fini(mtk_crtc);
>   	mtk_smi_larb_put(comp->larb_dev);
> +	ret = pm_runtime_put(comp->dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> +			      ret);
>   
>   	mtk_crtc->enabled = false;
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
