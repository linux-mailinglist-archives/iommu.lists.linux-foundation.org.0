Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E09633DB165
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 04:53:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6153C401B9;
	Fri, 30 Jul 2021 02:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMmo46MZTUqy; Fri, 30 Jul 2021 02:53:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DC3CE40227;
	Fri, 30 Jul 2021 02:53:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FAE1C000E;
	Fri, 30 Jul 2021 02:53:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89CAAC000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7949641481
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGNkDFGl4pVp for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 02:53:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FA1C4147E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:47 +0000 (UTC)
X-UUID: de08d299849f40e698262c5e3cb0e205-20210730
X-UUID: de08d299849f40e698262c5e3cb0e205-20210730
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1897307176; Fri, 30 Jul 2021 10:53:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:53:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:53:32 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 01/12] dt-binding: mediatek: Get rid of mediatek,
 larb for multimedia HW
Date: Fri, 30 Jul 2021 10:52:27 +0800
Message-ID: <20210730025238.22456-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

After adding device_link between the consumer with the smi-larbs,
if the consumer call its owner pm_runtime_get(_sync), the
pm_runtime_get(_sync) of smi-larb and smi-common will be called
automatically. Thus, the consumer don't need the property.

And IOMMU also know which larb this consumer connects with from
iommu id in the "iommus=" property.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 .../bindings/display/mediatek/mediatek,disp.txt          | 9 ---------
 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml | 9 ---------
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 9 ---------
 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 8 --------
 .../devicetree/bindings/media/mediatek-vcodec.txt        | 4 ----
 5 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..867bd82e2f03 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,8 +61,6 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
@@ -91,7 +89,6 @@ ovl0: ovl@1400c000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL0>;
 	iommus = <&iommu M4U_PORT_DISP_OVL0>;
-	mediatek,larb = <&larb0>;
 };
 
 ovl1: ovl@1400d000 {
@@ -101,7 +98,6 @@ ovl1: ovl@1400d000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL1>;
 	iommus = <&iommu M4U_PORT_DISP_OVL1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma0: rdma@1400e000 {
@@ -111,7 +107,6 @@ rdma0: rdma@1400e000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-	mediatek,larb = <&larb0>;
 	mediatek,rdma-fifosize = <8192>;
 };
 
@@ -122,7 +117,6 @@ rdma1: rdma@1400f000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma2: rdma@14010000 {
@@ -132,7 +126,6 @@ rdma2: rdma@14010000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-	mediatek,larb = <&larb4>;
 };
 
 wdma0: wdma@14011000 {
@@ -142,7 +135,6 @@ wdma0: wdma@14011000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-	mediatek,larb = <&larb0>;
 };
 
 wdma1: wdma@14012000 {
@@ -152,7 +144,6 @@ wdma1: wdma@14012000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 color0: color@14013000 {
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index 9b87f036f178..052e752157b4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -42,13 +42,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -63,7 +56,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -83,7 +75,6 @@ examples:
       clock-names = "jpgdec-smi",
                     "jpgdec";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
                <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index fcd9b829e036..8bfdfdfaba59 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -35,13 +35,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -56,7 +49,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -75,7 +67,6 @@ examples:
       clocks =  <&imgsys CLK_IMG_VENC>;
       clock-names = "jpgenc";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
                <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index caa24943da33..53ef26e2c857 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -27,9 +27,6 @@ Required properties (DMA function blocks, child node):
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
-- mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
 
 Example:
 	mdp_rdma0: rdma@14001000 {
@@ -40,7 +37,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,larb = <&larb0>;
 		mediatek,vpu = <&vpu>;
 	};
 
@@ -51,7 +47,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-		mediatek,larb = <&larb4>;
 	};
 
 	mdp_rsz0: rsz@14003000 {
@@ -81,7 +76,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WDMA>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot0: wrot@14007000 {
@@ -90,7 +84,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT0>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot1: wrot@14008000 {
@@ -99,5 +92,4 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT1>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-		mediatek,larb = <&larb4>;
 	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index ad1321e5a22d..71237355cc7e 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -13,7 +13,6 @@ Required properties:
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- mediatek,larb : must contain the local arbiters in the current Socs.
 - clocks : list of clock specifiers, corresponding to entries in
   the clock-names property.
 - clock-names: avc encoder must contain "venc_sel", vp8 encoder must
@@ -46,7 +45,6 @@ vcodec_dec: vcodec@16000000 {
           <0 0x16027800 0 0x800>,   /*VP8_VL*/
           <0 0x16028400 0 0x400>;   /*VP9_VD*/
     interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb1>;
     iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
              <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
              <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
@@ -99,7 +97,6 @@ vcodec_enc_avc: vcodec@18002000 {
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
              <&iommu M4U_PORT_VENC_NBM_WDMA>;
-    mediatek,larb = <&larb3>;
     mediatek,vpu = <&vpu>;
     clocks = <&topckgen CLK_TOP_VENC_SEL>;
     clock-names = "venc_sel";
@@ -120,7 +117,6 @@ vcodec_enc_vp8: vcodec@19002000 {
              <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
              <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
              <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-    mediatek,larb = <&larb5>;
     mediatek,vpu = <&vpu>;
     clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
     clock-names = "venc_lt_sel";
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
