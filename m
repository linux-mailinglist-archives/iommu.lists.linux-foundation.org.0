Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EB3059E0
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 12:33:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FDB085A4B;
	Wed, 27 Jan 2021 11:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crAMbX7TDwW8; Wed, 27 Jan 2021 11:33:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03800858B5;
	Wed, 27 Jan 2021 11:33:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1BA0C013A;
	Wed, 27 Jan 2021 11:33:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F915C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 953DC2152E
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Zo9ZtlR9ag0 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 11:33:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by silver.osuosl.org (Postfix) with ESMTPS id D5CE521561
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 11:33:33 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DQhK72ypDz7bp0;
 Wed, 27 Jan 2021 19:32:11 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.176.220) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 27 Jan 2021 19:33:13 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] perf/smmuv3: Don't reserve the PMCG register spaces
Date: Wed, 27 Jan 2021 19:32:56 +0800
Message-ID: <20210127113258.1421-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210127113258.1421-1-thunder.leizhen@huawei.com>
References: <20210127113258.1421-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.176.220]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
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

According to the SMMUv3 specification:
Each PMCG counter group is represented by one 4KB page (Page 0) with one
optional additional 4KB page (Page 1), both of which are at IMPLEMENTATION
DEFINED base addresses.

This means that the PMCG register spaces may be within the 64KB pages of
the SMMUv3 register space. When both the SMMU and PMCG drivers reserve
their own resources, a resource conflict occurs.

To avoid this conflict, don't reserve the PMCG regions.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 74474bb322c3f26..e5e505a0804fe53 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -761,6 +761,29 @@ static void smmu_pmu_get_acpi_options(struct smmu_pmu *smmu_pmu)
 	dev_notice(smmu_pmu->dev, "option mask 0x%x\n", smmu_pmu->options);
 }
 
+static void __iomem *
+smmu_pmu_get_and_ioremap_resource(struct platform_device *pdev,
+				  unsigned int index,
+				  struct resource **res)
+{
+	void __iomem *base;
+	struct resource *r;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	if (!r) {
+		dev_err(&pdev->dev, "invalid resource\n");
+		return ERR_PTR(-EINVAL);
+	}
+	if (res)
+		*res = r;
+
+	base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
+	if (!base)
+		return ERR_PTR(-ENOMEM);
+
+	return base;
+}
+
 static int smmu_pmu_probe(struct platform_device *pdev)
 {
 	struct smmu_pmu *smmu_pmu;
@@ -793,7 +816,7 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
-	smmu_pmu->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res_0);
+	smmu_pmu->reg_base = smmu_pmu_get_and_ioremap_resource(pdev, 0, &res_0);
 	if (IS_ERR(smmu_pmu->reg_base))
 		return PTR_ERR(smmu_pmu->reg_base);
 
@@ -801,7 +824,7 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 
 	/* Determine if page 1 is present */
 	if (cfgr & SMMU_PMCG_CFGR_RELOC_CTRS) {
-		smmu_pmu->reloc_base = devm_platform_ioremap_resource(pdev, 1);
+		smmu_pmu->reloc_base = smmu_pmu_get_and_ioremap_resource(pdev, 1, NULL);
 		if (IS_ERR(smmu_pmu->reloc_base))
 			return PTR_ERR(smmu_pmu->reloc_base);
 	} else {
-- 
1.8.3


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
