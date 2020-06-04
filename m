Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317D1EEE66
	for <lists.iommu@lfdr.de>; Fri,  5 Jun 2020 01:44:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EFB5E203DF;
	Thu,  4 Jun 2020 23:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4-bkeD8FR+Z; Thu,  4 Jun 2020 23:44:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C5144252B7;
	Thu,  4 Jun 2020 23:44:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AB25C016E;
	Thu,  4 Jun 2020 23:44:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A5B6C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2937587D93
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMMjJnYTelP6 for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 23:44:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 033A387D5D
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 23:44:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed987420002>; Thu, 04 Jun 2020 16:44:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 04 Jun 2020 16:44:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 04 Jun 2020 16:44:14 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jun
 2020 23:44:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 4 Jun 2020 23:44:11 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed9874a0005>; Thu, 04 Jun 2020 16:44:11 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v6 2/4] dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
Date: Thu, 4 Jun 2020 16:44:12 -0700
Message-ID: <20200604234414.21912-3-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604234414.21912-1-vdumpa@nvidia.com>
References: <20200604234414.21912-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591314242; bh=LA4k1vg82nqOEyJBiSaKjPU8uIzrWZealS2lAAvphgk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=rBXETk7xwGWbuVNmN3vTOczEhnc2iu7nNASUTnfsSUnD1Ps9OVc+EwjmoWr1lQjq/
 AhP403/amHyAdT60kq+RZj0kHiG/eJ76nAGWigpdvjTfxlEcDUxOE4K3Om42mdWTay
 FsCQUW0PqZaNkppdD62IO/GKKiJDAURu2JmB+R1bAQxmp9j58IE93+JAyMhU4q1ytc
 C5CjYv0lG7nF9iNNBSakm/V8Ydazp7tF/MH44FPjVeHcHPWNGKCbAZg8RX6QyttlEM
 HnJLi7Zu8IjMgZ6SxHIYiIRdU00obAzoDTMXHXRqjXRR1djtCGOIoFx3hyel0TlFlz
 wfBHUbGXow46A==
Cc: snikam@nvidia.com, mperttunen@nvidia.com, bhuntsman@nvidia.com,
 will@kernel.org, linux-kernel@vger.kernel.org, praithatha@nvidia.com,
 talho@nvidia.com, iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

Add binding for NVIDIA's Tegra194 Soc SMMU that is based
on ARM MMU-500.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index e3ef1c69d1326..8f7ffd248f303 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,11 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: NVIDIA SoCs that use more than one "arm,mmu-500"
+        items:
+          - enum:
+              - nvdia,tegra194-smmu-500
+          - const: arm,mmu-500
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
