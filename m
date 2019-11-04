Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B10EDF02
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 12:52:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BFD05F21;
	Mon,  4 Nov 2019 11:52:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A7EE7EF6
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:52:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7E40789E
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:52:48 +0000 (UTC)
X-UUID: aa349add43894e3d9a1d87829382cfc6-20191104
X-UUID: aa349add43894e3d9a1d87829382cfc6-20191104
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
	(envelope-from <chao.hao@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 588904639; Mon, 04 Nov 2019 19:52:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
	mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 19:52:39 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 19:52:38 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>
Subject: [RESEND,PATCH 02/13] iommu/mediatek: Add mt6779 IOMMU basic support
Date: Mon, 4 Nov 2019 19:52:27 +0800
Message-ID: <20191104115238.2394-3-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191104115238.2394-1-chao.hao@mediatek.com>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
	Cui Zhang <cui.zhang@mediatek.com>,
	Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
	linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
	iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
	Miles Chen <miles.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
	Guangming Cao <guangming.cao@mediatek.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

1. Add mt6779 registers define for iommu.
2. Add mt6779_data define to support mt6779 iommu HW init.
3. There are two iommus, one is mm_iommu, the other is vpu_iommu.
MM_IOMMU is connected smi_larb to support multimedia engine to
access DRAM, and VPU_IOMMU is connected to APU_bus to support
VPU,MDLA,EDMA to access DRAM. MM_IOMMU and VPU_IOMMU use the same
page table to simplify design by "mtk_iommu_get_m4u_data".
4. For smi_larb6, it doesn't use mm_iommu, so we can distinguish
vpu_iommu by it when excutes iommu_probe.
5. For mt6779 APU_IOMMU fault id is irregular, so it was treated
specially.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 91 +++++++++++++++++++++++++++++++++------
 drivers/iommu/mtk_iommu.h | 10 ++++-
 2 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 8ca2e99964fe..f2847e661137 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -38,12 +38,24 @@
 #define REG_MMU_INVLD_END_A			0x028
 
 #define REG_MMU_INV_SEL				0x038
+#define REG_MMU_INV_SEL_MT6779			0x02c
 #define F_INVLD_EN0				BIT(0)
 #define F_INVLD_EN1				BIT(1)
 
 #define REG_MMU_STANDARD_AXI_MODE		0x048
+
+#define REG_MMU_MISC_CRTL_MT6779		0x048
+#define REG_MMU_STANDARD_AXI_MODE_MT6779	(BIT(3) | BIT(19))
+#define REG_MMU_COHERENCE_EN			(BIT(0) | BIT(16))
+#define REG_MMU_IN_ORDER_WR_EN			(BIT(1) | BIT(17))
+#define F_MMU_HALF_ENTRY_MODE_L			(BIT(5) | BIT(21))
+#define F_MMU_BLOCKING_MODE_L			(BIT(4) | BIT(20))
+
 #define REG_MMU_DCM_DIS				0x050
 
+#define REG_MMU_WR_LEN				0x054
+#define F_MMU_WR_THROT_DIS			(BIT(5) |  BIT(21))
+
 #define REG_MMU_CTRL_REG			0x110
 #define F_MMU_TF_PROT_TO_PROGRAM_ADDR		(2 << 4)
 #define F_MMU_PREFETCH_RT_REPLACE_MOD		BIT(4)
@@ -88,10 +100,14 @@
 #define REG_MMU1_INVLD_PA			0x148
 #define REG_MMU0_INT_ID				0x150
 #define REG_MMU1_INT_ID				0x154
+#define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) & 0x7)
+#define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
 #define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
+#define F_MMU_INT_ID_COMM_APU_ID(a)		((a) & 0x3)
+#define F_MMU_INT_ID_SUB_APU_ID(a)		(((a) >> 2) & 0x3)
 
-#define MTK_PROTECT_PA_ALIGN			128
+#define MTK_PROTECT_PA_ALIGN			256
 
 /*
  * Get the local arbiter ID and the portid within the larb arbiter
@@ -165,7 +181,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 
 	for_each_m4u(data) {
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + REG_MMU_INV_SEL);
+			       data->base + data->plat_data->inv_sel_reg);
 		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 		wmb(); /* Make sure the tlb flush all done */
 	}
@@ -182,7 +198,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	for_each_m4u(data) {
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + REG_MMU_INV_SEL);
+			       data->base + data->plat_data->inv_sel_reg);
 
 		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
 		writel_relaxed(iova + size - 1,
@@ -226,7 +242,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
 	u32 int_state, regval, fault_iova, fault_pa;
-	unsigned int fault_larb, fault_port;
+	unsigned int fault_larb, fault_port, sub_comm = 0;
 	bool layer, write;
 
 	/* Read error info from registers */
@@ -242,17 +258,30 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
-	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
+	if (data->plat_data->has_sub_comm[data->m4u_id]) {
+		/* m4u1 is VPU in mt6779.*/
+		if (data->m4u_id && data->plat_data->m4u_plat == M4U_MT6779) {
+			fault_larb = F_MMU_INT_ID_COMM_APU_ID(regval);
+			sub_comm = F_MMU_INT_ID_SUB_APU_ID(regval);
+			fault_port = 0; /* for mt6779 APU ID is irregular */
+		} else {
+			fault_larb = F_MMU_INT_ID_COMM_ID(regval);
+			sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
+		}
+	} else {
+		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	}
 
-	fault_larb = data->plat_data->larbid_remap[fault_larb];
+	fault_larb = data->plat_data->larbid_remap[data->m4u_id][fault_larb];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
-			"fault type=0x%x iova=0x%x pa=0x%x larb=%d port=%d layer=%d %s\n",
-			int_state, fault_iova, fault_pa, fault_larb, fault_port,
+			"fault type=0x%x iova=0x%x pa=0x%x larb=%d sub_comm=%d port=%d regval=0x%x layer=%d %s\n",
+			int_state, fault_iova, fault_pa, fault_larb,
+			sub_comm, fault_port, regval,
 			layer, write ? "write" : "read");
 	}
 
