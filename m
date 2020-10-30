Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F22A00EB
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 10:13:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B41C87353;
	Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5oMM2m5Nd9O; Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C04687343;
	Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1049BC0051;
	Fri, 30 Oct 2020 09:13:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D858C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 891598609F
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OqPnrtf5BXrv for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 09:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id BCF9584DB8
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 09:13:51 +0000 (UTC)
X-UUID: 99d6ef79b9f542179138382e5e196829-20201030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wS05c32CeOcsELtrfSXV0XioPOrUrgRETIwe251DuTo=; 
 b=TtWVmSOFFMQM+WmiJDPkjBMQXVp5IezBZBkWMi36OYKE/qYHRHsfGaHiPzFSaVGAsc+Kz6MH4ehHJx3/7SIwNdQRAdzfl8lyqm1qwKRcCZyv78PxszVBW+QOqqfotmD5IRE2X4vGlR1Sw/DEiu8GSTzRX60BHroNRWt/RtIla9c=;
X-UUID: 99d6ef79b9f542179138382e5e196829-20201030
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1261586912; Fri, 30 Oct 2020 17:13:48 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Oct 2020 17:13:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Oct 2020 17:13:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 3/3] memory: mtk-smi: Add mt8192 support
Date: Fri, 30 Oct 2020 17:12:54 +0800
Message-ID: <20201030091254.26382-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201030091254.26382-1-yong.wu@mediatek.com>
References: <20201030091254.26382-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

Add mt8192 smi support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 691e4c344cf8..ac350f8d1e20 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -268,6 +268,10 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
 				      /* IPU0 | IPU1 | CCU */
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+};
+
 static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{
 		.compatible = "mediatek,mt8167-smi-larb",
@@ -293,6 +297,10 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 		.compatible = "mediatek,mt8183-smi-larb",
 		.data = &mtk_smi_larb_mt8183
 	},
+	{
+		.compatible = "mediatek,mt8192-smi-larb",
+		.data = &mtk_smi_larb_mt8192
+	},
 	{}
 };
 
@@ -432,6 +440,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 		    F_MMU1_LARB(7),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
+	.gen      = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
+		    F_MMU1_LARB(6),
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{
 		.compatible = "mediatek,mt8173-smi-common",
@@ -457,6 +472,10 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 		.compatible = "mediatek,mt8183-smi-common",
 		.data = &mtk_smi_common_mt8183,
 	},
+	{
+		.compatible = "mediatek,mt8192-smi-common",
+		.data = &mtk_smi_common_mt8192,
+	},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
