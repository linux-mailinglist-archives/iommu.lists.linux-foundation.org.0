Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375AB90F5
	for <lists.iommu@lfdr.de>; Fri, 20 Sep 2019 15:48:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 46D7EBA0;
	Fri, 20 Sep 2019 13:48:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63C40BA0
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 13:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B4FDE81A
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 13:48:33 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b2so6204533otq.10
	for <iommu@lists.linux-foundation.org>;
	Fri, 20 Sep 2019 06:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wyzOgChbiOArfvFaPvRpSR8QfOu1l1w0Piqw31gm3Gs=;
	b=MHp591KwBldmqhy4rassUIepMdeDZwj1x6wVLCajhMZ+wS3rFXTDucceX2KLXquSgT
	LeEkF46jzfgSTNY1NHVIoHCOuoaZ62QDxB1rfB2LG6w7DJKlYzqa/nZqgtLWCS8ikYuF
	ELFoWMX6MuZn2CY/EJx7gzAaOqUEjAAHqyrjy9fGJQ4LfOGaJq6hpoKECjLe5FTyreLw
	jDlc29OFiB9LT/SPqR58Vhvcq5zwxpKxqHrJdShsqLCp+cU8ne1Pr3ywKCY3+l9gFCi2
	iQEHsMlG8KjX1Etlb1zqM2pzvzhTtQCchl788VpHzrwFXzKcJJ+HhmG0bI5m8AI6lcDd
	ZIhA==
X-Gm-Message-State: APjAAAXGGQzw9J1KRXsPD92L0V08aKIXQVM/SX/XL6BV0qt6bIlHYqo5
	hCCqzd0FGmmWkVqtO/tcjQ==
X-Google-Smtp-Source: APXvYqxpFuDK5AFDI/+NJB/5aivaWoCqTuWiyvp26NI2QumaORZpdI7qLGoWLFnmpbIxLOFM3fsf/w==
X-Received: by 2002:a9d:5544:: with SMTP id h4mr11471400oti.347.1568987312829; 
	Fri, 20 Sep 2019 06:48:32 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
	[24.155.109.49]) by smtp.googlemail.com with ESMTPSA id
	w20sm403259otq.72.2019.09.20.06.48.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 06:48:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: iommu: Convert Arm SMMUv3 to DT schema
Date: Fri, 20 Sep 2019 08:48:29 -0500
Message-Id: <20190920134829.16432-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920134829.16432-1-robh@kernel.org>
References: <20190920134829.16432-1-robh@kernel.org>
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

Convert the Arm SMMv3 binding to the DT schema format.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <Robin.Murphy@arm.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iommu/arm,smmu-v3.txt |  77 -------------
 .../bindings/iommu/arm,smmu-v3.yaml           | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
