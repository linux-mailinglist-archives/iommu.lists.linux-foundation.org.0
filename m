Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0AB27E207
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:08:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6DBDE86838;
	Wed, 30 Sep 2020 07:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vbpsCvMTygc; Wed, 30 Sep 2020 07:07:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 433C286822;
	Wed, 30 Sep 2020 07:07:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 247DAC0051;
	Wed, 30 Sep 2020 07:07:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79F6DC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 717BC8683F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnL7RVLUtGJp for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:07:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29EAC86822
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:07:53 +0000 (UTC)
X-UUID: 25480ed19eda47d882ac5b769b8bbab9-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Xo0Crp63GjyhvyXgF1/eV6mgLcCaNdoox8Hlv2WH2/U=; 
 b=ZIZCpgnbullaoIyllo6MtJ1qH6u5zxsTE6Z5IQmOslS3BHVa3rAhKi2iMR07G24xXRgXBLdo3K+gnLQ+B27O2GJSX9S2PNFYaWZ9WUdsEJuwbaaYZIbntI0TjSSJDpy5/ii0Idk1i/fYRk0zp9/M4d9d+tMLdJhuT34FyWm2WSg=;
X-UUID: 25480ed19eda47d882ac5b769b8bbab9-20200930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 890985540; Wed, 30 Sep 2020 15:07:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:07:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:07:29 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 02/24] dt-bindings: memory: mediatek: Convert SMI to DT
 schema
Date: Wed, 30 Sep 2020 15:06:25 +0800
Message-ID: <20200930070647.10188-3-yong.wu@mediatek.com>
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

Convert MediaTek SMI to DT schema.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,smi-common.txt                   |  49 ---------
 .../mediatek,smi-common.yaml                  | 100 ++++++++++++++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  49 ---------
 .../memory-controllers/mediatek,smi-larb.yaml |  91 ++++++++++++++++
 4 files changed, 191 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
