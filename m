Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88433AF45
	for <lists.iommu@lfdr.de>; Mon, 15 Mar 2021 10:50:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACB547AB4;
	Mon, 15 Mar 2021 09:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ir5pwsIC60vL; Mon, 15 Mar 2021 09:50:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083F547C46;
	Mon, 15 Mar 2021 09:50:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDB6AC0012;
	Mon, 15 Mar 2021 09:50:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DBFCC000A
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 06:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 211064891B
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 06:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id NC3ah_HtQcR9 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 06:03:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id D7270485E1
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 06:03:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615788186; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=CFrkyfVxE9eKUVg9TiQ1zsFSGHaO9pEnp9ZPIbivGvU=;
 b=Yaz5UJNwelArkJtK9vZcnYfEQa5wWDsCI0xfTBuD5LCgpZ7votb8nSLIaV9C/iD7bdqNcJOe
 VS2kt7BYaYGS/9SiZuSMZLIDvMq3q5IjuzYGVA/cDj+JPWiKOCmg05azGqu+tMKeaIB6ZAHw
 9nRDEs3q2xuXXISej+Vch8iApfA=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 604ef890e3fca7d0a638cb18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 06:02:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A63AC43462; Mon, 15 Mar 2021 06:02:56 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B394AC433C6;
 Mon, 15 Mar 2021 06:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B394AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=rnayak@codeaurora.org
From: Rajendra Nayak <rnayak@codeaurora.org>
To: will@kernel.org
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for SC7280 SoC
Date: Mon, 15 Mar 2021 11:32:24 +0530
Message-Id: <1615788144-29508-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 15 Mar 2021 09:50:30 +0000
Cc: devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
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

From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Add the SoC specific compatible for SC7280 implementing
arm,mmu-500.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
This was earlier posted as part of the entire DT series for sc7280 [1]
Rest of the patches are now picked, posting this separately so it can
be picked up via the ARM SMMU tree.

[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=488871

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6ba161d..9d27aa5 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -34,6 +34,7 @@ properties:
         items:
           - enum:
               - qcom,sc7180-smmu-500
+              - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sdm845-smmu-500
               - qcom,sm8150-smmu-500
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
