Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E383FEDF2C
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 12:53:49 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72ABCF1E;
	Mon,  4 Nov 2019 11:53:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BD607EF6
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 283DD89E
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:28 +0000 (UTC)
X-UUID: 22d856d238704efaa7245c14feded0da-20191104
X-UUID: 22d856d238704efaa7245c14feded0da-20191104
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
	mailgw02.mediatek.com (envelope-from <chao.hao@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 340143234; Mon, 04 Nov 2019 19:53:26 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
	mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 19:53:25 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 19:53:14 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>
Subject: [RESEND,
	PATCH 13/13] iommu/mediatek: Add multiple mtk_iommu_domain support
	for mt6779
Date: Mon, 4 Nov 2019 19:52:38 +0800
Message-ID: <20191104115238.2394-14-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191104115238.2394-1-chao.hao@mediatek.com>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F8AD794D9FEF6333CE5BE9CFD73E711FCAB89F13FD72EC4B1E68F3848BF91BB72000:8
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

For mt6779, it need to support three mtk_iommu_domains, every
mtk_iommu_domain's iova space is different.
Three mtk_iommu_domains is as below:
1. Normal mtk_iommu_domain exclude 0x4000_0000~0x47ff_ffff and
   0x7da0_0000~7fbf_ffff.
2. CCU mtk_iommu_domain include 0x4000_0000~0x47ff_ffff.
3. VPU mtk_iommu_domain 0x7da0_0000~0x7fbf_ffff.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 45 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index c33ea55a1841..882fe01ff770 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -140,6 +140,30 @@ const struct mtk_domain_data single_dom = {
 	.max_iova = DMA_BIT_MASK(32)
 };
 
+/*
+ * related file: mt6779-larb-port.h
+ */
+const struct mtk_domain_data mt6779_multi_dom[] = {
+	/* normal domain */
+	{
+	 .min_iova = 0x0,
+	 .max_iova = DMA_BIT_MASK(32),
+	},
+	/* ccu domain */
+	{
+	 .min_iova = 0x40000000,
+	 .max_iova = 0x48000000 - 1,
+	 .port_mask = {MTK_M4U_ID(9, 21), MTK_M4U_ID(9, 22),
+		       MTK_M4U_ID(12, 0), MTK_M4U_ID(12, 1)}
+	},
+	/* vpu domain */
+	{
+	 .min_iova = 0x7da00000,
+	 .max_iova = 0x7fc00000 - 1,
+	 .port_mask = {MTK_M4U_ID(13, 0)}
+	}
+};
+
 static struct mtk_iommu_pgtable *share_pgtable;
 static const struct iommu_ops mtk_iommu_ops;
 
@@ -1055,6 +1079,21 @@ static const struct dev_pm_ops mtk_iommu_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
 };
 
+static const struct mtk_iommu_resv_iova_region mt6779_iommu_rsv_list[] = {
+	{
+		.dom_id = 0,
+		.iova_base = 0x40000000,	/* CCU */
+		.iova_size = 0x8000000,
+		.type = IOMMU_RESV_RESERVED,
+	},
+	{
+		.dom_id = 0,
+		.iova_base = 0x7da00000,	/* VPU/MDLA */
+		.iova_size = 0x2700000,
+		.type = IOMMU_RESV_RESERVED,
+	},
+};
+
 static const struct mtk_iommu_plat_data mt2712_data = {
 	.m4u_plat     = M4U_MT2712,
 	.has_4gb_mode = true,
@@ -1068,8 +1107,10 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat = M4U_MT6779,
-	.dom_cnt = 1,
-	.dom_data = &single_dom,
+	.resv_cnt     = ARRAY_SIZE(mt6779_iommu_rsv_list),
+	.resv_region  = mt6779_iommu_rsv_list,
+	.dom_cnt = ARRAY_SIZE(mt6779_multi_dom),
+	.dom_data = mt6779_multi_dom,
 	.larbid_remap[0] = {0, 1, 2, 3, 5, 7, 10, 9},
 	/* vp6a, vp6b, mdla/core2, mdla/edmc*/
 	.larbid_remap[1] = {2, 0, 3, 1},
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