deleted file mode 100644
index c9abbf3e4f68..000000000000
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* ARM SMMUv3 Architecture Implementation
-
-The SMMUv3 architecture is a significant departure from previous
-revisions, replacing the MMIO register interface with in-memory command
-and event queues and adding support for the ATS and PRI components of
-the PCIe specification.
-
-** SMMUv3 required properties:
-
-- compatible        : Should include:
-
-                      * "arm,smmu-v3" for any SMMUv3 compliant
-                        implementation. This entry should be last in the
-                        compatible list.
-
-- reg               : Base address and size of the SMMU.
-
-- interrupts        : Non-secure interrupt list describing the wired
-                      interrupt sources corresponding to entries in
-                      interrupt-names. If no wired interrupts are
-                      present then this property may be omitted.
-
-- interrupt-names   : When the interrupts property is present, should
-                      include the following:
-                      * "eventq"    - Event Queue not empty
-                      * "priq"      - PRI Queue not empty
-                      * "cmdq-sync" - CMD_SYNC complete
-                      * "gerror"    - Global Error activated
-                      * "combined"  - The combined interrupt is optional,
-				      and should only be provided if the
-				      hardware supports just a single,
-				      combined interrupt line.
-				      If provided, then the combined interrupt
-				      will be used in preference to any others.
-
-- #iommu-cells      : See the generic IOMMU binding described in
-                        devicetree/bindings/pci/pci-iommu.txt
-                      for details. For SMMUv3, must be 1, with each cell
-                      describing a single stream ID. All possible stream
-                      IDs which a device may emit must be described.
-
-** SMMUv3 optional properties:
-
-- dma-coherent      : Present if DMA operations made by the SMMU (page
-                      table walks, stream table accesses etc) are cache
-                      coherent with the CPU.
-
-                      NOTE: this only applies to the SMMU itself, not
-                      masters connected upstream of the SMMU.
-
-- msi-parent        : See the generic MSI binding described in
-                        devicetree/bindings/interrupt-controller/msi.txt
-                      for a description of the msi-parent property.
-
-- hisilicon,broken-prefetch-cmd
-                    : Avoid sending CMD_PREFETCH_* commands to the SMMU.
-
-- cavium,cn9900-broken-page1-regspace
-                    : Replaces all page 1 offsets used for EVTQ_PROD/CONS,
-		      PRIQ_PROD/CONS register access with page 0 offsets.
-		      Set for Cavium ThunderX2 silicon that doesn't support
-		      SMMU page1 register space.
-
-** Example
-
-        smmu@2b400000 {
-                compatible = "arm,smmu-v3";
-                reg = <0x0 0x2b400000 0x0 0x20000>;
-                interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
-                             <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
-                interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
-                dma-coherent;
-                #iommu-cells = <1>;
-                msi-parent = <&its 0xff0000>;
-        };
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
new file mode 100644
index 000000000000..1c97bcfbf82b
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM SMMUv3 Architecture Implementation
+
+maintainers:
+  - Will Deacon <will@kernel.org>
+  - Robin Murphy <Robin.Murphy@arm.com>
+
+description: |+
+  The SMMUv3 architecture is a significant departure from previous
+  revisions, replacing the MMIO register interface with in-memory command
+  and event queues and adding support for the ATS and PRI components of
+  the PCIe specification.
+
+properties:
+  $nodename:
+    pattern: "^iommu@[0-9a-f]*"
+  compatible:
+    const: arm,smmu-v3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    oneOf:
+      - const: combined
+        description:
+          The combined interrupt is optional, and should only be provided if the
+          hardware supports just a single, combined interrupt line.
+          If provided, then the combined interrupt will be used in preference to
+          any others.
+      - items:
+          - const: eventq     # Event Queue not empty
+          - const: priq       # PRI Queue not empty
+          - const: cmdq-sync  # CMD_SYNC complete
+          - const: gerror     # Global Error activated
+      - items:
+          - const: eventq
+          - const: gerror
+          - const: priq
+      - items:
+          - const: eventq
+          - const: gerror
+      - items:
+          - const: eventq
+          - const: priq
+
+  '#iommu-cells':
+    const: 1
+
+  dma-coherent:
+    description: |
+      Present if page table walks made by the SMMU are cache coherent with the
+      CPU.
+
+      NOTE: this only applies to the SMMU itself, not masters connected
+      upstream of the SMMU.
+
+  msi-parent: true
+
+  hisilicon,broken-prefetch-cmd:
+    type: boolean
+    description: Avoid sending CMD_PREFETCH_* commands to the SMMU.
+
+  cavium,cn9900-broken-page1-regspace:
+    type: boolean
+    description:
+      Replaces all page 1 offsets used for EVTQ_PROD/CONS, PRIQ_PROD/CONS
+      register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
+      doesn't support SMMU page1 register space.
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu@2b400000 {
+            compatible = "arm,smmu-v3";
+            reg = <0x2b400000 0x20000>;
+            interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 77 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "eventq", "priq", "cmdq-sync", "gerror";
+            dma-coherent;
+            #iommu-cells = <1>;
+            msi-parent = <&its 0xff0000>;
+    };
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
