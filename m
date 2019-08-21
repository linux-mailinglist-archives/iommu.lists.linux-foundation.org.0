Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 473FE97BAA
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 15:57:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A2845EC0;
	Wed, 21 Aug 2019 13:57:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C219AE41
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 13:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 3160D89E
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 13:57:28 +0000 (UTC)
X-UUID: 5a3e935a700448efb4b85f43047ad900-20190821
X-UUID: 5a3e935a700448efb4b85f43047ad900-20190821
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
	mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
	with ESMTP id 533225588; Wed, 21 Aug 2019 21:57:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
	mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 21 Aug 2019 21:57:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Wed, 21 Aug 2019 21:57:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v10 21/23] iommu/mediatek: Fix VLD_PA_RNG register backup when
	suspend
Date: Wed, 21 Aug 2019 21:53:24 +0800
Message-ID: <1566395606-7975-22-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
References: <1566395606-7975-1-git-send-email-yong.wu@mediatek.com>
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

The register VLD_PA_RNG(0x118) was forgot to backup while adding 4GB
mode support for mt2712. this patch add it.

Fixes: 30e2fccf9512 ("iommu/mediatek: Enlarge the validate PA range
for 4GB mode")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 2 ++
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 470de8b..5d5341c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -742,6 +742,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
 	reg->int_control0 = readl_relaxed(base + REG_MMU_INT_CONTROL0);
 	reg->int_main_control = readl_relaxed(base + REG_MMU_INT_MAIN_CONTROL);
 	reg->ivrp_paddr = readl_relaxed(base + REG_MMU_IVRP_PADDR);
+	reg->vld_pa_rng = readl_relaxed(base + REG_MMU_VLD_PA_RNG);
 	clk_disable_unprepare(data->bclk);
 	return 0;
 }
@@ -766,6 +767,7 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 	writel_relaxed(reg->int_control0, base + REG_MMU_INT_CONTROL0);
 	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
 	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
+	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
 	if (m4u_dom)
 		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
 		       base + REG_MMU_PT_BASE_ADDR);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 6b1f833..56b579c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -24,6 +24,7 @@ struct mtk_iommu_suspend_reg {
 	u32				int_control0;
 	u32				int_main_control;
 	u32				ivrp_paddr;
+	u32				vld_pa_rng;
 };
 
 enum mtk_iommu_plat {
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
