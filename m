Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DF495259A22
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 18:47:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9ADB287058;
	Tue,  1 Sep 2020 16:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4F5YR-z7Hz8P; Tue,  1 Sep 2020 16:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 116CF8704E;
	Tue,  1 Sep 2020 16:47:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0D81C0051;
	Tue,  1 Sep 2020 16:47:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3AFAC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 16:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DD91B20505
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 16:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxvGx4ZHqFOu for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 16:46:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 9D07820495
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 16:46:59 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id m5so972513pgj.9
 for <iommu@lists.linux-foundation.org>; Tue, 01 Sep 2020 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srEmGnrmxwaGCReCBnM1pPe/YxdooxBc+Wa1kzshwzQ=;
 b=QU4v2jGgzV9ckG0OCbywoUxnC5waLQgRQRT4H3Bb8Wt3k0SAmLvkC7waLKazY3WVjP
 458XRRSQXaVavpTDU8fh9pnzbne2+846Q8iTz5Db74j2aSorIrHgGFmQ72nQt3c5fnkK
 3vITDwpgVApyVv7ytuNnr5pbyWzVx+LZWO9CX2EWiSx02OHMSDNFqzjZsBrTzGcmZM/r
 Z7hxWOYCB8dDg972IeYcTGTLoYTC5W4vax1qWZcxczmVEDcpILJzKJdhOcnFS5iz2rsK
 /czjWIxhjYhjoqiZyFADg/tGMM8AEym9TWVSKhoM4yDmM2EUzONhN8Zbbpu+YORerV9I
 uSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srEmGnrmxwaGCReCBnM1pPe/YxdooxBc+Wa1kzshwzQ=;
 b=Yyv2vxtTunXSod1Qnr5wY0hLz3vtH8L/1hVemnLO/IC2waPpsXxVu2LMA8JO4+YKlG
 xM3RZ87ajkb+6whfCCZm/DGFTEIHJ1tS+AkklTM3n1fR6KE/S0Fo2oZ4SC4u5Km3wYSo
 FS7gAW0J3JESq1K9sR+HXjmhJeFnDAhNo4GaJ/5J3663WkVCVMFoGIp8/ZJxI5X8Kzvz
 cBQ1R3+J0OO7Y5Me6+U8WKI33/NMcuSOail1NV4hwPWpX7TRPifsEsddTZBm9r6KKXb1
 +/viK+5VVhXjRVoiJaN0E5Fx16gxX5aGvThe6govDRVebyv9Bb22EKS7lOBJRY4QG1Kc
 P1rQ==
X-Gm-Message-State: AOAM533lXpY8t6JVbJq6+6k7G1xn5dB07gnhrBppcz2a0un3KzjRMudu
 7pFfrRJ/L5cT1Bnfz6TeCa0=
X-Google-Smtp-Source: ABdhPJzVKI4T3VZ397dwbaQE0tU4GBpaAB3NSWyGfnoMKiZ68kdpK/TiKXmMyVlYdT8nnZ1WwtIKag==
X-Received: by 2002:a63:4746:: with SMTP id w6mr2263937pgk.412.1598978816565; 
 Tue, 01 Sep 2020 09:46:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id e66sm2386338pfa.130.2020.09.01.09.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:46:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v16 10/20] drm/msm/a6xx: Add support for per-instance
 pagetables
Date: Tue,  1 Sep 2020 09:46:27 -0700
Message-Id: <20200901164707.2645413-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Eric Anholt <eric@anholt.net>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
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

From: Jordan Crouse <jcrouse@codeaurora.org>

Add support for using per-instance pagetables if all the dependencies are
available.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
 3 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5eabb0109577..d7ad6c78d787 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -81,6 +81,49 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 	OUT_RING(ring, upper_32_bits(iova));
 }
 
+static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
+		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
+{
+	phys_addr_t ttbr;
+	u32 asid;
+	u64 memptr = rbmemptr(ring, ttbr0);
+
+	if (ctx == a6xx_gpu->cur_ctx)
+		return;
+
+	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
+		return;
+
+	/* Execute the table update */
+	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_0_TTBR0_LO(lower_32_bits(ttbr)));
+
+	OUT_RING(ring,
+		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
+		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+
+	/*
+	 * Write the new TTBR0 to the memstore. This is good for debugging.
+	 */
+	OUT_PKT7(ring, CP_MEM_WRITE, 4);
+	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
+	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
+
+	/*
+	 * And finally, trigger a uche flush to be sure there isn't anything
+	 * lingering in that part of the GPU
+	 */
+
+	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+	OUT_RING(ring, 0x31);
+
+	a6xx_gpu->cur_ctx = ctx;
+}
+
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
@@ -90,6 +133,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
+	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
 		rbmemptr_stats(ring, index, cpcycles_start));
 
@@ -696,6 +741,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
+	a6xx_gpu->cur_ctx = NULL;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
@@ -1008,6 +1055,21 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_private_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace = NULL;
+	struct msm_mmu *mmu;
+
+	mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
+
+	if (!IS_ERR(mmu))
+		aspace = msm_gem_address_space_create(mmu,
+			"gpu", 0x100000000ULL, 0x1ffffffffULL);
+
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1031,6 +1093,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
 		.create_address_space = adreno_iommu_create_address_space,
+		.create_private_address_space = a6xx_create_private_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 03ba60d5b07f..da22d7549d9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -19,6 +19,7 @@ struct a6xx_gpu {
 	uint64_t sqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
+	struct msm_file_private *cur_ctx;
 
 	struct a6xx_gmu gmu;
 };
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 7764373d0ed2..0987d6bf848c 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
+	volatile u64 ttbr0;
 };
 
 struct msm_ringbuffer {
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
