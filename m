Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 429373DB177
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 04:54:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE15960A53;
	Fri, 30 Jul 2021 02:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGghz4YpZ3O4; Fri, 30 Jul 2021 02:54:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E615160861;
	Fri, 30 Jul 2021 02:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B22A5C000E;
	Fri, 30 Jul 2021 02:54:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B300C000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CD60402D7
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doknCHMwRLcP for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 02:54:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AFA6402BD
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:54:38 +0000 (UTC)
X-UUID: bc12429d94b84cc7a9980c1a7e1fa7d4-20210730
X-UUID: bc12429d94b84cc7a9980c1a7e1fa7d4-20210730
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1634193771; Fri, 30 Jul 2021 10:54:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:54:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:54:29 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 06/12] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
Date: Fri, 30 Jul 2021 10:52:32 +0800
Message-ID: <20210730025238.22456-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Houlong Wei <houlong.wei@mediatek.com>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the mdp device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com> # on mt8173
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 3 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index de2d425efdd1..5e0ea83a9f7f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <soc/mediatek/smi.h>
 #include <linux/pm_runtime.h>
 
 #include "mtk_mdp_comp.h"
@@ -57,13 +56,6 @@ int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp)
 {
 	int status, err;
 
-	if (comp->larb_dev) {
-		err = mtk_smi_larb_get(comp->larb_dev);
-		if (err)
-			dev_err(comp->dev,
-				"failed to get larb, err %d.\n", err);
-	}
-
 	err = pm_runtime_get_sync(comp->dev);
 	if (err < 0) {
 		dev_err(comp->dev, "failed to runtime get, err %d.\n", err);
@@ -146,9 +138,6 @@ void mtk_mdp_comp_clock_off(struct mtk_mdp_comp *comp)
 			continue;
 		clk_disable_unprepare(comp->clk[i]);
 	}
-
-	if (comp->larb_dev)
-		mtk_smi_larb_put(comp->larb_dev);
 }
 
 /*
@@ -236,9 +225,6 @@ static const struct component_ops mtk_mdp_component_ops = {
 
 int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 {
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
-	int ret;
 	int i;
 	struct device_node *node = dev->of_node;
 	enum mtk_mdp_comp_type comp_type =
@@ -252,8 +238,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-			ret = PTR_ERR(comp->clk[i]);
-			goto err;
+			return PTR_ERR(comp->clk[i]);
 		}
 
 		/* Only RDMA needs two clocks */
@@ -261,36 +246,7 @@ int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
 			break;
 	}
 
-	/* Only DMA capable components need the LARB property */
-	comp->larb_dev = NULL;
-	if (comp_type != MTK_MDP_RDMA &&
-	    comp_type != MTK_MDP_WDMA &&
-	    comp_type != MTK_MDP_WROT)
-		return 0;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev,
-			"Missing mediadek,larb phandle in %pOF node\n", node);
-		ret = -EINVAL;
-		goto err;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		ret = -EPROBE_DEFER;
-		goto err;
-	}
-	of_node_put(larb_node);
-
-	comp->larb_dev = &larb_pdev->dev;
-
 	return 0;
-
-err:
-	return ret;
 }
 
 static int mtk_mdp_comp_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
index 5201c47f7baa..2bd229cc7eae 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
@@ -11,13 +11,11 @@
  * struct mtk_mdp_comp - the MDP's function component data
  * @node:	list node to track sibing MDP components
  * @clk:	clocks required for component
- * @larb_dev:	SMI device required for component
  * @dev:	component's device
  */
 struct mtk_mdp_comp {
 	struct list_head	node;
 	struct clk		*clk[2];
-	struct device           *larb_dev;
 	struct device		*dev;
 };
 
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index e1fb39231248..be7d35b3e3ff 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
-#include <soc/mediatek/smi.h>
 
 #include "mtk_mdp_comp.h"
 #include "mtk_mdp_core.h"
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
