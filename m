Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DADBB1F4FDF
	for <lists.iommu@lfdr.de>; Wed, 10 Jun 2020 10:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4324F86F8D;
	Wed, 10 Jun 2020 08:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blQvn-aE95ge; Wed, 10 Jun 2020 08:03:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BEA6886F89;
	Wed, 10 Jun 2020 08:03:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E4CDC08A0;
	Wed, 10 Jun 2020 08:03:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05098C016F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 06:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E881C8142F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 06:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFY24zjTfAVd for <iommu@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 06:20:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5CCD381234
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 06:20:26 +0000 (UTC)
X-UUID: a55210abbffe40579b4dbf2a384f3bf8-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hdgI+fXHtKacXru8/dXUuE3zpRMIWvgQyNSpZ1nA1Ys=; 
 b=oX5oBBIM4ItBDoymUnE0/6Ay/jMClwsCW0zcdpVwWlHcroH8SnaiXS4UDX9U1pbj0zHmh3I5UPHZQFmC/pSh0ZE9uOn0IViBRKLJysjidN2K2usrJIEdg6qDHYAtblwOWUhX0w2W3c/vYaROCN/FKVdANnZ6ozdXGuB0qUD95wk=;
X-UUID: a55210abbffe40579b4dbf2a384f3bf8-20200610
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 670896255; Wed, 10 Jun 2020 14:20:22 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 14:20:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 14:20:19 +0800
Message-ID: <1591770020.5047.5.camel@mtksdaap41>
Subject: Re: [PATCH v4 09/17] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Wed, 10 Jun 2020 14:20:20 +0800
In-Reply-To: <1591768038.527.6.camel@mtksdaap41>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-10-git-send-email-yong.wu@mediatek.com>
 <1591768038.527.6.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 10 Jun 2020 08:03:31 +0000
Cc: Maoguang Meng <Maoguang.Meng@mediatek.com>,
 Will Deacon <will.deacon@arm.com>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 eizan@chromium.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cui.zhang@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
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

On Wed, 2020-06-10 at 13:47 +0800, CK Hu wrote:
> + Tiffany & Maoguang.
> 
> On Sat, 2020-05-30 at 16:10 +0800, Yong Wu wrote:
> > MediaTek IOMMU has already added the device_link between the consumer
> > and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> > the smi-larb's pm_runtime_get_sync also be called automatically.
> > 

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> > CC: Tiffany Lin <tiffany.lin@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > ---
> >  .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 19 ---------------
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  3 ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  1 -
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 27 ----------------------
> >  4 files changed, 50 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 36dfe3f..1d7d14d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -8,14 +8,12 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/pm_runtime.h>
> > -#include <soc/mediatek/smi.h>
> >  
> >  #include "mtk_vcodec_dec_pm.h"
> >  #include "mtk_vcodec_util.h"
> >  
> >  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> >  {
> > -	struct device_node *node;
> >  	struct platform_device *pdev;
> >  	struct mtk_vcodec_pm *pm;
> >  	struct mtk_vcodec_clk *dec_clk;
> > @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> >  	pm = &mtkdev->pm;
> >  	pm->mtkdev = mtkdev;
> >  	dec_clk = &pm->vdec_clk;
> > -	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> > -	if (!node) {
> > -		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
> > -		return -1;
> > -	}
> >  
> > -	pdev = of_find_device_by_node(node);
> > -	of_node_put(node);
> > -	if (WARN_ON(!pdev)) {
> > -		return -1;
> > -	}
> > -	pm->larbvdec = &pdev->dev;
> >  	pdev = mtkdev->plat_dev;
> >  	pm->dev = &pdev->dev;
> >  
> > @@ -113,11 +100,6 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
> >  		}
> >  	}
> >  
> > -	ret = mtk_smi_larb_get(pm->larbvdec);
> > -	if (ret) {
> > -		mtk_v4l2_err("mtk_smi_larb_get larbvdec fail %d", ret);
> > -		goto error;
> > -	}
> >  	return;
> >  
> >  error:
> > @@ -130,7 +112,6 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
> >  	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
> >  	int i = 0;
> >  
> > -	mtk_smi_larb_put(pm->larbvdec);
> >  	for (i = dec_clk->clk_num - 1; i >= 0; i--)
> >  		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
> >  }
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 52d1ce1..7d3966a 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -190,10 +190,7 @@ struct mtk_vcodec_clk {
> >   */
> >  struct mtk_vcodec_pm {
> >  	struct mtk_vcodec_clk	vdec_clk;
> > -	struct device	*larbvdec;
> > -
> >  	struct mtk_vcodec_clk	venc_clk;
> > -	struct device	*larbvenc;
> >  	struct device	*dev;
> >  	struct mtk_vcodec_dev	*mtkdev;
> >  };
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 5301dca..18025f7 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -8,7 +8,6 @@
> >  #include <media/v4l2-event.h>
> >  #include <media/v4l2-mem2mem.h>
> >  #include <media/videobuf2-dma-contig.h>
> > -#include <soc/mediatek/smi.h>
> >  #include <linux/pm_runtime.h>
> >  
> >  #include "mtk_vcodec_drv.h"
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > index 01c6a55..047919e 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > @@ -8,44 +8,25 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/pm_runtime.h>
> > -#include <soc/mediatek/smi.h>
> >  
> >  #include "mtk_vcodec_enc_pm.h"
> >  #include "mtk_vcodec_util.h"
> >  
> >  int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
> >  {
> > -	struct device_node *node;
> >  	struct platform_device *pdev;
> >  	struct mtk_vcodec_pm *pm;
> >  	struct mtk_vcodec_clk *enc_clk;
> >  	struct mtk_vcodec_clk_info *clk_info;
> >  	int ret = 0, i = 0;
> > -	struct device *dev;
> >  
> >  	pdev = mtkdev->plat_dev;
> >  	pm = &mtkdev->pm;
> >  	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> >  	pm->mtkdev = mtkdev;
> >  	pm->dev = &pdev->dev;
> > -	dev = &pdev->dev;
> >  	enc_clk = &pm->venc_clk;
> >  
> > -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
> > -	if (!node) {
> > -		mtk_v4l2_err("no mediatek,larb found");
> > -		return -ENODEV;
> > -	}
> > -	pdev = of_find_device_by_node(node);
> > -	of_node_put(node);
> > -	if (!pdev) {
> > -		mtk_v4l2_err("no mediatek,larb device found");
> > -		return -ENODEV;
> > -	}
> > -	pm->larbvenc = &pdev->dev;
> > -	pdev = mtkdev->plat_dev;
> > -	pm->dev = &pdev->dev;
> > -
> >  	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
> >  		"clock-names");
> >  	if (enc_clk->clk_num > 0) {
> > @@ -93,13 +74,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
> >  		}
> >  	}
> >  
> > -	ret = mtk_smi_larb_get(pm->larbvenc);
> > -	if (ret) {
> > -		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> > -		goto clkerr;
> > -	}
> > -	return;
> > -
> >  clkerr:
> >  	for (i -= 1; i >= 0; i--)
> >  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> > @@ -110,7 +84,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
> >  	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
> >  	int i = 0;
> >  
> > -	mtk_smi_larb_put(pm->larbvenc);
> >  	for (i = enc_clk->clk_num - 1; i >= 0; i--)
> >  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> >  }
> 
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
