Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D239F6A6
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 14:30:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6008F400C8;
	Tue,  8 Jun 2021 12:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_BYdBP4G2yt; Tue,  8 Jun 2021 12:30:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A989402B0;
	Tue,  8 Jun 2021 12:30:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45F5AC0001;
	Tue,  8 Jun 2021 12:30:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC0D9C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id BD96A606A5
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id dQTeD8lgYR2C for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 12:30:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id 9DD4960884
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 12:30:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623155442; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UenV7iSFYEAFZ8DRh0vWD0hvTbYkw2dn+QBSNeAfUeI=;
 b=fthCl13Urs1KVNi2otxlSCaoSMVuuESQBe093bpAAZ3zHs6VCu4lJk3IWjmpsgr96vXnoZdR
 0ZjTtBhMVVJCnIaSZGoEeSNTDuAu4riUqHpDepByfw+giCLQrukRFX/CmD0MzSyCuIKdC64V
 a1ypT50KyKuv4jO8DWKGnEH+AJs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60bf62e88491191eb358082c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 12:30:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B30B4C4360C; Tue,  8 Jun 2021 12:30:32 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D17CDC43217;
 Tue,  8 Jun 2021 12:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D17CDC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCHv4 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific impl
Date: Tue,  8 Jun 2021 18:00:07 +0530
Message-Id: <c42181d313fdd440011541a28cde8cd10fffb9d3.1623155117.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1623155117.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, linux-arm-kernel@lists.infradead.org
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e93b5dbda7de..83c32566bf64 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -370,11 +370,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 			return qcom_smmu_create(smmu, &qcom_smmu_impl);
 	}
 
-	if (of_match_node(qcom_smmu_impl_of_match, np))
-		return qcom_smmu_create(smmu, &qcom_smmu_impl);
-
+	/*
+	 * Do not change this order of implementation, i.e., first adreno
+	 * smmu impl and then apss smmu since we can have both implementing
+	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
+	 * features if the order is changed.
+	 */
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
