Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B4517E35
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 09:15:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70411416B7;
	Tue,  3 May 2022 07:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2e9E6suPdDs; Tue,  3 May 2022 07:15:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E03E7416B6;
	Tue,  3 May 2022 07:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5339C002D;
	Tue,  3 May 2022 07:15:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50485C002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D3BA824CE
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TYS-VDuwxhI for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 07:15:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B110E81D3A
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:15:18 +0000 (UTC)
X-UUID: 2d1401b8b02e4dce9ca0e8187a52336d-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a9e0c9f2-ff76-433c-885f-7f8b7f54e755, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:37b24ac7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2d1401b8b02e4dce9ca0e8187a52336d-20220503
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1109114952; Tue, 03 May 2022 15:15:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:15:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:15:11 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v7 03/36] dt-bindings: mediatek: mt8186: Add binding for MM
 iommu
Date: Tue, 3 May 2022 15:13:54 +0800
Message-ID: <20220503071427.2285-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, libo.kang@mediatek.com,
 xueqi.zhang@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, yen-chang.chen@mediatek.com,
 chengci.xu@mediatek.com, iommu@lists.linux-foundation.org,
 yf.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com,
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Add mt8186 iommu binding. "-mm" means the iommu is for Multimedia.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        |   4 +
 .../dt-bindings/memory/mt8186-memory-port.h   | 217 ++++++++++++++++++
 2 files changed, 221 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8186-memory-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index eed59ec00e78..91a3629a8e6e 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -76,6 +76,7 @@ properties:
           - mediatek,mt8167-m4u  # generation two
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
+          - mediatek,mt8186-iommu-mm         # generation two
           - mediatek,mt8192-m4u  # generation two
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
@@ -122,6 +123,7 @@ properties:
       dt-binding/memory/mt8167-larb-port.h for mt8167,
       dt-binding/memory/mt8173-larb-port.h for mt8173,
       dt-binding/memory/mt8183-larb-port.h for mt8183,
+      dt-binding/memory/mt8186-memory-port.h for mt8186,
       dt-binding/memory/mt8192-larb-port.h for mt8192.
       dt-binding/memory/mt8195-memory-port.h for mt8195.
 
@@ -143,6 +145,7 @@ allOf:
               - mediatek,mt2701-m4u
               - mediatek,mt2712-m4u
               - mediatek,mt8173-m4u
+              - mediatek,mt8186-iommu-mm
               - mediatek,mt8192-m4u
               - mediatek,mt8195-iommu-vdo
               - mediatek,mt8195-iommu-vpp
@@ -155,6 +158,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - mediatek,mt8186-iommu-mm
             - mediatek,mt8192-m4u
             - mediatek,mt8195-iommu-vdo
             - mediatek,mt8195-iommu-vpp