@@ -545,11 +574,12 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		return ret;
 	}
 
+	regval = readl_relaxed(data->base + REG_MMU_CTRL_REG);
 	if (data->plat_data->m4u_plat == M4U_MT8173)
-		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
+		regval |= F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
 	else
-		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
+		regval |= F_MMU_TF_PROT_TO_PROGRAM_ADDR;
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
 	regval = F_L2_MULIT_HIT_EN |
@@ -589,6 +619,20 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	if (data->plat_data->reset_axi)
 		writel_relaxed(0, data->base + REG_MMU_STANDARD_AXI_MODE);
 
+	if (data->plat_data->has_wr_len) {
+		/* write command throttling mode */
+		regval = readl_relaxed(data->base + REG_MMU_WR_LEN);
+		regval &= ~F_MMU_WR_THROT_DIS;
+		writel_relaxed(regval, data->base + REG_MMU_WR_LEN);
+	}
+	/* special settings for mmu0 (multimedia iommu) */
+	if (data->plat_data->has_misc_ctrl[data->m4u_id]) {
+		regval = readl_relaxed(data->base + REG_MMU_MISC_CRTL_MT6779);
+		/* non-standard AXI mode */
+		regval &= ~REG_MMU_STANDARD_AXI_MODE_MT6779;
+		writel_relaxed(regval, data->base + REG_MMU_MISC_CRTL_MT6779);
+	}
+
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
 		writel_relaxed(0, data->base + REG_MMU_PT_BASE_ADDR);
@@ -678,6 +722,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
+		if (data->plat_data->m4u1_mask == (1 << id))
+			data->m4u_id = 1;
+
 		component_match_add_release(dev, &match, release_of,
 					    compare_of, larbnode);
 	}
@@ -731,6 +778,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	struct mtk_iommu_suspend_reg *reg = &data->reg;
 	void __iomem *base = data->base;
 
+	reg->wr_len = readl_relaxed(base + REG_MMU_WR_LEN);
 	reg->standard_axi_mode = readl_relaxed(base +
 					       REG_MMU_STANDARD_AXI_MODE);
 	reg->dcm_dis = readl_relaxed(base + REG_MMU_DCM_DIS);
@@ -756,6 +804,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
 		return ret;
 	}
+	writel_relaxed(reg->wr_len, base + REG_MMU_WR_LEN);
 	writel_relaxed(reg->standard_axi_mode,
 		       base + REG_MMU_STANDARD_AXI_MODE);
 	writel_relaxed(reg->dcm_dis, base + REG_MMU_DCM_DIS);
@@ -779,7 +828,20 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.inv_sel_reg = REG_MMU_INV_SEL,
+};
+
+static const struct mtk_iommu_plat_data mt6779_data = {
+	.m4u_plat = M4U_MT6779,
+	.larbid_remap[0] = {0, 1, 2, 3, 5, 7, 10, 9},
+	/* vp6a, vp6b, mdla/core2, mdla/edmc*/
+	.larbid_remap[1] = {2, 0, 3, 1},
+	.has_sub_comm = {true, true},
+	.has_wr_len = true,
+	.has_misc_ctrl = {true, false},
+	.inv_sel_reg = REG_MMU_INV_SEL_MT6779,
+	.m4u1_mask =  BIT(6),
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -787,17 +849,20 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.reset_axi    = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
-	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
+	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
+	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
+	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..132dc765a40b 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -25,11 +25,13 @@ struct mtk_iommu_suspend_reg {
 	u32				int_main_control;
 	u32				ivrp_paddr;
 	u32				vld_pa_rng;
+	u32				wr_len;
 };
 
 enum mtk_iommu_plat {
 	M4U_MT2701,
 	M4U_MT2712,
+	M4U_MT6779,
 	M4U_MT8173,
 	M4U_MT8183,
 };
@@ -42,7 +44,12 @@ struct mtk_iommu_plat_data {
 	bool                has_bclk;
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
-	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
+	bool                has_sub_comm[2];
+	bool                has_wr_len;
+	bool                has_misc_ctrl[2];
+	u32                 inv_sel_reg;
+	u32                 m4u1_mask;
+	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 };
 
 struct mtk_iommu_domain;
@@ -59,6 +66,7 @@ struct mtk_iommu_data {
 	bool                            enable_4GB;
 	spinlock_t			tlb_lock; /* lock for tlb range flush */
 
+	u32				m4u_id;
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
