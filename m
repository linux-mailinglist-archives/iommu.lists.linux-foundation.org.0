Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9533544948
	for <lists.iommu@lfdr.de>; Thu,  9 Jun 2022 12:40:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57AED40158;
	Thu,  9 Jun 2022 10:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahmX3I_80wdT; Thu,  9 Jun 2022 10:40:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 438D440BFD;
	Thu,  9 Jun 2022 10:40:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21946C002D;
	Thu,  9 Jun 2022 10:40:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4A4CC002D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jun 2022 10:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95A9E6101A
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jun 2022 10:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEgIi5nfjlFi for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jun 2022 10:40:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A28BE60E82
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jun 2022 10:40:11 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0401F66017C6;
 Thu,  9 Jun 2022 11:40:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654771209;
 bh=GX0txyd0JJ2fw10K575GVaUiFEMtDFJAGpNRUdkYnN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6XLvLR1v9PF6omuHiRlTXNk0cw3A3B/9lkmvkdHbxM6OfhBOcaQ45XB67DEp8OoJ
 ipLffPjj7VQsGkR0XDT0PG7RnEoXxJUpS8mCatNcvs3gYndNGX8hJVa5gL4jiSKSH9
 TU/B5ET7IrbG2+8T/T4I6SwBNOGKkbavjAKISRIPD7hQiBAm1wleh9oTlb/Vdek+OK
 5Sb8Jhve6ZmIynp1l19a7woNzX8WEhd0YgXkY5/MuZ4qO3+oP5W4kzsnDo57Qm7Qyg
 CaypPBraprsn9Qlp20aQwRiCo+PnwEeqAdCtLkNrvBDdLRK+BkdPfL3Nv0pEO4PUWz
 8vbhRMHO3EI1A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Subject: [PATCH v3 1/3] dt-bindings: mediatek: Add bindings for MT6795 M4U
Date: Thu,  9 Jun 2022 12:39:59 +0200
Message-Id: <20220609104001.97753-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
References: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, martin.botka@somainline.org,
 paul.bouchara@somainline.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, will@kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iommu/mediatek,iommu.yaml        |  4 +
 include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index d5e3272a54e8..20902c387520 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -73,6 +73,7 @@ properties:
           - mediatek,mt2701-m4u  # generation one
           - mediatek,mt2712-m4u  # generation two
           - mediatek,mt6779-m4u  # generation two
+          - mediatek,mt6795-m4u  # generation two
           - mediatek,mt8167-m4u  # generation two
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
@@ -128,6 +129,7 @@ properties:
       dt-binding/memory/mt2701-larb-port.h for mt2701 and mt7623,
       dt-binding/memory/mt2712-larb-port.h for mt2712,
       dt-binding/memory/mt6779-larb-port.h for mt6779,
+      dt-binding/memory/mt6795-larb-port.h for mt6795,
       dt-binding/memory/mt8167-larb-port.h for mt8167,
       dt-binding/memory/mt8173-larb-port.h for mt8173,
       dt-binding/memory/mt8183-larb-port.h for mt8183,
@@ -152,6 +154,7 @@ allOf:
             enum:
               - mediatek,mt2701-m4u
               - mediatek,mt2712-m4u
+              - mediatek,mt6795-m4u
               - mediatek,mt8173-m4u
               - mediatek,mt8186-iommu-mm
               - mediatek,mt8192-m4u
@@ -181,6 +184,7 @@ allOf:
           contains:
             enum:
               - mediatek,mt2712-m4u
+              - mediatek,mt6795-m4u
               - mediatek,mt8173-m4u
 
     then:
