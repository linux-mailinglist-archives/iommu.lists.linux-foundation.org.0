Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D77415D8B
	for <lists.iommu@lfdr.de>; Thu, 23 Sep 2021 14:02:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DF5584220;
	Thu, 23 Sep 2021 12:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktpPWRNCLV7P; Thu, 23 Sep 2021 12:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA1684373;
	Thu, 23 Sep 2021 12:02:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A6C4C0022;
	Thu, 23 Sep 2021 12:02:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31E4AC000D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F71140192
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f57kUp-du3XR for <iommu@lists.linux-foundation.org>;
 Thu, 23 Sep 2021 12:02:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AB6B400C5
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:02:01 +0000 (UTC)
X-UUID: 83d4b37d4b0e46f78f745f080b91e9b5-20210923
X-UUID: 83d4b37d4b0e46f78f745f080b91e9b5-20210923
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1506941841; Thu, 23 Sep 2021 20:01:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:01:57 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:01:56 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 18/33] iommu/mediatek: Adjust device link when it is
 sub-common
Date: Thu, 23 Sep 2021 19:58:25 +0800
Message-ID: <20210923115840.17813-19-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, yen-chang.chen@mediatek.com,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

For MM IOMMU, We always add device link between smi-common and IOMMU HW.
In mt8195, we add smi-sub-common. Thus, if the node is sub-common, we still
need find again to get smi-common, then do device link.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ebbb3412cb9..faea4a0d922f 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -786,9 +786,9 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
 				  struct component_match **match,
 				  struct mtk_iommu_data *data)
 {
+	struct device_node *larbnode, *smicomm_node, *smi_subcomm_node;
 	struct platform_device	*plarbdev;
 	struct device_link	*link;
-	struct device_node *larbnode, *smicomm_node;
 	int i, larb_nr, ret;
 
 	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
@@ -822,11 +822,21 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
 					    compare_of, larbnode);
 	}
 
-	/* Get smi-common dev from the last larb. */
-	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smicomm_node)
+	/* Get smi-(sub)-common dev from the last larb. */
+	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+	if (!smi_subcomm_node)
 		return -EINVAL;
 
+	/*
+	 * It may have two level smi-common. the node is smi-sub-common if it
+	 * has a new mediatek,smi property. otherwise it is smi-commmon.
+	 */
+	smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
+	if (smicomm_node)
+		of_node_put(smi_subcomm_node);
+	else
+		smicomm_node = smi_subcomm_node;
+
 	plarbdev = of_find_device_by_node(smicomm_node);
 	of_node_put(smicomm_node);
 	data->smicomm_dev = &plarbdev->dev;
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
