Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E7324E01
	for <lists.iommu@lfdr.de>; Thu, 25 Feb 2021 11:29:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF4E4322D;
	Thu, 25 Feb 2021 10:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLj7pLwpj19O; Thu, 25 Feb 2021 10:29:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B0743229;
	Thu, 25 Feb 2021 10:29:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90C03C0001;
	Thu, 25 Feb 2021 10:29:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6667C0001
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 10:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id C875683F3E
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 10:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id sjAsYYwQZnl4 for <iommu@lists.linux-foundation.org>;
 Thu, 25 Feb 2021 10:29:46 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id AB44383F1E
 for <iommu@lists.linux-foundation.org>; Thu, 25 Feb 2021 10:29:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614248986; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cRhQvm0USgn3aDh2NbvGTs2CTqxIUbRHkGX/UOWOsVo=;
 b=dP1/08dJQBgdnBa0t2lLMS1sxWgmSbEDbRHBzT31wuvFg/OitYxgAGDuoI17dg31KkWQqery
 upbF/EcU2TW7jr3y9kEt+rmggnfCJtJvfeYa3dcnml1RpJB3Qto6XuO1BC47xXEXetfZCyBp
 APeRZVkhFiNlyXprFiNqpX+C7qA=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60377ae7669548ff7ac2e783 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 10:24:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6E13BC43463; Thu, 25 Feb 2021 10:24:38 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B4A9C433CA;
 Thu, 25 Feb 2021 10:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B4A9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl
 earlier
Date: Thu, 25 Feb 2021 15:54:10 +0530
Message-Id: <ed9bedef1546879c5b5e9f0f3f6d4667ec6b4fc4.1614247752.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1614247752.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614247752.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
both implement "arm,mmu-500" in some QTI SoCs and to run through
adreno smmu specific implementation such as enabling split pagetables
support, we need to match the "qcom,adreno-smmu" compatible first
before apss smmu or else we will be running apps smmu implementation
for adreno smmu and the additional features for adreno smmu is never
set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
and adreno smmu implementing "arm,mmu-500", so the adreno smmu
implementation is never reached because the current sequence checks
for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
specific impl and we never reach adreno smmu specific implementation.

Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Its either this or we add a new compatible for adreno smmu implementing
arm,mmu-500 like "qcom,sc7280-adreno-smmu-500".

---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index bea3ee0dabc2..7d0fc2c8e72f 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -345,11 +345,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 
-	if (of_match_node(qcom_smmu_impl_of_match, np))
-		return qcom_smmu_create(smmu, &qcom_smmu_impl);
-
 	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
 		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
 
+	if (of_match_node(qcom_smmu_impl_of_match, np))
+		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+
 	return smmu;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
