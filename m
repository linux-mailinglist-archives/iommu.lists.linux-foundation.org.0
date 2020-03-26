Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1A19427A
	for <lists.iommu@lfdr.de>; Thu, 26 Mar 2020 16:09:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5EDAC2635F;
	Thu, 26 Mar 2020 15:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymK8N3PW1qcW; Thu, 26 Mar 2020 15:08:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6D13226316;
	Thu, 26 Mar 2020 15:08:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53EDAC0177;
	Thu, 26 Mar 2020 15:08:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5E59C0177
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 15:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B5A4886C39
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 15:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l49HWvmiSwag for <iommu@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 15:08:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2DFB86B62
 for <iommu@lists.linux-foundation.org>; Thu, 26 Mar 2020 15:08:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A2478AEE; Thu, 26 Mar 2020 16:08:48 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v4 14/16] iommu/qcom: Use accessor functions for iommu private
 data
Date: Thu, 26 Mar 2020 16:08:39 +0100
Message-Id: <20200326150841.10083-15-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326150841.10083-1-joro@8bytes.org>
References: <20200326150841.10083-1-joro@8bytes.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 guohanjun@huawei.com, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
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

From: Joerg Roedel <jroedel@suse.de>

Make use of dev_iommu_priv_set/get() functions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/qcom_iommu.c | 61 ++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 4328da0b0a9f..824a9e85fac6 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -74,16 +74,19 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
 
 static const struct iommu_ops qcom_iommu_ops;
 
-static struct qcom_iommu_dev * to_iommu(struct iommu_fwspec *fwspec)
+static struct qcom_iommu_dev * to_iommu(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
 	if (!fwspec || fwspec->ops != &qcom_iommu_ops)
 		return NULL;
-	return fwspec->iommu_priv;
+
+	return dev_iommu_priv_get(dev);
 }
 
-static struct qcom_iommu_ctx * to_ctx(struct iommu_fwspec *fwspec, unsigned asid)
+static struct qcom_iommu_ctx * to_ctx(struct device *dev, unsigned asid)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	if (!qcom_iommu)
 		return NULL;
 	return qcom_iommu->ctxs[asid - 1];
@@ -115,11 +118,14 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
 
 static void qcom_iommu_tlb_sync(void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct iommu_fwspec *fwspec;
+	struct device *dev = cookie;
 	unsigned i;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		unsigned int val, ret;
 
 		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
@@ -133,11 +139,14 @@ static void qcom_iommu_tlb_sync(void *cookie)
 
 static void qcom_iommu_tlb_inv_context(void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct device *dev = cookie;
+	struct iommu_fwspec *fwspec;
 	unsigned i;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
 	}
 
@@ -147,13 +156,16 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
 static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 					    size_t granule, bool leaf, void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct device *dev = cookie;
+	struct iommu_fwspec *fwspec;
 	unsigned i, reg;
 
 	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		size_t s = size;
 
 		iova = (iova >> 12) << 12;
@@ -222,9 +234,10 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 
 static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				  struct qcom_iommu_dev *qcom_iommu,
-				  struct iommu_fwspec *fwspec)
+				  struct device *dev)
 {
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
 	int i, ret = 0;
@@ -243,7 +256,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	};
 
 	qcom_domain->iommu = qcom_iommu;
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, fwspec);
+	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, dev);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -256,7 +269,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	domain->geometry.force_aperture = true;
 
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 
 		if (!ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
@@ -363,8 +376,7 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
 
 static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	int ret;
 
@@ -375,7 +387,7 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 
 	/* Ensure that the domain is finalized */
 	pm_runtime_get_sync(qcom_iommu->dev);
-	ret = qcom_iommu_init_domain(domain, qcom_iommu, fwspec);
+	ret = qcom_iommu_init_domain(domain, qcom_iommu, dev);
 	pm_runtime_put_sync(qcom_iommu->dev);
 	if (ret < 0)
 		return ret;
@@ -397,9 +409,9 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 
 static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	unsigned i;
 
 	if (WARN_ON(!qcom_domain->iommu))
@@ -407,7 +419,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 
 	pm_runtime_get_sync(qcom_iommu->dev);
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 
 		/* Disable the context bank: */
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
@@ -514,7 +526,7 @@ static bool qcom_iommu_capable(enum iommu_cap cap)
 
 static int qcom_iommu_add_device(struct device *dev)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev_iommu_fwspec_get(dev));
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	struct iommu_group *group;
 	struct device_link *link;
 
@@ -545,7 +557,7 @@ static int qcom_iommu_add_device(struct device *dev)
 
 static void qcom_iommu_remove_device(struct device *dev)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev_iommu_fwspec_get(dev));
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 
 	if (!qcom_iommu)
 		return;
@@ -557,7 +569,6 @@ static void qcom_iommu_remove_device(struct device *dev)
 
 static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct qcom_iommu_dev *qcom_iommu;
 	struct platform_device *iommu_pdev;
 	unsigned asid = args->args[0];
@@ -583,14 +594,14 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	    WARN_ON(asid > qcom_iommu->num_ctxs))
 		return -EINVAL;
 
-	if (!fwspec->iommu_priv) {
-		fwspec->iommu_priv = qcom_iommu;
+	if (!dev_iommu_priv_get(dev)) {
+		dev_iommu_priv_set(dev, qcom_iommu);
 	} else {
 		/* make sure devices iommus dt node isn't referring to
 		 * multiple different iommu devices.  Multiple context
 		 * banks are ok, but multiple devices are not:
 		 */
-		if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
+		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
 			return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
