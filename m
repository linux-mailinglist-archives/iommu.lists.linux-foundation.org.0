Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA2B1487
	for <lists.iommu@lfdr.de>; Thu, 12 Sep 2019 20:42:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 20F6BAC7;
	Thu, 12 Sep 2019 18:42:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BCB7FCC6
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 10:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
	[210.118.77.12])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29B5B8AA
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 10:20:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
	20190912102023euoutp02b87f11963d45b1b76c4fa30ad731d6a7~DqaV0O42b0296102961euoutp02e
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 10:20:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
	20190912102023euoutp02b87f11963d45b1b76c4fa30ad731d6a7~DqaV0O42b0296102961euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1568283623;
	bh=PfHXFCgRDtux4RVtVpQOJGAlubNU3XitVaH9bw8AQ9Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=DfmbhEQ1C+uwCuO68FkaWIvCKZ/adZFChPuKLjwSHNcnJK1xDe4Rn+n0WfQZ4niwi
	YJHnm/NJV/MN+hzS5SDkkID/VWc4DIXQ2FMCF4TLy2kF5GZWomstzXYC1Lwv/zz7PA
	pOlY//DERQdprbkGG4d9qD1+3QlbF5cTqFFI/y2M=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20190912102022eucas1p1e4e61b2e44891d9bb02018aed1192ac4~DqaUxR3wq0288402884eucas1p1n;
	Thu, 12 Sep 2019 10:20:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 9D.D9.04309.5EB1A7D5;
	Thu, 12 Sep 2019 11:20:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20190912102021eucas1p1b61b8bbdf809075c2c4f54d7e9312f98~DqaTzZ7pC1339313393eucas1p10;
	Thu, 12 Sep 2019 10:20:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20190912102020eusmtrp284707ba20b93c0e82ee5ad3e616cdbe3~DqaTlVkW_0582605826eusmtrp2m;
	Thu, 12 Sep 2019 10:20:20 +0000 (GMT)
X-AuditID: cbfec7f4-afbff700000010d5-0c-5d7a1be571a0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 33.2D.04117.4EB1A7D5;
	Thu, 12 Sep 2019 11:20:20 +0100 (BST)
