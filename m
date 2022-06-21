Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1305535A1
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 17:14:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91476418D8;
	Tue, 21 Jun 2022 15:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91476418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmy9kQ67GohT; Tue, 21 Jun 2022 15:14:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 13EB3418D7;
	Tue, 21 Jun 2022 15:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13EB3418D7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCFE4C0081;
	Tue, 21 Jun 2022 15:14:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 866ABC002D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47DEA4061D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47DEA4061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWbpSrlEalxw for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 15:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C8740503
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C8740503
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 121C31691;
 Tue, 21 Jun 2022 08:14:40 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0554F3F66F;
 Tue, 21 Jun 2022 08:14:38 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 2/3] iommu: Make .release_device optional
Date: Tue, 21 Jun 2022 16:14:26 +0100
Message-Id: <bda9d3eb4527eac8f6544a15067e2529cca54a2e.1655822151.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
In-Reply-To: <cover.1655822151.git.robin.murphy@arm.com>
References: <cover.1655822151.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Many drivers do nothing meaningful for .release_device, and it's neatly
abstracted to just two callsites in the core code, so let's make it
optional to implement.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/fsl_pamu_domain.c | 5 -----
 drivers/iommu/iommu.c           | 6 ++++--
 drivers/iommu/msm_iommu.c       | 5 -----
 drivers/iommu/sun50i-iommu.c    | 3 ---
 drivers/iommu/tegra-gart.c      | 5 -----
 drivers/iommu/tegra-smmu.c      | 3 ---
 6 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 94b4589dc67c..011f9ab7f743 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -447,15 +447,10 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 	return &pamu_iommu;
 }
 
-static void fsl_pamu_release_device(struct device *dev)
-{
-}
-
 static const struct iommu_ops fsl_pamu_ops = {
 	.capable	= fsl_pamu_capable,
 	.domain_alloc	= fsl_pamu_domain_alloc,
 	.probe_device	= fsl_pamu_probe_device,
-	.release_device	= fsl_pamu_release_device,
 	.device_group   = fsl_pamu_device_group,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= fsl_pamu_attach_device,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 06d6989f07f6..8b4fc7e62b99 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -259,7 +259,8 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	return 0;
 
 out_release:
-	ops->release_device(dev);
+	if (ops->release_device)
+		ops->release_device(dev);
 
 out_module_put:
 	module_put(ops->owner);
@@ -337,7 +338,8 @@ void iommu_release_device(struct device *dev)
 	iommu_device_unlink(dev->iommu->iommu_dev, dev);
 
 	ops = dev_iommu_ops(dev);
-	ops->release_device(dev);
+	if (ops->release_device)
+		ops->release_device(dev);
 
 	iommu_group_remove_device(dev);
 	module_put(ops->owner);
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index f09aedfdd462..428919a474c1 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -394,10 +394,6 @@ static struct iommu_device *msm_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
-static void msm_iommu_release_device(struct device *dev)
-{
-}
-
 static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret = 0;
@@ -677,7 +673,6 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 static struct iommu_ops msm_iommu_ops = {
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
-	.release_device = msm_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index c54ab477b8fd..a84c63518773 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -738,8 +738,6 @@ static struct iommu_device *sun50i_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
-static void sun50i_iommu_release_device(struct device *dev) {}
-
 static struct iommu_group *sun50i_iommu_device_group(struct device *dev)
 {
 	struct sun50i_iommu *iommu = sun50i_iommu_from_dev(dev);
@@ -764,7 +762,6 @@ static const struct iommu_ops sun50i_iommu_ops = {
 	.domain_alloc	= sun50i_iommu_domain_alloc,
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
-	.release_device	= sun50i_iommu_release_device,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= sun50i_iommu_attach_device,
 		.detach_dev	= sun50i_iommu_detach_device,
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index a6700a40a6f8..e5ca3cf1a949 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -246,10 +246,6 @@ static struct iommu_device *gart_iommu_probe_device(struct device *dev)
 	return &gart_handle->iommu;
 }
 
-static void gart_iommu_release_device(struct device *dev)
-{
-}
-
 static int gart_iommu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
@@ -273,7 +269,6 @@ static void gart_iommu_sync(struct iommu_domain *domain,
 static const struct iommu_ops gart_iommu_ops = {
 	.domain_alloc	= gart_iommu_domain_alloc,
 	.probe_device	= gart_iommu_probe_device,
-	.release_device	= gart_iommu_release_device,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
 	.of_xlate	= gart_iommu_of_xlate,
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1fea68e551f1..2a8de975fe63 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -864,8 +864,6 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 	return &smmu->iommu;
 }
 
-static void tegra_smmu_release_device(struct device *dev) {}
-
 static const struct tegra_smmu_group_soc *
 tegra_smmu_find_group(struct tegra_smmu *smmu, unsigned int swgroup)
 {
@@ -966,7 +964,6 @@ static int tegra_smmu_of_xlate(struct device *dev,
 static const struct iommu_ops tegra_smmu_ops = {
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
-	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
-- 
2.36.1.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
