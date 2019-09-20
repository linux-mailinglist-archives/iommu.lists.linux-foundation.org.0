Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B252AB90F4
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 15:48:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F7DEC2A;
	Fri, 20 Sep 2019 13:48:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0E803BA0
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 13:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B08D4711
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 13:48:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w6so1768715oie.11
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 06:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XnL3LBT8QQzpbHU1IfgBjfB53gmEW+KuMGZ91NGzOsg=;
	b=TFtZydk4RfkkdsVvBniG54JpVkRjehzwTF/wnR26w+9Y8qJ9OOX2t4gwJaN54SQkpi
	bNx3ec4padfnAH92f6q84rQw6jCojSd/cqXpsbK3ZavYqXnijsGFFupXBXgB+bUWotKW
	T7ggjFarNVJGHUkLiAWqDmKaampjVrlqIuFy7b9RIY/Ru4rydE8NNW9r7uTp/bg5GHBQ
	8o5ebrAukQiyb3p8GCEyxLpikm8/P43bf6rJmhzfp9cnI60rLnwKMpbTQ2rOhR36UFcM
	NWFM1nqPafgDW04RSHK0D6qcxb/HNaYgnkLyaMrJr7JFbV35UiCuP/fLusQZnD7u1pBI
	Ltzg==
X-Gm-Message-State: APjAAAWQMkwgk6JPzNxRYAMLIozxTy5yadXAugfbSmpgkORDwVjPto2e
	/RDbenmvmRGyXtqb3wZr8Q==
X-Google-Smtp-Source: APXvYqx89BFJRIb7o5gXOotH+WYXhC/3vTsDGrmToA/iOsvUj9N46HFYFcHXJABIs7znL0LgPpq1rg==
X-Received: by 2002:aca:701:: with SMTP id 1mr3040072oih.85.1568987311732;
	Fri, 20 Sep 2019 06:48:31 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
	[24.155.109.49]) by smtp.googlemail.com with ESMTPSA id
	w20sm403259otq.72.2019.09.20.06.48.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 06:48:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iommu: Convert Arm SMMU to DT schema
Date: Fri, 20 Sep 2019 08:48:28 -0500
Message-Id: <20190920134829.16432-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPOOFED_FREEMAIL autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <Robin.Murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Convert the Arm SMMU binding to DT schema.

The existing binding doc doesn't cover the number of variations of
compatible properties found in .dts files. "qcom,msm8998-smmu-v2" was
also missing, so add it.

SoCFPGA Stratix10 has a single clock defined which doesn't match the
binding. This issue remains.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <Robin.Murphy@arm.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iommu/arm,smmu.txt    | 182 --------------
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 229 ++++++++++++++++++
 2 files changed, 229 insertions(+), 182 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
