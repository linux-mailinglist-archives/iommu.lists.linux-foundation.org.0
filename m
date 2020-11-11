Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 106072AF0C5
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 13:39:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C410B86C40;
	Wed, 11 Nov 2020 12:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMZBGlkrIvj6; Wed, 11 Nov 2020 12:39:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B0BF186C23;
	Wed, 11 Nov 2020 12:39:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 998E3C1AD6;
	Wed, 11 Nov 2020 12:39:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C443AC016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B2EF28493F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRlDzjxZDPvW for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 12:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97B028684D
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:39:00 +0000 (UTC)
X-UUID: 74978841c0164ad182d8cd96c7b5c496-20201111
X-UUID: 74978841c0164ad182d8cd96c7b5c496-20201111
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 878149712; Wed, 11 Nov 2020 20:38:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:38:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:38:53 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to DT
 schema
Date: Wed, 11 Nov 2020 20:38:15 +0800
Message-ID: <20201111123838.15682-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201111123838.15682-1-yong.wu@mediatek.com>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
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

Convert MediaTek IOMMU to DT schema.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../bindings/iommu/mediatek,iommu.txt         | 105 -----------
 .../bindings/iommu/mediatek,iommu.yaml        | 167 ++++++++++++++++++
 2 files changed, 167 insertions(+), 105 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
