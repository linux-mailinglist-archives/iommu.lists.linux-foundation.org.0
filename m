Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA941D9E94
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 20:02:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9915286CA6;
	Tue, 19 May 2020 18:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jd6qr6n7-Kw7; Tue, 19 May 2020 18:02:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F095586D7F;
	Tue, 19 May 2020 18:02:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBB7FC0881;
	Tue, 19 May 2020 18:02:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B13EC0891
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 706D4888B9
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyVRPILqdYZB for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 18:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F0D5A888A2
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l11so448907wru.0
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 11:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JRCRvDwKBaj6zFWwAyf94DPzbFyDqhKWQ8Qel74T6k=;
 b=afLtAp2iGh0TSBKhOlXEtgRXoAAe/HVKmjTsSeDv9UxjhRCMaVKuinCcCKSstdsZUZ
 kdMWspzZ2QsL5Dau2h4mskzs/qU/JpXEbIEasYD0S1PcdPIAajqvdZryUJYwyh97byo3
 I9Wwh3Ym7E5J8i7hGztD4+iEGuD60ykADGTl3eKWMyiY2HIf6xDoG7OcUZp981d6hEq6
 0TIm+yZWWnnOBVgyRxiN34vur8pq+aRPJrG5M24Zz24eEH8j19WveCVy5CYw4fv399WU
 TGCaw9JbKY4KIq9k1nnPX6+3+/4+X2jtr691bmfVQXZQwcKQTCWCY+xoNAk8RN14s9Ip
 D1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JRCRvDwKBaj6zFWwAyf94DPzbFyDqhKWQ8Qel74T6k=;
 b=Zh5B7o1EGyRIZZmrGm6b15PnNpJUFY7du9V+VGsUzNtTnlnTj0C+U1pMVupPuqoY8v
 h1c2YKMv+oOFwz4i/VRhUjLiAKqr0QJYE1dTdl0JNFZio7SG3Ys8vDWR+u4GNB5FfxEl
 Ef4eD3uP4PPpcUxEdQYXTc6aqF38CgzU7+Zbuoq5HgfyripdopehzjPpIxhNJZ8jL71M
 H5fNTEAFT4RFIFnwM35IuQ951FOuQSmTfwvo6BzLmucH8iajvU3SRPyQTRsfZ0QuytCM
 F1JyKs1R2k+FXT7b2WxhPYHgN1fiQM599G2rjnl3J8WBn2OENfRFraOdxbgnj50I/wja
 Y3YA==
X-Gm-Message-State: AOAM532RNIltSosWQrJVYZ4CRn7jHchTggwwZaOEurWlPjNqtc2Migi5
 BXnJGiwSAIQJhR1UdvwU588t+Vl3k98lhQ==
X-Google-Smtp-Source: ABdhPJx8Z3P30TLSvOFRBCkey5bHCv2HIx/ihXvi35CP5z2ZNK51cJrX3rrbYnMtuijPpPM1UkAWBQ==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr76717wrs.273.1589911320419;
 Tue, 19 May 2020 11:02:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:01:59 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v7 16/24] iommu/arm-smmu-v3: Implement iommu_sva_bind/unbind()
Date: Tue, 19 May 2020 19:54:54 +0200
Message-Id: <20200519175502.2504091-17-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, jgg@ziepe.ca,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 felix.kuehling@amd.com, will@kernel.org, christian.koenig@amd.com
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

The sva_bind() function allows devices to access process address spaces
using a PASID (aka SSID).

(1) bind() allocates or gets an existing MMU notifier tied to the
    (domain, mm) pair. Each mm gets one PASID.

(2) Any change to the address space calls invalidate_range() which sends
    ATC invalidations (in a subsequent patch).

(3) When the process address space dies, the release() notifier disables
    the CD to allow reclaiming the page tables. Since release() has to
    be light we do not instruct device drivers to stop DMA here, we just
    ignore incoming page faults from this point onwards.

    To avoid any event 0x0a print (C_BAD_CD) we disable translation
    without clearing CD.V. PCIe Translation Requests and Page Requests
    are silently denied. Don't clear the R bit because the S bit can't
    be cleared when STALL_MODEL==0b10 (forced), and clearing R without
    clearing S is useless. Faulting transactions will stall and will be
    aborted by the IOPF handler.

(4) After stopping DMA, the device driver releases the bond by calling
    unbind(). We release the MMU notifier, free the PASID and the bond.

Three structures keep track of bonds:
* arm_smmu_bond: one per {device, mm} pair, the handle returned to the
  device driver for a bind() request.
