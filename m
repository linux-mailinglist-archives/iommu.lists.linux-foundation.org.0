Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF592F110C
	for <lists.iommu@lfdr.de>; Mon, 11 Jan 2021 12:21:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5DB71204B0;
	Mon, 11 Jan 2021 11:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOwUzHuAkhSd; Mon, 11 Jan 2021 11:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B064207EF;
	Mon, 11 Jan 2021 11:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B61BC013A;
	Mon, 11 Jan 2021 11:20:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1093C013A
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 11:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 89A1D85C95
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 11:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5MioMGRnOIy for <iommu@lists.linux-foundation.org>;
 Mon, 11 Jan 2021 11:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC6BA85B11
 for <iommu@lists.linux-foundation.org>; Mon, 11 Jan 2021 11:20:53 +0000 (UTC)
X-UUID: ba521d3d7e914c36839252e4e42c7a31-20210111
X-UUID: ba521d3d7e914c36839252e4e42c7a31-20210111
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1316402553; Mon, 11 Jan 2021 19:20:51 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:20:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:20:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 08/33] iommu/mediatek: Use the common mtk-memory-port.h
Date: Mon, 11 Jan 2021 19:18:49 +0800
Message-ID: <20210111111914.22211-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
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

Use the common memory header(larb-port) in the source code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/mtk_iommu.c  | 7 -------
 drivers/iommu/mtk_iommu.h  | 1 +
 drivers/memory/mtk-smi.c   | 1 +
 include/soc/mediatek/smi.h | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 86ab577c9520..f594971dbeb2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -103,13 +103,6 @@
 
 #define MTK_PROTECT_PA_ALIGN			256
 
-/*
- * Get the local arbiter ID and the portid within the larb arbiter
- * from mtk_m4u_id which is defined by MTK_M4U_ID.
- */
-#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
-#define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
-
 #define HAS_4GB_MODE			BIT(0)
 /* HW will use the EMI clock if there isn't the "bclk". */
 #define HAS_BCLK			BIT(1)
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index df32b3e3408b..c1584dea66cb 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -17,6 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-memory-port.h>
 
 #define MTK_LARB_COM_MAX	8
 #define MTK_LARB_SUBCOM_MAX	4
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index ac350f8d1e20..89f92fa2afa5 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -15,6 +15,7 @@
 #include <linux/pm_runtime.h>
 #include <soc/mediatek/smi.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
+#include <dt-bindings/memory/mtk-memory-port.h>
 
 /* mt8173 */
 #define SMI_LARB_MMU_EN		0xf00
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 5a34b87d89e3..9371bf572ab8 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -11,8 +11,6 @@
 
 #ifdef CONFIG_MTK_SMI
 
-#define MTK_LARB_NR_MAX		16
-
 #define MTK_SMI_MMU_EN(port)	BIT(port)
 
 struct mtk_smi_larb_iommu {
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
