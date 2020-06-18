Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3C1FEEC4
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 11:34:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D635E8838C;
	Thu, 18 Jun 2020 09:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DFhkgQMXGxnl; Thu, 18 Jun 2020 09:34:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F82B883A9;
	Thu, 18 Jun 2020 09:34:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 796ABC016E;
	Thu, 18 Jun 2020 09:34:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2301C016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 09:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE25E88380
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 09:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2-d6QGJ4tU8 for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 09:34:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7708F87BFE
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 09:34:49 +0000 (UTC)
X-UUID: 855350d237af447598937a20df6f1057-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fazQeAs8inAvGwYcQXqBGXqOlhYwCeTQdth0t/3tLpc=; 
 b=MHeeNIj++emO1PxnCKYQiheDFmpZ4QBACfg0h4/OsDUonE38uDizhI+ibfWfeYHrZWzdKmqjA4pspetmXciZRh0aMpC3nZVDYa6Z/T8lj5eJdfJoht83VIS8lU3VV4mz8emEXDFGXanQq7R5q4LS8CnMUfrDFmNHFsNV7hCie9k=;
X-UUID: 855350d237af447598937a20df6f1057-20200618
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 1739908511; Thu, 18 Jun 2020 17:34:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 18 Jun 2020 17:34:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 17:34:33 +0800
Message-ID: <1592472725.20080.12.camel@mhfsdcap03>
Subject: Re: [PATCH v4 06/17] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rick Chang
 <rick.chang@mediatek.com>
Date: Thu, 18 Jun 2020 17:32:05 +0800
In-Reply-To: <1590826218-23653-7-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-7-git-send-email-yong.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EAA0222707355DB3D9C41720DD63D68CCECEA4A8CC20861737BF3012552CC6C52000:8
X-MTK: N
Cc: xia.jiang@mediatek.com, Will Deacon <will.deacon@arm.com>,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Rick Chang <rick.chang@mediatek.com>, Evan
 Green <evgreen@chromium.org>, eizan@chromium.org, Matthias
 Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, cui.zhang@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

+ Rick

On Sat, 2020-05-30 at 16:10 +0800, Yong Wu wrote:
> MediaTek IOMMU has already added device_link between the consumer
> and smi-larb device. If the jpg device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Rick Chang <rick.chang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 22 ----------------------
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  2 --
>  2 files changed, 24 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f82a81a..21fba6f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -21,7 +21,6 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/videobuf2-core.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_jpeg_hw.h"
>  #include "mtk_jpeg_core.h"
> @@ -893,11 +892,6 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
>  
>  static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  {
> -	int ret;
> -
> -	ret = mtk_smi_larb_get(jpeg->larb);
> -	if (ret)
> -		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
>  	clk_prepare_enable(jpeg->clk_jdec_smi);
>  	clk_prepare_enable(jpeg->clk_jdec);
>  }
> @@ -906,7 +900,6 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>  {
>  	clk_disable_unprepare(jpeg->clk_jdec);
>  	clk_disable_unprepare(jpeg->clk_jdec_smi);
> -	mtk_smi_larb_put(jpeg->larb);
>  }
>  
>  static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> @@ -1051,21 +1044,6 @@ static int mtk_jpeg_release(struct file *file)
>  
>  static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
>  {
> -	struct device_node *node;
> -	struct platform_device *pdev;
> -
> -	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
> -	if (!node)
> -		return -EINVAL;
> -	pdev = of_find_device_by_node(node);
> -	if (WARN_ON(!pdev)) {
> -		of_node_put(node);
> -		return -EINVAL;
> -	}
> -	of_node_put(node);
> -
> -	jpeg->larb = &pdev->dev;
> -
>  	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
>  	if (IS_ERR(jpeg->clk_jdec))
>  		return PTR_ERR(jpeg->clk_jdec);
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 999bd14..8579494 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -47,7 +47,6 @@ enum mtk_jpeg_ctx_state {
>   * @dec_reg_base:	JPEG registers mapping
>   * @clk_jdec:		JPEG hw working clock
>   * @clk_jdec_smi:	JPEG SMI bus clock
> - * @larb:		SMI device
>   */
>  struct mtk_jpeg_dev {
>  	struct mutex		lock;
> @@ -61,7 +60,6 @@ struct mtk_jpeg_dev {
>  	void __iomem		*dec_reg_base;
>  	struct clk		*clk_jdec;
>  	struct clk		*clk_jdec_smi;
> -	struct device		*larb;
>  };
>  
>  /**

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
