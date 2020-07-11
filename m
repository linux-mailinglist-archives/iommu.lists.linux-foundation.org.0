Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D129B21C2AA
	for <lists.iommu@lfdr.de>; Sat, 11 Jul 2020 08:50:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B59C88334;
	Sat, 11 Jul 2020 06:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DNvCxQhy-jx; Sat, 11 Jul 2020 06:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FC8B88406;
	Sat, 11 Jul 2020 06:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18ACCC016F;
	Sat, 11 Jul 2020 06:50:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46C90C016F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 96A2488BC8
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SF+19nhQKyg for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 06:50:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id C941288A7F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:50:32 +0000 (UTC)
X-UUID: dadc81a768eb404dacf7362a53fb9cf9-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3FCHXsk0v/+mx639lcY+QeeKZChMx1+mN+luSHVlepA=; 
 b=J+PRaUn6Y7xNMn9jaUTf8uImTnbMtVjn2ad4urjTyLAa2277MLJZWxaQHH6xZj/VAk20CRaCC8DvGEjzZ0rGEOz77A9PMZsJhbKg/0x/55trDQMc9L//ZQzs0hhiy4wN7XbajNdJKgLOCSAqOjCtAobhRoRlv1gCgXf/lvV/9y8=;
X-UUID: dadc81a768eb404dacf7362a53fb9cf9-20200711
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 801109024; Sat, 11 Jul 2020 14:50:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:50:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:50:26 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 05/21] iommu/mediatek: Use the common mtk-smi-larb-port.h
Date: Sat, 11 Jul 2020 14:48:30 +0800
Message-ID: <20200711064846.16007-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
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

Use the common larb-port header in the source code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c  | 7 -------
 drivers/iommu/mtk_iommu.h  | 1 +
 drivers/memory/mtk-smi.c   | 1 +
 include/soc/mediatek/smi.h | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 59e5a62a34db..a8d8a874a209 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -101,13 +101,6 @@
 
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
index 214898578026..1a087af50a4e 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -16,6 +16,7 @@
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define MTK_LARB_COM_MAX	8
 #define MTK_LARB_SUBCOM_MAX	4
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index a113e811faab..f6516921287f 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
 
 /* mt8173 */
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
