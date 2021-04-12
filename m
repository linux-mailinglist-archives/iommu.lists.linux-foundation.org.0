Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E229835BA47
	for <lists.iommu@lfdr.de>; Mon, 12 Apr 2021 08:49:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16483403BF;
	Mon, 12 Apr 2021 06:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97NRL2XLqKSo; Mon, 12 Apr 2021 06:49:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ED7C403BE;
	Mon, 12 Apr 2021 06:49:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D84EFC0011;
	Mon, 12 Apr 2021 06:49:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87FD6C000A
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 06:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71AF64021A
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 06:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsieKeyrh_QN for <iommu@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 06:48:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3969F401EC
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 06:48:57 +0000 (UTC)
X-UUID: 6daf768510b94d86b18a23ad86cdddbb-20210412
X-UUID: 6daf768510b94d86b18a23ad86cdddbb-20210412
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 940755877; Mon, 12 Apr 2021 14:48:52 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:48:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:48:50 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: [PATCH 1/2] iommu/mediatek-v1: Avoid build fail when build as module
Date: Mon, 12 Apr 2021 14:48:42 +0800
Message-ID: <20210412064843.11614-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Valdis Kletnieks <valdis.kletnieks@vt.edu>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

When this driver build as module, It build fail like:

ERROR: modpost: "of_phandle_iterator_args"
[drivers/iommu/mtk_iommu_v1.ko] undefined!

This patch remove this interface to avoid this build fail.

Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Currently below patch is only in linux-next-20210409. This fixes tag may be
not needed. we can add this if it is need.
Fixes: 8de000cf0265 ("iommu/mediatek-v1: Allow building as module")
---
 drivers/iommu/mtk_iommu_v1.c | 62 ++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be1b20e3f20e..bed0bb9d63fd 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -424,23 +424,21 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args iommu_spec;
-	struct of_phandle_iterator it;
 	struct mtk_iommu_data *data;
-	int err;
+	int err, idx = 0;
 
-	of_for_each_phandle(&it, err, dev->of_node, "iommus",
-			"#iommu-cells", -1) {
-		int count = of_phandle_iterator_args(&it, iommu_spec.args,
-					MAX_PHANDLE_ARGS);
-		iommu_spec.np = of_node_get(it.node);
-		iommu_spec.args_count = count;
+	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
+					   "#iommu-cells",
+					   idx, &iommu_spec)) {
 
-		mtk_iommu_create_mapping(dev, &iommu_spec);
+		err = mtk_iommu_create_mapping(dev, &iommu_spec);
+		of_node_put(iommu_spec.np);
+		if (err)
+			return ERR_PTR(err);
 
 		/* dev->iommu_fwspec might have changed */
 		fwspec = dev_iommu_fwspec_get(dev);
-
-		of_node_put(iommu_spec.np);
+		idx++;
 	}
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
@@ -549,10 +547,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	struct resource			*res;
 	struct component_match		*match = NULL;
-	struct of_phandle_args		larb_spec;
-	struct of_phandle_iterator	it;
 	void				*protect;
-	int				larb_nr, ret, err;
+	int				larb_nr, ret, i;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -580,35 +576,33 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->bclk))
 		return PTR_ERR(data->bclk);
 
-	larb_nr = 0;
-	of_for_each_phandle(&it, err, dev->of_node,
-			"mediatek,larbs", NULL, 0) {
+	larb_nr = of_count_phandle_with_args(dev->of_node,
+					     "mediatek,larbs", NULL);
+	if (larb_nr < 0)
+		return larb_nr;
+
+	for (i = 0; i < larb_nr; i++) {
+		struct device_node *larbnode;
 		struct platform_device *plarbdev;
-		int count = of_phandle_iterator_args(&it, larb_spec.args,
-					MAX_PHANDLE_ARGS);
 
-		if (count)
-			continue;
+		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
+		if (!larbnode)
+			return -EINVAL;
 
-		larb_spec.np = of_node_get(it.node);
-		if (!of_device_is_available(larb_spec.np))
+		if (!of_device_is_available(larbnode)) {
+			of_node_put(larbnode);
 			continue;
+		}
 
-		plarbdev = of_find_device_by_node(larb_spec.np);
+		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
-			plarbdev = of_platform_device_create(
-						larb_spec.np, NULL,
-						platform_bus_type.dev_root);
-			if (!plarbdev) {
-				of_node_put(larb_spec.np);
-				return -EPROBE_DEFER;
-			}
+			of_node_put(larbnode);
+			return -EPROBE_DEFER;
 		}
+		data->larb_imu[i].dev = &plarbdev->dev;
 
-		data->larb_imu[larb_nr].dev = &plarbdev->dev;
 		component_match_add_release(dev, &match, release_of,
-					    compare_of, larb_spec.np);
-		larb_nr++;
+					    compare_of, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
