Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAE03C9E71
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 14:13:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD8760B83;
	Thu, 15 Jul 2021 12:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BkOB9Lz-Cu1; Thu, 15 Jul 2021 12:13:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4B31760B7D;
	Thu, 15 Jul 2021 12:13:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27804C000E;
	Thu, 15 Jul 2021 12:13:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B186C000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 12:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD97A40384
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 12:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CP5RTr3g_XmE for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 12:13:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25A0402AC
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 12:13:49 +0000 (UTC)
X-UUID: 034a65031a1e412f87e6b233594a55e2-20210715
X-UUID: 034a65031a1e412f87e6b233594a55e2-20210715
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1659994283; Thu, 15 Jul 2021 20:13:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 20:13:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 20:13:43 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 10/11] memory: mtk-smi: mt8195: Add initial setting for
 smi-common
Date: Thu, 15 Jul 2021 20:12:08 +0800
Message-ID: <20210715121209.31024-11-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210715121209.31024-1-yong.wu@mediatek.com>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 anthony.huang@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
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

To improve the performance, add initial setting for smi-common.
some register use some fix setting(suggested from DE).

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 42 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 3c288716a378..c52bf02458ff 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -18,11 +18,19 @@
 #include <dt-bindings/memory/mtk-memory-port.h>
 
 /* SMI COMMON */
+#define SMI_L1LEN			0x100
+
 #define SMI_BUS_SEL			0x220
 #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
 /* All are MMU0 defaultly. Only specialize mmu1 here. */
 #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
 
+#define SMI_M4U_TH			0x234
+#define SMI_FIFO_TH1			0x238
+#define SMI_FIFO_TH2			0x23c
+#define SMI_DCM				0x300
+#define SMI_DUMMY			0x444
+
 /* SMI LARB */
 
 /* Below are about mmu enable registers, they are different in SoCs */
@@ -58,6 +66,13 @@
 	(_id << 8 | _id << 10 | _id << 12 | _id << 14);	\
 })
 
+#define SMI_COMMON_INIT_REGS_NR		6
+
+struct mtk_smi_reg_pair {
+	unsigned int		offset;
+	u32			value;
+};
+
 enum mtk_smi_type {
 	MTK_SMI_GEN1,
 	MTK_SMI_GEN2,		/* gen2 smi common */
@@ -74,6 +89,8 @@ static const char * const mtk_smi_larb_clks_optional[] = {"gals"};
 struct mtk_smi_common_plat {
 	enum mtk_smi_type	type;
 	u32			bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
+
+	const struct mtk_smi_reg_pair	*init;
 };
 
 struct mtk_smi_larb_gen {
@@ -409,6 +426,15 @@ static struct platform_driver mtk_smi_larb_driver = {
 	}
 };
 
+static const struct mtk_smi_reg_pair mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
+	{SMI_L1LEN, 0xb},
+	{SMI_M4U_TH, 0xe100e10},
+	{SMI_FIFO_TH1, 0x506090a},
+	{SMI_FIFO_TH2, 0x506090a},
+	{SMI_DCM, 0x4f1},
+	{SMI_DUMMY, 0x1},
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_gen1 = {
 	.type     = MTK_SMI_GEN1,
 };
@@ -439,11 +465,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
 	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
 		    F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
 	.type     = MTK_SMI_GEN2,
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
 };
 
 static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
@@ -530,15 +558,21 @@ static int mtk_smi_common_remove(struct platform_device *pdev)
 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
 {
 	struct mtk_smi *common = dev_get_drvdata(dev);
-	u32 bus_sel = common->plat->bus_sel;
-	int ret;
+	const struct mtk_smi_reg_pair *init = common->plat->init;
+	u32 bus_sel = common->plat->bus_sel; /* default is 0 */
+	int ret, i;
 
 	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
 	if (ret)
 		return ret;
 
-	if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
-		writel(bus_sel, common->base + SMI_BUS_SEL);
+	if (common->plat->type != MTK_SMI_GEN2)
+		return 0;
+
+	for (i = 0; i < SMI_COMMON_INIT_REGS_NR && init && init[i].offset; i++)
+		writel_relaxed(init[i].value, common->base + init[i].offset);
+
+	writel(bus_sel, common->base + SMI_BUS_SEL);
 	return 0;
 }
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
