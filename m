Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E912E570
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 12:03:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F24CA815E9;
	Thu,  2 Jan 2020 11:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YoGiTnHadR6q; Thu,  2 Jan 2020 11:03:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C12383883;
	Thu,  2 Jan 2020 11:03:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 065D7C077D;
	Thu,  2 Jan 2020 11:03:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCD09C077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 11:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D90D5815E9
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 11:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiWU0hNsNdWf for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 11:03:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B80AC814E9
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 11:03:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577962981; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Kh5To+EGbT//PbB0ZXQ0h0S3u/fbkwAeO+mv8pFr1t8=;
 b=CAUYfREWhHlIDrijzFiO7rELLSSz5lEbTN4SLrwWUCPEw9n9OtLcBITLizKRwnFA3t4+/QaR
 Xd6i94nHzf5Qd9ijszUUTN3Oh3E+NNh3f3BJ7v/RHqAdw7nYZd6RN5pwOBLen2oWf9VACaEH
 LnoiQFbK314P6s6DtsTHV0SQMJA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcde5.7fc280363490-smtp-out-n01;
 Thu, 02 Jan 2020 11:03:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CF262C447B2; Thu,  2 Jan 2020 11:03:00 +0000 (UTC)
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 40A05C447A9;
 Thu,  2 Jan 2020 11:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40A05C447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/msm/a6xx: Add support for using system cache(LLC)
Date: Thu,  2 Jan 2020 16:32:13 +0530
Message-Id: <1577962933-13577-8-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
References: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
Cc: will@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@freedesktop.org, robin.murphy@arm.com,
 Sharat Masetty <smasetty@codeaurora.org>
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

The last level system cache can be partitioned to 32 different slices
of which GPU has two slices preallocated. One slice is used for caching GPU
buffers and the other slice is used for caching the GPU SMMU pagetables.
This patch talks to the core system cache driver to acquire the slice handles,
configure the SCID's to those slices and activates and deactivates the slices
upon GPU power collapse and restore.

Some support from the IOMMU driver is also needed to make use of the
system cache. IOMMU_QCOM_SYS_CACHE is a buffer protection flag which enables
caching GPU data buffers in the system cache with memory attributes such
as outer cacheable, read-allocate, write-allocate for buffers. The GPU
then has the ability to override a few cacheability parameters which it
does to override write-allocate to write-no-allocate as the GPU hardware
does not benefit much from it.

Similarly DOMAIN_ATTR_QCOM_SYS_CACHE is another domain level attribute
used by the IOMMU driver to set the right attributes to cache the hardware
pagetables into the system cache.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 100 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   3 +
 drivers/gpu/drm/msm/msm_iommu.c       |   3 +
 drivers/gpu/drm/msm/msm_mmu.h         |   4 ++
 4 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ab562f6..d15eb99f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,8 @@
 #include "a6xx_gmu.xml.h"

 #include <linux/devfreq.h>
+#include <linux/bitfield.h>
+#include <linux/soc/qcom/llcc-qcom.h>

 #define GPU_PAS_ID 13

@@ -781,6 +783,81 @@ static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu)
 	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
 }

+static void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
+{
+	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
+}
+
+static void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
+{
+	return msm_writel(value, a6xx_gpu->llc_mmio + (reg << 2));
+}
+
+static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
+{
+	llcc_slice_deactivate(a6xx_gpu->llc_slice);
+	llcc_slice_deactivate(a6xx_gpu->htw_llc_slice);
+}
+
+static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
+{
+	u32 cntl1_regval = 0;
+
+	if (IS_ERR(a6xx_gpu->llc_mmio))
+		return;
+
+	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
+		u32 gpu_scid = llcc_get_slice_id(a6xx_gpu->llc_slice);
+
+		gpu_scid &= 0x1f;
+		cntl1_regval = (gpu_scid << 0) | (gpu_scid << 5) |
+			(gpu_scid << 10) | (gpu_scid << 15) | (gpu_scid << 20);
+	}
+
+	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
+		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
+
+		gpuhtw_scid &= 0x1f;
+		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
+	}
+
+	if (cntl1_regval) {
+		/*
+		 * Program the slice IDs for the various GPU blocks and GPU MMU
+		 * pagetables
+		 */
+		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1,
+				cntl1_regval);
+
+		/*
+		 * Program cacheability overrides to not allocate cache lines on
+		 * a write miss
+		 */
+		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0,
+				0xF, 0x03);
+	}
+}
+
+static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
+{
+	llcc_slice_putd(a6xx_gpu->llc_slice);
+	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
+}
+
+static void a6xx_llc_slices_init(struct platform_device *pdev,
+		struct a6xx_gpu *a6xx_gpu)
+{
+	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
+	if (IS_ERR(a6xx_gpu->llc_mmio))
+		return;
+
+	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
+	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
+
+	if (IS_ERR(a6xx_gpu->llc_slice) && IS_ERR(a6xx_gpu->htw_llc_slice))
+		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -795,6 +872,8 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)

 	msm_gpu_resume_devfreq(gpu);

+	a6xx_llc_activate(a6xx_gpu);
+
 	return 0;
 }

@@ -803,6 +882,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);

+	a6xx_llc_deactivate(a6xx_gpu);
+
 	devfreq_suspend_device(gpu->devfreq.devfreq);

 	/*
@@ -851,6 +932,7 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put_unlocked(a6xx_gpu->sqe_bo);
 	}

+	a6xx_llc_slices_destroy(a6xx_gpu);
 	a6xx_gmu_remove(a6xx_gpu);

 	adreno_gpu_cleanup(adreno_gpu);
@@ -881,6 +963,8 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 static struct msm_gem_address_space *
 a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
@@ -894,6 +978,20 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 	}

+	if (!IS_ERR(a6xx_gpu->llc_slice))
+		mmu->features |= MMU_FEATURE_USE_SYSTEM_CACHE;
+
+	/*
+	 * This allows GPU to set the bus attributes required to use system
+	 * cache on behalf of the iommu page table walker.
+	 */
+	if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
+		int gpu_htw_llc = 1;
+
+		iommu_domain_set_attr(iommu, DOMAIN_ATTR_QCOM_SYS_CACHE,
+				&gpu_htw_llc);
+	}
+
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M, 0xffffffff);
 	if (IS_ERR(aspace))
 		mmu->funcs->destroy(mmu);
@@ -948,6 +1046,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 	adreno_gpu->reg_offsets = a6xx_register_offsets;

+	a6xx_llc_slices_init(pdev, a6xx_gpu);
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 7239b8b..9004344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -21,6 +21,9 @@ struct a6xx_gpu {
 	struct msm_ringbuffer *cur_ring;

 	struct a6xx_gmu gmu;
+	void __iomem *llc_mmio;
+	void *llc_slice;
+	void *htw_llc_slice;
 };

 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2ec08daf..3c41c4a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -37,6 +37,9 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;

+	if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
+		prot |= IOMMU_QCOM_SYS_CACHE;
+
 	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
 	WARN_ON(!ret);

diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index e4029b0..753443c 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -17,11 +17,15 @@ struct msm_mmu_funcs {
 	void (*destroy)(struct msm_mmu *mmu);
 };

+/* MMU features */
+#define MMU_FEATURE_USE_SYSTEM_CACHE (1 << 0)
+
 struct msm_mmu {
 	const struct msm_mmu_funcs *funcs;
 	struct device *dev;
 	int (*handler)(void *arg, unsigned long iova, int flags);
 	void *arg;
+	u32 features;
 };

 static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
--
1.9.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
