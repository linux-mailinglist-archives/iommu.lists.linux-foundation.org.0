Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5005535A2
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 17:14:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D28F83F6D;
	Tue, 21 Jun 2022 15:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D28F83F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eUYmvNUrHCbk; Tue, 21 Jun 2022 15:14:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3BB9D83F7E;
	Tue, 21 Jun 2022 15:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB9D83F7E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13B55C0081;
	Tue, 21 Jun 2022 15:14:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC120C002D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B322383F79
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B322383F79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oq5pnOxFg1Fc for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 15:14:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D318083F74
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id D318083F74
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D01C1692;
 Tue, 21 Jun 2022 08:14:41 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F9D43F66F;
 Tue, 21 Jun 2022 08:14:40 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 3/3] iommu: Clean up release_device checks
Date: Tue, 21 Jun 2022 16:14:27 +0100
Message-Id: <02671dbfad7a3343fc25a44222350efcb455fe3c.1655822151.git.robin.murphy@arm.com>
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

Since .release_device is now called through per-device ops, any call
which gets as far as a driver definitely *is* for that driver, for a
device which has successfully passed .probe_device, so all the checks to
that effect are now redundant and can be removed. In the same vein we
can also skip freeing fwspecs which are now managed by core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/apple-dart.c                  |  3 ---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  8 +-------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 14 +++-----------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 11 -----------
 drivers/iommu/exynos-iommu.c                |  3 ---
 drivers/iommu/mtk_iommu.c                   |  5 -----
 drivers/iommu/mtk_iommu_v1.c                |  5 -----
 drivers/iommu/sprd-iommu.c                  | 11 -----------
 drivers/iommu/virtio-iommu.c                |  8 +-------
 9 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 8af0242a90d9..e87d3cf54ed6 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -564,9 +564,6 @@ static void apple_dart_release_device(struct device *dev)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 
-	if (!cfg)
-		return;
-
 	dev_iommu_priv_set(dev, NULL);
 	kfree(cfg);
 }
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 88817a3376ef..382f3120e27b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2691,20 +2691,14 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 
 static void arm_smmu_release_device(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master *master;
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return;
-
-	master = dev_iommu_priv_get(dev);
 	if (WARN_ON(arm_smmu_master_sva_enabled(master)))
 		iopf_queue_remove_device(master->smmu->evtq.iopf, dev);
 	arm_smmu_detach_dev(master);
 	arm_smmu_disable_pasid(master);
 	arm_smmu_remove_master(master);
 	kfree(master);
-	iommu_fwspec_free(dev);
 }
 
 static struct iommu_group *arm_smmu_device_group(struct device *dev)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 2ed3594f384e..7c2a99862fd3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1432,27 +1432,19 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 static void arm_smmu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master_cfg *cfg;
-	struct arm_smmu_device *smmu;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 	int ret;
 
-	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return;
-
-	cfg  = dev_iommu_priv_get(dev);
-	smmu = cfg->smmu;
-
-	ret = arm_smmu_rpm_get(smmu);
+	ret = arm_smmu_rpm_get(cfg->smmu);
 	if (ret < 0)
 		return;
 
 	arm_smmu_master_free_smes(cfg, fwspec);
 
-	arm_smmu_rpm_put(smmu);
+	arm_smmu_rpm_put(cfg->smmu);
 
 	dev_iommu_priv_set(dev, NULL);
 	kfree(cfg);
-	iommu_fwspec_free(dev);
 }
 
 static void arm_smmu_probe_finalize(struct device *dev)
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4c077c38fbd6..4a922c7b69ee 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -532,16 +532,6 @@ static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 	return &qcom_iommu->iommu;
 }
 
-static void qcom_iommu_release_device(struct device *dev)
-{
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
-
-	if (!qcom_iommu)
-		return;
-
-	iommu_fwspec_free(dev);
-}
-
 static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
 	struct qcom_iommu_dev *qcom_iommu;
@@ -591,7 +581,6 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-	.release_device	= qcom_iommu_release_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 71f2018e23fe..1d6808d6e190 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1251,9 +1251,6 @@ static void exynos_iommu_release_device(struct device *dev)
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	if (!has_sysmmu(dev))
-		return;
-
 	if (owner->domain) {
 		struct iommu_group *group = iommu_group_get(dev);
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bb9dd92c9898..5c3d9366c25c 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -819,17 +819,12 @@ static void mtk_iommu_release_device(struct device *dev)
 	struct device *larbdev;
 	unsigned int larbid;
 
-	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
-		return;
-
 	data = dev_iommu_priv_get(dev);
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[0]);
 		larbdev = data->larb_imu[larbid].dev;
 		device_link_remove(dev, larbdev);
 	}
-
-	iommu_fwspec_free(dev);
 }
 
 static int mtk_iommu_get_group_id(struct device *dev, const struct mtk_iommu_plat_data *plat_data)
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index e1cb51b9866c..128c7a3f1778 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -532,15 +532,10 @@ static void mtk_iommu_v1_release_device(struct device *dev)
 	struct device *larbdev;
 	unsigned int larbid;
 
-	if (!fwspec || fwspec->ops != &mtk_iommu_v1_ops)
-		return;
-
 	data = dev_iommu_priv_get(dev);
 	larbid = mt2701_m4u_to_larb(fwspec->ids[0]);
 	larbdev = data->larb_imu[larbid].dev;
 	device_link_remove(dev, larbdev);
-
-	iommu_fwspec_free(dev);
 }
 
 static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index bd409bab6286..511959c8a14d 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -383,16 +383,6 @@ static struct iommu_device *sprd_iommu_probe_device(struct device *dev)
 	return &sdev->iommu;
 }
 
-static void sprd_iommu_release_device(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-
-	if (!fwspec || fwspec->ops != &sprd_iommu_ops)
-		return;
-
-	iommu_fwspec_free(dev);
-}
-
 static struct iommu_group *sprd_iommu_device_group(struct device *dev)
 {
 	struct sprd_iommu_device *sdev = dev_iommu_priv_get(dev);
@@ -417,7 +407,6 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 static const struct iommu_ops sprd_iommu_ops = {
 	.domain_alloc	= sprd_iommu_domain_alloc,
 	.probe_device	= sprd_iommu_probe_device,
-	.release_device	= sprd_iommu_release_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
 	.pgsize_bitmap	= ~0UL << SPRD_IOMMU_PAGE_SHIFT,
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 25be4b822aa0..55337796a5f8 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -981,13 +981,7 @@ static void viommu_probe_finalize(struct device *dev)
 
 static void viommu_release_device(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct viommu_endpoint *vdev;
-
-	if (!fwspec || fwspec->ops != &viommu_ops)
-		return;
-
-	vdev = dev_iommu_priv_get(dev);
+	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
 
 	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
-- 
2.36.1.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
