Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F8130728
	for <lists.iommu@lfdr.de>; Sun,  5 Jan 2020 11:46:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A437185C90;
	Sun,  5 Jan 2020 10:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04MKmVqhBFkX; Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5A5B85D5C;
	Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E656C1D8B;
	Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40371C0881
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 22EF885CE0
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frUVJoenoe-G for <iommu@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 10:46:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8DCD885C90
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:36 +0000 (UTC)
X-UUID: 203e6e9241554a088f4db1757d32f1b7-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5wwx9zI1tNRihK2T3I1D2qJUFCK1MtGL2mDXTtoZpp8=; 
 b=VgznuY2lEDk/TQh0Moc4gZ6TFqXdF9AB69olMhdi0x8V5gILcVQIxenSJOSV/W/Jw1GoivQ25cIO57D/fiGTynCFP4SK0HidvqtAncp9auIfGpeZSefLTl6bSZQpTRQSail3nNVhNFodftubJR+GpsQawUXYBIknsxopjSzfpZA=;
X-UUID: 203e6e9241554a088f4db1757d32f1b7-20200105
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 387808072; Sun, 05 Jan 2020 18:46:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:06 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:03 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 03/19] iommu/mediatek: Extend larb_remap to larb_remap[2]
Date: Sun, 5 Jan 2020 18:45:07 +0800
Message-ID: <20200105104523.31006-4-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Cui Zhang <zhang.cui@mediatek.com>, linux-arm-kernel@lists.infradead.org
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

For more than one IOMMUs, they are corresponding to different
smi_larb id, so we need to extend larb_remap to larb_remap[2]
to distinguish it by index.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 ++++----
 drivers/iommu/mtk_iommu.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 09192edef1f7..f2d953fc09df 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -245,7 +245,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	fault_larb = F_MMU_INT_ID_LARB_ID(regval);
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 
-	fault_larb = data->plat_data->larbid_remap[fault_larb];
+	fault_larb = data->plat_data->larbid_remap[data->m4u_id][fault_larb];
 
 	if (report_iommu_fault(&dom->domain, data->dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
@@ -782,7 +782,7 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 };
 
 static const struct mtk_iommu_plat_data mt8173_data = {
@@ -790,13 +790,13 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.reset_axi    = true,
-	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 };
 
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
-	.larbid_remap = {0, 4, 5, 6, 7, 2, 3, 1},
+	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
 };
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index b4bd76548615..c585811a957c 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -43,7 +43,7 @@ struct mtk_iommu_plat_data {
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
 	u32                 m4u1_mask;
-	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
+	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
