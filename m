Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id A022533D911
	for <lists.iommu@lfdr.de>; Tue, 16 Mar 2021 17:21:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33AE46F67A;
	Tue, 16 Mar 2021 16:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLAPCDEfJOUK; Tue, 16 Mar 2021 16:21:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9396F664;
	Tue, 16 Mar 2021 16:21:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C07C1C0010;
	Tue, 16 Mar 2021 16:21:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73E95C000A;
 Tue, 16 Mar 2021 16:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54EF983CCB;
 Tue, 16 Mar 2021 16:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCvtwD1YAGQV; Tue, 16 Mar 2021 16:21:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 688BB83C44;
 Tue, 16 Mar 2021 16:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QbaRk+uViIhwK+1vGzaBCikXARZr5f1xQIRzIwD32Xo=; b=pVagKNc0oe1T57mIf5QfMGURMv
 appCVg4vNJsD7q38Eic4qiYIZvzuTF4jUg0Ypngw8oY8I4xE4dK/LCqD0ypEhj+gifZ18xog/dDYo
 avWB/1bm6iyqCYRGZid2gLgGF12kGyjKLNG/jmDJgS4+EDIH/DLz4OmPJM5AZPEzfGkAeVz+uTpfI
 57Nh38MSF6YettF4SMBL51dwm//s0FUkI0hIHOqb7KV0qa6MHMpNFCBvMjwDEnKMObf2g3gLCmtkp
 1iOThtkmEDrD+KBMYRK/heBHcEVjJ2X5v6aSOPfYHEH74w+uPOtfnCDE2pPdwa6+MY4Vr+WVBx6lK
 gMZpl6rw==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMCRF-000J1I-SA; Tue, 16 Mar 2021 16:21:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 17/18] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
Date: Tue, 16 Mar 2021 16:38:23 +0100
Message-Id: <20210316153825.135976-18-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316153825.135976-1-hch@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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

Use an explicit set_pgtable_quirks method instead that just passes
the actual quirk bitmask instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c   | 64 +++++--------------------
 drivers/iommu/arm/arm-smmu/arm-smmu.h   |  2 +-
 drivers/iommu/iommu.c                   | 11 +++++
 include/linux/io-pgtable.h              |  4 --
 include/linux/iommu.h                   | 12 ++++-
 6 files changed, 35 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0f184c3dd9d9ec..4a0b14dad93e2e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -188,10 +188,7 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
 
 void adreno_set_llc_attributes(struct iommu_domain *iommu)
 {
-	struct io_pgtable_domain_attr pgtbl_cfg;
-
-	pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
-	iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
+	iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
 }
 
 struct msm_gem_address_space *
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 3dde22b1f8ffb0..b5e747eeed1362 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -770,8 +770,8 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			goto out_clear_smmu;
 	}
 
-	if (smmu_domain->pgtbl_cfg.quirks)
-		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
+	if (smmu_domain->pgtbl_quirks)
+		pgtbl_cfg.quirks |= smmu_domain->pgtbl_quirks;
 
 	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
 	if (!pgtbl_ops) {
@@ -1484,29 +1484,6 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
 	return group;
 }
 
-static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr, void *data)
-{
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-
-	switch(domain->type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		switch (attr) {
-		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
-			struct io_pgtable_domain_attr *pgtbl_cfg = data;
-			*pgtbl_cfg = smmu_domain->pgtbl_cfg;
-
-			return 0;
-		}
-		default:
-			return -ENODEV;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-}
-
 static int arm_smmu_enable_nesting(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
@@ -1522,37 +1499,19 @@ static int arm_smmu_enable_nesting(struct iommu_domain *domain)
 	return ret;
 }
 
-static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr, void *data)
+static int arm_smmu_set_pgtable_quirks(struct iommu_domain *domain,
+		unsigned long quirks)
 {
-	int ret = 0;
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	int ret = 0;
 
 	mutex_lock(&smmu_domain->init_mutex);
-
-	switch(domain->type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		switch (attr) {
-		case DOMAIN_ATTR_IO_PGTABLE_CFG: {
-			struct io_pgtable_domain_attr *pgtbl_cfg = data;
-
-			if (smmu_domain->smmu) {
-				ret = -EPERM;
-				goto out_unlock;
-			}
-
-			smmu_domain->pgtbl_cfg = *pgtbl_cfg;
-			break;
-		}
-		default:
-			ret = -ENODEV;
-		}
-		break;
-	default:
-		ret = -EINVAL;
-	}
-out_unlock:
+	if (smmu_domain->smmu)
+		ret = -EPERM;
+	else
+		smmu_domain->pgtbl_quirks = quirks;
 	mutex_unlock(&smmu_domain->init_mutex);
+
 	return ret;
 }
 
