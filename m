Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141B1B148C
	for <lists.iommu@lfdr.de>; Mon, 20 Apr 2020 20:34:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF555881B7;
	Mon, 20 Apr 2020 18:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnAhEGQOX61O; Mon, 20 Apr 2020 18:34:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65DAA881A4;
	Mon, 20 Apr 2020 18:34:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D32C0177;
	Mon, 20 Apr 2020 18:34:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 723DEC0177
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 18:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6DA4786932
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 18:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nW7SQh-FD4C for <iommu@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 18:34:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C26E886930
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 18:34:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587407653; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ix/MdnxLfjPN0cVkJkI+uYStoKyur9aJ+Sj4mNFkPFE=;
 b=PsPp8sNWBkY5Qn81R3wadrHsGMXrsRqigZkBse0bCoBqsGkgef9+6w1nGGub6tvrt0qEUfWk
 Fg9dQA89w3qMw+m0gTD0fdrRYN04Z7Pj2PbAKuVcZKeXoEb+T8uxBT8vOEMqIkvKWOVBvBX9
 u+oDunKU0bYts+qPgYgWoAq9V7A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9deb25.7f9316399c00-smtp-out-n03;
 Mon, 20 Apr 2020 18:34:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7FD7EC44792; Mon, 20 Apr 2020 18:34:12 +0000 (UTC)
Received: from blr-ubuntu-311.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EDAD6C433CB;
 Mon, 20 Apr 2020 18:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EDAD6C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Sibi Sankar <sibis@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Subject: [PATCHv4 1/6] iommu: arm-smmu-impl: Convert to a generic reset
 implementation
Date: Tue, 21 Apr 2020 00:03:49 +0530
Message-Id: <d24a0278021bc0b2732636c5728efe55e7318a8b.1587407458.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1587407458.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

Currently the QCOM specific smmu reset implementation is very
specific to SDM845 SoC and has a wait-for-safe logic which
may not be required for other SoCs. So move the SDM845 specific
logic to its specific reset function. Also add SC7180 SMMU
compatible for calling into QCOM specific implementation.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu-impl.c |  8 +++++---
 drivers/iommu/arm-smmu-qcom.c | 16 +++++++++++++---
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index 74d97a886e93..c75b9d957b70 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -150,6 +150,8 @@ static const struct arm_smmu_impl arm_mmu500_impl = {
 
 struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 {
+	const struct device_node *np = smmu->dev->of_node;
+
 	/*
 	 * We will inevitably have to combine model-specific implementation
 	 * quirks with platform-specific integration quirks, but everything
@@ -166,11 +168,11 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 		break;
 	}
 
-	if (of_property_read_bool(smmu->dev->of_node,
-				  "calxeda,smmu-secure-config-access"))
+	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500"))
+	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
+	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
 
 	return smmu;
diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index 24c071c1d8b0..64a4ab270ab7 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -15,8 +15,6 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 
-	arm_mmu500_reset(smmu);
-
 	/*
 	 * To address performance degradation in non-real time clients,
 	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
@@ -30,8 +28,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
+{
+	const struct device_node *np = smmu->dev->of_node;
+
+	arm_mmu500_reset(smmu);
+
+	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
+		return qcom_sdm845_smmu500_reset(smmu);
+
+	return 0;
+}
+
 static const struct arm_smmu_impl qcom_smmu_impl = {
-	.reset = qcom_sdm845_smmu500_reset,
+	.reset = qcom_smmu500_reset,
 };
 
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
