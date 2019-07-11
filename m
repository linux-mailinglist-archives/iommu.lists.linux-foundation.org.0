Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246965E8B
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 19:29:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 640205485;
	Thu, 11 Jul 2019 17:28:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 42725530E
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 913F8886
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:42 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0993D21670;
	Thu, 11 Jul 2019 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562865582;
	bh=HnRzChtLDEESI4CzPLhVOq4tB14Znxec2yjYXHr+AyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k69wTVPv+7adq2kuLkTCPRZlLYn+WCyr4Gkwuv4JZxDIDO1eXnnyB9Q7WVOeIYudo
	K4o4EJBHtcznXUFkvb7D88QiagyKpuFoAXZ2R6+LlgmLR6w6BLVsiR/nhMv9dzUPwC
	OEu6eg/7mDk9yga2m1QF+A9vxFPlufe1usP84kMk=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH v2 03/19] iommu/io-pgtable: Rename iommu_gather_ops to
	iommu_flush_ops
Date: Thu, 11 Jul 2019 18:19:11 +0100
Message-Id: <20190711171927.28803-4-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711171927.28803-1-will@kernel.org>
References: <20190711171927.28803-1-will@kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Will Deacon <will@kernel.org>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, Robin Murphy <robin.murphy@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

In preparation for TLB flush gathering in the IOMMU API, rename the
iommu_gather_ops structure in io-pgtable to iommu_flush_ops, which
better describes its purpose and avoids the potential for confusion
between different levels of the API.

$ find linux/ -type f -name '*.[ch]' | xargs sed -i 's/gather_ops/flush_ops/g'

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 drivers/iommu/arm-smmu-v3.c             | 4 ++--
 drivers/iommu/arm-smmu.c                | 8 ++++----
 drivers/iommu/io-pgtable-arm-v7s.c      | 2 +-
 drivers/iommu/io-pgtable-arm.c          | 2 +-
 drivers/iommu/ipmmu-vmsa.c              | 4 ++--
 drivers/iommu/msm_iommu.c               | 4 ++--
 drivers/iommu/mtk_iommu.c               | 4 ++--
 drivers/iommu/qcom_iommu.c              | 4 ++--
 include/linux/io-pgtable.h              | 6 +++---
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 762b1bd2a8c2..d25c89a3ba48 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -249,7 +249,7 @@ static void mmu_tlb_sync_context(void *cookie)
 	// TODO: Wait 1000 GPU cycles for HW_ISSUE_6367/T60X
 }
 
-static const struct iommu_gather_ops mmu_tlb_ops = {
+static const struct iommu_flush_ops mmu_tlb_ops = {
 	.tlb_flush_all	= mmu_tlb_inv_context_s1,
 	.tlb_add_flush	= mmu_tlb_inv_range_nosync,
 	.tlb_sync	= mmu_tlb_sync_context,
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 8ff8f61d9e1c..33fbf0becad2 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1597,7 +1597,7 @@ static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 	} while (size -= granule);
 }
 
