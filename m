Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E338F39E
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 20:38:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 233B110C8;
	Thu, 15 Aug 2019 18:37:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 848BC10C8
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:37:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2784CCF
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 18:37:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D18D5360;
	Thu, 15 Aug 2019 11:37:54 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E5073F694; 
	Thu, 15 Aug 2019 11:37:53 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH v2 08/17] iommu/arm-smmu: Get rid of weird "atomic" write
Date: Thu, 15 Aug 2019 19:37:28 +0100
Message-Id: <c578e786b3994bd21b174d9af44533ff082aff52.1565892337.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1565892337.git.robin.murphy@arm.com>
References: <cover.1565892337.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

The smmu_write_atomic_lq oddity made some sense when the context
format was effectively tied to CONFIG_64BIT, but these days it's
simpler to just pick an explicit access size based on the format
for the one-and-a-half times we actually care.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm-smmu.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5b12e96d7878..24b4de1a4185 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -83,17 +83,6 @@
 		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
 			? 0x400 : 0))
 
-/*
- * Some 64-bit registers only make sense to write atomically, but in such
- * cases all the data relevant to AArch32 formats lies within the lower word,
- * therefore this actually makes more sense than it might first appear.
- */
-#ifdef CONFIG_64BIT
-#define smmu_write_atomic_lq		writeq_relaxed
-#else
-#define smmu_write_atomic_lq		writel_relaxed
-#endif
-
 /* Translation context bank */
 #define ARM_SMMU_CB(smmu, n)	((smmu)->base + (((smmu)->numpage + (n)) << (smmu)->pgshift))
 
@@ -533,7 +522,10 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 	reg += leaf ? ARM_SMMU_CB_S2_TLBIIPAS2L : ARM_SMMU_CB_S2_TLBIIPAS2;
 	iova >>= 12;
 	do {
-		smmu_write_atomic_lq(iova, reg);
+		if (smmu_domain->cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64)
+			writeq_relaxed(iova, reg);
+		else
+			writel_relaxed(iova, reg);
 		iova += granule >> 12;
 	} while (size -= granule);
 }
@@ -1371,11 +1363,10 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	cb_base = ARM_SMMU_CB(smmu, cfg->cbndx);
 
 	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
-	/* ATS1 registers can only be written atomically */
 	va = iova & ~0xfffUL;
-	if (smmu->version == ARM_SMMU_V2)
-		smmu_write_atomic_lq(va, cb_base + ARM_SMMU_CB_ATS1PR);
-	else /* Register is only 32-bit in v1 */
+	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
+		writeq_relaxed(va, cb_base + ARM_SMMU_CB_ATS1PR);
+	else
 		writel_relaxed(va, cb_base + ARM_SMMU_CB_ATS1PR);
 
 	if (readl_poll_timeout_atomic(cb_base + ARM_SMMU_CB_ATSR, tmp,
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