diff --git a/include/dt-bindings/memory/mt6795-larb-port.h b/include/dt-bindings/memory/mt6795-larb-port.h
new file mode 100644
index 000000000000..223aca8fd350
--- /dev/null
+++ b/include/dt-bindings/memory/mt6795-larb-port.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 Collabora Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_MEMORY_MT6795_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT6795_LARB_PORT_H_
+
+#include <dt-bindings/memory/mtk-memory-port.h>
+
+#define M4U_LARB0_ID			0
+#define M4U_LARB1_ID			1
+#define M4U_LARB2_ID			2
+#define M4U_LARB3_ID			3
+#define M4U_LARB4_ID			4
+#define M4U_LARB5_ID			5
+
+/* larb0 */
+#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
+#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 1)
+#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 2)
+#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 3)
+#define M4U_PORT_DISP_OVL1		MTK_M4U_ID(M4U_LARB0_ID, 4)
+#define M4U_PORT_DISP_RDMA2		MTK_M4U_ID(M4U_LARB0_ID, 5)
+#define M4U_PORT_DISP_WDMA1		MTK_M4U_ID(M4U_LARB0_ID, 6)
+#define M4U_PORT_DISP_OD_R		MTK_M4U_ID(M4U_LARB0_ID, 7)
+#define M4U_PORT_DISP_OD_W		MTK_M4U_ID(M4U_LARB0_ID, 8)
+#define M4U_PORT_MDP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 9)
+#define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 10)
+#define M4U_PORT_MDP_WDMA		MTK_M4U_ID(M4U_LARB0_ID, 11)
+#define M4U_PORT_MDP_WROT0		MTK_M4U_ID(M4U_LARB0_ID, 12)
+#define M4U_PORT_MDP_WROT1		MTK_M4U_ID(M4U_LARB0_ID, 13)
+
+/* larb1 */
+#define M4U_PORT_VDEC_MC		MTK_M4U_ID(M4U_LARB1_ID, 0)
+#define M4U_PORT_VDEC_PP		MTK_M4U_ID(M4U_LARB1_ID, 1)
+#define M4U_PORT_VDEC_UFO		MTK_M4U_ID(M4U_LARB1_ID, 2)
+#define M4U_PORT_VDEC_VLD		MTK_M4U_ID(M4U_LARB1_ID, 3)
+#define M4U_PORT_VDEC_VLD2		MTK_M4U_ID(M4U_LARB1_ID, 4)
+#define M4U_PORT_VDEC_AVC_MV		MTK_M4U_ID(M4U_LARB1_ID, 5)
+#define M4U_PORT_VDEC_PRED_RD		MTK_M4U_ID(M4U_LARB1_ID, 6)
+#define M4U_PORT_VDEC_PRED_WR		MTK_M4U_ID(M4U_LARB1_ID, 7)
+#define M4U_PORT_VDEC_PPWRAP		MTK_M4U_ID(M4U_LARB1_ID, 8)
+
+/* larb2 */
+#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB2_ID, 0)
+#define M4U_PORT_CAM_RRZO		MTK_M4U_ID(M4U_LARB2_ID, 1)
+#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB2_ID, 2)
+#define M4U_PORT_CAM_LCSO		MTK_M4U_ID(M4U_LARB2_ID, 3)
+#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB2_ID, 4)
+#define M4U_PORT_CAM_IMGO_S		MTK_M4U_ID(M4U_LARB2_ID, 5)
+#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB2_ID, 6)
+#define M4U_PORT_CAM_LSCI_D		MTK_M4U_ID(M4U_LARB2_ID, 7)
+#define M4U_PORT_CAM_BPCI		MTK_M4U_ID(M4U_LARB2_ID, 8)
+#define M4U_PORT_CAM_BPCI_D		MTK_M4U_ID(M4U_LARB2_ID, 9)
+#define M4U_PORT_CAM_UFDI		MTK_M4U_ID(M4U_LARB2_ID, 10)
+#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB2_ID, 11)
+#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB2_ID, 12)
+#define M4U_PORT_CAM_IMG3O		MTK_M4U_ID(M4U_LARB2_ID, 13)
+#define M4U_PORT_CAM_VIPI		MTK_M4U_ID(M4U_LARB2_ID, 14)
+#define M4U_PORT_CAM_VIP2I		MTK_M4U_ID(M4U_LARB2_ID, 15)
+#define M4U_PORT_CAM_VIP3I		MTK_M4U_ID(M4U_LARB2_ID, 16)
+#define M4U_PORT_CAM_LCEI		MTK_M4U_ID(M4U_LARB2_ID, 17)
+#define M4U_PORT_CAM_RB			MTK_M4U_ID(M4U_LARB2_ID, 18)
+#define M4U_PORT_CAM_RP			MTK_M4U_ID(M4U_LARB2_ID, 19)
+#define M4U_PORT_CAM_WR			MTK_M4U_ID(M4U_LARB2_ID, 20)
+
+/* larb3 */
+#define M4U_PORT_VENC_RCPU		MTK_M4U_ID(M4U_LARB3_ID, 0)
+#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB3_ID, 1)
+#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 2)
+#define M4U_PORT_VENC_SV_COMV		MTK_M4U_ID(M4U_LARB3_ID, 3)
+#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB3_ID, 4)
+#define M4U_PORT_JPGENC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 5)
+#define M4U_PORT_REMDC_SDMA		MTK_M4U_ID(M4U_LARB3_ID, 6)
+#define M4U_PORT_REMDC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 7)
+#define M4U_PORT_JPGENC_RDMA		MTK_M4U_ID(M4U_LARB3_ID, 8)
+#define M4U_PORT_JPGENC_SDMA		MTK_M4U_ID(M4U_LARB3_ID, 9)
+#define M4U_PORT_JPGDEC_WDMA		MTK_M4U_ID(M4U_LARB3_ID, 10)
+#define M4U_PORT_JPGDEC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 11)
+#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB3_ID, 12)
+#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB3_ID, 13)
+#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB3_ID, 14)
+#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB3_ID, 15)
+#define M4U_PORT_REMDC_WDMA		MTK_M4U_ID(M4U_LARB3_ID, 16)
+#define M4U_PORT_VENC_NBM_RDMA		MTK_M4U_ID(M4U_LARB3_ID, 17)
+#define M4U_PORT_VENC_NBM_WDMA		MTK_M4U_ID(M4U_LARB3_ID, 18)
+
+/* larb4 */
+#define M4U_PORT_MJC_MV_RD		MTK_M4U_ID(M4U_LARB4_ID, 0)
+#define M4U_PORT_MJC_MV_WR		MTK_M4U_ID(M4U_LARB4_ID, 1)
+#define M4U_PORT_MJC_DMA_RD		MTK_M4U_ID(M4U_LARB4_ID, 2)
+#define M4U_PORT_MJC_DMA_WR		MTK_M4U_ID(M4U_LARB4_ID, 3)
+
+#endif
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
