Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DC20CBC5
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 04:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC9FD86DFA;
	Mon, 29 Jun 2020 02:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MA-Aozi0Ohm; Mon, 29 Jun 2020 02:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 857F886E3F;
	Mon, 29 Jun 2020 02:28:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 728C7C0891;
	Mon, 29 Jun 2020 02:28:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25B16C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 02:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 152F2890C7
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 02:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3mFkyvdu3Oe for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 02:28:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C1718915B
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 02:28:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef9517d0000>; Sun, 28 Jun 2020 19:27:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 28 Jun 2020 19:28:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 28 Jun 2020 19:28:47 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 02:28:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 29 Jun 2020 02:28:43 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef951db0000>; Sun, 28 Jun 2020 19:28:43 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v7 2/3] dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
Date: Sun, 28 Jun 2020 19:28:37 -0700
Message-ID: <20200629022838.29628-3-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629022838.29628-1-vdumpa@nvidia.com>
References: <20200629022838.29628-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593397629; bh=Jc+XyeC88tqkNN/9PiqUq0uk5O5JxUm8Rkp1FWBteWQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=dbBcjSCbNMBnx4resYq5aRg0eLqJaX0Oa9boG2kLvDeGgREv/HSDUbYahmmlvkNPr
 R8MHpsrZ6xQvM/AXahdOHEh+H+ph8nvjCTNgsRt9sY6uoohmAmaTx60LlSGCP3Sswa
 UIco0yjtaypaHczUujOYsPEuNF1cuUIJkkpiHpeFfPXI0wT/44qD1lPnUvasJN2zqx
 9UfYtTY3A7h4WfTy1ROs52kj++jGfbH5RNdYFlrkdu/b4pjiletjy1BMnTdzDTmWG5
 q1a6DJKZc0x/9RjuSw3RlVKECJSDJRKRZU2CTDTPP0sewIEP8TbcjflesKeTOnYpu1
 y5jfoaqS6sbJA==
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

Add binding for NVIDIA's Tegra194 SoC SMMU topology that is based
on ARM MMU-500.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423b..5b2586ac715ed 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,11 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: NVIDIA SoCs that use more than one "arm,mmu-500"
+        items:
+          - enum:
+              - nvdia,tegra194-smmu
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
