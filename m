Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D902528420
	for <lists.iommu@lfdr.de>; Mon, 16 May 2022 14:26:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6CC6106B;
	Mon, 16 May 2022 12:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uQNRShDCqX0; Mon, 16 May 2022 12:26:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F35661093;
	Mon, 16 May 2022 12:26:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37985C002D;
	Mon, 16 May 2022 12:26:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6B7AC002D
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C3B82BF4
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZkgrqYouqKw for <iommu@lists.linux-foundation.org>;
 Mon, 16 May 2022 12:26:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A5B382C8E
 for <iommu@lists.linux-foundation.org>; Mon, 16 May 2022 12:26:10 +0000 (UTC)
X-UUID: edbd5f950e044056a58f5462c8f61155-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:26ff3d68-52a5-405b-95d9-c12c8d23b6b3, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:105
X-CID-INFO: VERSION:1.1.5, REQID:26ff3d68-52a5-405b-95d9-c12c8d23b6b3, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:105
X-CID-META: VersionHash:2a19b09, CLOUDID:0f453194-563e-4fc2-8a0d-fda4821947ab,
 C
 OID:40fffd665588,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:0,BEC:nil
X-UUID: edbd5f950e044056a58f5462c8f61155-20220516
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yf.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 206944733; Mon, 16 May 2022 20:26:05 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 20:26:03 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 16 May 2022 20:26:02 +0800
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:MEDIATEK IOMMU DRIVER" <iommu@lists.linux-foundation.org>, "moderated
 list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/2] iomm/mediatek: Allow page table PA up to 35bit
Date: Mon, 16 May 2022 20:18:50 +0800
Message-ID: <20220516121852.8775-3-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220516121852.8775-1-yf.wang@mediatek.com>
References: <20220516121852.8775-1-yf.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Ning Li <ning.li@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>,
 wsd_upstream@mediatek.com, Yunfei Wang <yf.wang@mediatek.com>
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
From: "yf.wang--- via iommu" <iommu@lists.linux-foundation.org>
Reply-To: yf.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Yunfei Wang <yf.wang@mediatek.com>

Add the quirk IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT support, so that allows
page table PA up to 35bit, not only in ZONE_DMA32.

Signed-off-by: Ning Li <ning.li@mediatek.com>
Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fd75a60abd6..1b9a876ef271 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -33,6 +33,7 @@
 
 #define REG_MMU_PT_BASE_ADDR			0x000
 #define MMU_PT_ADDR_MASK			GENMASK(31, 7)
+#define MMU_PT_ADDR_2_0_MASK			GENMASK(2, 0)
 
 #define REG_MMU_INVALIDATE			0x020
 #define F_ALL_INVLD				0x2
@@ -118,6 +119,7 @@
 #define WR_THROT_EN			BIT(6)
 #define HAS_LEGACY_IVRP_PADDR		BIT(7)
 #define IOVA_34_EN			BIT(8)
+#define PGTABLE_PA_35_EN		BIT(9)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -401,6 +403,9 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 		.iommu_dev = data->dev,
 	};
 
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
+		dom->cfg.quirks |= IO_PGTABLE_QUIRK_ARM_MTK_TTBR_EXT;
+
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_4GB_MODE))
 		dom->cfg.oas = data->enable_4GB ? 33 : 32;
 	else
@@ -450,6 +455,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	struct device *m4udev = data->dev;
 	int ret, domid;
+	u32 regval;
 
 	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
 	if (domid < 0)
@@ -472,8 +478,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 			return ret;
 		}
 		data->m4u_dom = dom;
-		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       data->base + REG_MMU_PT_BASE_ADDR);
+
+		/* Bits[6:3] are invalid for mediatek platform */
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
+			regval = (dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK) |
+				 (dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_2_0_MASK);
+		else
+			regval = dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK;
+		writel(regval, data->base + REG_MMU_PT_BASE_ADDR);
 
 		pm_runtime_put(m4udev);
 	}
@@ -987,6 +999,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	struct mtk_iommu_domain *m4u_dom = data->m4u_dom;
 	void __iomem *base = data->base;
+	u32 regval;
 	int ret;
 
 	ret = clk_prepare_enable(data->bclk);
@@ -1010,7 +1023,14 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
 	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
-	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
+
+	/* Bits[6:3] are invalid for mediatek platform */
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN))
+		regval = (m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK) |
+			 (m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_2_0_MASK);
+	else
+		regval = m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK;
+	writel(regval, base + REG_MMU_PT_BASE_ADDR);
 
 	/*
 	 * Users may allocate dma buffer before they call pm_runtime_get,
@@ -1038,7 +1058,8 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
-	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN,
+	.flags         = HAS_SUB_COMM | OUT_ORDER_WR_EN | WR_THROT_EN |
+			 PGTABLE_PA_35_EN,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.iova_region   = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
