Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DBC88990
	for <lists.iommu@lfdr.de>; Sat, 10 Aug 2019 10:01:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B811ACD;
	Sat, 10 Aug 2019 08:01:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ECC43481
	for <iommu@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:01:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1C4007D2
	for <iommu@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:01:22 +0000 (UTC)
X-UUID: 47c66220023f4d09a2177cb312a8d8a5-20190810
X-UUID: 47c66220023f4d09a2177cb312a8d8a5-20190810
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
	with ESMTP id 785535917; Sat, 10 Aug 2019 16:01:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Sat, 10 Aug 2019 16:01:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Sat, 10 Aug 2019 16:01:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v9 16/21] iommu/mediatek: Add mmu1 support
Date: Sat, 10 Aug 2019 15:58:16 +0800
Message-ID: <1565423901-17008-17-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
References: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
	anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>,
	linux-arm-kernel@lists.infradead.org
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

Normally the M4U HW connect EMI with smi. the diagram is like below:
              EMI
               |
              M4U
               |
            smi-common
               |
       -----------------
       |    |    |     |    ...
    larb0 larb1  larb2 larb3

Actually there are 2 mmu cells in the M4U HW, like this diagram:

              EMI
           ---------
            |     |
           mmu0  mmu1     <- M4U
            |     |
           ---------
               |
            smi-common
               |
       -----------------
       |    |    |     |    ...
    larb0 larb1  larb2 larb3

This patch add support for mmu1. In order to get better performance,
we could adjust some larbs go to mmu1 while the others still go to
mmu0. This is controlled by a SMI COMMON register SMI_BUS_SEL(0x220).

mt2712, mt8173 and mt8183 M4U HW all have 2 mmu cells. the default
value of that register is 0 which means all the larbs go to mmu0
defaultly.

This is a preparing patch for adjusting SMI_BUS_SEL for mt8183.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 46 +++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 550b093..cbebe11 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -64,26 +64,32 @@
 #define F_INT_CLR_BIT				BIT(12)
 
 #define REG_MMU_INT_MAIN_CONTROL		0x124
-#define F_INT_TRANSLATION_FAULT			BIT(0)
-#define F_INT_MAIN_MULTI_HIT_FAULT		BIT(1)
-#define F_INT_INVALID_PA_FAULT			BIT(2)
-#define F_INT_ENTRY_REPLACEMENT_FAULT		BIT(3)
-#define F_INT_TLB_MISS_FAULT			BIT(4)
-#define F_INT_MISS_TRANSACTION_FIFO_FAULT	BIT(5)
-#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT	BIT(6)
+						/* mmu0 | mmu1 */
+#define F_INT_TRANSLATION_FAULT			(BIT(0) | BIT(7))
+#define F_INT_MAIN_MULTI_HIT_FAULT		(BIT(1) | BIT(8))
+#define F_INT_INVALID_PA_FAULT			(BIT(2) | BIT(9))
+#define F_INT_ENTRY_REPLACEMENT_FAULT		(BIT(3) | BIT(10))
+#define F_INT_TLB_MISS_FAULT			(BIT(4) | BIT(11))
+#define F_INT_MISS_TRANSACTION_FIFO_FAULT	(BIT(5) | BIT(12))
+#define F_INT_PRETETCH_TRANSATION_FIFO_FAULT	(BIT(6) | BIT(13))
 
 #define REG_MMU_CPE_DONE			0x12C
 
 #define REG_MMU_FAULT_ST1			0x134
+#define F_REG_MMU0_FAULT_MASK			GENMASK(6, 0)
+#define F_REG_MMU1_FAULT_MASK			GENMASK(13, 7)
 
-#define REG_MMU_FAULT_VA			0x13c
+#define REG_MMU0_FAULT_VA			0x13c
 #define F_MMU_FAULT_VA_WRITE_BIT		BIT(1)
 #define F_MMU_FAULT_VA_LAYER_BIT		BIT(0)
 
-#define REG_MMU_INVLD_PA			0x140
-#define REG_MMU_INT_ID				0x150
-#define F_MMU0_INT_ID_LARB_ID(a)		(((a) >> 7) & 0x7)
-#define F_MMU0_INT_ID_PORT_ID(a)		(((a) >> 2) & 0x1f)
+#define REG_MMU0_INVLD_PA			0x140
+#define REG_MMU1_FAULT_VA			0x144
+#define REG_MMU1_INVLD_PA			0x148
+#define REG_MMU0_INT_ID				0x150
+#define REG_MMU1_INT_ID				0x154
+#define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) & 0x7)
+#define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
 #define MTK_PROTECT_PA_ALIGN			128
 
@@ -202,13 +208,19 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 
 	/* Read error info from registers */
 	int_state = readl_relaxed(data->base + REG_MMU_FAULT_ST1);
-	fault_iova = readl_relaxed(data->base + REG_MMU_FAULT_VA);
+	if (int_state & F_REG_MMU0_FAULT_MASK) {
+		regval = readl_relaxed(data->base + REG_MMU0_INT_ID);
+		fault_iova = readl_relaxed(data->base + REG_MMU0_FAULT_VA);
+		fault_pa = readl_relaxed(data->base + REG_MMU0_INVLD_PA);
+	} else {
+		regval = readl_relaxed(data->base + REG_MMU1_INT_ID);
+		fault_iova = readl_relaxed(data->base + REG_MMU1_FAULT_VA);
+		fault_pa = readl_relaxed(data->base + REG_MMU1_INVLD_PA);
+	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
-	fault_pa = readl_relaxed(data->base + REG_MMU_INVLD_PA);
-	regval = readl_relaxed(data->base + REG_MMU_INT_ID);
-	fault_larb = F_MMU0_INT_ID_LARB_ID(regval);
-	fault_port = F_MMU0_INT_ID_PORT_ID(regval);
+	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
+	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 
 	fault_larb = data->plat_data->larbid_remap[fault_larb];
 
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
