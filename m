Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6EB1F701C
	for <lists.iommu@lfdr.de>; Fri, 12 Jun 2020 00:29:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 61D3189005;
	Thu, 11 Jun 2020 22:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUZTpsJR-2e2; Thu, 11 Jun 2020 22:29:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBD908907E;
	Thu, 11 Jun 2020 22:29:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2302C016F;
	Thu, 11 Jun 2020 22:29:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ADA0C016F
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 66F5688F8C
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuocVjY5g3qS for <iommu@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 22:29:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED2BB88F87
 for <iommu@lists.linux-foundation.org>; Thu, 11 Jun 2020 22:29:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591914577; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iD/NTCbEkXnW7JMeR0c7hWaZgF7iJZmQDmy6n4LLUm8=;
 b=j5IoqNs+EuQ9GjD2MtftSqsPIH1tht65CyAZ1+4o1GZW3lUBJPw+kHh8m2ZLPGnYSYeXyps0
 d4d0FU3l1ZGRJmbaPUqlVMIoF9zhv8FJko4O42n70pDyAKOM9WNHEvAzjvmHOEiVACd7kpZz
 1r4qdK704/GOM/tstFynEo7Y+PM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ee2b04e0206ad41d1d0b483 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:29:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 983DFC43387; Thu, 11 Jun 2020 22:29:33 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 249A0C43387;
 Thu, 11 Jun 2020 22:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 249A0C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/6] drm/msm: Add support to create a local pagetable
Date: Thu, 11 Jun 2020 16:29:19 -0600
Message-Id: <20200611222921.464-5-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611222921.464-1-jcrouse@codeaurora.org>
References: <20200611222921.464-1-jcrouse@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
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

Add support to create a io-pgtable for use by targets that support
per-instance pagetables.  In order to support per-instance pagetables the
GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
split pagetables and auxiliary domains need to be supported and enabled.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c  | 180 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
 3 files changed, 195 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
index 310a31b05faa..aab121f4beb7 100644
--- a/drivers/gpu/drm/msm/msm_gpummu.c
+++ b/drivers/gpu/drm/msm/msm_gpummu.c
@@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
 	}
 
 	gpummu->gpu = gpu;
-	msm_mmu_init(&gpummu->base, dev, &funcs);
+	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
 
 	return &gpummu->base;
 }
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bbe129867590..c7efe43388e3 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -4,15 +4,192 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/io-pgtable.h>
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
+	struct iommu_domain *aux_domain;
 };
+
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
 