@@ -1611,9 +1570,8 @@ static struct iommu_ops arm_smmu_ops = {
 	.probe_device		= arm_smmu_probe_device,
 	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
-	.domain_get_attr	= arm_smmu_domain_get_attr,
-	.domain_set_attr	= arm_smmu_domain_set_attr,
 	.enable_nesting		= arm_smmu_enable_nesting,
+	.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d2a2d1bc58bad8..c31a59d35c64da 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -364,7 +364,7 @@ enum arm_smmu_domain_stage {
 struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct io_pgtable_ops		*pgtbl_ops;
-	struct io_pgtable_domain_attr	pgtbl_cfg;
+	unsigned long			pgtbl_quirks;
 	const struct iommu_flush_ops	*flush_ops;
 	struct arm_smmu_cfg		cfg;
 	enum arm_smmu_domain_stage	stage;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e193ea88f3f842..afd21b37e319ee 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2698,6 +2698,17 @@ int iommu_enable_nesting(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_enable_nesting);
 
+int iommu_set_pgtable_quirks(struct iommu_domain *domain,
+		unsigned long quirk)
+{
+	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return -EINVAL;
+	if (!domain->ops->set_pgtable_quirks)
+		return -EINVAL;
+	return domain->ops->set_pgtable_quirks(domain, quirk);
+}
+EXPORT_SYMBOL_GPL(iommu_set_pgtable_quirks);
+
 void iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index a4c9ca2c31f10a..4d40dfa75b55fe 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -204,10 +204,6 @@ struct io_pgtable {
 
 #define io_pgtable_ops_to_pgtable(x) container_of((x), struct io_pgtable, ops)
 
-struct io_pgtable_domain_attr {
-	unsigned long quirks;
-};
-
 static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
 {
 	if (iop->cfg.tlb && iop->cfg.tlb->tlb_flush_all)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 3d50ecf3a49c24..a53d74f2007b14 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -107,7 +107,6 @@ enum iommu_cap {
  */
 
 enum iommu_attr {
-	DOMAIN_ATTR_IO_PGTABLE_CFG,
 	DOMAIN_ATTR_MAX,
 };
 
@@ -195,6 +194,7 @@ struct iommu_iotlb_gather {
  * @domain_get_attr: Query domain attributes
  * @domain_set_attr: Change domain attributes
  * @enable_nesting: Enable nesting
+ * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
  * @apply_resv_region: Temporary helper call-back for iova reserved ranges
@@ -248,6 +248,8 @@ struct iommu_ops {
 	int (*domain_set_attr)(struct iommu_domain *domain,
 			       enum iommu_attr attr, void *data);
 	int (*enable_nesting)(struct iommu_domain *domain);
+	int (*set_pgtable_quirks)(struct iommu_domain *domain,
+				  unsigned long quirks);
 
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
@@ -496,6 +498,8 @@ extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
 extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
 				 void *data);
 int iommu_enable_nesting(struct iommu_domain *domain);
+int iommu_set_pgtable_quirks(struct iommu_domain *domain,
+		unsigned long quirks);
 
 void iommu_set_dma_strict(bool val);
 bool iommu_get_dma_strict(void);
@@ -877,6 +881,12 @@ static inline int iommu_domain_set_attr(struct iommu_domain *domain,
 	return -EINVAL;
 }
 
+static inline int iommu_set_pgtable_quirks(struct iommu_domain *domain,
+		unsigned long quirks)
+{
+	return 0;
+}
+
 static inline int  iommu_device_register(struct iommu_device *iommu)
 {
 	return -ENODEV;
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