deleted file mode 100644
index 3133f3ba7567..000000000000
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ /dev/null
@@ -1,182 +0,0 @@
-* ARM System MMU Architecture Implementation
-
-ARM SoCs may contain an implementation of the ARM System Memory
-Management Unit Architecture, which can be used to provide 1 or 2 stages
-of address translation to bus masters external to the CPU.
-
-The SMMU may also raise interrupts in response to various fault
-conditions.
-
-** System MMU required properties:
-
-- compatible    : Should be one of:
-
-                        "arm,smmu-v1"
-                        "arm,smmu-v2"
-                        "arm,mmu-400"
-                        "arm,mmu-401"
-                        "arm,mmu-500"
-                        "cavium,smmu-v2"
-                        "qcom,smmu-v2"
-
-                  depending on the particular implementation and/or the
-                  version of the architecture implemented.
-
-                  Qcom SoCs must contain, as below, SoC-specific compatibles
-                  along with "qcom,smmu-v2":
-                  "qcom,msm8996-smmu-v2", "qcom,smmu-v2",
-                  "qcom,sdm845-smmu-v2", "qcom,smmu-v2".
-
-                  Qcom SoCs implementing "arm,mmu-500" must also include,
-                  as below, SoC-specific compatibles:
-                  "qcom,sdm845-smmu-500", "arm,mmu-500"
-
-- reg           : Base address and size of the SMMU.
-
-- #global-interrupts : The number of global interrupts exposed by the
-                       device.
-
-- interrupts    : Interrupt list, with the first #global-irqs entries
-                  corresponding to the global interrupts and any
-                  following entries corresponding to context interrupts,
-                  specified in order of their indexing by the SMMU.
-
-                  For SMMUv2 implementations, there must be exactly one
-                  interrupt per context bank. In the case of a single,
-                  combined interrupt, it must be listed multiple times.
-
-- #iommu-cells  : See Documentation/devicetree/bindings/iommu/iommu.txt
-                  for details. With a value of 1, each IOMMU specifier
-                  represents a distinct stream ID emitted by that device
-                  into the relevant SMMU.
-
-                  SMMUs with stream matching support and complex masters
-                  may use a value of 2, where the second cell of the
-                  IOMMU specifier represents an SMR mask to combine with
-                  the ID in the first cell.  Care must be taken to ensure
-                  the set of matched IDs does not result in conflicts.
-
-** System MMU optional properties:
-
-- dma-coherent  : Present if page table walks made by the SMMU are
-                  cache coherent with the CPU.
-
-                  NOTE: this only applies to the SMMU itself, not
-                  masters connected upstream of the SMMU.
-
-- calxeda,smmu-secure-config-access : Enable proper handling of buggy
-                  implementations that always use secure access to
-                  SMMU configuration registers. In this case non-secure
-                  aliases of secure registers have to be used during
-                  SMMU configuration.
-
-- stream-match-mask : For SMMUs supporting stream matching and using
-                  #iommu-cells = <1>, specifies a mask of bits to ignore
-		  when matching stream IDs (e.g. this may be programmed
-		  into the SMRn.MASK field of every stream match register
-		  used). For cases where it is desirable to ignore some
-                  portion of every Stream ID (e.g. for certain MMU-500
-                  configurations given globally unique input IDs). This
-                  property is not valid for SMMUs using stream indexing,
-                  or using stream matching with #iommu-cells = <2>, and
-                  may be ignored if present in such cases.
-
-- clock-names:    List of the names of clocks input to the device. The
-                  required list depends on particular implementation and
-                  is as follows:
-                  - for "qcom,smmu-v2":
-                    - "bus": clock required for downstream bus access and
-                             for the smmu ptw,
-                    - "iface": clock required to access smmu's registers
-                               through the TCU's programming interface.
-                  - unspecified for other implementations.
-
-- clocks:         Specifiers for all clocks listed in the clock-names property,
-                  as per generic clock bindings.
-
-- power-domains:  Specifiers for power domains required to be powered on for
-                  the SMMU to operate, as per generic power domain bindings.
-
-** Deprecated properties:
-
-- mmu-masters (deprecated in favour of the generic "iommus" binding) :
-                  A list of phandles to device nodes representing bus
-                  masters for which the SMMU can provide a translation
-                  and their corresponding Stream IDs. Each device node
-                  linked from this list must have a "#stream-id-cells"
-                  property, indicating the number of Stream ID
-                  arguments associated with its phandle.
-
-** Examples:
-
-        /* SMMU with stream matching or stream indexing */
-        smmu1: iommu {
-                compatible = "arm,smmu-v1";
-                reg = <0xba5e0000 0x10000>;
-                #global-interrupts = <2>;
-                interrupts = <0 32 4>,
-                             <0 33 4>,
-                             <0 34 4>, /* This is the first context interrupt */
-                             <0 35 4>,
-                             <0 36 4>,
-                             <0 37 4>;
-                #iommu-cells = <1>;
-        };
-
-        /* device with two stream IDs, 0 and 7 */
-        master1 {
-                iommus = <&smmu1 0>,
-                         <&smmu1 7>;
-        };
-
-
-        /* SMMU with stream matching */
-        smmu2: iommu {
-                ...
-                #iommu-cells = <2>;
-        };
-
-        /* device with stream IDs 0 and 7 */
-        master2 {
-                iommus = <&smmu2 0 0>,
-                         <&smmu2 7 0>;
-        };
-
-        /* device with stream IDs 1, 17, 33 and 49 */
-        master3 {
-                iommus = <&smmu2 1 0x30>;
-        };
-
-
-        /* ARM MMU-500 with 10-bit stream ID input configuration */
-        smmu3: iommu {
-                compatible = "arm,mmu-500", "arm,smmu-v2";
-                ...
-                #iommu-cells = <1>;
-                /* always ignore appended 5-bit TBU number */
-                stream-match-mask = 0x7c00;
-        };
-
-        bus {
-                /* bus whose child devices emit one unique 10-bit stream
-                   ID each, but may master through multiple SMMU TBUs */
-                iommu-map = <0 &smmu3 0 0x400>;
-                ...
-        };
-
-	/* Qcom's arm,smmu-v2 implementation */
-	smmu4: iommu@d00000 {
-		compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-		reg = <0xd00000 0x10000>;
-
-		#global-interrupts = <1>;
-		interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
-		#iommu-cells = <1>;
-		power-domains = <&mmcc MDSS_GDSC>;
-
-		clocks = <&mmcc SMMU_MDP_AXI_CLK>,
-			 <&mmcc SMMU_MDP_AHB_CLK>;
-		clock-names = "bus", "iface";
-	};
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
new file mode 100644
index 000000000000..3b31b4802a54
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -0,0 +1,229 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM System MMU Architecture Implementation
+
+maintainers:
+  - Will Deacon <will@kernel.org>
+  - Robin Murphy <Robin.Murphy@arm.com>
+
+description: |+
+  ARM SoCs may contain an implementation of the ARM System Memory
+  Management Unit Architecture, which can be used to provide 1 or 2 stages
+  of address translation to bus masters external to the CPU.
+
+  The SMMU may also raise interrupts in response to various fault
+  conditions.
+
+properties:
+  $nodename:
+    pattern: "^iommu@[0-9a-f]*"
+  compatible:
+    oneOf:
+      - description: Qcom SoCs implementing "arm,smmu-v2"
+        items:
+          - enum:
+              - qcom,msm8996-smmu-v2
+              - qcom,msm8998-smmu-v2
+              - qcom,sdm845-smmu-v2
+          - const: qcom,smmu-v2
+
+      - description: Qcom SoCs implementing "arm,mmu-500"
+        items:
+          - enum:
+              - qcom,sdm845-smmu-500
+          - const: arm,mmu-500
+      - items:
+          - const: arm,mmu-500
+          - const: arm,smmu-v2
+      - items:
+          - const: arm,mmu-401
+          - const: arm,smmu-v1
+      - enum:
+          - arm,smmu-v1
+          - arm,smmu-v2
+          - arm,mmu-400
+          - arm,mmu-401
+          - arm,mmu-500
+          - cavium,smmu-v2
+
+  reg:
+    maxItems: 1
+
+  '#global-interrupts':
+    description: The number of global interrupts exposed by the device.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 260   # 2 secure, 2 non-secure, and up to 256 perf counters
+
+  '#iommu-cells':
+    enum: [ 1, 2 ]
+    description: |
+      See Documentation/devicetree/bindings/iommu/iommu.txt for details. With a
+      value of 1, each IOMMU specifier represents a distinct stream ID emitted
+      by that device into the relevant SMMU.
+
+      SMMUs with stream matching support and complex masters may use a value of
+      2, where the second cell of the IOMMU specifier represents an SMR mask to
+      combine with the ID in the first cell.  Care must be taken to ensure the
+      set of matched IDs does not result in conflicts.
+
+  interrupts:
+    minItems: 1
+    maxItems: 388   # 260 plus 128 contexts
+    description: |
+      Interrupt list, with the first #global-interrupts entries corresponding to
+      the global interrupts and any following entries corresponding to context
+      interrupts, specified in order of their indexing by the SMMU.
+
+      For SMMUv2 implementations, there must be exactly one interrupt per
+      context bank. In the case of a single, combined interrupt, it must be
+      listed multiple times.
+
+  dma-coherent:
+    description: |
+      Present if page table walks made by the SMMU are cache coherent with the
+      CPU.
+
+      NOTE: this only applies to the SMMU itself, not masters connected
+      upstream of the SMMU.
+
+  calxeda,smmu-secure-config-access:
+    type: boolean
+    description:
+      Enable proper handling of buggy implementations that always use secure
+      access to SMMU configuration registers. In this case non-secure aliases of
+      secure registers have to be used during SMMU configuration.
+
+  stream-match-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      For SMMUs supporting stream matching and using #iommu-cells = <1>,
+      specifies a mask of bits to ignore when matching stream IDs (e.g. this may
+      be programmed into the SMRn.MASK field of every stream match register
+      used). For cases where it is desirable to ignore some portion of every
+      Stream ID (e.g. for certain MMU-500 configurations given globally unique
+      input IDs). This property is not valid for SMMUs using stream indexing, or
+      using stream matching with #iommu-cells = <2>, and may be ignored if
+      present in such cases.
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+
+  clocks:
+    items:
+      - description: bus clock required for downstream bus access and for the
+          smmu ptw
+      - description: interface clock required to access smmu's registers
+          through the TCU's programming interface.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#global-interrupts'
+  - '#iommu-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    /* SMMU with stream matching or stream indexing */
+    smmu1: iommu@ba5e0000 {
+            compatible = "arm,smmu-v1";
+            reg = <0xba5e0000 0x10000>;
+            #global-interrupts = <2>;
+            interrupts = <0 32 4>,
+                         <0 33 4>,
+                         <0 34 4>, /* This is the first context interrupt */
+                         <0 35 4>,
+                         <0 36 4>,
+                         <0 37 4>;
+            #iommu-cells = <1>;
+    };
+
+    /* device with two stream IDs, 0 and 7 */
+    master1 {
+            iommus = <&smmu1 0>,
+                     <&smmu1 7>;
+    };
+
+
+    /* SMMU with stream matching */
+    smmu2: iommu@ba5f0000 {
+            compatible = "arm,smmu-v1";
+            reg = <0xba5f0000 0x10000>;
+            #global-interrupts = <2>;
+            interrupts = <0 38 4>,
+                         <0 39 4>,
+                         <0 40 4>, /* This is the first context interrupt */
+                         <0 41 4>,
+                         <0 42 4>,
+                         <0 43 4>;
+            #iommu-cells = <2>;
+    };
+
+    /* device with stream IDs 0 and 7 */
+    master2 {
+            iommus = <&smmu2 0 0>,
+                     <&smmu2 7 0>;
+    };
+
+    /* device with stream IDs 1, 17, 33 and 49 */
+    master3 {
+            iommus = <&smmu2 1 0x30>;
+    };
+
+
+    /* ARM MMU-500 with 10-bit stream ID input configuration */
+    smmu3: iommu@ba600000 {
+            compatible = "arm,mmu-500", "arm,smmu-v2";
+            reg = <0xba600000 0x10000>;
+            #global-interrupts = <2>;
+            interrupts = <0 44 4>,
+                         <0 45 4>,
+                         <0 46 4>, /* This is the first context interrupt */
+                         <0 47 4>,
+                         <0 48 4>,
+                         <0 49 4>;
+            #iommu-cells = <1>;
+            /* always ignore appended 5-bit TBU number */
+            stream-match-mask = <0x7c00>;
+    };
+
+    bus {
+            /* bus whose child devices emit one unique 10-bit stream
+               ID each, but may master through multiple SMMU TBUs */
+            iommu-map = <0 &smmu3 0 0x400>;
+
+
+    };
+
+  - |+
+    /* Qcom's arm,smmu-v2 implementation */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    smmu4: iommu@d00000 {
+      compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+      reg = <0xd00000 0x10000>;
+
+      #global-interrupts = <1>;
+      interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+             <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+      #iommu-cells = <1>;
+      power-domains = <&mmcc 0>;
+
+      clocks = <&mmcc 123>,
+        <&mmcc 124>;
+      clock-names = "bus", "iface";
+    };
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
