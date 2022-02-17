Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FDD4B9EF7
	for <lists.iommu@lfdr.de>; Thu, 17 Feb 2022 12:37:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE98417F9;
	Thu, 17 Feb 2022 11:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ZtrA02EdgtT; Thu, 17 Feb 2022 11:37:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4021341801;
	Thu, 17 Feb 2022 11:37:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17D86C0039;
	Thu, 17 Feb 2022 11:37:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 868F6C000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72E9461B81
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ojdy29HkhfZ for <iommu@lists.linux-foundation.org>;
 Thu, 17 Feb 2022 11:37:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E7EB6F6C9
 for <iommu@lists.linux-foundation.org>; Thu, 17 Feb 2022 11:37:36 +0000 (UTC)
X-UUID: 5f4d9233828944c891749e00314d3b48-20220217
X-UUID: 5f4d9233828944c891749e00314d3b48-20220217
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1022615158; Thu, 17 Feb 2022 19:37:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Feb 2022 19:37:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 19:37:31 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 16/34] iommu/mediatek: Contain MM IOMMU flow with the MM
 TYPE
Date: Thu, 17 Feb 2022 19:34:35 +0800
Message-ID: <20220217113453.13658-17-yong.wu@mediatek.com>
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

Prepare for supporting INFRA_IOMMU, and APU_IOMMU later.

For Infra IOMMU/APU IOMMU, it doesn't have the "larb""port". thus, Use
the MM flag contain the MM_IOMMU special flow, Also, it moves a big
chunk code about parsing the mediatek,larbs into a function, this is
only needed for MM IOMMU. and all the current SoC are MM_IOMMU.

The device link between iommu consumer device and smi-larb device only
is needed in MM iommu case.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 212 ++++++++++++++++++++++----------------
 1 file changed, 121 insertions(+), 91 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 13c2296eb84c..1253c165daf5 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -138,6 +138,8 @@
 #define MTK_IOMMU_IS_TYPE(pdata, _x)	MTK_IOMMU_HAS_FLAG_MASK(pdata, _x,\
 							MTK_IOMMU_TYPE_MASK)
 
+#define MTK_INVALID_LARBID		MTK_LARB_NR_MAX
+
 struct mtk_iommu_domain {
 	struct io_pgtable_cfg		cfg;
 	struct io_pgtable_ops		*iop;
@@ -274,7 +276,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
-	unsigned int fault_larb, fault_port, sub_comm = 0;
+	unsigned int fault_larb = MTK_INVALID_LARBID, fault_port = 0, sub_comm = 0;
 	u32 int_state, regval, va34_32, pa34_32;
 	u64 fault_iova, fault_pa;
 	bool layer, write;
@@ -300,17 +302,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
 	fault_pa |= (u64)pa34_32 << 32;
 
-	fault_port = F_MMU_INT_ID_PORT_ID(regval);
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
-		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
-		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
-	} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
-		fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
-		sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
-	} else {
-		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		fault_port = F_MMU_INT_ID_PORT_ID(regval);
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_2BITS)) {
+			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
+			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+		} else if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM_3BITS)) {
+			fault_larb = F_MMU_INT_ID_COMM_ID_EXT(regval);
+			sub_comm = F_MMU_INT_ID_SUB_COMM_ID_EXT(regval);
+		} else {
+			fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+		}
+		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 	}
-	fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
@@ -374,19 +378,21 @@ static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
 		portid = MTK_M4U_TO_PORT(fwspec->ids[i]);
 
-		larb_mmu = &data->larb_imu[larbid];
+		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+			larb_mmu = &data->larb_imu[larbid];
 
-		region = data->plat_data->iova_region + domid;
-		larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
+			region = data->plat_data->iova_region + domid;
+			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-		dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
-			enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-			portid, domid, larb_mmu->bank[portid]);
+			dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
+				portid, domid, larb_mmu->bank[portid]);
 
-		if (enable)
-			larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
-		else
-			larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+			if (enable)
+				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
+			else
+				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+		}
 	}
 }
 
@@ -593,6 +599,9 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 
 	data = dev_iommu_priv_get(dev);
 
+	if (!MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
+		return &data->iommu;
+
 	/*
 	 * Link the consumer device with the smi-larb device(supplier).
 	 * The device that connects with each a larb is a independent HW.
@@ -626,9 +635,11 @@ static void mtk_iommu_release_device(struct device *dev)
 		return;
 
 	data = dev_iommu_priv_get(dev);
-	larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
-	larbdev = data->larb_imu[larbid].dev;
-	device_link_remove(dev, larbdev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
+		larbdev = data->larb_imu[larbid].dev;
+		device_link_remove(dev, larbdev);
+	}
 
 	iommu_fwspec_free(dev);
 }
@@ -818,19 +829,77 @@ static const struct component_master_ops mtk_iommu_com_ops = {
 	.unbind		= mtk_iommu_unbind,
 };
 
+static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **match,
+				  struct mtk_iommu_data *data)
+{
+	struct device_node *larbnode, *smicomm_node;
+	struct platform_device *plarbdev;
+	struct device_link *link;
+	int i, larb_nr, ret;
+
+	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
+	if (larb_nr < 0)
+		return larb_nr;
+
+	for (i = 0; i < larb_nr; i++) {
+		u32 id;
+
+		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
+		if (!larbnode)
+			return -EINVAL;
+
+		if (!of_device_is_available(larbnode)) {
+			of_node_put(larbnode);
+			continue;
+		}
+
+		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
+		if (ret)/* The id is consecutive if there is no this property */
+			id = i;
+
+		plarbdev = of_find_device_by_node(larbnode);
+		if (!plarbdev) {
+			of_node_put(larbnode);
+			return -ENODEV;
+		}
+		if (!plarbdev->dev.driver) {
+			of_node_put(larbnode);
+			return -EPROBE_DEFER;
+		}
+		data->larb_imu[id].dev = &plarbdev->dev;
+
+		component_match_add_release(dev, match, release_of,
+					    compare_of, larbnode);
+	}
+
+	/* Get smi-common dev from the last larb. */
+	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+	if (!smicomm_node)
+		return -EINVAL;
+
+	plarbdev = of_find_device_by_node(smicomm_node);
+	of_node_put(smicomm_node);
+	data->smicomm_dev = &plarbdev->dev;
+
+	link = device_link_add(data->smicomm_dev, dev,
+			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+	if (!link) {
+		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+		return PTR_ERR(link);
+	}
+	return 0;
+}
+
 static int mtk_iommu_probe(struct platform_device *pdev)
 {
 	struct mtk_iommu_data   *data;
 	struct device           *dev = &pdev->dev;
-	struct device_node	*larbnode, *smicomm_node;
-	struct platform_device	*plarbdev;
-	struct device_link	*link;
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
 	struct regmap		*infracfg;
 	void                    *protect;
-	int                     i, larb_nr, ret;
+	int                     ret;
 	u32			val;
 	char                    *p;
 
@@ -885,59 +954,12 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			return PTR_ERR(data->bclk);
 	}
 