* arm_smmu_mmu_notifier: one per {domain, mm} pair, deals with ATS/TLB
  invalidations and clearing the context descriptor on mm exit.
* arm_smmu_ctx_desc: one per mm, holds the pinned ASID and pgd.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v6->v7: Keep track of {domains, mm} pairs. Move
  mmu_notifier_synchronize() to module_exit().
---
 drivers/iommu/Kconfig       |   2 +
 drivers/iommu/arm-smmu-v3.c | 272 +++++++++++++++++++++++++++++++++++-
 2 files changed, 269 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 15e9dc4e503c..00b517f449ab 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -432,8 +432,10 @@ config ARM_SMMU_V3
 	tristate "ARM Ltd. System MMU Version 3 (SMMUv3) Support"
 	depends on ARM64
 	select IOMMU_API
+	select IOMMU_SVA
 	select IOMMU_IO_PGTABLE_LPAE
 	select GENERIC_MSI_IRQ_DOMAIN
+	select MMU_NOTIFIER
 	help
 	  Support for implementations of the ARM System MMU architecture
 	  version 3 providing translation support to a PCIe root complex.
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index b016b61cee23..00a9342eed99 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -24,6 +24,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mmu_context.h>
+#include <linux/mmu_notifier.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -36,6 +37,7 @@
 #include <linux/amba/bus.h>
 
 #include "io-pgtable-arm.h"
+#include "iommu-sva.h"
 
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
@@ -734,8 +736,32 @@ struct arm_smmu_domain {
 
 	struct list_head		devices;
 	spinlock_t			devices_lock;
+
+	struct list_head		mmu_notifiers;
+};
+
+struct arm_smmu_mmu_notifier {
+	struct mmu_notifier		mn;
+	struct arm_smmu_ctx_desc	*cd;
+	bool				cleared;
+	refcount_t			refs;
+	struct list_head		list;
+	struct arm_smmu_domain		*domain;
 };
 
+#define mn_to_smmu(mn) container_of(mn, struct arm_smmu_mmu_notifier, mn)
+
+struct arm_smmu_bond {
+	struct iommu_sva		sva;
+	struct mm_struct		*mm;
+	struct arm_smmu_mmu_notifier	*smmu_mn;
+	struct list_head		list;
+	refcount_t			refs;
+};
+
+#define sva_to_bond(handle) \
+	container_of(handle, struct arm_smmu_bond, sva)
+
 struct arm_smmu_option_prop {
 	u32 opt;
 	const char *prop;
@@ -745,6 +771,13 @@ static DEFINE_XARRAY_ALLOC1(asid_xa);
 static DEFINE_MUTEX(asid_lock);
 static DEFINE_MUTEX(sva_lock);
 
+/*
+ * When a process dies, DMA is still running but we need to clear the pgd. If we
+ * simply cleared the valid bit from the context descriptor, we'd get event 0x0a
+ * which are not recoverable.
+ */
+static struct arm_smmu_ctx_desc invalid_cd = { 0 };
+
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
@@ -1654,7 +1687,9 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
 	 * (2) Install a secondary CD, for SID+SSID traffic.
 	 * (3) Update ASID of a CD. Atomically write the first 64 bits of the
 	 *     CD, then invalidate the old entry and mappings.
-	 * (4) Remove a secondary CD.
+	 * (4) Quiesce the context without clearing the valid bit. Disable
+	 *     translation, and ignore any translation fault.
+	 * (5) Remove a secondary CD.
 	 */
 	u64 val;
 	bool cd_live;
@@ -1671,8 +1706,10 @@ static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
 	val = le64_to_cpu(cdptr[0]);
 	cd_live = !!(val & CTXDESC_CD_0_V);
 
-	if (!cd) { /* (4) */
+	if (!cd) { /* (5) */
 		val = 0;
+	} else if (cd == &invalid_cd) { /* (4) */
+		val |= CTXDESC_CD_0_TCR_EPD0;
 	} else if (cd_live) { /* (3) */
 		val &= ~CTXDESC_CD_0_ASID;
 		val |= FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid);
@@ -1872,7 +1909,6 @@ static struct arm_smmu_ctx_desc *arm_smmu_share_asid(u16 asid)
 	return NULL;
 }
 
-__maybe_unused
 static struct arm_smmu_ctx_desc *arm_smmu_alloc_shared_cd(struct mm_struct *mm)
 {
 	u16 asid;
@@ -1969,7 +2005,6 @@ static struct arm_smmu_ctx_desc *arm_smmu_alloc_shared_cd(struct mm_struct *mm)
 	return ERR_PTR(ret);
 }
 
-__maybe_unused
 static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
 {
 	lockdep_assert_held(&sva_lock);
@@ -2606,6 +2641,8 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 	}
 }
 
