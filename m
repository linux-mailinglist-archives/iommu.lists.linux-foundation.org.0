Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6514B9ED9
	for <lists.iommu@lfdr.de>; Thu, 17 Feb 2022 12:37:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AE383F23;
	Thu, 17 Feb 2022 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxldnQqvIXFR; Thu, 17 Feb 2022 11:37:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B4CA183E35;
	Thu, 17 Feb 2022 11:37:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88B38C0039;
	Thu, 17 Feb 2022 11:37:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17C5BC000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4726F6C9
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LuPGE0gMOHCa for <iommu@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 11:37:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03FC961B81
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:18 +0000 (UTC)
X-UUID: 53119817481248e2a6ae2990b1e5748f-20220217
X-UUID: 53119817481248e2a6ae2990b1e5748f-20220217
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850263235; Thu, 17 Feb 2022 19:37:14 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Feb 2022 19:37:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 19:37:11 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 14/34] iommu/mediatek: Add SUB_COMMON_3BITS flag
Date: Thu, 17 Feb 2022 19:34:33 +0800
Message-ID: <20220217113453.13658-15-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220217113453.13658-1-yong.wu@mediatek.com>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 chengci.xu@mediatek.com, xueqi.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, libo.kang@mediatek.com,
 yen-chang.chen@mediatek.com, iommu@lists.linux-foundation.org,
 yf.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

In prevous SoC, the sub common id occupy 2 bits. the mt8195's sub common
id has 3bits. Add a new flag for this. and rename the previous flag to
_2BITS. For readable, I put these two flags together, then move the
other flags. no functional change.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 26 ++++++++++++++++----------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9703eb16013c..9f57354d2562 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -105,6 +105,8 @@
 #define REG_MMU1_INT_ID				0x154
 #define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) & 0x7)
 #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
+#define F_MMU_INT_ID_COMM_ID_EXT(a)		(((a) >> 10) & 0x7)
+#define F_MMU_INT_ID_SUB_COMM_ID_EXT(a)		(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
@@ -116,13 +118,14 @@
 #define HAS_VLD_PA_RNG			BIT(2)
 #define RESET_AXI			BIT(3)
 #define OUT_ORDER_WR_EN			BIT(4)
-#define HAS_SUB_COMM			BIT(5)
-#define WR_THROT_EN			BIT(6)
-#define HAS_LEGACY_IVRP_PADDR		BIT(7)
-#define IOVA_34_EN			BIT(8)
-#define SHARE_PGTABLE			BIT(9) /* 2 HW share pgtable */
-#define DCM_DISABLE			BIT(10)
-#define NOT_STD_AXI_MODE		BIT(11)
+#define HAS_SUB_COMM_2BITS		BIT(5)
+#define HAS_SUB_COMM_3BITS		BIT(6)
+#define WR_THROT_EN			BIT(7)
+#define HAS_LEGACY_IVRP_PADDR		BIT(8)
+#define IOVA_34_EN			BIT(9)
+#define SHARE_PGTABLE			BIT(10) /* 2 HW share pgtable */
+#define DCM_DISABLE			BIT(11)
+#define NOT_STD_AXI_MODE		BIT(12)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -290,9 +293,12 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_pa |= (u64)pa34_32 << 32;
 
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
 		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
 		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+	} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
+		fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
+		sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
 	} else {
 		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	}
@@ -1067,7 +1073,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
-	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN |
+	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
 			 NOT_STD_AXI_MODE,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.iova_region   = single_domain,
@@ -1105,7 +1111,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
-	.flags          = HAS_BCLK | HAS_SUB_COMM | OUT_ORDER_WR_EN |
+	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
 			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
 	.iova_region    = mt8192_multi_dom,
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index c10f5630e55d..82c51a034e6b 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -20,7 +20,7 @@
 #include <dt-bindings/memory/mtk-memory-port.h>
 
 #define MTK_LARB_COM_MAX	8
-#define MTK_LARB_SUBCOM_MAX	4
+#define MTK_LARB_SUBCOM_MAX	8
 
 #define MTK_IOMMU_GROUP_MAX	8
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
