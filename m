Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F324A54F
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 19:54:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF2E085910;
	Wed, 19 Aug 2020 17:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDXo0mrTeSOS; Wed, 19 Aug 2020 17:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6404085992;
	Wed, 19 Aug 2020 17:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DDA3C0051;
	Wed, 19 Aug 2020 17:54:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5F8FC0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC7DF20417
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwNTi5i0tRaJ for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 17:54:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 775EF20419
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:54:09 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDB942067C;
 Wed, 19 Aug 2020 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597859649;
 bh=+lMEGCp5k/4W2mojZvtyfBE+r5nQiIYYlfpn6vSb4ZE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MMUT8j46k7Uvd2tGhO09R/5TjMjgqPb8V52uNie6ncFfyWFg4q6jAlr5u2QVuLI8z
 KTTJuWjKIrEexR1GUkhlZ5mhEGM2Qk5YXHRqMcEQC0hRDXBTgKW+vLtcih3Xnm23KB
 qP8zrLdz4w4hOwFaC8ECEnfV5fkXmP/2tsQnPCLo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [RESEND PATCH 5/5] iommu: qcom: Drop of_match_ptr to fix
 -Wunused-const-variable
Date: Wed, 19 Aug 2020 19:53:45 +0200
Message-Id: <20200819175345.20833-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175345.20833-1-krzk@kernel.org>
References: <20200819175345.20833-1-krzk@kernel.org>
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

The of_device_id is included unconditionally by of.h header and used
in the driver as well.  Remove of_match_ptr to fix W=1 compile test
warning with !CONFIG_OF:

    drivers/iommu/qcom_iommu.c:910:34: warning: 'qcom_iommu_of_match' defined but not used [-Wunused-const-variable=]
      910 | static const struct of_device_id qcom_iommu_of_match[] = {

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index af6bec3ace00..9535a6af7553 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -752,7 +752,7 @@ static const struct of_device_id ctx_of_match[] = {
 static struct platform_driver qcom_iommu_ctx_driver = {
 	.driver	= {
 		.name		= "qcom-iommu-ctx",
-		.of_match_table	= of_match_ptr(ctx_of_match),
+		.of_match_table	= ctx_of_match,
 	},
 	.probe	= qcom_iommu_ctx_probe,
 	.remove = qcom_iommu_ctx_remove,
@@ -915,7 +915,7 @@ static const struct of_device_id qcom_iommu_of_match[] = {
 static struct platform_driver qcom_iommu_driver = {
 	.driver	= {
 		.name		= "qcom-iommu",
-		.of_match_table	= of_match_ptr(qcom_iommu_of_match),
+		.of_match_table	= qcom_iommu_of_match,
 		.pm		= &qcom_iommu_pm_ops,
 	},
 	.probe	= qcom_iommu_device_probe,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
