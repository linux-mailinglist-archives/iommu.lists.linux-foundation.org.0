Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBCB224DA4
	for <lists.iommu@lfdr.de>; Sat, 18 Jul 2020 21:35:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67F2788045;
	Sat, 18 Jul 2020 19:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuLsyCJkzi3L; Sat, 18 Jul 2020 19:35:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF96888026;
	Sat, 18 Jul 2020 19:35:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6E2EC0733;
	Sat, 18 Jul 2020 19:35:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13618C0733
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F04D487FB5
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLxs6LfqZT5p for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jul 2020 19:35:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0EB2387FCC
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:12 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f134e7a0000>; Sat, 18 Jul 2020 12:33:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 12:35:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 12:35:11 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 19:35:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 18 Jul 2020 19:35:08 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f134eeb0000>; Sat, 18 Jul 2020 12:35:08 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH v11 2/5] iommu/arm-smmu: ioremap smmu mmio region before
 implementation init
Date: Sat, 18 Jul 2020 12:34:54 -0700
Message-ID: <20200718193457.30046-3-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718193457.30046-1-vdumpa@nvidia.com>
References: <20200718193457.30046-1-vdumpa@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595100794; bh=yPxpHRDBRTnTuG1GZSPEhZJeDeggkVWp8IlCCMutmsg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=pvOsiwpshEJ1qoJM0NZz7ysBHtevsxcj4VedVoy2BBDZjyPPy48Dt/EJf0eTNYhb+
 su6Qxgwlj9/mSdg3W4Ah23mMqGsa6dHm2DfhYZt9HiK7e4XEKXVBZ1T72S1ZZy9Ryo
 z+q57Eh7Rpzt8y8BRMmMc5CsmTC1HzeaUkD9tPiTqPrdQaT6Iu+MBKkYuO+TfWqfeo
 QhkZ7Auv6YsRyTCRGukpeDUDdvvp4lY3nQaYFyKCNU1SsmmwLm+6jxT6znitIxs5Hz
 cgQn6wWdNA5z/2C0nxI/pMjh89IDie/BvbaO4U7PmWLq9fyav+XzR0K4bLh1DIUD8/
 ihtwMrDVdSGDw==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 bhuntsman@nvidia.com, yhsu@nvidia.com, linux-kernel@vger.kernel.org,
 talho@nvidia.com, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

ioremap smmu mmio region before calling into implementation init.
This is necessary to allow mapped address available during vendor
specific implementation init.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
Reviewed-by: Pritesh Raithatha <praithatha@nvidia.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/iommu/arm-smmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index cdd15ead9bc4..de520115d3df 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -2123,10 +2123,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	smmu = arm_smmu_impl_init(smmu);
-	if (IS_ERR(smmu))
-		return PTR_ERR(smmu);
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ioaddr = res->start;
 	smmu->base = devm_ioremap_resource(dev, res);
@@ -2138,6 +2134,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	 */
 	smmu->numpage = resource_size(res);
 
+	smmu = arm_smmu_impl_init(smmu);
+	if (IS_ERR(smmu))
+		return PTR_ERR(smmu);
+
 	num_irqs = 0;
 	while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, num_irqs))) {
 		num_irqs++;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
