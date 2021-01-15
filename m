Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B72F74D2
	for <lists.iommu@lfdr.de>; Fri, 15 Jan 2021 10:03:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03DC6867BD;
	Fri, 15 Jan 2021 09:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7GgTCD6XqKE; Fri, 15 Jan 2021 09:03:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A510B8665F;
	Fri, 15 Jan 2021 09:03:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F9D5C088B;
	Fri, 15 Jan 2021 09:03:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF08FC088B
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 09:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 96A33869B4
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 09:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xh+wnKUUfeZs for <iommu@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 09:03:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1A4D7869A7
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 09:03:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4456207C4;
 Fri, 15 Jan 2021 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610701420;
 bh=uJhyVV4SVJoHx8fWIPl5o7ANEKCUgWUsewnTvhAof9U=;
 h=From:To:Cc:Subject:Date:From;
 b=EUSNT7TXVa3THjMLvJ+xFW45BgCuydAqAFcI7I2rr3J1kswQdXWflyzp5Da55SYNH
 p+wP2hX66nSWhvmrlb1qP9plAMQv9A04X/gHYVZNAXNebLEt20jiztjvsRQoad5cNP
 kVOSPtEFBoyyf8l8fuMp3ECQt173K+DlfGOohHFL3NrgnQf3sJp63IQdSh+74eNnWy
 uFnvuZsQulHsEq+AXiXUnykoBcABIT89GNDXSS401avmqyUSpJlkRWn6nc6lGm9wGv
 PJUtD9/jB3re2sPQijfaQX143UWmENvDwFcPoNPeTqnaHh1aNCs36sbYK6ZHVPeJgL
 Y1i0KpMs9Jk3w==
From: Vinod Koul <vkoul@kernel.org>
To: Will Deacon <will@kernel.org>
Subject: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
Date: Fri, 15 Jan 2021 14:33:21 +0530
Message-Id: <20210115090322.2287538-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Add compatible string for sm8350 iommu to documentation.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3b63f2ae24db..161a5d389808 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sdm845-smmu-500
               - qcom,sm8150-smmu-500
               - qcom,sm8250-smmu-500
+              - qcom,sm8350-smmu-500
           - const: arm,mmu-500
       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
         items:
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