-static const struct iommu_gather_ops arm_smmu_gather_ops = {
+static const struct iommu_flush_ops arm_smmu_flush_ops = {
 	.tlb_flush_all	= arm_smmu_tlb_inv_context,
 	.tlb_add_flush	= arm_smmu_tlb_inv_range_nosync,
 	.tlb_sync	= arm_smmu_tlb_sync,
@@ -1790,7 +1790,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain)
 		.ias		= ias,
 		.oas		= oas,
 		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
-		.tlb		= &arm_smmu_gather_ops,
+		.tlb		= &arm_smmu_flush_ops,
 		.iommu_dev	= smmu->dev,
 	};
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 009156bb6d42..44592d9c2ab4 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -254,7 +254,7 @@ enum arm_smmu_domain_stage {
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
-	const struct iommu_gather_ops	*tlb_ops;
+	const struct iommu_flush_ops	*tlb_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
 	bool				non_strict;
@@ -550,19 +550,19 @@ static void arm_smmu_tlb_inv_vmid_nosync(unsigned long iova, size_t size,
 	writel_relaxed(smmu_domain->cfg.vmid, base + ARM_SMMU_GR0_TLBIVMID);
 }
 
-static const struct iommu_gather_ops arm_smmu_s1_tlb_ops = {
+static const struct iommu_flush_ops arm_smmu_s1_tlb_ops = {
 	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
 	.tlb_add_flush	= arm_smmu_tlb_inv_range_nosync,
 	.tlb_sync	= arm_smmu_tlb_sync_context,
 };
 
-static const struct iommu_gather_ops arm_smmu_s2_tlb_ops_v2 = {
+static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v2 = {
 	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
 	.tlb_add_flush	= arm_smmu_tlb_inv_range_nosync,
 	.tlb_sync	= arm_smmu_tlb_sync_context,
 };
 
-static const struct iommu_gather_ops arm_smmu_s2_tlb_ops_v1 = {
+static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
 	.tlb_flush_all	= arm_smmu_tlb_inv_context_s2,
 	.tlb_add_flush	= arm_smmu_tlb_inv_vmid_nosync,
 	.tlb_sync	= arm_smmu_tlb_sync_vmid,
diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 6a6d6bb438d9..c0b352ce37a6 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -828,7 +828,7 @@ static void dummy_tlb_sync(void *cookie)
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static const struct iommu_gather_ops dummy_tlb_ops = {
+static const struct iommu_flush_ops dummy_tlb_ops = {
 	.tlb_flush_all	= dummy_tlb_flush_all,
 	.tlb_add_flush	= dummy_tlb_add_flush,
 	.tlb_sync	= dummy_tlb_sync,
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index b696b6c139cc..8587622afecd 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1092,7 +1092,7 @@ static void dummy_tlb_sync(void *cookie)
 	WARN_ON(cookie != cfg_cookie);
 }
 
-static const struct iommu_gather_ops dummy_tlb_ops __initconst = {
+static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
 	.tlb_flush_all	= dummy_tlb_flush_all,
 	.tlb_add_flush	= dummy_tlb_add_flush,
 	.tlb_sync	= dummy_tlb_sync,
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 12bcb95bdaa8..207bff3ad796 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -360,7 +360,7 @@ static void ipmmu_tlb_add_flush(unsigned long iova, size_t size,
 	/* The hardware doesn't support selective TLB flush. */
 }
 
-static const struct iommu_gather_ops ipmmu_gather_ops = {
+static const struct iommu_flush_ops ipmmu_flush_ops = {
 	.tlb_flush_all = ipmmu_tlb_flush_all,
 	.tlb_add_flush = ipmmu_tlb_add_flush,
 	.tlb_sync = ipmmu_tlb_flush_all,
@@ -424,7 +424,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
 	domain->cfg.ias = 32;
 	domain->cfg.oas = 40;
-	domain->cfg.tlb = &ipmmu_gather_ops;
+	domain->cfg.tlb = &ipmmu_flush_ops;
 	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
 	domain->io_domain.geometry.force_aperture = true;
 	/*
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index b4b87d6ae67f..7c78b6d899c5 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -191,7 +191,7 @@ static void __flush_iotlb_sync(void *cookie)
 	 */
 }
 
-static const struct iommu_gather_ops msm_iommu_gather_ops = {
+static const struct iommu_flush_ops msm_iommu_flush_ops = {
 	.tlb_flush_all = __flush_iotlb,
 	.tlb_add_flush = __flush_iotlb_range,
 	.tlb_sync = __flush_iotlb_sync,
@@ -358,7 +358,7 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 		.pgsize_bitmap = msm_iommu_ops.pgsize_bitmap,
 		.ias = 32,
 		.oas = 32,
-		.tlb = &msm_iommu_gather_ops,
+		.tlb = &msm_iommu_flush_ops,
 		.iommu_dev = priv->dev,
 	};
 
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b66d11b0286e..2012b1655779 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -196,7 +196,7 @@ static void mtk_iommu_tlb_sync(void *cookie)
 	}
 }
 
-static const struct iommu_gather_ops mtk_iommu_gather_ops = {
+static const struct iommu_flush_ops mtk_iommu_flush_ops = {
 	.tlb_flush_all = mtk_iommu_tlb_flush_all,
 	.tlb_add_flush = mtk_iommu_tlb_add_flush_nosync,
 	.tlb_sync = mtk_iommu_tlb_sync,
@@ -275,7 +275,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
 		.oas = 32,
-		.tlb = &mtk_iommu_gather_ops,
+		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
 	};
 
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 8cdd3f059513..c254db346732 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -175,7 +175,7 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 	}
 }
 
-static const struct iommu_gather_ops qcom_gather_ops = {
+static const struct iommu_flush_ops qcom_flush_ops = {
 	.tlb_flush_all	= qcom_iommu_tlb_inv_context,
 	.tlb_add_flush	= qcom_iommu_tlb_inv_range_nosync,
 	.tlb_sync	= qcom_iommu_tlb_sync,
@@ -226,7 +226,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		.pgsize_bitmap	= qcom_iommu_ops.pgsize_bitmap,
 		.ias		= 32,
 		.oas		= 40,
-		.tlb		= &qcom_gather_ops,
+		.tlb		= &qcom_flush_ops,
 		.iommu_dev	= qcom_iommu->dev,
 	};
 
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b5a450a3bb47..6292ea15d674 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -17,7 +17,7 @@ enum io_pgtable_fmt {
 };
 
 /**
- * struct iommu_gather_ops - IOMMU callbacks for TLB and page table management.
+ * struct iommu_flush_ops - IOMMU callbacks for TLB and page table management.
  *
  * @tlb_flush_all: Synchronously invalidate the entire TLB context.
  * @tlb_add_flush: Queue up a TLB invalidation for a virtual address range.
@@ -28,7 +28,7 @@ enum io_pgtable_fmt {
  * Note that these can all be called in atomic context and must therefore
  * not block.
  */
-struct iommu_gather_ops {
+struct iommu_flush_ops {
 	void (*tlb_flush_all)(void *cookie);
 	void (*tlb_add_flush)(unsigned long iova, size_t size, size_t granule,
 			      bool leaf, void *cookie);
@@ -84,7 +84,7 @@ struct io_pgtable_cfg {
 	unsigned int			ias;
 	unsigned int			oas;
 	bool				coherent_walk;
-	const struct iommu_gather_ops	*tlb;
+	const struct iommu_flush_ops	*tlb;
 	struct device			*iommu_dev;
 
 	/* Low-level data specific to the table format */
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
