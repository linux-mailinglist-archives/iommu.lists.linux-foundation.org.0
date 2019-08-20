Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE795D87
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 13:38:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7C52FE21;
	Tue, 20 Aug 2019 11:38:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 518F4CBF
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 11:38:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D8DE487
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 11:38:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 818D8344;
	Tue, 20 Aug 2019 04:38:53 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CF3553F718; 
	Tue, 20 Aug 2019 04:38:52 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH] iommu/arm-smmu: Fix build issues
Date: Tue, 20 Aug 2019 12:38:49 +0100
Message-Id: <909636ed9dfc702a7cb4806903e3e698ce9b29a6.1566301129.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

In a hurry to get things ready for merging, we missed that one more
include needs moving to arm-smmu.h along with the register accessors
to prevent 32-bit builds breaking, and some missing static specifiers
made Sparse sad.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu-impl.c | 8 ++++----
 drivers/iommu/arm-smmu.c      | 1 -
 drivers/iommu/arm-smmu.h      | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index e22e9004f449..3f88cd078dd5 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -68,7 +68,7 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-int cavium_init_context(struct arm_smmu_domain *smmu_domain)
+static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
@@ -81,12 +81,12 @@ int cavium_init_context(struct arm_smmu_domain *smmu_domain)
 	return 0;
 }
 
-const struct arm_smmu_impl cavium_impl = {
+static const struct arm_smmu_impl cavium_impl = {
 	.cfg_probe = cavium_cfg_probe,
 	.init_context = cavium_init_context,
 };
 
-struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smmu)
+static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	struct cavium_smmu *cs;
 
@@ -143,7 +143,7 @@ static int arm_mmu500_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-const struct arm_smmu_impl arm_mmu500_impl = {
+static const struct arm_smmu_impl arm_mmu500_impl = {
 	.reset = arm_mmu500_reset,
 };
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index b8628e2ab579..523a88842e7f 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -26,7 +26,6 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/iopoll.h>
 #include <linux/init.h>
 #include <linux/moduleparam.h>
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index 611ed742e56f..ac9eac966cf5 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -14,6 +14,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
 #include <linux/mutex.h>
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
