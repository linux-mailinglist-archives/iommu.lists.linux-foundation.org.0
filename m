Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E26415DA9
	for <lists.iommu@lfdr.de>; Thu, 23 Sep 2021 14:03:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58EE061580;
	Thu, 23 Sep 2021 12:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F50RfSUccpw4; Thu, 23 Sep 2021 12:03:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 77F276157F;
	Thu, 23 Sep 2021 12:03:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FB08C000D;
	Thu, 23 Sep 2021 12:03:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22E27C000D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE8B6081C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adKJUfrxLVul for <iommu@lists.linux-foundation.org>;
 Thu, 23 Sep 2021 12:03:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E19B061403
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 12:03:00 +0000 (UTC)
X-UUID: 7e00feca84e24546a5b9d0b9d5d3de25-20210923
X-UUID: 7e00feca84e24546a5b9d0b9d5d3de25-20210923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1177473187; Thu, 23 Sep 2021 20:02:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:02:54 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:02:53 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 25/33] iommu/mediatek: Just move code position in hw_init
Date: Thu, 23 Sep 2021 19:58:32 +0800
Message-ID: <20210923115840.17813-26-yong.wu@mediatek.com>
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

No functional change too, prepare for mt8195 IOMMU support bank functions.
Some global control settings are in bank0 while the other banks have
their bank independent setting. Here only move the global control
settings and the independent registers together.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 725e000eee0f..ac31fe8b7aaf 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -731,30 +731,6 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
-	regval = F_L2_MULIT_HIT_EN |
-		F_TABLE_WALK_FAULT_INT_EN |
-		F_PREETCH_FIFO_OVERFLOW_INT_EN |
-		F_MISS_FIFO_OVERFLOW_INT_EN |
-		F_PREFETCH_FIFO_ERR_INT_EN |
-		F_MISS_FIFO_ERR_INT_EN;
-	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
-
-	regval = F_INT_TRANSLATION_FAULT |
-		F_INT_MAIN_MULTI_HIT_FAULT |
-		F_INT_INVALID_PA_FAULT |
-		F_INT_ENTRY_REPLACEMENT_FAULT |
-		F_INT_TLB_MISS_FAULT |
-		F_INT_MISS_TRANSACTION_FIFO_FAULT |
-		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
-	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
-
-	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
-		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
-	else
-		regval = lower_32_bits(data->protect_base) |
-			 upper_32_bits(data->protect_base);
-	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
-
 	if (data->enable_4GB &&
 	    MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_VLD_PA_RNG)) {
 		/*
@@ -788,6 +764,30 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
 
+	regval = F_L2_MULIT_HIT_EN |
+		F_TABLE_WALK_FAULT_INT_EN |
+		F_PREETCH_FIFO_OVERFLOW_INT_EN |
+		F_MISS_FIFO_OVERFLOW_INT_EN |
+		F_PREFETCH_FIFO_ERR_INT_EN |
+		F_MISS_FIFO_ERR_INT_EN;
+	writel_relaxed(regval, data->base + REG_MMU_INT_CONTROL0);
+
+	regval = F_INT_TRANSLATION_FAULT |
+		F_INT_MAIN_MULTI_HIT_FAULT |
+		F_INT_INVALID_PA_FAULT |
+		F_INT_ENTRY_REPLACEMENT_FAULT |
+		F_INT_TLB_MISS_FAULT |
+		F_INT_MISS_TRANSACTION_FIFO_FAULT |
+		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
+	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
+
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
+		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
+	else
+		regval = lower_32_bits(data->protect_base) |
+			 upper_32_bits(data->protect_base);
+	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
+
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
 		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
