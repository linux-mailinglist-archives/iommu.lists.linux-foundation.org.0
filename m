Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F347F517E70
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 09:18:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853DD40ABF;
	Tue,  3 May 2022 07:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2gM3LbInqpi; Tue,  3 May 2022 07:18:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 74F5940AC1;
	Tue,  3 May 2022 07:18:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44B3AC007E;
	Tue,  3 May 2022 07:18:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79DE2C002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67CE8818B5
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMKUWhZCYRPA for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 07:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B0018186E
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:17:58 +0000 (UTC)
X-UUID: 92dbbe780aab44689d700a6b2ea2d7a4-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f1aa710b-7ba5-43f1-b4d2-4b3abbdb0a7b, OB:70,
 L
 OB:30,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ha
 m,ACTION:release,TS:80
X-CID-INFO: VERSION:1.1.4, REQID:f1aa710b-7ba5-43f1-b4d2-4b3abbdb0a7b, OB:70,
 LOB
 :30,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3
 D,ACTION:quarantine,TS:80
X-CID-META: VersionHash:faefae9, CLOUDID:77bc822f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:d2f05428c351,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 92dbbe780aab44689d700a6b2ea2d7a4-20220503
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 861360160; Tue, 03 May 2022 15:17:52 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:17:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 15:17:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:17:37 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v7 21/36] iommu/mediatek: Add infra iommu support
Date: Tue, 3 May 2022 15:14:12 +0800
Message-ID: <20220503071427.2285-22-yong.wu@mediatek.com>
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

The infra iommu enable bits in mt8195 is in the pericfg register segment,
use regmap to update it.

If infra iommu master translation fault, It doesn't have the larbid/portid,
thus print out the whole register value.

Since regmap_update_bits may fail, add return value for mtk_iommu_config.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 36 +++++++++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.h |  2 ++
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index cd89c109e8c4..ff48506b480c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -112,6 +112,8 @@
 
 #define MTK_PROTECT_PA_ALIGN			256
 
+#define PERICFG_IOMMU_1				0x714
+
 #define HAS_4GB_MODE			BIT(0)
 /* HW will use the EMI clock if there isn't the "bclk". */
 #define HAS_BCLK			BIT(1)
@@ -343,8 +345,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
-			"fault type=0x%x iova=0x%llx pa=0x%llx larb=%d port=%d layer=%d %s\n",
-			int_state, fault_iova, fault_pa, fault_larb, fault_port,
+			"fault type=0x%x iova=0x%llx pa=0x%llx master=0x%x(larb=%d port=%d) layer=%d %s\n",
+			int_state, fault_iova, fault_pa, regval, fault_larb, fault_port,
 			layer, write ? "write" : "read");
 	}
 
@@ -388,14 +390,15 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 	return -EINVAL;
 }
 
-static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
-			     bool enable, unsigned int domid)
+static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
+			    bool enable, unsigned int domid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	const struct mtk_iommu_iova_region *region;
-	int i;
+	u32 peri_mmuen, peri_mmuen_msk;
+	int i, ret = 0;
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
@@ -415,8 +418,19 @@ static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
 			else
 				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
+			peri_mmuen_msk = BIT(portid);
+			peri_mmuen = enable ? peri_mmuen_msk : 0;
+
+			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
+						 peri_mmuen_msk, peri_mmuen);
+			if (ret)
+				dev_err(dev, "%s iommu(%s) inframaster 0x%x fail(%d).\n",
+					enable ? "enable" : "disable",
+					dev_name(data->dev), peri_mmuen_msk, ret);
 		}
 	}
+	return ret;
 }
 
 static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
@@ -531,8 +545,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	}
 	mutex_unlock(&data->mutex);
 
-	mtk_iommu_config(data, dev, true, domid);
-	return 0;
+	return mtk_iommu_config(data, dev, true, domid);
 
 err_unlock:
 	mutex_unlock(&data->mutex);
@@ -997,6 +1010,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			dev_err(dev, "mm dts parse fail(%d).", ret);
 			goto out_runtime_disable;
 		}
+	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
+		   data->plat_data->pericfg_comp_str) {
+		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
+		if (IS_ERR(infracfg)) {
+			ret = PTR_ERR(infracfg);
+			goto out_runtime_disable;
+		}
+
+		data->pericfg = infracfg;
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index f41e32252056..56838fad8c73 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -55,6 +55,7 @@ struct mtk_iommu_plat_data {
 	u32                 flags;
 	u32                 inv_sel_reg;
 
+	char					*pericfg_comp_str;
 	struct list_head			*hw_list;
 	unsigned int				iova_region_nr;
 	const struct mtk_iommu_iova_region	*iova_region;
@@ -80,6 +81,7 @@ struct mtk_iommu_data {
 	struct device			*smicomm_dev;
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
+	struct regmap			*pericfg;
 
 	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
