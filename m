Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF2107B5B
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 00:32:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66B64883E5;
	Fri, 22 Nov 2019 23:32:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-3GffJCARMo; Fri, 22 Nov 2019 23:32:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D2142883D8;
	Fri, 22 Nov 2019 23:32:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF8D2C18DA;
	Fri, 22 Nov 2019 23:32:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 362B6C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 22B9B20420
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSD18xZZVsFM for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 23:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-186.smtp-out.us-west-2.amazonses.com
 (a27-186.smtp-out.us-west-2.amazonses.com [54.240.27.186])
 by silver.osuosl.org (Postfix) with ESMTPS id 90EDA203DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465526;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=IT10Q4XCr31Jq/WEe8X5Birx5D7BngHgTwImSyhbjdU=;
 b=etHKw3vEqufzpS0QNMYJCyELCAbBdCTWi5JrbYvdgF0pZEUp8kONUKYXc6my7Dcp
 YC3+n2RRJlt66wUH3PBu+k0M8SEbYlZE4R9pIdcHyIF8y84ci+CprhqqfGKv7J+DnVm
 leJFUAAx7H8CnwrPJ8VsX8kLx9xzdsd5fXx6zhoo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465526;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=IT10Q4XCr31Jq/WEe8X5Birx5D7BngHgTwImSyhbjdU=;
 b=P0Cz1EPb1OmOJVIWFdOTCYaDSWeocQeQUBr+oA+3wu1s5snwieucNYAr0wTgko47
 sndy5oxiHNe19wjbzEKJYih9uDHEDQFvdYD/SAg5XKGcxkH+N2ER7a8ms8NLK3poa+7
 kd0jyajHHI5T7l/tLQfWOdBZx03tO5/fbluPZVKM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 365FCC48B0E
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 8/8] arm64: dts: qcom: sdm845: Update Adreno GPU SMMU
 compatible string
Date: Fri, 22 Nov 2019 23:32:06 +0000
Message-ID: <0101016e957559fa-548de4d5-e5e8-494f-ba5c-284e17b7d1d4-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, will@kernel.org,
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

Add "qcom,adreno-smmu-v2" compatible string for the Adreno GPU SMMU node
to enable split pagetable support.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23..d90ba6eda 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2869,7 +2869,7 @@
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu-v2", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
