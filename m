Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF99517E33
	for <lists.iommu@lfdr.de>; Tue,  3 May 2022 09:15:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1780581C58;
	Tue,  3 May 2022 07:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5N87UemfiyZY; Tue,  3 May 2022 07:15:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 73F4281D3A;
	Tue,  3 May 2022 07:15:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A8B6C007E;
	Tue,  3 May 2022 07:15:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA540C002D
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A0EA81C58
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYVYeR_rxijN for <iommu@lists.linux-foundation.org>;
 Tue,  3 May 2022 07:14:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65868824CE
 for <iommu@lists.linux-foundation.org>; Tue,  3 May 2022 07:14:58 +0000 (UTC)
X-UUID: 013d5f99642d4911b82e9c2ccbe6b54f-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:af4f1f26-c3e0-4fdd-a9d6-8bb48af3c82b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:80
X-CID-INFO: VERSION:1.1.4, REQID:af4f1f26-c3e0-4fdd-a9d6-8bb48af3c82b, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:80
X-CID-META: VersionHash:faefae9, CLOUDID:80af4ac7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:641a58b95193,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 013d5f99642d4911b82e9c2ccbe6b54f-20220503
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980105312; Tue, 03 May 2022 15:14:52 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:14:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 15:14:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:14:50 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v7 01/36] dt-bindings: mediatek: mt8195: Add binding for MM
 IOMMU
Date: Tue, 3 May 2022 15:13:52 +0800
Message-ID: <20220503071427.2285-2-yong.wu@mediatek.com>
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
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
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

This patch adds descriptions for mt8195 IOMMU which also use ARM
Short-Descriptor translation table format.

In mt8195, there are two smi-common HW and IOMMU, one is for vdo(video
output), the other is for vpp(video processing pipe). They connects
with different smi-larbs, then some setting(larbid_remap) is different.
Differentiate them with the compatible string.

Something like this:

    IOMMU(VDO)          IOMMU(VPP)
       |                   |
  SMI_COMMON_VDO      SMI_COMMON_VPP
  ---------------     ----------------
  |      |   ...      |      |     ...
larb0 larb2  ...    larb1 larb3    ...

Another change is that we have a new IOMMU that is for infra master like
PCIe and USB. The infra master don't have the larb and ports, thus we
rename the port header file to mt8195-memory-port.h rather than
mt8195-larb-port.h.

Also, the IOMMU is not only for MM, thus, we don't call it "m4u" which
means "MultiMedia Memory Management UNIT". thus, use the "iommu" as the
compatiable string.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iommu/mediatek,iommu.yaml        |   7 +
 .../dt-bindings/memory/mt8195-memory-port.h   | 390 ++++++++++++++++++
 2 files changed, 397 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8195-memory-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 97e8c471a5e8..2223408e91a9 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -77,6 +77,8 @@ properties:
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
           - mediatek,mt8192-m4u  # generation two
+          - mediatek,mt8195-iommu-vdo        # generation two
+          - mediatek,mt8195-iommu-vpp        # generation two
 
       - description: mt7623 generation one
         items:
@@ -120,6 +122,7 @@ properties:
       dt-binding/memory/mt8173-larb-port.h for mt8173,
       dt-binding/memory/mt8183-larb-port.h for mt8183,
       dt-binding/memory/mt8192-larb-port.h for mt8192.
+      dt-binding/memory/mt8195-memory-port.h for mt8195.
 
   power-domains:
     maxItems: 1
@@ -141,6 +144,8 @@ allOf:
               - mediatek,mt2712-m4u
               - mediatek,mt8173-m4u
               - mediatek,mt8192-m4u
+              - mediatek,mt8195-iommu-vdo
+              - mediatek,mt8195-iommu-vpp
 
     then:
       required:
@@ -151,6 +156,8 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8192-m4u
+            - mediatek,mt8195-iommu-vdo
+            - mediatek,mt8195-iommu-vpp
 
     then:
       required:
