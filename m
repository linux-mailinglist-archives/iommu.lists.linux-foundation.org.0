Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A827E215
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:08:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2CB4871AC;
	Wed, 30 Sep 2020 07:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MtxpHHpbnFpR; Wed, 30 Sep 2020 07:08:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FE19871DF;
	Wed, 30 Sep 2020 07:08:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FAD2C0051;
	Wed, 30 Sep 2020 07:08:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58AEDC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44A3E81C39
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q364tE+xu4mC for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id 602A6815E8
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:36 +0000 (UTC)
X-UUID: 9a46722c16154dc7aabc9bccced87120-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RXxpydUhOiDH5psuccLuJjNdd894eEQ6qDkPc6eppHU=; 
 b=TJnaMpUJpyHVQ4mN5eQMRtdTgoPRJBhmjgEFSTBGlJ3My9Ll9myz0GuvIi1EFbLwcSRRmKcloX2mSIfb3fnyzkoqwUcmd2rN5ozWwYwO8yvNTGsr48iI72b6CZmWXLCP+bf13coGhoKipmPfBPW2i+CpgKsiTuGZAopRU9b3qcY=;
X-UUID: 9a46722c16154dc7aabc9bccced87120-20200930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 859056950; Wed, 30 Sep 2020 15:08:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:08:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:08:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 07/24] iommu/mediatek: Use the common mtk-smi-larb-port.h
Date: Wed, 30 Sep 2020 15:06:30 +0800
Message-ID: <20200930070647.10188-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
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
index 785b228d39a6..fd8322ee4980 100644
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
index 122925dbe547..a2e2c844b96e 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -17,6 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define MTK_LARB_COM_MAX	8
 #define MTK_LARB_SUBCOM_MAX	4
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c21262502581..ec83f1ac48b1 100644
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
