Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 78250517E79
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 09:18:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC85416BE;
	Tue,  3 May 2022 07:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKeUFb62jCYr; Tue,  3 May 2022 07:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EEAA4416BC;
	Tue,  3 May 2022 07:18:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3794EC0084;
	Tue,  3 May 2022 07:18:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE5EC002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E4A78186E
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFUqRhGzk323 for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 07:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4111D818B5
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:18:51 +0000 (UTC)
X-UUID: 91f221dbefcc4f32a792cd8a54442312-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4f213e43-1e43-47f5-b00e-2086f67262fc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:2fd34ac7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 91f221dbefcc4f32a792cd8a54442312-20220503
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1215228417; Tue, 03 May 2022 15:18:49 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:18:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:18:46 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v7 31/36] iommu/mediatek: Change the domid to iova_region_id
Date: Tue, 3 May 2022 15:14:22 +0800
Message-ID: <20220503071427.2285-32-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, libo.kang@mediatek.com,
 xueqi.zhang@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, yen-chang.chen@mediatek.com,
 chengci.xu@mediatek.com, iommu@lists.linux-foundation.org,
 yf.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com,
 linux-arm-kernel@lists.infradead.org,
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Prepare for adding bankid, also no functional change.

In the previous SoC, each a iova_region is a domain; In the multi-banks
case, each a bank is a domain, then the original function name
"mtk_iommu_get_domain_id" is not proper. Use "iova_region_id" instead of
"domain_id".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5f298cf6aac3..023bb7d3ffb2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -467,8 +467,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int mtk_iommu_get_domain_id(struct device *dev,
-				   const struct mtk_iommu_plat_data *plat_data)
+static int mtk_iommu_get_iova_region_id(struct device *dev,
+					const struct mtk_iommu_plat_data *plat_data)
 {
 	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
 	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
@@ -498,7 +498,7 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 }
 
 static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
-			    bool enable, unsigned int domid)
+			    bool enable, unsigned int regionid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
@@ -514,12 +514,12 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 		if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
 			larb_mmu = &data->larb_imu[larbid];
 
-			region = data->plat_data->iova_region + domid;
+			region = data->plat_data->iova_region + regionid;
 			larb_mmu->bank[portid] = upper_32_bits(region->iova_base);
 
-			dev_dbg(dev, "%s iommu for larb(%s) port %d dom %d bank %d.\n",
+			dev_dbg(dev, "%s iommu for larb(%s) port %d region %d rgn-bank %d.\n",
 				enable ? "enable" : "disable", dev_name(larb_mmu->dev),
-				portid, domid, larb_mmu->bank[portid]);
+				portid, regionid, larb_mmu->bank[portid]);
 
 			if (enable)
 				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
@@ -545,7 +545,7 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 
 static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 				     struct mtk_iommu_data *data,
-				     unsigned int domid)
+				     unsigned int region_id)
 {
 	const struct mtk_iommu_iova_region *region;
 	struct mtk_iommu_domain	*m4u_dom;
@@ -584,7 +584,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 
 update_iova_region:
 	/* Update the iova region for this domain */
-	region = data->plat_data->iova_region + domid;
+	region = data->plat_data->iova_region + region_id;
 	dom->domain.geometry.aperture_start = region->iova_base;
 	dom->domain.geometry.aperture_end = region->iova_base + region->size - 1;
 	dom->domain.geometry.force_aperture = true;
@@ -620,18 +620,18 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct device *m4udev = data->dev;
 	struct mtk_iommu_bank_data *bank;
 	unsigned int bankid = 0;
-	int ret, domid;
+	int ret, region_id;
 
-	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
-	if (domid < 0)
-		return domid;
+	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (region_id < 0)
+		return region_id;
 
 	mutex_lock(&dom->mutex);
 	if (!dom->bank) {
 		/* Data is in the frstdata in sharing pgtable case. */
 		frstdata = mtk_iommu_get_frst_data(hw_list);
 
-		ret = mtk_iommu_domain_finalise(dom, frstdata, domid);
+		ret = mtk_iommu_domain_finalise(dom, frstdata, region_id);
 		if (ret) {
 			mutex_unlock(&dom->mutex);
 			return -ENODEV;
@@ -662,7 +662,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	}
 	mutex_unlock(&data->mutex);
 
-	return mtk_iommu_config(data, dev, true, domid);
+	return mtk_iommu_config(data, dev, true, region_id);
 
 err_unlock:
 	mutex_unlock(&data->mutex);
@@ -802,22 +802,22 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
 	struct list_head *hw_list = c_data->hw_list;
 	struct iommu_group *group;
-	int domid;
+	int regionid;
 
 	data = mtk_iommu_get_frst_data(hw_list);
 	if (!data)
 		return ERR_PTR(-ENODEV);
 
-	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
-	if (domid < 0)
-		return ERR_PTR(domid);
+	regionid = mtk_iommu_get_iova_region_id(dev, data->plat_data);
+	if (regionid < 0)
+		return ERR_PTR(regionid);
 
 	mutex_lock(&data->mutex);
-	group = data->m4u_group[domid];
+	group = data->m4u_group[regionid];
 	if (!group) {
 		group = iommu_group_alloc();
 		if (!IS_ERR(group))
-			data->m4u_group[domid] = group;
+			data->m4u_group[regionid] = group;
 	} else {
 		iommu_group_ref_get(group);
 	}
@@ -851,14 +851,14 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 				       struct list_head *head)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
-	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
+	unsigned int regionid = mtk_iommu_get_iova_region_id(dev, data->plat_data), i;
 	const struct mtk_iommu_iova_region *resv, *curdom;
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
 
-	if ((int)domid < 0)
+	if ((int)regionid < 0)
 		return;
-	curdom = data->plat_data->iova_region + domid;
+	curdom = data->plat_data->iova_region + regionid;
 	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
 		resv = data->plat_data->iova_region + i;
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
