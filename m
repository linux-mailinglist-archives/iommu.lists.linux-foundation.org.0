Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4C2ECFA7
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 13:30:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AD94865C1;
	Thu,  7 Jan 2021 12:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uY2db8PAV2gh; Thu,  7 Jan 2021 12:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A539865DB;
	Thu,  7 Jan 2021 12:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44ADAC013A;
	Thu,  7 Jan 2021 12:30:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8065BC013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 64795204E3
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k6eDDyQFkgZV for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 12:30:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by silver.osuosl.org (Postfix) with ESMTP id E16822002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:30:36 +0000 (UTC)
X-UUID: 553a4b6a982248ce9fd2525244d4dcc4-20210107
X-UUID: 553a4b6a982248ce9fd2525244d4dcc4-20210107
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 285571440; Thu, 07 Jan 2021 20:30:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 20:30:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 20:30:32 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 7/7] iommu/mediatek: Remove the tlb-ops for v7s
Date: Thu, 7 Jan 2021 20:29:09 +0800
Message-ID: <20210107122909.16317-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 David Laight <David.Laight@ACULAB.COM>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
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

Until now, we have already used the tlb operations from iommu framework,
then the tlb operations for v7s can be removed.

Correspondingly, Switch the paramenter "cookie" to the internal structure.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d3b8a1649093..86ab577c9520 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -182,10 +182,8 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 	return container_of(dom, struct mtk_iommu_domain, domain);
 }
 
-static void mtk_iommu_tlb_flush_all(void *cookie)
+static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	struct mtk_iommu_data *data = cookie;
-
 	for_each_m4u(data) {
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       data->base + data->plat_data->inv_sel_reg);
@@ -195,9 +193,9 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-					   size_t granule, void *cookie)
+					   size_t granule,
+					   struct mtk_iommu_data *data)
 {
-	struct mtk_iommu_data *data = cookie;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
@@ -219,7 +217,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
-			mtk_iommu_tlb_flush_all(cookie);
+			mtk_iommu_tlb_flush_all(data);
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
@@ -227,22 +225,6 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	}
 }
 
-static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
-					    unsigned long iova, size_t granule,
-					    void *cookie)
-{
-	struct mtk_iommu_data *data = cookie;
-	struct iommu_domain *domain = &data->m4u_dom->domain;
-
-	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
-}
-
-static const struct iommu_flush_ops mtk_iommu_flush_ops = {
-	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
-	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
-};
-
 static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
@@ -326,7 +308,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
 		.oas = 34,
-		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
 	};
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
