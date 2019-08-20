Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C105968EB
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 21:06:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1ABBDCCE;
	Tue, 20 Aug 2019 19:06:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F1A2C11
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:43 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CDF4612E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B586260F38; Tue, 20 Aug 2019 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328002;
	bh=zzjtL5wslsQS8yWsr2CKph8GttmF/LKM4t/Yy33PQbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmGGSHOGPovm0LqZtDwvxCWxW+kXqIdyBZeTz8qZK9g7OlcX1ZUWJAhzeOIweqfkO
	XlV2UzEXl5V6DDYEix+Z3dKV9mzm5uj3gkCfedr2nbksxAa/A7uCElMOPWiXDW0ExQ
	SD7/BFxrRmppyV76P9SUo1xRdmVNyjYguVR4/qVw=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id C9FEB60E40;
	Tue, 20 Aug 2019 19:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1566328001;
	bh=zzjtL5wslsQS8yWsr2CKph8GttmF/LKM4t/Yy33PQbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qg0TuwlYiNw6G05Dy5nOOSnh4PuCp/NgTjhzAREkbQU0ac+BrGd9PGFZygmo85kQe
	C5rXdpyWGH4ojSU1ynbdTZOJweG81C5ZS5HeLIPtAFFh9Xb5U7dEGDwMv5646bE3CJ
	bwi9cwYDHojU/JleqC8XYl2s89+adAx2Fa7YPbTA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9FEB60E40
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Date: Tue, 20 Aug 2019 13:06:27 -0600
Message-Id: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Add a compatible string to identify SMMUs that are attached
to Adreno GPU devices that wish to support split pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3b..3b07896 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -18,6 +18,7 @@ conditions.
                         "arm,mmu-500"
                         "cavium,smmu-v2"
                         "qcom,smmu-v2"
+			"qcom,adreno-smmu-v2"
 
                   depending on the particular implementation and/or the
                   version of the architecture implemented.
@@ -31,6 +32,12 @@ conditions.
                   as below, SoC-specific compatibles:
                   "qcom,sdm845-smmu-500", "arm,mmu-500"
 
+		  "qcom,adreno-smmu-v2" is a special implementation for
+		  SMMU devices attached to the Adreno GPU on Qcom devices.
+		  If selected, this will enable split pagetable (TTBR1)
+		  support. Only use this if the GPU target is capable of
+		  supporting 64 bit addresses.
+
 - reg           : Base address and size of the SMMU.
 
 - #global-interrupts : The number of global interrupts exposed by the
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
