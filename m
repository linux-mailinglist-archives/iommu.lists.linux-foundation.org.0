Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D8D266133
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 16:28:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94AF8874A2;
	Fri, 11 Sep 2020 14:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d57kvtODaKV0; Fri, 11 Sep 2020 14:28:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 34B1A87496;
	Fri, 11 Sep 2020 14:28:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22E70C0052;
	Fri, 11 Sep 2020 14:28:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A843C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 14:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EE96187496
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 14:28:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfWeCngIzSsY for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 14:28:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-55.smtp-out.us-west-2.amazonses.com
 (a27-55.smtp-out.us-west-2.amazonses.com [54.240.27.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8901D8748F
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834495;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=orZJUtk8zuXCuyD9M2bu/OIyXLSAJfTBuYp/toele7o=;
 b=DSeeOrqOBuQKMbCXyMFoD6F9o8I4P/packjop/VfyFX5Xy+5STc+hiGrJgi9O2lw
 fQP0QNp7sF6vciTOi5GDsGOmUSADYUt5LAKpEP/L00BOhMXm95Klg0RdgJzcI9drgyu
 vDJ5eGwp5w+1u8gc+uN2+BRNiqAYrOz4hvTvRce8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834495;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=orZJUtk8zuXCuyD9M2bu/OIyXLSAJfTBuYp/toele7o=;
 b=i1bFpqq3qxVIhhE2uXqsqbcGV5x2XYemw5TtWLCcuNEOrbQPtNaUaD8XHrJRXNw2
 yfHchcE8i+fdqAFYyap6g+Owkl3IJg11tEVouuV7xojQSkKaTq1NSnzkvXA/AI1biAx
 mXJ/GzSS5lCk27Wwfv60Olv68Zh82xPJFkTVQQo0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEE2AC433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv4 5/6] iommu: arm-smmu-impl: Use table to list QCOM
 implementations
Date: Fri, 11 Sep 2020 14:28:15 +0000
Message-ID: <010101747d911870-1aec07d0-a55c-4302-b36d-970f5516572f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599832685.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.11-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

Use table and of_match_node() to match qcom implementation
instead of multiple of_device_compatible() calls for each
QCOM SMMU implementation.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index d199b4bff15d..ce78295cfa78 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -9,6 +9,13 @@
 
 #include "arm-smmu.h"
 
+static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,sc7180-smmu-500" },
+	{ .compatible = "qcom,sdm845-smmu-500" },
+	{ .compatible = "qcom,sm8150-smmu-500" },
+	{ .compatible = "qcom,sm8250-smmu-500" },
+	{ }
+};
 
 static int arm_smmu_gr0_ns(int offset)
 {
@@ -217,10 +224,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
+	if (of_match_node(qcom_smmu_impl_of_match, np))
 		return qcom_smmu_impl_init(smmu);
 
 	if (of_device_is_compatible(smmu->dev->of_node, "qcom,adreno-smmu"))
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