-	larb_nr = of_count_phandle_with_args(dev->of_node,
-					     "mediatek,larbs", NULL);
-	if (larb_nr < 0)
-		return larb_nr;
-
-	for (i = 0; i < larb_nr; i++) {
-		u32 id;
-
-		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
-		if (!larbnode)
-			return -EINVAL;
-
-		if (!of_device_is_available(larbnode)) {
-			of_node_put(larbnode);
-			continue;
-		}
-
-		ret = of_property_read_u32(larbnode, "mediatek,larb-id", &id);
-		if (ret)/* The id is consecutive if there is no this property */
-			id = i;
-
-		plarbdev = of_find_device_by_node(larbnode);
-		if (!plarbdev) {
-			of_node_put(larbnode);
-			return -ENODEV;
-		}
-		if (!plarbdev->dev.driver) {
-			of_node_put(larbnode);
-			return -EPROBE_DEFER;
-		}
-		data->larb_imu[id].dev = &plarbdev->dev;
-
-		component_match_add_release(dev, &match, release_of,
-					    compare_of, larbnode);
-	}
-
-	/* Get smi-common dev from the last larb. */
-	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smicomm_node)
-		return -EINVAL;
-
-	plarbdev = of_find_device_by_node(smicomm_node);
-	of_node_put(smicomm_node);
-	data->smicomm_dev = &plarbdev->dev;
-
 	pm_runtime_enable(dev);
 
-	link = device_link_add(data->smicomm_dev, dev,
-			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
-	if (!link) {
-		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
-		ret = -EINVAL;
-		goto out_runtime_disable;
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		ret = mtk_iommu_mm_dts_parse(dev, &match, data);
+		if (ret)
+			goto out_runtime_disable;
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -969,9 +991,11 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_list_del;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
-	if (ret)
-		goto out_bus_set_null;
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+		if (ret)
+			goto out_bus_set_null;
+	}
 	return ret;
 
 out_bus_set_null:
@@ -982,7 +1006,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 out_sysfs_remove:
 	iommu_device_sysfs_remove(&data->iommu);
 out_link_remove:
-	device_link_remove(data->smicomm_dev, dev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
+		device_link_remove(data->smicomm_dev, dev);
 out_runtime_disable:
 	pm_runtime_disable(dev);
 	return ret;
@@ -997,10 +1022,12 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 
 	list_del(&data->list);
 
-	device_link_remove(data->smicomm_dev, &pdev->dev);
+	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		device_link_remove(data->smicomm_dev, &pdev->dev);
+		component_master_del(&pdev->dev, &mtk_iommu_com_ops);
+	}
 	pm_runtime_disable(&pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
-	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
 }
 
@@ -1071,7 +1098,7 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
 static const struct mtk_iommu_plat_data mt2712_data = {
 	.m4u_plat     = M4U_MT2712,
 	.flags        = HAS_4GB_MODE | HAS_BCLK | HAS_VLD_PA_RNG | SHARE_PGTABLE |
-			NOT_STD_AXI_MODE,
+			NOT_STD_AXI_MODE | MTK_IOMMU_TYPE_MM,
 	.hw_list      = &m4ulist,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
@@ -1082,7 +1109,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat      = M4U_MT6779,
 	.flags         = HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN | WR_THROT_EN |
-			 NOT_STD_AXI_MODE,
+			 NOT_STD_AXI_MODE | MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg   = REG_MMU_INV_SEL_GEN2,
 	.iova_region   = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1091,7 +1118,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 
 static const struct mtk_iommu_plat_data mt8167_data = {
 	.m4u_plat     = M4U_MT8167,
-	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE,
+	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE |
+			MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1101,7 +1129,8 @@ static const struct mtk_iommu_plat_data mt8167_data = {
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
-			HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE,
+			HAS_LEGACY_IVRP_PADDR | NOT_STD_AXI_MODE |
+			MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1110,7 +1139,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
-	.flags        = RESET_AXI,
+	.flags        = RESET_AXI | MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.iova_region  = single_domain,
 	.iova_region_nr = ARRAY_SIZE(single_domain),
@@ -1120,7 +1149,8 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 static const struct mtk_iommu_plat_data mt8192_data = {
 	.m4u_plat       = M4U_MT8192,
 	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
-			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE,
+			  WR_THROT_EN | IOVA_34_EN | NOT_STD_AXI_MODE |
+			  MTK_IOMMU_TYPE_MM,
 	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
 	.iova_region    = mt8192_multi_dom,
 	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
