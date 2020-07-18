Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC331224DA6
	for <lists.iommu@lfdr.de>; Sat, 18 Jul 2020 21:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C9BA2040C;
	Sat, 18 Jul 2020 19:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3cRU2ftN-Ix; Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 97058204A4;
	Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF33C0733;
	Sat, 18 Jul 2020 19:35:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6199C0733
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C201A87832
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-GeJsEY2NCx for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 389F087838
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:16 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f134eb70000>; Sat, 18 Jul 2020 12:34:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 12:35:15 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 12:35:15 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 19:35:11 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 18 Jul 2020 19:35:10 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f134eed0003>; Sat, 18 Jul 2020 12:35:10 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH v11 4/5] dt-bindings: arm-smmu: add binding for Tegra194 SMMU
Date: Sat, 18 Jul 2020 12:34:56 -0700
Message-ID: <20200718193457.30046-5-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718193457.30046-1-vdumpa@nvidia.com>
References: <20200718193457.30046-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595100855; bh=Y2GkTsQPdZaXJ3/ZSfPDjVUpBzjiUKOjktXU6d24nFk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=JzUqKQqNncVSoo1ttjCQA2/b08DCu9lGElLEyC7u6129abh0YWGJLXNmcf5JCG3Qt
 YK52ulKn10OO8sT57ZA6a3Ln3/0UR9LwvuGtKU9bgL9VfQEa4DgZNpvVSRwa+tj8tt
 iHvaYJAMWlvn0p18m0Yysf1H702r0+TH36/jdb9drqvAFl/8rRaNrvkiPhIlI0p20d
 zIBc7HxKFuR5Qo2dRmcdffP1n15fw9nu/Q0Y5V5d9PqgHrxs0BY+s5I0JrbFCFClun
 +2hPd4wifnK8zisRUUkauu0SGnGldYq9rMz7nzpo5V1ijCVrEujQ1lDxGgOhHPKTbn
 WTerEMONdvyWg==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 Rob Herring <robh@kernel.org>, bhuntsman@nvidia.com, yhsu@nvidia.com,
 linux-kernel@vger.kernel.org, talho@nvidia.com,
 iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

Add binding for NVIDIA's Tegra194 SoC SMMU.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 93fb9fe068b9..503160a7b9a0 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -44,6 +44,11 @@ properties:
         items:
           - const: marvell,ap806-smmu-500
           - const: arm,mmu-500
+      - description: NVIDIA SoCs that program two ARM MMU-500s identically
+        items:
+          - enum:
+              - nvidia,tegra194-smmu
+          - const: nvidia,smmu-500
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
@@ -61,7 +66,8 @@ properties:
           - cavium,smmu-v2
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   '#global-interrupts':
     description: The number of global interrupts exposed by the device.
@@ -144,6 +150,23 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-smmu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 examples:
   - |+
     /* SMMU with stream matching or stream indexing */
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
