Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2525134D2
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 15:18:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9FAB40A63;
	Thu, 28 Apr 2022 13:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZmVVx8qrFC6; Thu, 28 Apr 2022 13:18:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB55040C35;
	Thu, 28 Apr 2022 13:18:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 961B3C0082;
	Thu, 28 Apr 2022 13:18:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABD46C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A1D60E95
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cyVXYjNI-v0e for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 13:18:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1101660E3B
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 994FE1480;
 Thu, 28 Apr 2022 06:18:45 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AF483F73B;
 Thu, 28 Apr 2022 06:18:43 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 08/14] iommu/exynos: Clean up bus_set_iommu()
Date: Thu, 28 Apr 2022 14:18:09 +0100
Message-Id: <9a92e01323e988eeea80655105db3f1fc4051362.1650890638.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.35.3.dirty
In-Reply-To: <cover.1650890638.git.robin.murphy@arm.com>
References: <cover.1650890638.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 gerald.schaefer@linux.ibm.com
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

Stop calling bus_set_iommu() since it's now unnecessary, and simplify
the init failure path accordingly.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/exynos-iommu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 71f2018e23fe..359b255b3924 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1356,16 +1356,7 @@ static int __init exynos_iommu_init(void)
 		goto err_zero_lv2;
 	}
 
-	ret = bus_set_iommu(&platform_bus_type, &exynos_iommu_ops);
-	if (ret) {
-		pr_err("%s: Failed to register exynos-iommu driver.\n",
-								__func__);
-		goto err_set_iommu;
-	}
-
 	return 0;
-err_set_iommu:
-	kmem_cache_free(lv2table_kmem_cache, zero_lv2_table);
 err_zero_lv2:
 	platform_driver_unregister(&exynos_sysmmu_driver);
 err_reg_driver:
-- 
2.35.3.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
