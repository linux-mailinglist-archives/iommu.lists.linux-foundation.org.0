Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF052C3983
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 08:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EFDA686D43;
	Wed, 25 Nov 2020 07:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZOgXF-iqT3FP; Wed, 25 Nov 2020 07:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 309E086D3E;
	Wed, 25 Nov 2020 07:01:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CFA3C0052;
	Wed, 25 Nov 2020 07:01:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A232FC0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 07:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9E91987173
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 07:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWr+AelkqwZp for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 07:01:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B35287337
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 07:01:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606287717; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xBQcg+Wcwhh18eydvFxaDQClwZpGMJnYWJxgECPLHjo=;
 b=Nc2LX7Gcpm9a2e0dxRfUoDeHMH/8tjIXNC/w/5p5UlM6t5qU3SLyF37wtGoS7Z5dpn0iFbIi
 EdReUUE642BE8kq24woixBoyZBnDhJBEeU1mA99JMmwmbud7u4xy1Kpbkna3uycC3QJ80c/+
 Tqf7sGSLKn4JDMJW/5fU1FdLkRA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fbe01417ef0a8d84330a17b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 07:01:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 32F97C43468; Wed, 25 Nov 2020 07:01:21 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61F42C433ED;
 Wed, 25 Nov 2020 07:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61F42C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv10 9/9] iommu: arm-smmu-impl: Add a space before open
 parenthesis
Date: Wed, 25 Nov 2020 12:30:18 +0530
Message-Id: <0b4c3718a87992f11340a1cdd99fd746c647e485.1606287059.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Kristian H Kristensen <hoegsberg@google.com>,
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

Fix the checkpatch warning for space required before the open
parenthesis.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Acked-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 26e2734eb4d7..136872e77195 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -12,7 +12,7 @@
 
 static int arm_smmu_gr0_ns(int offset)
 {
-	switch(offset) {
+	switch (offset) {
 	case ARM_SMMU_GR0_sCR0:
 	case ARM_SMMU_GR0_sACR:
 	case ARM_SMMU_GR0_sGFSR:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