+static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops;
+
 static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
 {
 	struct arm_smmu_domain *smmu_domain;
@@ -2633,6 +2670,7 @@ static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
 	mutex_init(&smmu_domain->init_mutex);
 	INIT_LIST_HEAD(&smmu_domain->devices);
 	spin_lock_init(&smmu_domain->devices_lock);
+	INIT_LIST_HEAD(&smmu_domain->mmu_notifiers);
 
 	return &smmu_domain->domain;
 }
@@ -3127,6 +3165,216 @@ arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 	return ops->iova_to_phys(ops, iova);
 }
 
+static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
+					 struct mm_struct *mm,
+					 unsigned long start, unsigned long end)
+{
+	/* TODO: invalidate ATS */
+}
+
+static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
+{
+	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
+	struct arm_smmu_domain *smmu_domain = smmu_mn->domain;
+
+	mutex_lock(&sva_lock);
+	if (smmu_mn->cleared) {
+		mutex_unlock(&sva_lock);
+		return;
+	}
+
+	/*
+	 * DMA may still be running. Keep the cd valid to avoid C_BAD_CD events,
+	 * but disable translation.
+	 */
+	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, &invalid_cd);
+
+	arm_smmu_tlb_inv_asid(smmu_domain->smmu, smmu_mn->cd->asid);
+	/* TODO: invalidate ATS */
+
+	smmu_mn->cleared = true;
+	mutex_unlock(&sva_lock);
+}
+
+static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
+{
+	kfree(mn_to_smmu(mn));
+}
+
+static struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
+	.invalidate_range	= arm_smmu_mm_invalidate_range,
+	.release		= arm_smmu_mm_release,
+	.free_notifier		= arm_smmu_mmu_notifier_free,
+};
+
+/* Allocate or get existing MMU notifier for this {domain, mm} pair */
+static struct arm_smmu_mmu_notifier *
+arm_smmu_mmu_notifier_get(struct arm_smmu_domain *smmu_domain,
+			  struct mm_struct *mm)
+{
+	int ret;
+	struct arm_smmu_ctx_desc *cd;
+	struct arm_smmu_mmu_notifier *smmu_mn;
+
+	lockdep_assert_held(&sva_lock);
+
+	list_for_each_entry(smmu_mn, &smmu_domain->mmu_notifiers, list) {
+		if (smmu_mn->mn.mm == mm) {
+			refcount_inc(&smmu_mn->refs);
+			return smmu_mn;
+		}
+	}
+
+	cd = arm_smmu_alloc_shared_cd(mm);
+	if (IS_ERR(cd))
+		return ERR_CAST(cd);
+
+	smmu_mn = kzalloc(sizeof(*smmu_mn), GFP_KERNEL);
+	if (!smmu_mn) {
+		ret = -ENOMEM;
+		goto err_free_cd;
+	}
+
+	refcount_set(&smmu_mn->refs, 1);
+	smmu_mn->cd = cd;
+	smmu_mn->domain = smmu_domain;
+	smmu_mn->mn.ops = &arm_smmu_mmu_notifier_ops;
+
+	ret = mmu_notifier_register(&smmu_mn->mn, mm);
+	if (ret) {
+		kfree(smmu_mn);
+		goto err_free_cd;
+	}
+
+	ret = arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, cd);
+	if (ret)
+		goto err_put_notifier;
+
+	list_add(&smmu_mn->list, &smmu_domain->mmu_notifiers);
+	return smmu_mn;
+
+err_put_notifier:
+	/* Frees smmu_mn */
+	mmu_notifier_put(&smmu_mn->mn);
+err_free_cd:
+	arm_smmu_free_shared_cd(cd);
+	return ERR_PTR(ret);
+}
+
+static void arm_smmu_mmu_notifier_put(struct arm_smmu_mmu_notifier *smmu_mn)
+{
+	struct mm_struct *mm = smmu_mn->mn.mm;
+	struct arm_smmu_ctx_desc *cd = smmu_mn->cd;
+	struct arm_smmu_domain *smmu_domain = smmu_mn->domain;
+
+	lockdep_assert_held(&sva_lock);
+
+	if (!refcount_dec_and_test(&smmu_mn->refs))
+		return;
+
+	list_del(&smmu_mn->list);
+	arm_smmu_write_ctx_desc(smmu_domain, mm->pasid, NULL);
+
+	/*
+	 * If we went through clear(), we've already invalidated, and no
+	 * new TLB entry can have been formed.
+	 */
+	if (!smmu_mn->cleared) {
+		arm_smmu_tlb_inv_asid(smmu_domain->smmu, cd->asid);
+		/* TODO: invalidate ATS */
+	}
+
+	/* Frees smmu_mn */
+	mmu_notifier_put(&smmu_mn->mn);
+	arm_smmu_free_shared_cd(cd);
+}
+
+static struct iommu_sva *
+__arm_smmu_sva_bind(struct device *dev, struct mm_struct *mm)
+{
+	int ret;
+	struct arm_smmu_bond *bond;
+	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+	lockdep_assert_held(&sva_lock);
+
+	if (!master || !master->sva_enabled)
+		return ERR_PTR(-ENODEV);
+
+	/* If bind() was already called for this {dev, mm} pair, reuse it. */
+	list_for_each_entry(bond, &master->bonds, list) {
+		if (bond->mm == mm) {
+			refcount_inc(&bond->refs);
+			return &bond->sva;
+		}
+	}
+
+	bond = kzalloc(sizeof(*bond), GFP_KERNEL);
+	if (!bond)
+		return ERR_PTR(-ENOMEM);
+
+	/* Allocate a PASID for this mm if necessary */
+	ret = iommu_sva_alloc_pasid(mm, 1, (1U << master->ssid_bits) - 1);
+	if (ret)
+		goto err_free_bond;
+
+	bond->mm = mm;
+	bond->sva.dev = dev;
+	refcount_set(&bond->refs, 1);
+
+	bond->smmu_mn = arm_smmu_mmu_notifier_get(smmu_domain, mm);
+	if (IS_ERR(bond->smmu_mn))
+		goto err_free_pasid;
+
+	list_add(&bond->list, &master->bonds);
+	return &bond->sva;
+
+err_free_pasid:
+	iommu_sva_free_pasid(mm);
+err_free_bond:
+	kfree(bond);
+	return ERR_PTR(ret);
+}
+
+static struct iommu_sva *
+arm_smmu_sva_bind(struct device *dev, struct mm_struct *mm, void *drvdata)
+{
+	struct iommu_sva *handle;
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+
+	if (smmu_domain->stage != ARM_SMMU_DOMAIN_S1)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&sva_lock);
+	handle = __arm_smmu_sva_bind(dev, mm);
+	mutex_unlock(&sva_lock);
+	return handle;
+}
+
+static void arm_smmu_sva_unbind(struct iommu_sva *handle)
+{
+	struct arm_smmu_bond *bond = sva_to_bond(handle);
+
+	mutex_lock(&sva_lock);
+	if (refcount_dec_and_test(&bond->refs)) {
+		list_del(&bond->list);
+		arm_smmu_mmu_notifier_put(bond->smmu_mn);
+		iommu_sva_free_pasid(bond->mm);
+		kfree(bond);
+	}
+	mutex_unlock(&sva_lock);
+}
+
+static int arm_smmu_sva_get_pasid(struct iommu_sva *handle)
+{
+	struct arm_smmu_bond *bond = sva_to_bond(handle);
+
+	return bond->mm->pasid;
+}
+
 static struct platform_driver arm_smmu_driver;
 
 static
