Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 982173E8A04
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 08:08:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388D74038A;
	Wed, 11 Aug 2021 06:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCv7e9yGT1F5; Wed, 11 Aug 2021 06:08:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 05FB14022B;
	Wed, 11 Aug 2021 06:08:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7D36C000E;
	Wed, 11 Aug 2021 06:08:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A0CBC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 4383E82AF8
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id JAmM6pvKP_I4 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:08:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 1817082A8F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:08:01 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628662085; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=9Zv3TbeA9kZ428yMlz9Od+wQ9dy0fvYJYQCf8ShjWY0=;
 b=uxCEw2mdZja14uO2pHxtsNQFivf8caQj9cY2s2GGnO8rkUTI05LHtNlrdcNyrgxvtx7QPJNz
 8/4flR866osYS3sweyudpWGBr/Ly7pgQ7dRwiwxpd/IChxui1LolQLOCmStGDceRdxgJPaSY
 E4dqWBPt+Ets/5MUaIlDNSmMqPc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6113693ab14e7e2ecb5ddb7e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 06:07:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36550C43217; Wed, 11 Aug 2021 06:07:54 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A869CC433F1;
 Wed, 11 Aug 2021 06:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A869CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCHv4] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
Date: Wed, 11 Aug 2021 11:37:25 +0530
Message-Id: <20210811060725.25221-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Cc: Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
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

Currently for iommu_unmap() of large scatter-gather list with page size
elements, the majority of time is spent in flushing of partial walks in
__arm_lpae_unmap() which is a VA based TLB invalidation invalidating
page-by-page on iommus like arm-smmu-v2 (TLBIVA).

For example: to unmap a 32MB scatter-gather list with page size elements
(8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
overhead.

On qcom implementation, there are several performance improvements for
TLB cache invalidations in HW like wait-for-safe (for realtime clients
such as camera and display) and few others to allow for cache
lookups/updates when TLBI is in progress for the same context bank.
So the cost of over-invalidation is less compared to the unmap latency
on several usecases like camera which deals with large buffers. So,
ASID based TLB invalidations (TLBIASID) can be used to invalidate the
entire context for partial walk flush thereby improving the unmap
latency.

Non-strict mode can use this by default for all platforms given its
all about over-invalidation saving time on individual unmaps and
non-deterministic generally.

For this example of 32MB scatter-gather list unmap, this change results
in just 16 ASID based TLB invalidations (TLBIASIDs) as opposed to 8192
TLBIVAs thereby increasing the performance of unmaps drastically.

Test on QTI SM8150 SoC for 10 iterations of iommu_{map_sg}/unmap:
(average over 10 iterations)

Before this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            2.067 us         1.854 us
     64K            9.598 us         8.802 us
      1M          148.890 us       130.718 us
      2M          305.864 us        67.291 us
     12M         1793.604 us       390.838 us
     16M         2386.848 us       518.187 us
     24M         3563.296 us       775.989 us
     32M         4747.171 us      1033.364 us

After this optimization:

    size        iommu_map_sg      iommu_unmap
      4K            1.723 us         1.765 us
     64K            9.880 us         8.869 us
      1M          155.364 us       135.223 us
      2M          303.906 us         5.385 us
     12M         1786.557 us        21.250 us
     16M         2391.890 us        27.437 us
     24M         3570.895 us        39.937 us
     32M         4755.234 us        51.797 us

Real world data also shows big difference in unmap performance as below:

There were reports of camera frame drops because of high overhead in
iommu unmap without this optimization because of frequent unmaps issued
by camera of about 100MB/s taking more than 100ms thereby causing frame
drops.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v4:
 * Use a flag in struct arm_smmu_cfg to prefer TLBIASID (Will)

Changes in v3:
 * Move the logic to arm-smmu driver from io-pgtable (Robin)
 * Use a new set of iommu_flush_ops->arm_smmu_s1_tlb_impl_ops and use it for qcom impl

Changes in v2:
 * Add a quirk to choose tlb_flush_all in partial walk flush
 * Set the quirk for QTI SoC implementation

---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 11 +++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 17 +++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 9b9d13ec5a88..55690af1b25d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -193,6 +193,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 {
 	struct adreno_smmu_priv *priv;
 
+	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
+
 	/* Only enable split pagetables for the GPU device (SID 0) */
 	if (!qcom_adreno_smmu_is_gpu_device(dev))
 		return 0;
@@ -235,6 +237,14 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
+{
+	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
+
+	return 0;
+}
+
 static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 {
 	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
@@ -358,6 +368,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index f7da8953afbe..3904b598e0f9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -327,9 +327,16 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 static void arm_smmu_tlb_inv_walk_s1(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
-	arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
-				  ARM_SMMU_CB_S1_TLBIVA);
-	arm_smmu_tlb_sync_context(cookie);
+	struct arm_smmu_domain *smmu_domain = cookie;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+
+	if (cfg->flush_walk_prefer_tlbiasid) {
+		arm_smmu_tlb_inv_context_s1(cookie);
+	} else {
+		arm_smmu_tlb_inv_range_s1(iova, size, granule, cookie,
+					  ARM_SMMU_CB_S1_TLBIVA);
+		arm_smmu_tlb_sync_context(cookie);
+	}
 }
 
 static void arm_smmu_tlb_add_page_s1(struct iommu_iotlb_gather *gather,
@@ -765,8 +772,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (!iommu_get_dma_strict(domain))
+	if (!iommu_get_dma_strict(domain)) {
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
+		cfg->flush_walk_prefer_tlbiasid = true;
+	}
 
 	if (smmu->impl && smmu->impl->init_context) {
 		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index a50271595960..432de2f742c3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -346,6 +346,7 @@ struct arm_smmu_cfg {
 	};
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
+	bool				flush_walk_prefer_tlbiasid;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