diff --git a/include/dt-bindings/memory/mt8195-memory-port.h b/include/dt-bindings/memory/mt8195-memory-port.h
new file mode 100644
index 000000000000..c10e8b61f1e8
--- /dev/null
+++ b/include/dt-bindings/memory/mt8195-memory-port.h
@@ -0,0 +1,390 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef _DT_BINDINGS_MEMORY_MT8195_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8195_LARB_PORT_H_
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
+ * disp         0 ~ 4G                  larb0/1/2/3
+ * vcodec      4G ~ 8G                  larb19/20/21/22/23/24
+ * cam/mdp     8G ~ 12G                 the other larbs.
+ * N/A         12G ~ 16G
+ * CCU0   0x24000_0000 ~ 0x243ff_ffff   larb18: port 0/1
+ * CCU1   0x24400_0000 ~ 0x247ff_ffff   larb18: port 2/3
+ *
+ * This SoC have two IOMMU HWs, this is the detailed connected information:
+ * iommu-vdo: larb0/2/5/7/9/10/11/13/17/19/21/24/25/28
+ * iommu-vpp: larb1/3/4/6/8/12/14/16/18/20/22/23/26/27
+ */
+
+/* MM IOMMU ports */
+/* larb0 */
+#define M4U_PORT_L0_DISP_RDMA0			MTK_M4U_ID(0, 0)
+#define M4U_PORT_L0_DISP_WDMA0			MTK_M4U_ID(0, 1)
+#define M4U_PORT_L0_DISP_OVL0_RDMA0		MTK_M4U_ID(0, 2)
+#define M4U_PORT_L0_DISP_OVL0_RDMA1		MTK_M4U_ID(0, 3)
+#define M4U_PORT_L0_DISP_OVL0_HDR		MTK_M4U_ID(0, 4)
+#define M4U_PORT_L0_DISP_FAKE0			MTK_M4U_ID(0, 5)
+
+/* larb1 */
+#define M4U_PORT_L1_DISP_RDMA0			MTK_M4U_ID(1, 0)
+#define M4U_PORT_L1_DISP_WDMA0			MTK_M4U_ID(1, 1)
+#define M4U_PORT_L1_DISP_OVL0_RDMA0		MTK_M4U_ID(1, 2)
+#define M4U_PORT_L1_DISP_OVL0_RDMA1		MTK_M4U_ID(1, 3)
+#define M4U_PORT_L1_DISP_OVL0_HDR		MTK_M4U_ID(1, 4)
+#define M4U_PORT_L1_DISP_FAKE0			MTK_M4U_ID(1, 5)
+
+/* larb2 */
+#define M4U_PORT_L2_MDP_RDMA0			MTK_M4U_ID(2, 0)
+#define M4U_PORT_L2_MDP_RDMA2			MTK_M4U_ID(2, 1)
+#define M4U_PORT_L2_MDP_RDMA4			MTK_M4U_ID(2, 2)
+#define M4U_PORT_L2_MDP_RDMA6			MTK_M4U_ID(2, 3)
+#define M4U_PORT_L2_DISP_FAKE1			MTK_M4U_ID(2, 4)
+
+/* larb3 */
+#define M4U_PORT_L3_MDP_RDMA1			MTK_M4U_ID(3, 0)
+#define M4U_PORT_L3_MDP_RDMA3			MTK_M4U_ID(3, 1)
+#define M4U_PORT_L3_MDP_RDMA5			MTK_M4U_ID(3, 2)
+#define M4U_PORT_L3_MDP_RDMA7			MTK_M4U_ID(3, 3)
+#define M4U_PORT_L3_HDR_DS			MTK_M4U_ID(3, 4)
+#define M4U_PORT_L3_HDR_ADL			MTK_M4U_ID(3, 5)
+#define M4U_PORT_L3_DISP_FAKE1			MTK_M4U_ID(3, 6)
+
+/* larb4 */
+#define M4U_PORT_L4_MDP_RDMA			MTK_M4U_ID(4, 0)
+#define M4U_PORT_L4_MDP_FG			MTK_M4U_ID(4, 1)
+#define M4U_PORT_L4_MDP_OVL			MTK_M4U_ID(4, 2)
+#define M4U_PORT_L4_MDP_WROT			MTK_M4U_ID(4, 3)
+#define M4U_PORT_L4_FAKE			MTK_M4U_ID(4, 4)
+
+/* larb5 */
+#define M4U_PORT_L5_SVPP1_MDP_RDMA		MTK_M4U_ID(5, 0)
+#define M4U_PORT_L5_SVPP1_MDP_FG		MTK_M4U_ID(5, 1)
+#define M4U_PORT_L5_SVPP1_MDP_OVL		MTK_M4U_ID(5, 2)
+#define M4U_PORT_L5_SVPP1_MDP_WROT		MTK_M4U_ID(5, 3)
+#define M4U_PORT_L5_SVPP2_MDP_RDMA		MTK_M4U_ID(5, 4)
+#define M4U_PORT_L5_SVPP2_MDP_FG		MTK_M4U_ID(5, 5)
+#define M4U_PORT_L5_SVPP2_MDP_WROT		MTK_M4U_ID(5, 6)
+#define M4U_PORT_L5_FAKE			MTK_M4U_ID(5, 7)
+
+/* larb6 */
+#define M4U_PORT_L6_SVPP3_MDP_RDMA		MTK_M4U_ID(6, 0)
+#define M4U_PORT_L6_SVPP3_MDP_FG		MTK_M4U_ID(6, 1)
+#define M4U_PORT_L6_SVPP3_MDP_WROT		MTK_M4U_ID(6, 2)
+#define M4U_PORT_L6_FAKE			MTK_M4U_ID(6, 3)
+
+/* larb7 */
+#define M4U_PORT_L7_IMG_WPE_RDMA0		MTK_M4U_ID(7, 0)
+#define M4U_PORT_L7_IMG_WPE_RDMA1		MTK_M4U_ID(7, 1)
+#define M4U_PORT_L7_IMG_WPE_WDMA0		MTK_M4U_ID(7, 2)
+
+/* larb8 */
+#define M4U_PORT_L8_IMG_WPE_RDMA0		MTK_M4U_ID(8, 0)
+#define M4U_PORT_L8_IMG_WPE_RDMA1		MTK_M4U_ID(8, 1)
+#define M4U_PORT_L8_IMG_WPE_WDMA0		MTK_M4U_ID(8, 2)
+
+/* larb9 */
+#define M4U_PORT_L9_IMG_IMGI_T1_A		MTK_M4U_ID(9, 0)
+#define M4U_PORT_L9_IMG_IMGBI_T1_A		MTK_M4U_ID(9, 1)
+#define M4U_PORT_L9_IMG_IMGCI_T1_A		MTK_M4U_ID(9, 2)
+#define M4U_PORT_L9_IMG_SMTI_T1_A		MTK_M4U_ID(9, 3)
+#define M4U_PORT_L9_IMG_TNCSTI_T1_A		MTK_M4U_ID(9, 4)
+#define M4U_PORT_L9_IMG_TNCSTI_T4_A		MTK_M4U_ID(9, 5)
+#define M4U_PORT_L9_IMG_YUVO_T1_A		MTK_M4U_ID(9, 6)
+#define M4U_PORT_L9_IMG_TIMGO_T1_A		MTK_M4U_ID(9, 7)
+#define M4U_PORT_L9_IMG_YUVO_T2_A		MTK_M4U_ID(9, 8)
+#define M4U_PORT_L9_IMG_IMGI_T1_B		MTK_M4U_ID(9, 9)
+#define M4U_PORT_L9_IMG_IMGBI_T1_B		MTK_M4U_ID(9, 10)
+#define M4U_PORT_L9_IMG_IMGCI_T1_B		MTK_M4U_ID(9, 11)
+#define M4U_PORT_L9_IMG_YUVO_T5_A		MTK_M4U_ID(9, 12)
+#define M4U_PORT_L9_IMG_SMTI_T1_B		MTK_M4U_ID(9, 13)
+#define M4U_PORT_L9_IMG_TNCSO_T1_A		MTK_M4U_ID(9, 14)
+#define M4U_PORT_L9_IMG_SMTO_T1_A		MTK_M4U_ID(9, 15)
+#define M4U_PORT_L9_IMG_TNCSTO_T1_A		MTK_M4U_ID(9, 16)
+#define M4U_PORT_L9_IMG_YUVO_T2_B		MTK_M4U_ID(9, 17)
+#define M4U_PORT_L9_IMG_YUVO_T5_B		MTK_M4U_ID(9, 18)
+#define M4U_PORT_L9_IMG_SMTO_T1_B		MTK_M4U_ID(9, 19)
+
+/* larb10 */
+#define M4U_PORT_L10_IMG_IMGI_D1_A		MTK_M4U_ID(10, 0)
+#define M4U_PORT_L10_IMG_IMGCI_D1_A		MTK_M4U_ID(10, 1)
+#define M4U_PORT_L10_IMG_DEPI_D1_A		MTK_M4U_ID(10, 2)
+#define M4U_PORT_L10_IMG_DMGI_D1_A		MTK_M4U_ID(10, 3)
+#define M4U_PORT_L10_IMG_VIPI_D1_A		MTK_M4U_ID(10, 4)
+#define M4U_PORT_L10_IMG_TNRWI_D1_A		MTK_M4U_ID(10, 5)
+#define M4U_PORT_L10_IMG_RECI_D1_A		MTK_M4U_ID(10, 6)
+#define M4U_PORT_L10_IMG_SMTI_D1_A		MTK_M4U_ID(10, 7)
+#define M4U_PORT_L10_IMG_SMTI_D6_A		MTK_M4U_ID(10, 8)
+#define M4U_PORT_L10_IMG_PIMGI_P1_A		MTK_M4U_ID(10, 9)
+#define M4U_PORT_L10_IMG_PIMGBI_P1_A		MTK_M4U_ID(10, 10)
+#define M4U_PORT_L10_IMG_PIMGCI_P1_A		MTK_M4U_ID(10, 11)
+#define M4U_PORT_L10_IMG_PIMGI_P1_B		MTK_M4U_ID(10, 12)
+#define M4U_PORT_L10_IMG_PIMGBI_P1_B		MTK_M4U_ID(10, 13)
+#define M4U_PORT_L10_IMG_PIMGCI_P1_B		MTK_M4U_ID(10, 14)
+#define M4U_PORT_L10_IMG_IMG3O_D1_A		MTK_M4U_ID(10, 15)
+#define M4U_PORT_L10_IMG_IMG4O_D1_A		MTK_M4U_ID(10, 16)
+#define M4U_PORT_L10_IMG_IMG3CO_D1_A		MTK_M4U_ID(10, 17)
+#define M4U_PORT_L10_IMG_FEO_D1_A		MTK_M4U_ID(10, 18)
+#define M4U_PORT_L10_IMG_IMG2O_D1_A		MTK_M4U_ID(10, 19)
+#define M4U_PORT_L10_IMG_TNRWO_D1_A		MTK_M4U_ID(10, 20)
+#define M4U_PORT_L10_IMG_SMTO_D1_A		MTK_M4U_ID(10, 21)
+#define M4U_PORT_L10_IMG_WROT_P1_A		MTK_M4U_ID(10, 22)
+#define M4U_PORT_L10_IMG_WROT_P1_B		MTK_M4U_ID(10, 23)
+
+/* larb11 */
+#define M4U_PORT_L11_IMG_WPE_EIS_RDMA0_A	MTK_M4U_ID(11, 0)
+#define M4U_PORT_L11_IMG_WPE_EIS_RDMA1_A	MTK_M4U_ID(11, 1)
+#define M4U_PORT_L11_IMG_WPE_EIS_WDMA0_A	MTK_M4U_ID(11, 2)
+#define M4U_PORT_L11_IMG_WPE_TNR_RDMA0_A	MTK_M4U_ID(11, 3)
+#define M4U_PORT_L11_IMG_WPE_TNR_RDMA1_A	MTK_M4U_ID(11, 4)
+#define M4U_PORT_L11_IMG_WPE_TNR_WDMA0_A	MTK_M4U_ID(11, 5)
+#define M4U_PORT_L11_IMG_WPE_EIS_CQ0_A		MTK_M4U_ID(11, 6)
+#define M4U_PORT_L11_IMG_WPE_EIS_CQ1_A		MTK_M4U_ID(11, 7)
+#define M4U_PORT_L11_IMG_WPE_TNR_CQ0_A		MTK_M4U_ID(11, 8)
+#define M4U_PORT_L11_IMG_WPE_TNR_CQ1_A		MTK_M4U_ID(11, 9)
+
+/* larb12 */
+#define M4U_PORT_L12_IMG_FDVT_RDA		MTK_M4U_ID(12, 0)
+#define M4U_PORT_L12_IMG_FDVT_RDB		MTK_M4U_ID(12, 1)
+#define M4U_PORT_L12_IMG_FDVT_WRA		MTK_M4U_ID(12, 2)
+#define M4U_PORT_L12_IMG_FDVT_WRB		MTK_M4U_ID(12, 3)
+#define M4U_PORT_L12_IMG_ME_RDMA		MTK_M4U_ID(12, 4)
+#define M4U_PORT_L12_IMG_ME_WDMA		MTK_M4U_ID(12, 5)
+#define M4U_PORT_L12_IMG_DVS_RDMA		MTK_M4U_ID(12, 6)
+#define M4U_PORT_L12_IMG_DVS_WDMA		MTK_M4U_ID(12, 7)
+#define M4U_PORT_L12_IMG_DVP_RDMA		MTK_M4U_ID(12, 8)
+#define M4U_PORT_L12_IMG_DVP_WDMA		MTK_M4U_ID(12, 9)
+
+/* larb13 */
+#define M4U_PORT_L13_CAM_CAMSV_CQI_E1		MTK_M4U_ID(13, 0)
+#define M4U_PORT_L13_CAM_CAMSV_CQI_E2		MTK_M4U_ID(13, 1)
+#define M4U_PORT_L13_CAM_GCAMSV_A_IMGO_0	MTK_M4U_ID(13, 2)
+#define M4U_PORT_L13_CAM_SCAMSV_A_IMGO_0	MTK_M4U_ID(13, 3)
+#define M4U_PORT_L13_CAM_GCAMSV_B_IMGO_0	MTK_M4U_ID(13, 4)
+#define M4U_PORT_L13_CAM_GCAMSV_B_IMGO_1	MTK_M4U_ID(13, 5)
+#define M4U_PORT_L13_CAM_GCAMSV_A_UFEO_0	MTK_M4U_ID(13, 6)
+#define M4U_PORT_L13_CAM_GCAMSV_B_UFEO_0	MTK_M4U_ID(13, 7)
+#define M4U_PORT_L13_CAM_PDAI_0			MTK_M4U_ID(13, 8)
+#define M4U_PORT_L13_CAM_FAKE			MTK_M4U_ID(13, 9)
+
+/* larb14 */
+#define M4U_PORT_L14_CAM_GCAMSV_A_IMGO_1	MTK_M4U_ID(14, 0)
+#define M4U_PORT_L14_CAM_SCAMSV_A_IMGO_1	MTK_M4U_ID(14, 1)
+#define M4U_PORT_L14_CAM_GCAMSV_B_IMGO_0	MTK_M4U_ID(14, 2)
+#define M4U_PORT_L14_CAM_GCAMSV_B_IMGO_1	MTK_M4U_ID(14, 3)
+#define M4U_PORT_L14_CAM_SCAMSV_B_IMGO_0	MTK_M4U_ID(14, 4)
+#define M4U_PORT_L14_CAM_SCAMSV_B_IMGO_1	MTK_M4U_ID(14, 5)
+#define M4U_PORT_L14_CAM_IPUI			MTK_M4U_ID(14, 6)
+#define M4U_PORT_L14_CAM_IPU2I			MTK_M4U_ID(14, 7)
+#define M4U_PORT_L14_CAM_IPUO			MTK_M4U_ID(14, 8)
+#define M4U_PORT_L14_CAM_IPU2O			MTK_M4U_ID(14, 9)
+#define M4U_PORT_L14_CAM_IPU3O			MTK_M4U_ID(14, 10)
+#define M4U_PORT_L14_CAM_GCAMSV_A_UFEO_1	MTK_M4U_ID(14, 11)
+#define M4U_PORT_L14_CAM_GCAMSV_B_UFEO_1	MTK_M4U_ID(14, 12)
+#define M4U_PORT_L14_CAM_PDAI_1			MTK_M4U_ID(14, 13)
+#define M4U_PORT_L14_CAM_PDAO			MTK_M4U_ID(14, 14)
+
+/* larb15: null */
+
+/* larb16 */
+#define M4U_PORT_L16_CAM_IMGO_R1		MTK_M4U_ID(16, 0)
+#define M4U_PORT_L16_CAM_CQI_R1			MTK_M4U_ID(16, 1)
+#define M4U_PORT_L16_CAM_CQI_R2			MTK_M4U_ID(16, 2)
+#define M4U_PORT_L16_CAM_BPCI_R1		MTK_M4U_ID(16, 3)
+#define M4U_PORT_L16_CAM_LSCI_R1		MTK_M4U_ID(16, 4)
+#define M4U_PORT_L16_CAM_RAWI_R2		MTK_M4U_ID(16, 5)
+#define M4U_PORT_L16_CAM_RAWI_R3		MTK_M4U_ID(16, 6)
+#define M4U_PORT_L16_CAM_UFDI_R2		MTK_M4U_ID(16, 7)
+#define M4U_PORT_L16_CAM_UFDI_R3		MTK_M4U_ID(16, 8)
+#define M4U_PORT_L16_CAM_RAWI_R4		MTK_M4U_ID(16, 9)
+#define M4U_PORT_L16_CAM_RAWI_R5		MTK_M4U_ID(16, 10)
+#define M4U_PORT_L16_CAM_AAI_R1			MTK_M4U_ID(16, 11)
+#define M4U_PORT_L16_CAM_FHO_R1			MTK_M4U_ID(16, 12)
+#define M4U_PORT_L16_CAM_AAO_R1			MTK_M4U_ID(16, 13)
+#define M4U_PORT_L16_CAM_TSFSO_R1		MTK_M4U_ID(16, 14)
+#define M4U_PORT_L16_CAM_FLKO_R1		MTK_M4U_ID(16, 15)
+
+/* larb17 */
+#define M4U_PORT_L17_CAM_YUVO_R1		MTK_M4U_ID(17, 0)
+#define M4U_PORT_L17_CAM_YUVO_R3		MTK_M4U_ID(17, 1)
+#define M4U_PORT_L17_CAM_YUVCO_R1		MTK_M4U_ID(17, 2)
+#define M4U_PORT_L17_CAM_YUVO_R2		MTK_M4U_ID(17, 3)
+#define M4U_PORT_L17_CAM_RZH1N2TO_R1		MTK_M4U_ID(17, 4)
+#define M4U_PORT_L17_CAM_DRZS4NO_R1		MTK_M4U_ID(17, 5)
+#define M4U_PORT_L17_CAM_TNCSO_R1		MTK_M4U_ID(17, 6)
+
+/* larb18 */
+#define M4U_PORT_L18_CAM_CCUI			MTK_M4U_ID(18, 0)
+#define M4U_PORT_L18_CAM_CCUO			MTK_M4U_ID(18, 1)
+#define M4U_PORT_L18_CAM_CCUI2			MTK_M4U_ID(18, 2)
+#define M4U_PORT_L18_CAM_CCUO2			MTK_M4U_ID(18, 3)
+
+/* larb19 */
+#define M4U_PORT_L19_VENC_RCPU			MTK_M4U_ID(19, 0)
+#define M4U_PORT_L19_VENC_REC			MTK_M4U_ID(19, 1)
+#define M4U_PORT_L19_VENC_BSDMA			MTK_M4U_ID(19, 2)
+#define M4U_PORT_L19_VENC_SV_COMV		MTK_M4U_ID(19, 3)
+#define M4U_PORT_L19_VENC_RD_COMV		MTK_M4U_ID(19, 4)
+#define M4U_PORT_L19_VENC_NBM_RDMA		MTK_M4U_ID(19, 5)
+#define M4U_PORT_L19_VENC_NBM_RDMA_LITE		MTK_M4U_ID(19, 6)
+#define M4U_PORT_L19_JPGENC_Y_RDMA		MTK_M4U_ID(19, 7)
+#define M4U_PORT_L19_JPGENC_C_RDMA		MTK_M4U_ID(19, 8)
+#define M4U_PORT_L19_JPGENC_Q_TABLE		MTK_M4U_ID(19, 9)
+#define M4U_PORT_L19_VENC_SUB_W_LUMA		MTK_M4U_ID(19, 10)
+#define M4U_PORT_L19_VENC_FCS_NBM_RDMA		MTK_M4U_ID(19, 11)
+#define M4U_PORT_L19_JPGENC_BSDMA		MTK_M4U_ID(19, 12)
+#define M4U_PORT_L19_JPGDEC_WDMA0		MTK_M4U_ID(19, 13)
+#define M4U_PORT_L19_JPGDEC_BSDMA0		MTK_M4U_ID(19, 14)
+#define M4U_PORT_L19_VENC_NBM_WDMA		MTK_M4U_ID(19, 15)
+#define M4U_PORT_L19_VENC_NBM_WDMA_LITE		MTK_M4U_ID(19, 16)
+#define M4U_PORT_L19_VENC_FCS_NBM_WDMA		MTK_M4U_ID(19, 17)
+#define M4U_PORT_L19_JPGDEC_WDMA1		MTK_M4U_ID(19, 18)
+#define M4U_PORT_L19_JPGDEC_BSDMA1		MTK_M4U_ID(19, 19)
+#define M4U_PORT_L19_JPGDEC_BUFF_OFFSET1	MTK_M4U_ID(19, 20)
+#define M4U_PORT_L19_JPGDEC_BUFF_OFFSET0	MTK_M4U_ID(19, 21)
+#define M4U_PORT_L19_VENC_CUR_LUMA		MTK_M4U_ID(19, 22)
+#define M4U_PORT_L19_VENC_CUR_CHROMA		MTK_M4U_ID(19, 23)
+#define M4U_PORT_L19_VENC_REF_LUMA		MTK_M4U_ID(19, 24)
+#define M4U_PORT_L19_VENC_REF_CHROMA		MTK_M4U_ID(19, 25)
+#define M4U_PORT_L19_VENC_SUB_R_CHROMA		MTK_M4U_ID(19, 26)
+
+/* larb20 */
+#define M4U_PORT_L20_VENC_RCPU			MTK_M4U_ID(20, 0)
+#define M4U_PORT_L20_VENC_REC			MTK_M4U_ID(20, 1)
+#define M4U_PORT_L20_VENC_BSDMA			MTK_M4U_ID(20, 2)
+#define M4U_PORT_L20_VENC_SV_COMV		MTK_M4U_ID(20, 3)
+#define M4U_PORT_L20_VENC_RD_COMV		MTK_M4U_ID(20, 4)
+#define M4U_PORT_L20_VENC_NBM_RDMA		MTK_M4U_ID(20, 5)
+#define M4U_PORT_L20_VENC_NBM_RDMA_LITE		MTK_M4U_ID(20, 6)
+#define M4U_PORT_L20_JPGENC_Y_RDMA		MTK_M4U_ID(20, 7)
+#define M4U_PORT_L20_JPGENC_C_RDMA		MTK_M4U_ID(20, 8)
+#define M4U_PORT_L20_JPGENC_Q_TABLE		MTK_M4U_ID(20, 9)
+#define M4U_PORT_L20_VENC_SUB_W_LUMA		MTK_M4U_ID(20, 10)
+#define M4U_PORT_L20_VENC_FCS_NBM_RDMA		MTK_M4U_ID(20, 11)
+#define M4U_PORT_L20_JPGENC_BSDMA		MTK_M4U_ID(20, 12)
+#define M4U_PORT_L20_JPGDEC_WDMA0		MTK_M4U_ID(20, 13)
+#define M4U_PORT_L20_JPGDEC_BSDMA0		MTK_M4U_ID(20, 14)
+#define M4U_PORT_L20_VENC_NBM_WDMA		MTK_M4U_ID(20, 15)
+#define M4U_PORT_L20_VENC_NBM_WDMA_LITE		MTK_M4U_ID(20, 16)
+#define M4U_PORT_L20_VENC_FCS_NBM_WDMA		MTK_M4U_ID(20, 17)
+#define M4U_PORT_L20_JPGDEC_WDMA1		MTK_M4U_ID(20, 18)
+#define M4U_PORT_L20_JPGDEC_BSDMA1		MTK_M4U_ID(20, 19)
+#define M4U_PORT_L20_JPGDEC_BUFF_OFFSET1	MTK_M4U_ID(20, 20)
+#define M4U_PORT_L20_JPGDEC_BUFF_OFFSET0	MTK_M4U_ID(20, 21)
+#define M4U_PORT_L20_VENC_CUR_LUMA		MTK_M4U_ID(20, 22)
+#define M4U_PORT_L20_VENC_CUR_CHROMA		MTK_M4U_ID(20, 23)
+#define M4U_PORT_L20_VENC_REF_LUMA		MTK_M4U_ID(20, 24)
+#define M4U_PORT_L20_VENC_REF_CHROMA		MTK_M4U_ID(20, 25)
+#define M4U_PORT_L20_VENC_SUB_R_CHROMA		MTK_M4U_ID(20, 26)
+
+/* larb21 */
+#define M4U_PORT_L21_VDEC_MC_EXT		MTK_M4U_ID(21, 0)
+#define M4U_PORT_L21_VDEC_UFO_EXT		MTK_M4U_ID(21, 1)
+#define M4U_PORT_L21_VDEC_PP_EXT		MTK_M4U_ID(21, 2)
+#define M4U_PORT_L21_VDEC_PRED_RD_EXT		MTK_M4U_ID(21, 3)
+#define M4U_PORT_L21_VDEC_PRED_WR_EXT		MTK_M4U_ID(21, 4)
+#define M4U_PORT_L21_VDEC_PPWRAP_EXT		MTK_M4U_ID(21, 5)
+#define M4U_PORT_L21_VDEC_TILE_EXT		MTK_M4U_ID(21, 6)
+#define M4U_PORT_L21_VDEC_VLD_EXT		MTK_M4U_ID(21, 7)
+#define M4U_PORT_L21_VDEC_VLD2_EXT		MTK_M4U_ID(21, 8)
+#define M4U_PORT_L21_VDEC_AVC_MV_EXT		MTK_M4U_ID(21, 9)
+
+/* larb22 */
+#define M4U_PORT_L22_VDEC_MC_EXT		MTK_M4U_ID(22, 0)
+#define M4U_PORT_L22_VDEC_UFO_EXT		MTK_M4U_ID(22, 1)
+#define M4U_PORT_L22_VDEC_PP_EXT		MTK_M4U_ID(22, 2)
+#define M4U_PORT_L22_VDEC_PRED_RD_EXT		MTK_M4U_ID(22, 3)
+#define M4U_PORT_L22_VDEC_PRED_WR_EXT		MTK_M4U_ID(22, 4)
+#define M4U_PORT_L22_VDEC_PPWRAP_EXT		MTK_M4U_ID(22, 5)
+#define M4U_PORT_L22_VDEC_TILE_EXT		MTK_M4U_ID(22, 6)
+#define M4U_PORT_L22_VDEC_VLD_EXT		MTK_M4U_ID(22, 7)
+#define M4U_PORT_L22_VDEC_VLD2_EXT		MTK_M4U_ID(22, 8)
+#define M4U_PORT_L22_VDEC_AVC_MV_EXT		MTK_M4U_ID(22, 9)
+
+/* larb23 */
+#define M4U_PORT_L23_VDEC_UFO_ENC_EXT		MTK_M4U_ID(23, 0)
+#define M4U_PORT_L23_VDEC_RDMA_EXT		MTK_M4U_ID(23, 1)
+
+/* larb24 */
+#define M4U_PORT_L24_VDEC_LAT0_VLD_EXT		MTK_M4U_ID(24, 0)
+#define M4U_PORT_L24_VDEC_LAT0_VLD2_EXT		MTK_M4U_ID(24, 1)
+#define M4U_PORT_L24_VDEC_LAT0_AVC_MC_EXT	MTK_M4U_ID(24, 2)
+#define M4U_PORT_L24_VDEC_LAT0_PRED_RD_EXT	MTK_M4U_ID(24, 3)
+#define M4U_PORT_L24_VDEC_LAT0_TILE_EXT		MTK_M4U_ID(24, 4)
+#define M4U_PORT_L24_VDEC_LAT0_WDMA_EXT		MTK_M4U_ID(24, 5)
+#define M4U_PORT_L24_VDEC_LAT1_VLD_EXT		MTK_M4U_ID(24, 6)
+#define M4U_PORT_L24_VDEC_LAT1_VLD2_EXT		MTK_M4U_ID(24, 7)
+#define M4U_PORT_L24_VDEC_LAT1_AVC_MC_EXT	MTK_M4U_ID(24, 8)
+#define M4U_PORT_L24_VDEC_LAT1_PRED_RD_EXT	MTK_M4U_ID(24, 9)
+#define M4U_PORT_L24_VDEC_LAT1_TILE_EXT		MTK_M4U_ID(24, 10)
+#define M4U_PORT_L24_VDEC_LAT1_WDMA_EXT		MTK_M4U_ID(24, 11)
+
+/* larb25 */
+#define M4U_PORT_L25_CAM_MRAW0_LSCI_M1		MTK_M4U_ID(25, 0)
+#define M4U_PORT_L25_CAM_MRAW0_CQI_M1		MTK_M4U_ID(25, 1)
+#define M4U_PORT_L25_CAM_MRAW0_CQI_M2		MTK_M4U_ID(25, 2)
+#define M4U_PORT_L25_CAM_MRAW0_IMGO_M1		MTK_M4U_ID(25, 3)
+#define M4U_PORT_L25_CAM_MRAW0_IMGBO_M1		MTK_M4U_ID(25, 4)
+#define M4U_PORT_L25_CAM_MRAW2_LSCI_M1		MTK_M4U_ID(25, 5)
+#define M4U_PORT_L25_CAM_MRAW2_CQI_M1		MTK_M4U_ID(25, 6)
+#define M4U_PORT_L25_CAM_MRAW2_CQI_M2		MTK_M4U_ID(25, 7)
+#define M4U_PORT_L25_CAM_MRAW2_IMGO_M1		MTK_M4U_ID(25, 8)
+#define M4U_PORT_L25_CAM_MRAW2_IMGBO_M1		MTK_M4U_ID(25, 9)
+#define M4U_PORT_L25_CAM_MRAW0_AFO_M1		MTK_M4U_ID(25, 10)
+#define M4U_PORT_L25_CAM_MRAW2_AFO_M1		MTK_M4U_ID(25, 11)
+
+/* larb26 */
+#define M4U_PORT_L26_CAM_MRAW1_LSCI_M1		MTK_M4U_ID(26, 0)
+#define M4U_PORT_L26_CAM_MRAW1_CQI_M1		MTK_M4U_ID(26, 1)
+#define M4U_PORT_L26_CAM_MRAW1_CQI_M2		MTK_M4U_ID(26, 2)
+#define M4U_PORT_L26_CAM_MRAW1_IMGO_M1		MTK_M4U_ID(26, 3)
+#define M4U_PORT_L26_CAM_MRAW1_IMGBO_M1		MTK_M4U_ID(26, 4)
+#define M4U_PORT_L26_CAM_MRAW3_LSCI_M1		MTK_M4U_ID(26, 5)
+#define M4U_PORT_L26_CAM_MRAW3_CQI_M1		MTK_M4U_ID(26, 6)
+#define M4U_PORT_L26_CAM_MRAW3_CQI_M2		MTK_M4U_ID(26, 7)
+#define M4U_PORT_L26_CAM_MRAW3_IMGO_M1		MTK_M4U_ID(26, 8)
+#define M4U_PORT_L26_CAM_MRAW3_IMGBO_M1		MTK_M4U_ID(26, 9)
+#define M4U_PORT_L26_CAM_MRAW1_AFO_M1		MTK_M4U_ID(26, 10)
+#define M4U_PORT_L26_CAM_MRAW3_AFO_M1		MTK_M4U_ID(26, 11)
+
+/* larb27 */
+#define M4U_PORT_L27_CAM_IMGO_R1		MTK_M4U_ID(27, 0)
+#define M4U_PORT_L27_CAM_CQI_R1			MTK_M4U_ID(27, 1)
+#define M4U_PORT_L27_CAM_CQI_R2			MTK_M4U_ID(27, 2)
+#define M4U_PORT_L27_CAM_BPCI_R1		MTK_M4U_ID(27, 3)
+#define M4U_PORT_L27_CAM_LSCI_R1		MTK_M4U_ID(27, 4)
+#define M4U_PORT_L27_CAM_RAWI_R2		MTK_M4U_ID(27, 5)
+#define M4U_PORT_L27_CAM_RAWI_R3		MTK_M4U_ID(27, 6)
+#define M4U_PORT_L27_CAM_UFDI_R2		MTK_M4U_ID(27, 7)
+#define M4U_PORT_L27_CAM_UFDI_R3		MTK_M4U_ID(27, 8)
+#define M4U_PORT_L27_CAM_RAWI_R4		MTK_M4U_ID(27, 9)
+#define M4U_PORT_L27_CAM_RAWI_R5		MTK_M4U_ID(27, 10)
+#define M4U_PORT_L27_CAM_AAI_R1			MTK_M4U_ID(27, 11)
+#define M4U_PORT_L27_CAM_FHO_R1			MTK_M4U_ID(27, 12)
+#define M4U_PORT_L27_CAM_AAO_R1			MTK_M4U_ID(27, 13)
+#define M4U_PORT_L27_CAM_TSFSO_R1		MTK_M4U_ID(27, 14)
+#define M4U_PORT_L27_CAM_FLKO_R1		MTK_M4U_ID(27, 15)
+
+/* larb28 */
+#define M4U_PORT_L28_CAM_YUVO_R1		MTK_M4U_ID(28, 0)
+#define M4U_PORT_L28_CAM_YUVO_R3		MTK_M4U_ID(28, 1)
+#define M4U_PORT_L28_CAM_YUVCO_R1		MTK_M4U_ID(28, 2)
+#define M4U_PORT_L28_CAM_YUVO_R2		MTK_M4U_ID(28, 3)
+#define M4U_PORT_L28_CAM_RZH1N2TO_R1		MTK_M4U_ID(28, 4)
+#define M4U_PORT_L28_CAM_DRZS4NO_R1		MTK_M4U_ID(28, 5)
+#define M4U_PORT_L28_CAM_TNCSO_R1		MTK_M4U_ID(28, 6)
+
+#endif
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
