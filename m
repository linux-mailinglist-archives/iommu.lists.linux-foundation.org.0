Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 776703B7BA3
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 04:36:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24957405FB;
	Wed, 30 Jun 2021 02:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4o2d0ykZNE_K; Wed, 30 Jun 2021 02:36:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4FD90405F7;
	Wed, 30 Jun 2021 02:36:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36E31C000E;
	Wed, 30 Jun 2021 02:36:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B638C000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 02:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D8B8606F0
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 02:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fejeEso1zZxT for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 02:36:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C1846065C
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 02:36:30 +0000 (UTC)
X-UUID: da1d11cc0dd543538bfc0cd9d22b515d-20210630
X-UUID: da1d11cc0dd543538bfc0cd9d22b515d-20210630
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 405164280; Wed, 30 Jun 2021 10:36:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:36:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:36:23 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 08/24] iommu/mediatek: Remove for_each_m4u in tlb_sync_all
Date: Wed, 30 Jun 2021 10:34:48 +0800
Message-ID: <20210630023504.18177-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, chao.hao@mediatek.com,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

The tlb_sync_all only is called in
a) flush_iotlb_all: it will called for each iommu HW.
b) tlb_flush_range_sync: it already has for_each_m4u.
c) in irq: it has already fail. no need for_each_m4u to flush

thus, No need for_each_m4u in this tlb_sync_all.
This patch remove it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7fe9ebd879fe..ed3455b5cef0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -208,19 +208,15 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 
 static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	struct list_head *head = data->hw_list;
-
-	for_each_m4u(data, head) {
-		if (pm_runtime_get_if_in_use(data->dev) <= 0)
-			continue;
+	if (pm_runtime_get_if_in_use(data->dev) <= 0)
+		return;
 
-		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
-			       data->base + data->plat_data->inv_sel_reg);
-		writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
-		wmb(); /* Make sure the tlb flush all done */
+	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
+		       data->base + data->plat_data->inv_sel_reg);
+	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
+	wmb(); /* Make sure the tlb flush all done */
 
-		pm_runtime_put(data->dev);
-	}
+	pm_runtime_put(data->dev);
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