diff --git a/include/dt-bindings/memory/mt8186-memory-port.h b/include/dt-bindings/memory/mt8186-memory-port.h
new file mode 100644
index 000000000000..2bc6e4433048
--- /dev/null
+++ b/include/dt-bindings/memory/mt8186-memory-port.h
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ *
+ * Author: Anan Sun <anan.sun@mediatek.com>
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef _DT_BINDINGS_MEMORY_MT8186_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8186_LARB_PORT_H_
+
+#include <dt-bindings/memory/mtk-memory-port.h>
+
+/*
+ * MM IOMMU supports 16GB dma address. We separate it to four ranges:
+ * 0 ~ 4G; 4G ~ 8G; 8G ~ 12G; 12G ~ 16G, we could adjust these masters
+ * locate in anyone region. BUT:
+ * a) Make sure all the ports inside a larb are in one range.
+ * b) The iova of any master can NOT cross the 4G/8G/12G boundary.
+ *
+ * This is the suggested mapping in this SoC:
+ *
+ * modules    dma-address-region	larbs-ports
+ * disp         0 ~ 4G                  larb0/1/2
+ * vcodec      4G ~ 8G                  larb4/7
+ * cam/mdp     8G ~ 12G                 the other larbs.
+ * N/A         12G ~ 16G
+ * CCU0   0x24000_0000 ~ 0x243ff_ffff   larb13: port 9/10
+ * CCU1   0x24400_0000 ~ 0x247ff_ffff   larb14: port 4/5
+ */
+
+/* MM IOMMU ports */
+/* LARB 0 -- MMSYS */
+#define IOMMU_PORT_L0_DISP_POSTMASK0	MTK_M4U_ID(0, 0)
+#define IOMMU_PORT_L0_REVERSED		MTK_M4U_ID(0, 1)
+#define IOMMU_PORT_L0_OVL_RDMA0		MTK_M4U_ID(0, 2)
+#define IOMMU_PORT_L0_DISP_FAKE0	MTK_M4U_ID(0, 3)
+
+/* LARB 1 -- MMSYS */
+#define IOMMU_PORT_L1_DISP_RDMA1	MTK_M4U_ID(1, 0)
+#define IOMMU_PORT_L1_OVL_2L_RDMA0	MTK_M4U_ID(1, 1)
+#define IOMMU_PORT_L1_DISP_RDMA0	MTK_M4U_ID(1, 2)
+#define IOMMU_PORT_L1_DISP_WDMA0	MTK_M4U_ID(1, 3)
+#define IOMMU_PORT_L1_DISP_FAKE1	MTK_M4U_ID(1, 4)
+
+/* LARB 2 -- MMSYS */
+#define IOMMU_PORT_L2_MDP_RDMA0		MTK_M4U_ID(2, 0)
+#define IOMMU_PORT_L2_MDP_RDMA1		MTK_M4U_ID(2, 1)
+#define IOMMU_PORT_L2_MDP_WROT0		MTK_M4U_ID(2, 2)
+#define IOMMU_PORT_L2_MDP_WROT1		MTK_M4U_ID(2, 3)
+#define IOMMU_PORT_L2_DISP_FAKE0	MTK_M4U_ID(2, 4)
+
+/* LARB 4 -- VDEC */
+#define IOMMU_PORT_L4_HW_VDEC_MC_EXT		MTK_M4U_ID(4, 0)
+#define IOMMU_PORT_L4_HW_VDEC_UFO_EXT		MTK_M4U_ID(4, 1)
+#define IOMMU_PORT_L4_HW_VDEC_PP_EXT		MTK_M4U_ID(4, 2)
+#define IOMMU_PORT_L4_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(4, 3)
+#define IOMMU_PORT_L4_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(4, 4)
+#define IOMMU_PORT_L4_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(4, 5)
+#define IOMMU_PORT_L4_HW_VDEC_TILE_EXT		MTK_M4U_ID(4, 6)
+#define IOMMU_PORT_L4_HW_VDEC_VLD_EXT		MTK_M4U_ID(4, 7)
+#define IOMMU_PORT_L4_HW_VDEC_VLD2_EXT		MTK_M4U_ID(4, 8)
+#define IOMMU_PORT_L4_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(4, 9)
+#define IOMMU_PORT_L4_HW_VDEC_UFO_ENC_EXT	MTK_M4U_ID(4, 10)
+#define IOMMU_PORT_L4_HW_VDEC_RG_CTRL_DMA_EXT	MTK_M4U_ID(4, 11)
+#define IOMMU_PORT_L4_HW_MINI_MDP_R0_EXT	MTK_M4U_ID(4, 12)
+#define IOMMU_PORT_L4_HW_MINI_MDP_W0_EXT	MTK_M4U_ID(4, 13)
+
+/* LARB 7 -- VENC */
+#define IOMMU_PORT_L7_VENC_RCPU		MTK_M4U_ID(7, 0)
+#define IOMMU_PORT_L7_VENC_REC		MTK_M4U_ID(7, 1)
+#define IOMMU_PORT_L7_VENC_BSDMA	MTK_M4U_ID(7, 2)
+#define IOMMU_PORT_L7_VENC_SV_COMV	MTK_M4U_ID(7, 3)
+#define IOMMU_PORT_L7_VENC_RD_COMV	MTK_M4U_ID(7, 4)
+#define IOMMU_PORT_L7_VENC_CUR_LUMA	MTK_M4U_ID(7, 5)
+#define IOMMU_PORT_L7_VENC_CUR_CHROMA	MTK_M4U_ID(7, 6)
+#define IOMMU_PORT_L7_VENC_REF_LUMA	MTK_M4U_ID(7, 7)
+#define IOMMU_PORT_L7_VENC_REF_CHROMA	MTK_M4U_ID(7, 8)
+#define IOMMU_PORT_L7_JPGENC_Y_RDMA	MTK_M4U_ID(7, 9)
+#define IOMMU_PORT_L7_JPGENC_C_RDMA	MTK_M4U_ID(7, 10)
+#define IOMMU_PORT_L7_JPGENC_Q_TABLE	MTK_M4U_ID(7, 11)
+#define IOMMU_PORT_L7_JPGENC_BSDMA	MTK_M4U_ID(7, 12)
+
+/* LARB 8 -- WPE */
+#define IOMMU_PORT_L8_WPE_RDMA_0	MTK_M4U_ID(8, 0)
+#define IOMMU_PORT_L8_WPE_RDMA_1	MTK_M4U_ID(8, 1)
+#define IOMMU_PORT_L8_WPE_WDMA_0	MTK_M4U_ID(8, 2)
+
+/* LARB 9 -- IMG-1 */
+#define IOMMU_PORT_L9_IMG_IMGI_D1	MTK_M4U_ID(9, 0)
+#define IOMMU_PORT_L9_IMG_IMGBI_D1	MTK_M4U_ID(9, 1)
+#define IOMMU_PORT_L9_IMG_DMGI_D1	MTK_M4U_ID(9, 2)
+#define IOMMU_PORT_L9_IMG_DEPI_D1	MTK_M4U_ID(9, 3)
+#define IOMMU_PORT_L9_IMG_LCE_D1	MTK_M4U_ID(9, 4)
+#define IOMMU_PORT_L9_IMG_SMTI_D1	MTK_M4U_ID(9, 5)
+#define IOMMU_PORT_L9_IMG_SMTO_D2	MTK_M4U_ID(9, 6)
+#define IOMMU_PORT_L9_IMG_SMTO_D1	MTK_M4U_ID(9, 7)
+#define IOMMU_PORT_L9_IMG_CRZO_D1	MTK_M4U_ID(9, 8)
+#define IOMMU_PORT_L9_IMG_IMG3O_D1	MTK_M4U_ID(9, 9)
+#define IOMMU_PORT_L9_IMG_VIPI_D1	MTK_M4U_ID(9, 10)
+#define IOMMU_PORT_L9_IMG_SMTI_D5	MTK_M4U_ID(9, 11)
+#define IOMMU_PORT_L9_IMG_TIMGO_D1	MTK_M4U_ID(9, 12)
+#define IOMMU_PORT_L9_IMG_UFBC_W0	MTK_M4U_ID(9, 13)
+#define IOMMU_PORT_L9_IMG_UFBC_R0	MTK_M4U_ID(9, 14)
+#define IOMMU_PORT_L9_IMG_WPE_RDMA1	MTK_M4U_ID(9, 15)
+#define IOMMU_PORT_L9_IMG_WPE_RDMA0	MTK_M4U_ID(9, 16)
+#define IOMMU_PORT_L9_IMG_WPE_WDMA	MTK_M4U_ID(9, 17)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA0	MTK_M4U_ID(9, 18)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA1	MTK_M4U_ID(9, 19)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA2	MTK_M4U_ID(9, 20)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA3	MTK_M4U_ID(9, 21)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA4	MTK_M4U_ID(9, 22)
+#define IOMMU_PORT_L9_IMG_MFB_RDMA5	MTK_M4U_ID(9, 23)
+#define IOMMU_PORT_L9_IMG_MFB_WDMA0	MTK_M4U_ID(9, 24)
+#define IOMMU_PORT_L9_IMG_MFB_WDMA1	MTK_M4U_ID(9, 25)
+#define IOMMU_PORT_L9_IMG_RESERVE6	MTK_M4U_ID(9, 26)
+#define IOMMU_PORT_L9_IMG_RESERVE7	MTK_M4U_ID(9, 27)
+#define IOMMU_PORT_L9_IMG_RESERVE8	MTK_M4U_ID(9, 28)
+
+/* LARB 11 -- IMG-2 */
+#define IOMMU_PORT_L11_IMG_IMGI_D1	MTK_M4U_ID(11, 0)
+#define IOMMU_PORT_L11_IMG_IMGBI_D1	MTK_M4U_ID(11, 1)
+#define IOMMU_PORT_L11_IMG_DMGI_D1	MTK_M4U_ID(11, 2)
+#define IOMMU_PORT_L11_IMG_DEPI_D1	MTK_M4U_ID(11, 3)
+#define IOMMU_PORT_L11_IMG_LCE_D1	MTK_M4U_ID(11, 4)
+#define IOMMU_PORT_L11_IMG_SMTI_D1	MTK_M4U_ID(11, 5)
+#define IOMMU_PORT_L11_IMG_SMTO_D2	MTK_M4U_ID(11, 6)
+#define IOMMU_PORT_L11_IMG_SMTO_D1	MTK_M4U_ID(11, 7)
+#define IOMMU_PORT_L11_IMG_CRZO_D1	MTK_M4U_ID(11, 8)
+#define IOMMU_PORT_L11_IMG_IMG3O_D1	MTK_M4U_ID(11, 9)
+#define IOMMU_PORT_L11_IMG_VIPI_D1	MTK_M4U_ID(11, 10)
+#define IOMMU_PORT_L11_IMG_SMTI_D5	MTK_M4U_ID(11, 11)
+#define IOMMU_PORT_L11_IMG_TIMGO_D1	MTK_M4U_ID(11, 12)
+#define IOMMU_PORT_L11_IMG_UFBC_W0	MTK_M4U_ID(11, 13)
+#define IOMMU_PORT_L11_IMG_UFBC_R0	MTK_M4U_ID(11, 14)
+#define IOMMU_PORT_L11_IMG_WPE_RDMA1	MTK_M4U_ID(11, 15)
+#define IOMMU_PORT_L11_IMG_WPE_RDMA0	MTK_M4U_ID(11, 16)
+#define IOMMU_PORT_L11_IMG_WPE_WDMA	MTK_M4U_ID(11, 17)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA0	MTK_M4U_ID(11, 18)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA1	MTK_M4U_ID(11, 19)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA2	MTK_M4U_ID(11, 20)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA3	MTK_M4U_ID(11, 21)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA4	MTK_M4U_ID(11, 22)
+#define IOMMU_PORT_L11_IMG_MFB_RDMA5	MTK_M4U_ID(11, 23)
+#define IOMMU_PORT_L11_IMG_MFB_WDMA0	MTK_M4U_ID(11, 24)
+#define IOMMU_PORT_L11_IMG_MFB_WDMA1	MTK_M4U_ID(11, 25)
+#define IOMMU_PORT_L11_IMG_RESERVE6	MTK_M4U_ID(11, 26)
+#define IOMMU_PORT_L11_IMG_RESERVE7	MTK_M4U_ID(11, 27)
+#define IOMMU_PORT_L11_IMG_RESERVE8	MTK_M4U_ID(11, 28)
+
+/* LARB 13 -- CAM */
+#define IOMMU_PORT_L13_CAM_MRAWI	MTK_M4U_ID(13, 0)
+#define IOMMU_PORT_L13_CAM_MRAWO_0	MTK_M4U_ID(13, 1)
+#define IOMMU_PORT_L13_CAM_MRAWO_1	MTK_M4U_ID(13, 2)
+#define IOMMU_PORT_L13_CAM_CAMSV_4	MTK_M4U_ID(13, 6)
+#define IOMMU_PORT_L13_CAM_CAMSV_5	MTK_M4U_ID(13, 7)
+#define IOMMU_PORT_L13_CAM_CAMSV_6	MTK_M4U_ID(13, 8)
+#define IOMMU_PORT_L13_CAM_CCUI		MTK_M4U_ID(13, 9)
+#define IOMMU_PORT_L13_CAM_CCUO		MTK_M4U_ID(13, 10)
+#define IOMMU_PORT_L13_CAM_FAKE		MTK_M4U_ID(13, 11)
+
+/* LARB 14 -- CAM */
+#define IOMMU_PORT_L14_CAM_CCUI		MTK_M4U_ID(14, 4)
+#define IOMMU_PORT_L14_CAM_CCUO		MTK_M4U_ID(14, 5)
+
+/* LARB 16 -- RAW-A */
+#define IOMMU_PORT_L16_CAM_IMGO_R1_A	MTK_M4U_ID(16, 0)
+#define IOMMU_PORT_L16_CAM_RRZO_R1_A	MTK_M4U_ID(16, 1)
+#define IOMMU_PORT_L16_CAM_CQI_R1_A	MTK_M4U_ID(16, 2)
+#define IOMMU_PORT_L16_CAM_BPCI_R1_A	MTK_M4U_ID(16, 3)
+#define IOMMU_PORT_L16_CAM_YUVO_R1_A	MTK_M4U_ID(16, 4)
+#define IOMMU_PORT_L16_CAM_UFDI_R2_A	MTK_M4U_ID(16, 5)
+#define IOMMU_PORT_L16_CAM_RAWI_R2_A	MTK_M4U_ID(16, 6)
+#define IOMMU_PORT_L16_CAM_RAWI_R3_A	MTK_M4U_ID(16, 7)
+#define IOMMU_PORT_L16_CAM_AAO_R1_A	MTK_M4U_ID(16, 8)
+#define IOMMU_PORT_L16_CAM_AFO_R1_A	MTK_M4U_ID(16, 9)
+#define IOMMU_PORT_L16_CAM_FLKO_R1_A	MTK_M4U_ID(16, 10)
+#define IOMMU_PORT_L16_CAM_LCESO_R1_A	MTK_M4U_ID(16, 11)
+#define IOMMU_PORT_L16_CAM_CRZO_R1_A	MTK_M4U_ID(16, 12)
+#define IOMMU_PORT_L16_CAM_LTMSO_R1_A	MTK_M4U_ID(16, 13)
+#define IOMMU_PORT_L16_CAM_RSSO_R1_A	MTK_M4U_ID(16, 14)
+#define IOMMU_PORT_L16_CAM_AAHO_R1_A	MTK_M4U_ID(16, 15)
+#define IOMMU_PORT_L16_CAM_LSCI_R1_A	MTK_M4U_ID(16, 16)
+
+/* LARB 17 -- RAW-B */
+#define IOMMU_PORT_L17_CAM_IMGO_R1_B	MTK_M4U_ID(17, 0)
+#define IOMMU_PORT_L17_CAM_RRZO_R1_B	MTK_M4U_ID(17, 1)
+#define IOMMU_PORT_L17_CAM_CQI_R1_B	MTK_M4U_ID(17, 2)
+#define IOMMU_PORT_L17_CAM_BPCI_R1_B	MTK_M4U_ID(17, 3)
+#define IOMMU_PORT_L17_CAM_YUVO_R1_B	MTK_M4U_ID(17, 4)
+#define IOMMU_PORT_L17_CAM_UFDI_R2_B	MTK_M4U_ID(17, 5)
+#define IOMMU_PORT_L17_CAM_RAWI_R2_B	MTK_M4U_ID(17, 6)
+#define IOMMU_PORT_L17_CAM_RAWI_R3_B	MTK_M4U_ID(17, 7)
+#define IOMMU_PORT_L17_CAM_AAO_R1_B	MTK_M4U_ID(17, 8)
+#define IOMMU_PORT_L17_CAM_AFO_R1_B	MTK_M4U_ID(17, 9)
+#define IOMMU_PORT_L17_CAM_FLKO_R1_B	MTK_M4U_ID(17, 10)
+#define IOMMU_PORT_L17_CAM_LCESO_R1_B	MTK_M4U_ID(17, 11)
+#define IOMMU_PORT_L17_CAM_CRZO_R1_B	MTK_M4U_ID(17, 12)
+#define IOMMU_PORT_L17_CAM_LTMSO_R1_B	MTK_M4U_ID(17, 13)
+#define IOMMU_PORT_L17_CAM_RSSO_R1_B	MTK_M4U_ID(17, 14)
+#define IOMMU_PORT_L17_CAM_AAHO_R1_B	MTK_M4U_ID(17, 15)
+#define IOMMU_PORT_L17_CAM_LSCI_R1_B	MTK_M4U_ID(17, 16)
+
+/* LARB 19 -- IPE */
+#define IOMMU_PORT_L19_IPE_DVS_RDMA	MTK_M4U_ID(19, 0)
+#define IOMMU_PORT_L19_IPE_DVS_WDMA	MTK_M4U_ID(19, 1)
+#define IOMMU_PORT_L19_IPE_DVP_RDMA	MTK_M4U_ID(19, 2)
+#define IOMMU_PORT_L19_IPE_DVP_WDMA	MTK_M4U_ID(19, 3)
+
+/* LARB 20 -- IPE */
+#define IOMMU_PORT_L20_IPE_FDVT_RDA	MTK_M4U_ID(20, 0)
+#define IOMMU_PORT_L20_IPE_FDVT_RDB	MTK_M4U_ID(20, 1)
+#define IOMMU_PORT_L20_IPE_FDVT_WRA	MTK_M4U_ID(20, 2)
+#define IOMMU_PORT_L20_IPE_FDVT_WRB	MTK_M4U_ID(20, 3)
+#define IOMMU_PORT_L20_IPE_RSC_RDMA0	MTK_M4U_ID(20, 4)
+#define IOMMU_PORT_L20_IPE_RSC_WDMA	MTK_M4U_ID(20, 5)
+
+#endif
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
