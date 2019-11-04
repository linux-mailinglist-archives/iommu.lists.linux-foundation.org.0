Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B33EDF0A
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 12:53:08 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1C5FCF25;
	Mon,  4 Nov 2019 11:52:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F990F16
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A95E8710
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:52:51 +0000 (UTC)
X-UUID: 44dfcedf35d146a28d5d0841d39fce49-20191104
X-UUID: 44dfcedf35d146a28d5d0841d39fce49-20191104
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
	mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 292851282; Mon, 04 Nov 2019 19:52:50 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
	mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 19:52:46 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 19:52:45 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>
Subject: [RESEND, PATCH 04/13] iommu/mediatek: Remove mtk_iommu_domain_finalise
Date: Mon, 4 Nov 2019 19:52:29 +0800
Message-ID: <20191104115238.2394-5-chao.hao@mediatek.com>
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

We already have global mtk_iommu_pgtable structure to describe
page table and create it in group_device, "mtk_iommu_domain_finalise"
is as the same as that, so so we will remove mtk_iommu_domain_finalise.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 48 ++++++++-------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index fcbde6b0f58d..3fa09b12e9f9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -329,40 +329,6 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
 	}
 }
 
-static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
-{
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
-
-	if (data->pgtable) {
-		dom->cfg = data->pgtable->cfg;
-		dom->iop = data->pgtable->iop;
-		dom->domain.pgsize_bitmap = data->pgtable->cfg.pgsize_bitmap;
-		return 0;
-	}
-
-	dom->cfg = (struct io_pgtable_cfg) {
-		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
-			IO_PGTABLE_QUIRK_NO_PERMS |
-			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
-			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
-		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
-		.ias = 32,
-		.oas = 34,
-		.tlb = &mtk_iommu_flush_ops,
-		.iommu_dev = data->dev,
-	};
-
-	dom->iop = alloc_io_pgtable_ops(ARM_V7S, &dom->cfg, data);
-	if (!dom->iop) {
-		dev_err(data->dev, "Failed to alloc io pgtable\n");
-		return -EINVAL;
-	}
-
-	/* Update our support page sizes bitmap */
-	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
-	return 0;
-}
-
 static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
 {
 	struct mtk_iommu_pgtable *pgtable;
@@ -420,11 +386,17 @@ static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
 
 static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 	struct mtk_iommu_domain *dom;
 
 	if (type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
+	if (!pgtable) {
+		pr_err("%s, pgtable is not ready\n", __func__);
+		return NULL;
+	}
+
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -432,8 +404,10 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (iommu_get_dma_cookie(&dom->domain))
 		goto  free_dom;
 
-	if (mtk_iommu_domain_finalise(dom))
-		goto  put_dma_cookie;
+	dom->cfg = pgtable->cfg;
+	dom->iop = pgtable->iop;
+	/* Update our support page sizes bitmap */
+	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
 	dom->domain.geometry.aperture_start = 0;
 	dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
@@ -441,8 +415,6 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 
 	return &dom->domain;
 
-put_dma_cookie:
-	iommu_put_dma_cookie(&dom->domain);
 free_dom:
 	kfree(dom);
 	return NULL;
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