@@ -3491,6 +3739,9 @@ static struct iommu_ops arm_smmu_ops = {
 	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
 	.dev_enable_feat	= arm_smmu_dev_enable_feature,
 	.dev_disable_feat	= arm_smmu_dev_disable_feature,
+	.sva_bind		= arm_smmu_sva_bind,
+	.sva_unbind		= arm_smmu_sva_unbind,
+	.sva_get_pasid		= arm_smmu_sva_get_pasid,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 };
 
@@ -4598,6 +4849,16 @@ static const struct of_device_id arm_smmu_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
 
+static void arm_smmu_driver_unregister(struct platform_driver *drv)
+{
+	/*
+	 * Wait for all notifiers free() RCU callbacks, since they are still
+	 * using the arm_smmu_mmu_notifier_ops.
+	 */
+	mmu_notifier_synchronize();
+	platform_driver_unregister(drv);
+}
+
 static struct platform_driver arm_smmu_driver = {
 	.driver	= {
 		.name			= "arm-smmu-v3",
@@ -4608,7 +4869,8 @@ static struct platform_driver arm_smmu_driver = {
 	.remove	= arm_smmu_device_remove,
 	.shutdown = arm_smmu_device_shutdown,
 };
-module_platform_driver(arm_smmu_driver);
+module_driver(arm_smmu_driver, platform_driver_register,
+	      arm_smmu_driver_unregister);
 
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
