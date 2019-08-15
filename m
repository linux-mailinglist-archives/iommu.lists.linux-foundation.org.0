Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C268F3A5
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 20:38:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AF09410DC;
	Thu, 15 Aug 2019 18:38:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp2.linuxfoundation.org (smtp2.linux-foundation.org
	[172.17.192.36])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8CEA10D5
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:38:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp2.linuxfoundation.org (Postfix) with ESMTP id 836BF1DD19
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:38:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15195344;
	Thu, 15 Aug 2019 11:38:01 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B60453F694; 
	Thu, 15 Aug 2019 11:37:59 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH v2 12/17] iommu/arm-smmu: Rename arm-smmu-regs.h
Date: Thu, 15 Aug 2019 19:37:32 +0100
Message-Id: <75a8504028a60b3890997af2bf25032158e0d7a7.1565892337.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1565892337.git.robin.murphy@arm.com>
References: <cover.1565892337.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp2.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

We're about to start using it for more than just register definitions,
so generalise the name.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c                      | 2 +-
 drivers/iommu/{arm-smmu-regs.h => arm-smmu.h} | 6 +++---
 drivers/iommu/qcom_iommu.c                    | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/iommu/{arm-smmu-regs.h => arm-smmu.h} (98%)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index e9fd9117109e..f3b8301a3059 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -46,7 +46,7 @@
 #include <linux/amba/bus.h>
 #include <linux/fsl/mc.h>
 
-#include "arm-smmu-regs.h"
+#include "arm-smmu.h"
 
 /*
  * Apparently, some Qualcomm arm64 platforms which appear to expose their SMMU
diff --git a/drivers/iommu/arm-smmu-regs.h b/drivers/iommu/arm-smmu.h
similarity index 98%
rename from drivers/iommu/arm-smmu-regs.h
rename to drivers/iommu/arm-smmu.h
index a8e288192285..ccc3097a4247 100644
--- a/drivers/iommu/arm-smmu-regs.h
+++ b/drivers/iommu/arm-smmu.h
@@ -7,8 +7,8 @@
  * Author: Will Deacon <will.deacon@arm.com>
  */
 
-#ifndef _ARM_SMMU_REGS_H
-#define _ARM_SMMU_REGS_H
+#ifndef _ARM_SMMU_H
+#define _ARM_SMMU_H
 
 #include <linux/bits.h>
 
@@ -194,4 +194,4 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_CB_ATSR		0x8f0
 #define ATSR_ACTIVE			BIT(0)
 
-#endif /* _ARM_SMMU_REGS_H */
+#endif /* _ARM_SMMU_H */
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 60a125dd7300..a2062d13584f 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -33,7 +33,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include "arm-smmu-regs.h"
+#include "arm-smmu.h"
 
 #define SMMU_INTR_SEL_NS     0x2000
 
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
