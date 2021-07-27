Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D733D7212
	for <lists.iommu@lfdr.de>; Tue, 27 Jul 2021 11:34:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24D044039B;
	Tue, 27 Jul 2021 09:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xH9KgdCxESwT; Tue, 27 Jul 2021 09:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2A6904038E;
	Tue, 27 Jul 2021 09:34:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E36D7C001F;
	Tue, 27 Jul 2021 09:34:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E72CBC000E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 09:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id CF3DD4038E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 09:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id PbrH3LHsuHU1 for <iommu@lists.linux-foundation.org>;
 Tue, 27 Jul 2021 09:34:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 952B9401CF
 for <iommu@lists.linux-foundation.org>; Tue, 27 Jul 2021 09:34:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627378459; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kagWZe+ixHB1PpOFUHGC8RpKnQRK2ITDmPTtxKqpozo=;
 b=Qntma9kU/xJMTGkLk5rXqM2R+XkGcQFs/XmgffGh+RcZA6ppqcSptul6ZdkTLn4mAr31kyPI
 UtT4POjEIrnP1yKLcUNa6tjKiA17suaOpgWLDYr9TJKbjPUECvVfBOLF4bj9U2KJhCEDJHht
 4pmy3HVFZXP+PeZhHcBSTygKZvc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60ffd31017c2b4047daf4ba7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Jul 2021 09:34:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 704F5C43143; Tue, 27 Jul 2021 09:34:07 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25EE7C433D3;
 Tue, 27 Jul 2021 09:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25EE7C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Taniya Das <tdas@codeaurora.org>, srimuc <srimuc@codeaurora.org>
Subject: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to system pm
 callbacks
Date: Tue, 27 Jul 2021 15:03:22 +0530
Message-Id: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
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

Some clocks for SMMU can have parent as XO such as gpu_cc_hub_cx_int_clk
of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states in
such cases, we would need to drop the XO clock vote in unprepare call and
this unprepare callback for XO is in RPMh (Resource Power Manager-Hardened)
clock driver which controls RPMh managed clock resources for new QTI SoCs
and is a blocking call.

Given we cannot have a sleeping calls such as clk_bulk_prepare() and
clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
operations like map and unmap can be in atomic context and are in fast
path, add this prepare and unprepare call to drop the XO vote only for
system pm callbacks since it is not a fast path and we expect the system
to enter deep sleep states with system pm as opposed to runtime pm.

This is a similar sequence of clock requests (prepare,enable and
disable,unprepare) in arm-smmu probe and remove.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d3c6f54110a5..9561ba4c5d39 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2277,6 +2277,13 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
 {
+	int ret;
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+
+	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
+	if (ret)
+		return ret;
+
 	if (pm_runtime_suspended(dev))
 		return 0;
 
@@ -2285,10 +2292,19 @@ static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
 
 static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
 {
+	int ret = 0;
+	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+
 	if (pm_runtime_suspended(dev))
-		return 0;
+		goto clk_unprepare;
 
-	return arm_smmu_runtime_suspend(dev);
+	ret = arm_smmu_runtime_suspend(dev);
+	if (ret)
+		return ret;
+
+clk_unprepare:
+	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
+	return ret;
 }
 
 static const struct dev_pm_ops arm_smmu_pm_ops = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
