Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 84479D5BB4
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 08:53:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B570E25F6;
	Mon, 14 Oct 2019 06:52:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E5A02552
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 06:39:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id CB0495D3
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 06:39:18 +0000 (UTC)
X-UUID: 770286f22718455b9e1f755d555f5e0c-20191014
X-UUID: 770286f22718455b9e1f755d555f5e0c-20191014
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 1071566511; Mon, 14 Oct 2019 14:39:14 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
	mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 14 Oct 2019 14:39:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 14 Oct 2019 14:39:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will.deacon@arm.com>
Subject: [PATCH v3 5/7] iommu/mediatek: Move the tlb_sync into tlb_flush
Date: Mon, 14 Oct 2019 14:38:19 +0800
Message-ID: <1571035101-4213-6-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
References: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D6519AAB6225CC953BE3549E5B551BA25AFF0DAD153178E3B499A341494007622000:8
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	edison.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
	Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
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

Right now, the tlb_add_flush_nosync and tlb_sync always appear together.
we merge the two functions into one. No functional change.

mtk_iommu_tlb_add_flush_nosync
mtk_iommu_tlb_sync

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 36 ++++++++----------------------------
 drivers/iommu/mtk_iommu.h |  1 -
 2 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 19f936c..dbbacc3 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -173,10 +173,12 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 	}
 }
 
-static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
+static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   size_t granule, void *cookie)
 {
 	struct mtk_iommu_data *data = cookie;
+	int ret;
+	u32 tmp;
 
 	for_each_m4u(data) {
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
@@ -187,21 +189,8 @@ static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
 			       data->base + REG_MMU_INVLD_END_A);
 		writel_relaxed(F_MMU_INV_RANGE,
 			       data->base + REG_MMU_INVALIDATE);
-		data->tlb_flush_active = true;
-	}
-}
-
-static void mtk_iommu_tlb_sync(void *cookie)
-{
-	struct mtk_iommu_data *data = cookie;
-	int ret;
-	u32 tmp;
-
-	for_each_m4u(data) {
-		/* Avoid timing out if there's nothing to wait for */
-		if (!data->tlb_flush_active)
-			return;
 
+		/* tlb sync */
 		ret = readl_poll_timeout_atomic(data->base + REG_MMU_CPE_DONE,
 						tmp, tmp != 0, 10, 100000);
 		if (ret) {
@@ -211,17 +200,9 @@ static void mtk_iommu_tlb_sync(void *cookie)
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
-		data->tlb_flush_active = false;
 	}
 }
 
-static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
-				     size_t granule, void *cookie)
-{
-	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, cookie);
-	mtk_iommu_tlb_sync(cookie);
-}
-
 static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 					    unsigned long iova, size_t granule,
 					    void *cookie)
@@ -236,8 +217,8 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 
 static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
-	.tlb_flush_leaf = mtk_iommu_tlb_flush_walk,
+	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
+	.tlb_flush_leaf = mtk_iommu_tlb_flush_range_sync,
 	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
 };
 
@@ -466,9 +447,8 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 	if (!is_in_gather)
 		spin_lock_irqsave(&dom->pgtlock, flags);
 
-	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
-				       data);
-	mtk_iommu_tlb_sync(data);
+	mtk_iommu_tlb_flush_range_sync(gather->start, length,
+				       gather->pgsize, data);
 
 	if (!is_in_gather)
 		spin_unlock_irqrestore(&dom->pgtlock, flags);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index d29af1d..9056f73 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -57,7 +57,6 @@ struct mtk_iommu_data {
 	struct mtk_iommu_domain		*m4u_dom;
 	struct iommu_group		*m4u_group;
 	bool                            enable_4GB;
-	bool				tlb_flush_active;
 	bool				is_in_tlb_gather_add_page;
 
 	struct iommu_device		iommu;
-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
