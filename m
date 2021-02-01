Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFF30A8B2
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 14:29:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F95786FA0;
	Mon,  1 Feb 2021 13:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wQ1Ig96+gN6R; Mon,  1 Feb 2021 13:29:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6553886F9C;
	Mon,  1 Feb 2021 13:29:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FEF5C013A;
	Mon,  1 Feb 2021 13:29:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99CB0C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 89526806ED
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tbiHzMH4yyVv for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 13:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F0EB280857
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:16 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTpfL1P7Yz162lf;
 Mon,  1 Feb 2021 21:27:54 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.176.220) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 21:29:02 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/1] perf/smmuv3: Don't reserve the PMCG register spaces
Date: Mon, 1 Feb 2021 21:27:50 +0800
Message-ID: <20210201132750.1709-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210201132750.1709-1-thunder.leizhen@huawei.com>
References: <20210201132750.1709-1-thunder.leizhen@huawei.com>
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
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_smmuv3_pmu.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 74474bb322c3f26..8f0b71b5d08a815 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -793,17 +793,30 @@ static int smmu_pmu_probe(struct platform_device *pdev)
 		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE,
 	};
 
-	smmu_pmu->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res_0);
-	if (IS_ERR(smmu_pmu->reg_base))
-		return PTR_ERR(smmu_pmu->reg_base);
+	/*
+	 * The register spaces of the PMCG may be in the register space of
+	 * other devices. For example, SMMU. Therefore, the PMCG resources are
+	 * not reserved to avoid resource conflicts with other drivers.
+	 */
+	res_0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res_0)
+		return -EINVAL;
+	smmu_pmu->reg_base = devm_ioremap(dev, res_0->start, resource_size(res_0));
+	if (!smmu_pmu->reg_base)
+		return -ENOMEM;
 
 	cfgr = readl_relaxed(smmu_pmu->reg_base + SMMU_PMCG_CFGR);
 
 	/* Determine if page 1 is present */
 	if (cfgr & SMMU_PMCG_CFGR_RELOC_CTRS) {
-		smmu_pmu->reloc_base = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(smmu_pmu->reloc_base))
-			return PTR_ERR(smmu_pmu->reloc_base);
+		struct resource *res_1;
+
+		res_1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+		if (!res_1)
+			return -EINVAL;
+		smmu_pmu->reloc_base = devm_ioremap(dev, res_1->start, resource_size(res_1));
+		if (!smmu_pmu->reloc_base)
+			return -ENOMEM;
 	} else {
 		smmu_pmu->reloc_base = smmu_pmu->reg_base;
 	}
-- 
2.26.0.106.g9fadedd


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
