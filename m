Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE52D3C9D
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 09:02:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E00DC86CCF;
	Wed,  9 Dec 2020 08:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PuplmMyH-04b; Wed,  9 Dec 2020 08:02:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25B6686DB1;
	Wed,  9 Dec 2020 08:02:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 112F0C013B;
	Wed,  9 Dec 2020 08:02:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDD8FC013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B7521877CB
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FX3AfOSIkk2s for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 08:02:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by hemlock.osuosl.org (Postfix) with ESMTP id 14C65877CA
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:02:00 +0000 (UTC)
X-UUID: bda078e12a65473a8c6ec9539b6e132c-20201209
X-UUID: bda078e12a65473a8c6ec9539b6e132c-20201209
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1960935038; Wed, 09 Dec 2020 16:01:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:01:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:01:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 04/27] dt-bindings: memory: mediatek: Add domain definition
Date: Wed, 9 Dec 2020 16:00:39 +0800
Message-ID: <20201209080102.26626-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
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

In the latest SoC, there are several HW IP require a sepecial iova
range, mainly CCU and VPU has this requirement. Take CCU as a example,
CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).

In this patch we add a domain definition for the special port. In the
example of CCU, If we preassign CCU port in domain1, then iommu driver
will prepare a independent iommu domain of the special iova range for it,
then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
range.

This is a preparing patch for multi-domain support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
index 7d64103209af..2d4c973c174f 100644
--- a/include/dt-bindings/memory/mtk-smi-larb-port.h
+++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
@@ -7,9 +7,16 @@
 #define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
 
 #define MTK_LARB_NR_MAX			32
+#define MTK_M4U_DOM_NR_MAX		8
+
+#define MTK_M4U_DOM_ID(domid, larb, port)	\
+	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
+
+/* The default dom id is 0. */
+#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
+#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
 
 #endif
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