deleted file mode 100644
index ac949f7fe3d4..000000000000
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-* Mediatek IOMMU Architecture Implementation
-
-  Some Mediatek SOCs contain a Multimedia Memory Management Unit (M4U), and
-this M4U have two generations of HW architecture. Generation one uses flat
-pagetable, and only supports 4K size page mapping. Generation two uses the
-ARM Short-Descriptor translation table format for address translation.
-
-  About the M4U Hardware Block Diagram, please check below:
-
-              EMI (External Memory Interface)
-               |
-              m4u (Multimedia Memory Management Unit)
-               |
-          +--------+
-          |        |
-      gals0-rx   gals1-rx    (Global Async Local Sync rx)
-          |        |
-          |        |
-      gals0-tx   gals1-tx    (Global Async Local Sync tx)
-          |        |          Some SoCs may have GALS.
-          +--------+
-               |
-           SMI Common(Smart Multimedia Interface Common)
-               |
-       +----------------+-------
-       |                |
-       |             gals-rx        There may be GALS in some larbs.
-       |                |
-       |                |
-       |             gals-tx
-       |                |
-   SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
-   (display)         (vdec)
-       |                |
-       |                |
- +-----+-----+     +----+----+
- |     |     |     |    |    |
- |     |     |...  |    |    |  ... There are different ports in each larb.
- |     |     |     |    |    |
-OVL0 RDMA0 WDMA0  MC   PP   VLD
-
-  As above, The Multimedia HW will go through SMI and M4U while it
-access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
-smi local arbiter and smi common. It will control whether the Multimedia
-HW should go though the m4u for translation or bypass it and talk
-directly with EMI. And also SMI help control the power domain and clocks for
-each local arbiter.
-  Normally we specify a local arbiter(larb) for each multimedia HW
-like display, video decode, and camera. And there are different ports
-in each larb. Take a example, There are many ports like MC, PP, VLD in the
-video decode local arbiter, all these ports are according to the video HW.
-  In some SoCs, there may be a GALS(Global Async Local Sync) module between
-smi-common and m4u, and additional GALS module between smi-larb and
-smi-common. GALS can been seen as a "asynchronous fifo" which could help
-synchronize for the modules in different clock frequency.
-
-Required properties:
-- compatible : must be one of the following string:
-	"mediatek,mt2701-m4u" for mt2701 which uses generation one m4u HW.
-	"mediatek,mt2712-m4u" for mt2712 which uses generation two m4u HW.
-	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
-	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
-						     generation one m4u HW.
-	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
-	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
-	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
-- reg : m4u register base and size.
-- interrupts : the interrupt of m4u.
-- clocks : must contain one entry for each clock-names.
-- clock-names : Only 1 optional clock:
-  - "bclk": the block clock of m4u.
-  Here is the list which require this "bclk":
-  - mt2701, mt2712, mt7623 and mt8173.
-  Note that m4u use the EMI clock which always has been enabled before kernel
-  if there is no this "bclk".
-- mediatek,larbs : List of phandle to the local arbiters in the current Socs.
-	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
-	according to the local arbiter index, like larb0, larb1, larb2...
-- iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
-	Specifies the mtk_m4u_id as defined in
-	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
-	dt-binding/memory/mt2712-larb-port.h for mt2712,
-	dt-binding/memory/mt6779-larb-port.h for mt6779,
-	dt-binding/memory/mt8167-larb-port.h for mt8167,
-	dt-binding/memory/mt8173-larb-port.h for mt8173, and
-	dt-binding/memory/mt8183-larb-port.h for mt8183.
-
-Example:
-	iommu: iommu@10205000 {
-		compatible = "mediatek,mt8173-m4u";
-		reg = <0 0x10205000 0 0x1000>;
-		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&infracfg CLK_INFRA_M4U>;
-		clock-names = "bclk";
-		mediatek,larbs = <&larb0 &larb1 &larb2 &larb3 &larb4 &larb5>;
-		#iommu-cells = <1>;
-	};
-
-Example for a client device:
-	display {
-		compatible = "mediatek,mt8173-disp";
-		iommus = <&iommu M4U_PORT_DISP_OVL0>,
-			 <&iommu M4U_PORT_DISP_RDMA0>;
-		...
-	};
diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
new file mode 100644
index 000000000000..b9946809fc2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek IOMMU Architecture Implementation
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+description: |+
+  Some MediaTek SOCs contain a Multimedia Memory Management Unit (M4U), and
+  this M4U have two generations of HW architecture. Generation one uses flat
+  pagetable, and only supports 4K size page mapping. Generation two uses the
+  ARM Short-Descriptor translation table format for address translation.
+
+  About the M4U Hardware Block Diagram, please check below:
+
+                EMI (External Memory Interface)
+                 |
+                m4u (Multimedia Memory Management Unit)
+                 |
+            +--------+
+            |        |
+        gals0-rx   gals1-rx    (Global Async Local Sync rx)
+            |        |
+            |        |
+        gals0-tx   gals1-tx    (Global Async Local Sync tx)
+            |        |          Some SoCs may have GALS.
+            +--------+
+                 |
+             SMI Common(Smart Multimedia Interface Common)
+                 |
+         +----------------+-------
+         |                |
+         |             gals-rx        There may be GALS in some larbs.
+         |                |
+         |                |
+         |             gals-tx
+         |                |
+     SMI larb0        SMI larb1   ... SoCs have several SMI local arbiter(larb).
+     (display)         (vdec)
+         |                |
+         |                |
+   +-----+-----+     +----+----+
+   |     |     |     |    |    |
+   |     |     |...  |    |    |  ... There are different ports in each larb.
+   |     |     |     |    |    |
+  OVL0 RDMA0 WDMA0  MC   PP   VLD
+
+  As above, The Multimedia HW will go through SMI and M4U while it
+  access EMI. SMI is a bridge between m4u and the Multimedia HW. It contain
+  smi local arbiter and smi common. It will control whether the Multimedia
+  HW should go though the m4u for translation or bypass it and talk
+  directly with EMI. And also SMI help control the power domain and clocks for
+  each local arbiter.
+
+  Normally we specify a local arbiter(larb) for each multimedia HW
+  like display, video decode, and camera. And there are different ports
+  in each larb. Take a example, There are many ports like MC, PP, VLD in the
+  video decode local arbiter, all these ports are according to the video HW.
+
+  In some SoCs, there may be a GALS(Global Async Local Sync) module between
+  smi-common and m4u, and additional GALS module between smi-larb and
+  smi-common. GALS can been seen as a "asynchronous fifo" which could help
+  synchronize for the modules in different clock frequency.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-m4u  # generation one
+          - mediatek,mt2712-m4u  # generation two
+          - mediatek,mt6779-m4u  # generation two
+          - mediatek,mt8167-m4u  # generation two
+          - mediatek,mt8173-m4u  # generation two
+          - mediatek,mt8183-m4u  # generation two
+
+      - description: mt7623 generation one
+        items:
+          - const: mediatek,mt7623-m4u
+          - const: mediatek,mt2701-m4u
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: bclk is the block clock.
+
+  clock-names:
+    items:
+      - const: bclk
+
+  mediatek,larbs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 16
+    description: |
+      List of phandle to the local arbiters in the current Socs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
+      according to the local arbiter index, like larb0, larb1, larb2...
+
+  '#iommu-cells':
+    const: 1
+    description: |
+      This is the mtk_m4u_id according to the HW. Specifies the mtk_m4u_id as
+      defined in
+      dt-binding/memory/mt2701-larb-port.h for mt2701 and mt7623,
+      dt-binding/memory/mt2712-larb-port.h for mt2712,
+      dt-binding/memory/mt6779-larb-port.h for mt6779,
+      dt-binding/memory/mt8167-larb-port.h for mt8167,
+      dt-binding/memory/mt8173-larb-port.h for mt8173,
+      dt-binding/memory/mt8183-larb-port.h for mt8183.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,larbs
+  - '#iommu-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-m4u
+              - mediatek,mt2712-m4u
+              - mediatek,mt8173-m4u
+
+    then:
+      required:
+        - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    iommu: iommu@10205000 {
+            compatible = "mediatek,mt8173-m4u";
+            reg = <0x10205000 0x1000>;
+            interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&infracfg CLK_INFRA_M4U>;
+            clock-names = "bclk";
+            mediatek,larbs = <&larb0 &larb1 &larb2
+                              &larb3 &larb4 &larb5>;
+            #iommu-cells = <1>;
+    };
+
+  - |
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+
+    /* Example for a client device */
+    display {
+           compatible = "mediatek,mt8173-disp";
+           iommus = <&iommu M4U_PORT_DISP_OVL0>,
+                    <&iommu M4U_PORT_DISP_RDMA0>;
+     };
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
