Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C9EDF13
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 12:53:22 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91483F16;
	Mon,  4 Nov 2019 11:53:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2BAA4F00
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 22B3D89E
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:03 +0000 (UTC)
X-UUID: a0f676bd011b459e9c6217a60ea321a1-20191104
X-UUID: a0f676bd011b459e9c6217a60ea321a1-20191104
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
	mailgw02.mediatek.com (envelope-from <chao.hao@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 1196001826; Mon, 04 Nov 2019 19:53:00 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 19:52:58 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 19:52:55 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>
Subject: [RESEND,PATCH 07/13] iommu/mediatek: Add smi_larb info about device
Date: Mon, 4 Nov 2019 19:52:32 +0800
Message-ID: <20191104115238.2394-8-chao.hao@mediatek.com>
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

All the devices which used iommu are connected to SMI_larb port,
so when different devices driver execute initialization, iommu
can check larb_id and port_id to distinguish them and then make
them match to iommu_group accordingly. We also add dom_cnt variable
to describe the number of mtk_iommu_domain.

Larb_id and port_id define can refer to "mtxxxx-larb-port.h(ex:
mt6779-larb-port.h)" file

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 50 ++++++++++++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 27995b2b29a6..0eacbc473374 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -126,6 +126,7 @@ struct mtk_iommu_domain {
 struct mtk_iommu_pgtable {
 	struct io_pgtable_cfg	cfg;
 	struct io_pgtable_ops	*iop;
+	struct device		*init_dev;
 	struct list_head	m4u_dom_v2;
 };
 
@@ -177,22 +178,35 @@ static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
 	return NULL;
 }
 
-static u32 get_domain_id(void)
+static u32 get_domain_id(struct mtk_iommu_data *data, u32 portid)
 {
-	/* only support one mtk_iommu_domain currently */
-	return 0;
+	u32 dom_id = 0;
+	int i;
+
+	/* only support one mtk_iommu_domain currently(dom_cnt = 1) */
+	for (i = 0; i < data->plat_data->dom_cnt; i++)
+		return i;
+
+	return dom_id;
 }
 
-static u32 mtk_iommu_get_domain_id(void)
+static u32 mtk_iommu_get_domain_id(struct device *dev)
 {
-	return get_domain_id();
+	struct iommu_fwspec *fwspec = dev->iommu_fwspec;
+	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
+	u32 portid = fwspec->ids[0];
+
+	return get_domain_id(data, portid);
 }
 
 static struct mtk_iommu_domain *get_mtk_domain(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
 	struct mtk_iommu_domain *dom;
-	u32 domain_id = mtk_iommu_get_domain_id();
+	u32 domain_id = mtk_iommu_get_domain_id(dev);
+
+	if (domain_id >= data->plat_data->dom_cnt)
+		return NULL;
 
 	list_for_each_entry(dom, &data->pgtable->m4u_dom_v2, list) {
 		if (dom->id == domain_id)
@@ -431,11 +445,18 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	struct mtk_iommu_domain *dom;
+	struct device *dev;
 
 	if (type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
-	if (!pgtable) {
+	if (pgtable) {
+		dev = pgtable->init_dev;
+		if (!data->m4u_group) {
+			pr_err("%s, find m4u_group failed\n", __func__);
+			return NULL;
+		}
+	} else {
 		pr_err("%s, pgtable is not ready\n", __func__);
 		return NULL;
 	}
@@ -447,8 +468,11 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (iommu_get_dma_cookie(&dom->domain))
 		goto  free_dom;
 
+	dom->id = mtk_iommu_get_domain_id(dev);
+	if (dom->id >= data->plat_data->dom_cnt)
+		goto  put_dma_cookie;
+
 	dom->group = data->m4u_group;
-	dom->id = mtk_iommu_get_domain_id();
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
@@ -459,6 +483,8 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 
 	return &dom->domain;
 
+put_dma_cookie:
+	iommu_put_dma_cookie(&dom->domain);
 free_dom:
 	kfree(dom);
 	return NULL;
@@ -619,6 +645,10 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	} else {
 		iommu_group_ref_get(data->m4u_group);
 	}
+
+	/* save the latest init device */
+	pgtable->init_dev = dev;
+
 	return data->m4u_group;
 }
 
@@ -927,12 +957,14 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat = M4U_MT6779,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 5, 7, 10, 9},
 	/* vp6a, vp6b, mdla/core2, mdla/edmc*/
 	.larbid_remap[1] = {2, 0, 3, 1},
@@ -948,6 +980,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.reset_axi    = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
@@ -955,6 +988,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index dd5f19f78b62..6801f8496fcc 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -49,6 +49,7 @@ struct mtk_iommu_plat_data {
 	bool                has_misc_ctrl[2];
 	u32                 inv_sel_reg;
 	u32                 m4u1_mask;
+	u32		    dom_cnt;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 };
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
