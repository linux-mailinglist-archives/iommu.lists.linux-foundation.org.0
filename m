Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 223403900AF
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 14:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A36383C3E;
	Tue, 25 May 2021 12:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bj4CACH9qa-s; Tue, 25 May 2021 12:16:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B7683C72;
	Tue, 25 May 2021 12:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45FDEC0001;
	Tue, 25 May 2021 12:16:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64D45C0001
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 12:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52419403A3
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 12:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Sgrs59VlW87 for <iommu@lists.linux-foundation.org>;
 Tue, 25 May 2021 12:16:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E915D4039B
 for <iommu@lists.linux-foundation.org>; Tue, 25 May 2021 12:16:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: benjamin.gaignard)
 with ESMTPSA id C83E71F421E8
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 xxm@rock-chips.com, robin.murphy@arm.com
Subject: [PATCH v7 1/4] dt-bindings: iommu: rockchip: Convert IOMMU to DT
 schema
Date: Tue, 25 May 2021 14:15:48 +0200
Message-Id: <20210525121551.606240-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
References: <20210525121551.606240-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

Convert Rockchip IOMMU to DT schema

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/iommu/rockchip,iommu.txt         | 38 ---------
 .../bindings/iommu/rockchip,iommu.yaml        | 80 +++++++++++++++++++
 2 files changed, 80 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt b/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
deleted file mode 100644
index 6ecefea1c6f9..000000000000
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Rockchip IOMMU
-==============
-
-A Rockchip DRM iommu translates io virtual addresses to physical addresses for
-its master device.  Each slave device is bound to a single master device, and
-shares its clocks, power domain and irq.
-
-Required properties:
-- compatible      : Should be "rockchip,iommu"
-- reg             : Address space for the configuration registers
-- interrupts      : Interrupt specifier for the IOMMU instance
-- interrupt-names : Interrupt name for the IOMMU instance
-- #iommu-cells    : Should be <0>.  This indicates the iommu is a
-                    "single-master" device, and needs no additional information
-                    to associate with its master device.  See:
-                    Documentation/devicetree/bindings/iommu/iommu.txt
-- clocks          : A list of clocks required for the IOMMU to be accessible by
-                    the host CPU.
-- clock-names     : Should contain the following:
-	"iface" - Main peripheral bus clock (PCLK/HCL) (required)
-	"aclk"  - AXI bus clock (required)
-
-Optional properties:
-- rockchip,disable-mmu-reset : Don't use the mmu reset operation.
-			       Some mmu instances may produce unexpected results
-			       when the reset operation is used.
-
-Example:
-
-	vopl_mmu: iommu@ff940300 {
-		compatible = "rockchip,iommu";
-		reg = <0xff940300 0x100>;
-		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "vopl_mmu";
-		clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
-		clock-names = "aclk", "iface";
-		#iommu-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
new file mode 100644
index 000000000000..099fc2578b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip IOMMU
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |+
+  A Rockchip DRM iommu translates io virtual addresses to physical addresses for
+  its master device. Each slave device is bound to a single master device and
+  shares its clocks, power domain and irq.
+
+  For information on assigning IOMMU controller to its peripheral devices,
+  see generic IOMMU bindings.
+
+properties:
+  compatible:
+    const: rockchip,iommu
+
+  reg:
+    items:
+      - description: configuration registers for MMU instance 0
+      - description: configuration registers for MMU instance 1
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    items:
+      - description: interruption for MMU instance 0
+      - description: interruption for MMU instance 1
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: iface
+
+  "#iommu-cells":
+    const: 0
+
+  rockchip,disable-mmu-reset:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not use the mmu reset operation.
+      Some mmu instances may produce unexpected results
+      when the reset operation is used.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    vopl_mmu: iommu@ff940300 {
+      compatible = "rockchip,iommu";
+      reg = <0xff940300 0x100>;
+      interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
+      clock-names = "aclk", "iface";
+      #iommu-cells = <0>;
+    };
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