deleted file mode 100644
index b64573680b42..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-SMI (Smart Multimedia Interface) Common
-
-The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
-
-Mediatek SMI have two generations of HW architecture, here is the list
-which generation the SoCs use:
-generation 1: mt2701 and mt7623.
-generation 2: mt2712, mt6779, mt8173 and mt8183.
-
-There's slight differences between the two SMI, for generation 2, the
-register which control the iommu port is at each larb's register base. But
-for generation 1, the register is at smi ao base(smi always on register
-base). Besides that, the smi async clock should be prepared and enabled for
-SMI generation 1 to transform the smi clock into emi clock domain, but that is
-not needed for SMI generation 2.
-
-Required properties:
-- compatible : must be one of :
-	"mediatek,mt2701-smi-common"
-	"mediatek,mt2712-smi-common"
-	"mediatek,mt6779-smi-common"
-	"mediatek,mt7623-smi-common", "mediatek,mt2701-smi-common"
-	"mediatek,mt8173-smi-common"
-	"mediatek,mt8183-smi-common"
-- reg : the register and size of the SMI block.
-- power-domains : a phandle to the power domain of this local arbiter.
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : must contain 3 entries for generation 1 smi HW and 2 entries
-  for generation 2 smi HW as follows:
-  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
-	    the register.
-  - "smi" : It's the clock for transfer data and command.
-	    They may be the same if both source clocks are the same.
-  - "async" : asynchronous clock, it help transform the smi clock into the emi
-	      clock domain, this clock is only needed by generation 1 smi HW.
-  and these 2 option clocks for generation 2 smi HW:
-  - "gals0": the path0 clock of GALS(Global Async Local Sync).
-  - "gals1": the path1 clock of GALS(Global Async Local Sync).
-  Here is the list which has this GALS: mt6779 and mt8183.
-
-Example:
-	smi_common: smi@14022000 {
-		compatible = "mediatek,mt8173-smi-common";
-		reg = <0 0x14022000 0 0x1000>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		clocks = <&mmsys CLK_MM_SMI_COMMON>,
-			 <&mmsys CLK_MM_SMI_COMMON>;
-		clock-names = "apb", "smi";
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
new file mode 100644
index 000000000000..76ecc7205438
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMI (Smart Multimedia Interface) Common
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+description: |+
+  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
+
+  MediaTek SMI have two generations of HW architecture, here is the list
+  which generation the SoCs use:
+  generation 1: mt2701 and mt7623.
+  generation 2: mt2712, mt6779, mt8173 and mt8183.
+
+  There's slight differences between the two SMI, for generation 2, the
+  register which control the iommu port is at each larb's register base. But
+  for generation 1, the register is at smi ao base(smi always on register
+  base). Besides that, the smi async clock should be prepared and enabled for
+  SMI generation 1 to transform the smi clock into emi clock domain, but that is
+  not needed for SMI generation 2.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-smi-common
+          - mediatek,mt2712-smi-common
+          - mediatek,mt6779-smi-common
+          - mediatek,mt8173-smi-common
+          - mediatek,mt8183-smi-common
+
+      - description: for mt7623
+        items:
+          - const: mediatek,mt7623-smi-common
+          - const: mediatek,mt2701-smi-common
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      apb and smi are mandatory. the async is only for generation 1 smi HW.
+      gals(global async local sync) also is optional, here is the list which
+      require gals: mt6779 and mt8183.
+    minItems: 2
+    maxItems: 4
+    items:
+      - description: apb is Advanced Peripheral Bus clock, It's the clock for
+          setting the register.
+      - description: smi is the clock for transfer data and command.
+      - description: async is asynchronous clock, it help transform the smi clock
+          into the emi clock domain.
+      - description: gals0 is the path0 clock of gals.
+      - description: gals1 is the path1 clock of gals.
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: apb
+          - const: smi
+      - items:
+          - const: apb
+          - const: smi
+          - const: async
+      - items:
+          - const: apb
+          - const: smi
+          - const: gals0
+          - const: gals1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    smi_common: smi@14022000 {
+            compatible = "mediatek,mt8173-smi-common";
+            reg = <0x14022000 0x1000>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+            clocks = <&mmsys CLK_MM_SMI_COMMON>,
+                     <&mmsys CLK_MM_SMI_COMMON>;
+            clock-names = "apb", "smi";
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
deleted file mode 100644
index 8f19dfe7d80e..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-SMI (Smart Multimedia Interface) Local Arbiter
-
-The hardware block diagram please check bindings/iommu/mediatek,iommu.txt
-
-Required properties:
-- compatible : must be one of :
-		"mediatek,mt2701-smi-larb"
-		"mediatek,mt2712-smi-larb"
-		"mediatek,mt6779-smi-larb"
-		"mediatek,mt7623-smi-larb", "mediatek,mt2701-smi-larb"
-		"mediatek,mt8173-smi-larb"
-		"mediatek,mt8183-smi-larb"
-- reg : the register and size of this local arbiter.
-- mediatek,smi : a phandle to the smi_common node.
-- power-domains : a phandle to the power domain of this local arbiter.
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names: must contain 2 entries, as follows:
-  - "apb" : Advanced Peripheral Bus clock, It's the clock for setting
-	    the register.
-  - "smi" : It's the clock for transfer data and command.
-  and this optional clock name:
-  - "gals": the clock for GALS(Global Async Local Sync).
-  Here is the list which has this GALS: mt8183.
-
-Required property for mt2701, mt2712, mt6779 and mt7623:
-- mediatek,larb-id :the hardware id of this larb.
-
-Example:
-	larb1: larb@16010000 {
-		compatible = "mediatek,mt8173-smi-larb";
-		reg = <0 0x16010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
-		clocks = <&vdecsys CLK_VDEC_CKEN>,
-			 <&vdecsys CLK_VDEC_LARB_CKEN>;
-		clock-names = "apb", "smi";
-	};
-
-Example for mt2701:
-	larb0: larb@14010000 {
-		compatible = "mediatek,mt2701-smi-larb";
-		reg = <0 0x14010000 0 0x1000>;
-		mediatek,smi = <&smi_common>;
-		mediatek,larb-id = <0>;
-		clocks = <&mmsys CLK_MM_SMI_LARB0>,
-			 <&mmsys CLK_MM_SMI_LARB0>;
-		clock-names = "apb", "smi";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
new file mode 100644
index 000000000000..50793a0e6759
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SMI (Smart Multimedia Interface) Local Arbiter
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+description: |+
+  The hardware block diagram please check bindings/iommu/mediatek,iommu.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-smi-larb
+          - mediatek,mt2712-smi-larb
+          - mediatek,mt6779-smi-larb
+          - mediatek,mt8173-smi-larb
+          - mediatek,mt8183-smi-larb
+
+      - description: for mt7623
+        items:
+          - const: mediatek,mt7623-smi-larb
+          - const: mediatek,mt2701-smi-larb
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      apb and smi are mandatory. gals(global async local sync) is optional,
+      here is the list which require gals: mt8183.
+    minItems: 2
+    maxItems: 3
+    items:
+       - description: apb is Advanced Peripheral Bus clock, It's the clock for
+           setting the register.
+       - description: smi is the clock for transfer data and command.
+       - description: the clock for gals.
+
+  clock-names:
+    oneOf:
+      - items:
+         - const: apb
+         - const: smi
+      - items:
+         - const: apb
+         - const: smi
+         - const: gals
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,smi:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: a phandle to the smi_common node.
+
+  mediatek,larb-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    description: the hardware id of this larb.
+      Required property for mt2701, mt2712, mt6779 and mt7623.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    larb1: larb@16010000 {
+      compatible = "mediatek,mt8173-smi-larb";
+      reg = <0x16010000 0x1000>;
+      mediatek,smi = <&smi_common>;
+      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+      clocks = <&vdecsys CLK_VDEC_CKEN>,
+               <&vdecsys CLK_VDEC_LARB_CKEN>;
+      clock-names = "apb", "smi";
+    };
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