+struct msm_iommu_pagetable {
+	struct msm_mmu base;
+	struct msm_mmu *parent;
+	struct io_pgtable_ops *pgtbl_ops;
+	phys_addr_t ttbr;
+	u32 asid;
+};
+
+static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
+{
+	return container_of(mmu, struct msm_iommu_pagetable, base);
+}
+
+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
+		size_t size)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	size_t unmapped = 0;
+
+	/* Unmap the block one page at a time */
+	while (size) {
+		unmapped += ops->unmap(ops, iova, 4096, NULL);
+		iova += 4096;
+		size -= 4096;
+	}
+
+	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
+
+	return (unmapped == size) ? 0 : -EINVAL;
+}
+
+static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
+		struct sg_table *sgt, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct scatterlist *sg;
+	size_t mapped = 0;
+	u64 addr = iova;
+	unsigned int i;
+
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		size_t size = sg->length;
+		phys_addr_t phys = sg_phys(sg);
+
+		/* Map the block one page at a time */
+		while (size) {
+			if (ops->map(ops, addr, phys, 4096, prot)) {
+				msm_iommu_pagetable_unmap(mmu, iova, mapped);
+				return -EINVAL;
+			}
+
+			phys += 4096;
+			addr += 4096;
+			size -= 4096;
+			mapped += 4096;
+		}
+	}
+
+	return 0;
+}
+
+static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+
+	free_io_pgtable_ops(pagetable->pgtbl_ops);
+	kfree(pagetable);
+}
+
+/*
+ * Given a parent device, create and return an aux domain. This will enable the
+ * TTBR0 region
+ */
+static struct iommu_domain *msm_iommu_get_aux_domain(struct msm_mmu *parent)
+{
+	struct msm_iommu *iommu = to_msm_iommu(parent);
+	struct iommu_domain *domain;
+	int ret;
+
+	if (iommu->aux_domain)
+		return iommu->aux_domain;
+
+	if (!iommu_dev_has_feature(parent->dev, IOMMU_DEV_FEAT_AUX))
+		return ERR_PTR(-ENODEV);
+
+	domain = iommu_domain_alloc(&platform_bus_type);
+	if (!domain)
+		return ERR_PTR(-ENODEV);
+
+	ret = iommu_aux_attach_device(domain, parent->dev);
+	if (ret) {
+		iommu_domain_free(domain);
+		return ERR_PTR(ret);
+	}
+
+	iommu->aux_domain = domain;
+	return domain;
+}
+
+int msm_iommu_pagetable_params(struct msm_mmu *mmu,
+		phys_addr_t *ttbr, int *asid)
+{
+	struct msm_iommu_pagetable *pagetable;
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (ttbr)
+		*ttbr = pagetable->ttbr;
+
+	if (asid)
+		*asid = pagetable->asid;
+
+	return 0;
+}
+
+static const struct msm_mmu_funcs pagetable_funcs = {
+		.map = msm_iommu_pagetable_map,
+		.unmap = msm_iommu_pagetable_unmap,
+		.destroy = msm_iommu_pagetable_destroy,
+};
+
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+{
+	static int next_asid = 16;
+	struct msm_iommu_pagetable *pagetable;
+	struct iommu_domain *aux_domain;
+	struct io_pgtable_cfg cfg;
+	int ret;
+
+	/* Make sure that the parent has a aux domain attached */
+	aux_domain = msm_iommu_get_aux_domain(parent);
+	if (IS_ERR(aux_domain))
+		return ERR_CAST(aux_domain);
+
+	/* Get the pagetable configuration from the aux domain */
+	ret = iommu_domain_get_attr(aux_domain, DOMAIN_ATTR_PGTABLE_CFG, &cfg);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
+	if (!pagetable)
+		return ERR_PTR(-ENOMEM);
+
+	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
+		MSM_MMU_IOMMU_PAGETABLE);
+
+	cfg.tlb = NULL;
+
+	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
+		&cfg, aux_domain);
+
+	if (!pagetable->pgtbl_ops) {
+		kfree(pagetable);
+		return ERR_PTR(-ENOMEM);
+	}
+
+
+	/* Needed later for TLB flush */
+	pagetable->parent = parent;
+	pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
+
+	pagetable->asid = next_asid;
+	next_asid = (next_asid + 1)  % 255;
+	if (next_asid < 16)
+		next_asid = 16;
+
+	return &pagetable->base;
+}
+
 static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
@@ -40,6 +217,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT(48))
 		iova |= GENMASK(63, 49);
 
+
 	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 	WARN_ON(!ret);
 
@@ -85,7 +263,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 		return ERR_PTR(-ENOMEM);
 
 	iommu->domain = domain;
-	msm_mmu_init(&iommu->base, dev, &funcs);
+	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
 	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
 
 	ret = iommu_attach_device(iommu->domain, dev);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 3a534ee59bf6..61ade89d9e48 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -17,18 +17,26 @@ struct msm_mmu_funcs {
 	void (*destroy)(struct msm_mmu *mmu);
 };
 
+enum msm_mmu_type {
+	MSM_MMU_GPUMMU,
+	MSM_MMU_IOMMU,
+	MSM_MMU_IOMMU_PAGETABLE,
+};
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags);
 	void *arg;
+	enum msm_mmu_type type;
 };
 
 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
-		const struct msm_mmu_funcs *funcs)
+		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
 {
 	mmu->dev = dev;
 	mmu->funcs = funcs;
+	mmu->type = type;
 }
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
@@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+
 void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error);
 
+
+int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
+		int *asid);
+
 #endif /* __MSM_MMU_H__ */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
