Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA42132F4
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 06:42:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 141B189873;
	Fri,  3 Jul 2020 04:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oiXDgYt28rxH; Fri,  3 Jul 2020 04:42:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1EF4889869;
	Fri,  3 Jul 2020 04:42:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 026E6C0733;
	Fri,  3 Jul 2020 04:42:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B22BC0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6AAD088B74
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99-nqvfLfuO1 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 04:42:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6594988C32
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:42:46 +0000 (UTC)
X-UUID: c3bb80147f944205b9dd37f71fb34a60-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dx7uAL5Znm+LVgMZRYOyuq3Q8utOQ9QBHB/isvNyWXA=; 
 b=rPU9LFg6zEMWzY3Ze1FBTLxhxgOAsBalpJXwcEmf8vsm60FH59mIA6xYlm8Yon3vYrEyxTC/s4i6TzpKSgXCFCY6VC3OKdmjJFwrNNRhnzMZrn5ETHZCqJSZf2t3MsvTFSpN3F2mRlsVy+p/bs5wQg2yZDw25z/OLF/0jkDw8gA=;
X-UUID: c3bb80147f944205b9dd37f71fb34a60-20200703
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1396366408; Fri, 03 Jul 2020 12:42:44 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:40 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:36 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 02/10] iommu/mediatek: Rename the register
 STANDARD_AXI_MODE(0x48) to MISC_CTRL
Date: Fri, 3 Jul 2020 12:41:19 +0800
Message-ID: <20200703044127.27438-3-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 156077749534FC8A33E1151E8BBAE816F9853DDA26CCD020A260760924A8613A2000:8
X-MTK: N
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

For iommu offset=0x48 register, only the previous mt8173/mt8183 use the
name STANDARD_AXI_MODE, all the latest SoC extend the register more
feature by different bits, for example: axi_mode, in_order_en, coherent_en
and so on. So rename REG_MMU_MISC_CTRL may be more proper.

This patch only rename the register name, no functional change.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 14 +++++++-------
 drivers/iommu/mtk_iommu.h |  5 ++++-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2be96f1cdbd2..88d3df5b91c2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -41,7 +41,7 @@
 #define F_INVLD_EN0				BIT(0)
 #define F_INVLD_EN1				BIT(1)
 
-#define REG_MMU_STANDARD_AXI_MODE		0x048
+#define REG_MMU_MISC_CTRL			0x048
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -573,8 +573,10 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
-	if (data->plat_data->reset_axi)
-		writel_relaxed(0, data->base + REG_MMU_STANDARD_AXI_MODE);
+	if (data->plat_data->reset_axi) {
+		/* The register is called STANDARD_AXI_MODE in this case */
+		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
+	}
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
@@ -718,8 +720,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
-	reg->standard_axi_mode = readl_relaxed(base +
-					       REG_MMU_STANDARD_AXI_MODE);
+	reg->misc_ctrl = readl_relaxed(base + REG_MMU_MISC_CTRL);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
 	reg->ctrl_reg = readl_relaxed(base + REG_MMU_CTRL_REG);
 	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
@@ -743,8 +744,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
-	writel_relaxed(reg->standard_axi_mode,
-		       base + REG_MMU_STANDARD_AXI_MODE);
+	writel_relaxed(reg->misc_ctrl, base + REG_MMU_MISC_CTRL);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
 	writel_relaxed(reg->ctrl_reg, base + REG_MMU_CTRL_REG);
 	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..7212e6fcf982 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -18,7 +18,10 @@
 #include <soc/mediatek/smi.h>
 
 struct mtk_iommu_suspend_reg {
-	u32				standard_axi_mode;
+	union {
+		u32			standard_axi_mode;/* v1 */
+		u32			misc_ctrl;/* v2 */
+	};
 	u32				dcm_dis;
 	u32				ctrl_reg;
 	u32				int_control0;
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