Received: from AMDC2459.DIGITAL.local (unknown [106.120.51.95]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20190912102020eusmtip1409ac8703956cb4d202b88628e344b1e~DqaTIC3Ws0326303263eusmtip1x;
	Thu, 12 Sep 2019 10:20:20 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com,
	m.szyprowski@samsung.com, a.hajda@samsung.com
Subject: [PATCH] dt-bindings: gpu: Convert Samsung Image Rotator to dt-schema
Date: Thu, 12 Sep 2019 12:20:08 +0200
Message-Id: <20190912102008.14292-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsWy7djP87pPpatiDf7dNLe4te4cq0XvuZNM
	FvOPAFkL9ltbXN41h83iQfM6Nou1R+6yWyy9fpHJonXvEXYHTo8189Ywemxa1cnmsf3bA1aP
	yTeWM3r0bVnF6PF5k1wAWxSXTUpqTmZZapG+XQJXxrsdBgUtUhXdiy8wNTBOFe1i5OSQEDCR
	uLHyOXMXIxeHkMAKRomPcw6ygSSEBL4wSqz64waR+MwosePofnaYjoUPFrBBJJYzSsz8cZER
	wgHqONb6jBGkik3AQKL/zV4WEFtEIF/i4PYbrCBFzAI9jBLr5/0DGyUs4C/xt/krM4jNIqAq
	cf5JL5jNK2Ajcf51PzPEOnmJ1RsOQNmv2SQ+zlOCsF0kfp5aARUXlnh1fAvUeTIS/3fOZ+pi
	5ACyqyWufZMF2Ssh0MIocX3aWzaIGmuJP6smsoHUMAtoSqzfpQ8RdpTYe7OFBaKVT+LGW0GQ
	MDOQOWnbdGaIMK9ER5sQhKkq8WZCLESjtETrmv2MELaHxL6mHkZIGMZK/O9vY53AKDcLYdUC
	RsZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYgQni9L/jX3Yw7vqTdIhRgINRiYdX4G5F
	rBBrYllxZe4hRgkOZiURXp83lbFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeasZHkQLCaQnlqRm
	p6YWpBbBZJk4OKUaGBMNvwXtvrftmOGeNQ2G7xiuVDAuP8LqyrLoXIBQ4sP8BVKnpbgT+q9k
	7edqftX1UeXsJ649YfGu7H0Zitzn/tzkPr7Zkc22OiVmwVV2rYz7JTo6+2a2beXr6r6a9Tbt
	RHKh9xa7yBPHX5ud3MXHlOzybR9PIHOuidRnnsUzThjPd1We9NxirxJLcUaioRZzUXEiAAxW
	g34MAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsVy+t/xu7pPpKtiDWYdM7W4te4cq0XvuZNM
	FvOPAFkL9ltbXN41h83iQfM6Nou1R+6yWyy9fpHJonXvEXYHTo8189Ywemxa1cnmsf3bA1aP
	yTeWM3r0bVnF6PF5k1wAW5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
	TUpqTmZZapG+XYJexrsdBgUtUhXdiy8wNTBOFe1i5OSQEDCRWPhgAVsXIxeHkMBSRomHt96z
	QiSkJfZf+8gOYQtL/LnWBVX0iVGibXcLM0iCTcBAov/NXpYuRg4OEYFSicUvqkFqmAUmMEp8
	bnrBAlIjLOArseTkHUYQm0VAVeL8k16wXl4BG4nzr/uZIRbIS6zecIB5AiPPAkaGVYwiqaXF
	uem5xUZ6xYm5xaV56XrJ+bmbGIHhue3Yzy07GLveBR9iFOBgVOLhzbhfESvEmlhWXJl7iFGC
	g1lJhNfnTWWsEG9KYmVValF+fFFpTmrxIUZToOUTmaVEk/OBsZNXEm9oamhuYWlobmxubGah
	JM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGxyLj5+kX3i3v/z7evUjlRp7MtnzedvVCm++Yp
	920fpJhNJbhKuL/wfl2p+mgGn/bRuWEbHFmDJsinLLv/fRpfyxIrtdjJxnfTAy1mJNwzmnzR
	uOPesvesx30FGyU0t13m6DX6Oa+dm+3jiYXnhUUNNRb/vL9jpspjt7Xid2t7XKcFH7jU1/xG
	iaU4I9FQi7moOBEAq+i7S2UCAAA=
X-CMS-MailID: 20190912102021eucas1p1b61b8bbdf809075c2c4f54d7e9312f98
X-Msg-Generator: CA
X-RootMTR: 20190912102021eucas1p1b61b8bbdf809075c2c4f54d7e9312f98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190912102021eucas1p1b61b8bbdf809075c2c4f54d7e9312f98
References: <CGME20190912102021eucas1p1b61b8bbdf809075c2c4f54d7e9312f98@eucas1p1.samsung.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 12 Sep 2019 18:42:04 +0000
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
	Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Convert Samsung Image Rotator to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../bindings/gpu/samsung-rotator.txt          | 28 ------------
 .../bindings/gpu/samsung-rotator.yaml         | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.yaml

diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
deleted file mode 100644
index 3aca2578da0b..000000000000
--- a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Samsung Image Rotator
-
-Required properties:
-  - compatible : value should be one of the following:
-	* "samsung,s5pv210-rotator" for Rotator IP in S5PV210
-	* "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
-	* "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4412
-	* "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : Interrupt specifier for rotator interrupt, according to format
-		 specific to interrupt parent.
-
-  - clocks : Clock specifier for rotator clock, according to generic clock
-	     bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
-
-  - clock-names : Names of clocks. For exynos rotator, it should be "rotator".
-
-Example:
-	rotator@12810000 {
-		compatible = "samsung,exynos4210-rotator";
-		reg = <0x12810000 0x1000>;
-		interrupts = <0 83 0>;
-		clocks = <&clock 278>;
-		clock-names = "rotator";
-	};
diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
new file mode 100644
index 000000000000..6927cfc1aefc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/samsung-rotator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Image Rotator
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+
+properties:
+  compatible:
+    enum:
+      - "samsung,s5pv210-rotator"    # for Rotator IP in S5PV210
+      - "samsung,exynos4210-rotator" # for Rotator IP in Exynos4210
+      - "samsung,exynos4212-rotator" # for Rotator IP in Exynos4212/4412
+      - "samsung,exynos5250-rotator" # for Rotator IP in Exynos5250
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Clock specifier for rotator clock according to generic clock
+      bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
+    maxItems: 1
+
+  clock-names:
+    items:
+    - const: rotator
+    maxItems: 1
+
+examples:
+  - |
+    rotator@12810000 {
+        compatible = "samsung,exynos4210-rotator";
+        reg = <0x12810000 0x1000>;
+        interrupts = <0 83 0>;
+        clocks = <&clock 278>;
+        clock-names = "rotator";
+    };
+
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
