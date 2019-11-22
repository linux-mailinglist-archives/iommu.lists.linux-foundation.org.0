Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1702C107B55
	for <lists.iommu@lfdr.de>; Sat, 23 Nov 2019 00:31:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A6A9883C3;
	Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6T2+VbYJh+B; Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1258082067;
	Fri, 22 Nov 2019 23:31:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6EAFC18DA;
	Fri, 22 Nov 2019 23:31:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAFB6C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E18DC203DE
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hKaRhjI9rHS for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 23:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by silver.osuosl.org (Postfix) with ESMTPS id 209D9203DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465510;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=o+LH9HwYJtl6AvafAe/yG6jV7U6wpVWP6EbR+x6D88w=;
 b=WLZ09wiKbanR65C/t3KMlNImMJQFQC/tzF1UZJW72yu/Li8pbomg5DENKUcwtm2n
 aGKGV6o+STILooJzbUpkif/ych6VnWzfdF/GOKvGAVzsdy9aQp/gnyZG2t4jvGpYtgb
 ur0Hf160SSsgLDuDzyH4ENi8bqPNPLlUO8ZdtidA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465510;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=o+LH9HwYJtl6AvafAe/yG6jV7U6wpVWP6EbR+x6D88w=;
 b=U7MZ5KQvhTjHMzemUPbjygUfvh3klFkhEcW2+aT8l1fXFmHhbk6+65f0QogRC9dJ
 zuAriUsvxd09VynXocoefdAtC+qFT/8J1tM2VtqogXwrqyHyNkQNsTvl/cMHslmP7+K
 tR90aldnQI9xpD8IPGUgFLQWwyuH1/eo60TA8no8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9946C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 1/8] dt-bindings: arm-smmu: Add Adreno GPU variant
Date: Fri, 22 Nov 2019 23:31:50 +0000
Message-ID: <0101016e95751b4b-8322fd0f-5f95-4fef-81be-dc15801e7fed-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

Add a compatible string to identify SMMUs that are attached
to Adreno GPU devices that wish to support split pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6515dbe..db9f826 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -31,6 +31,12 @@ properties:
               - qcom,sdm845-smmu-v2
           - const: qcom,smmu-v2
 
+      - description: Qcom Adreno GPU SMMU iplementing split pagetables
+        items:
+          - enum:
+              - qcom,adreno-smmu-v2
+          - const: qcom,smmu-v2
+
       - description: Qcom SoCs implementing "arm,mmu-500"
         items:
           - enum:
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
