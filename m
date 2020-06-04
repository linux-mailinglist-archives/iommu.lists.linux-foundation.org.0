Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F71EEC26
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 22:39:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2BAF86473;
	Thu,  4 Jun 2020 20:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yb3sXMKpr2iK; Thu,  4 Jun 2020 20:39:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 085AD863A3;
	Thu,  4 Jun 2020 20:39:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EADE2C016E;
	Thu,  4 Jun 2020 20:39:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99F57C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 87E13863D0
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 20:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3CvKhxk0ozU for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 20:39:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3AA81863A3
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 20:39:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591303159; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1lvc/rtJTGg1ms49oe99E5caOYOwoBK6dQq3fFKin0E=;
 b=TUXuL3AmRD7ae4shmo4XdjvfYwh1MFSMPxbv3SykHct19oWPuEzz6Hiup8uDUbCEuFHMtBHg
 nEFM6Dvikio87fGEnvHxobQfmHpBPqGF5E8XF6jA34ZsqNgeW7BgetO8Il3e2IP1zQUCeABV
 biag+cOqF7WyQSkF1ABdwf0/SVU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ed95befc0031c71c24ba624 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 20:39:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 94949C433CA; Thu,  4 Jun 2020 20:39:10 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1002FC433C6;
 Thu,  4 Jun 2020 20:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1002FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] iommu/arm-smmu: Mark qcom_smmu_client_of_match as possibly
 unused
Date: Thu,  4 Jun 2020 14:39:04 -0600
Message-Id: <20200604203905.31964-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

When CONFIG_OF=n of_match_device() gets pre-processed out of existence
leaving qcom-smmu_client_of_match unused. Mark it as possibly unused to
keep the compiler from warning in that case.

Fixes: 0e764a01015d ("iommu/arm-smmu: Allow client devices to select direct mapping")
Reported-by: kbuild test robot <lkp@intel.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index cf01d0215a39..be4318044f96 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -12,7 +12,7 @@ struct qcom_smmu {
 	struct arm_smmu_device smmu;
 };
 
-static const struct of_device_id qcom_smmu_client_of_match[] = {
+static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
