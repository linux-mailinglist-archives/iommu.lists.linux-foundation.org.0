Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907E3D1622
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 20:21:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3798482F9B;
	Wed, 21 Jul 2021 18:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ktP-5Vr2W-b; Wed, 21 Jul 2021 18:21:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4134582F14;
	Wed, 21 Jul 2021 18:21:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29EB6C000E;
	Wed, 21 Jul 2021 18:21:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03BB2C0022
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E837482F57
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_m7NDqNYWaU for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 18:21:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD8D82F14
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFC3113E;
 Wed, 21 Jul 2021 11:21:16 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CA4B3F694;
 Wed, 21 Jul 2021 11:21:15 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 18/23] iommu: Express DMA strictness via the domain type
Date: Wed, 21 Jul 2021 19:20:29 +0100
Message-Id: <37708e21b55e17eb074ef145afc2157cd0192abe.1626888445.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626888444.git.robin.murphy@arm.com>
References: <cover.1626888444.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Eliminate the iommu_get_dma_strict() indirection and pipe the
information through the domain type from the beginning. Besides
the flow simplification this also has several nice side-effects:

 - Automatically implies strict mode for untrusted devices by
   virtue of their IOMMU_DOMAIN_DMA override.
 - Ensures that we only ends up using flush queues for drivers
   which are aware of them and can actually benefit.
 - Allows us to handle flush queue init failure by falling back
   to strict mode instead of leaving it to possibly blow up later.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  2 +-
 drivers/iommu/dma-iommu.c                   | 10 ++++++----
 drivers/iommu/iommu.c                       | 14 ++++----------
 include/linux/iommu.h                       |  1 -
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index fa41026d272e..260b560d0075 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2175,7 +2175,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (!iommu_get_dma_strict(domain))
+	if (domain->type == IOMMU_DOMAIN_DMA_FQ)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
 	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index dbc14c265b15..2c717f3be056 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -765,7 +765,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (!iommu_get_dma_strict(domain))
+	if (domain->type == IOMMU_DOMAIN_DMA_FQ)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
 	if (smmu->impl && smmu->impl->init_context) {
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b1af1ff324c5..a114a7ad88ec 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -363,13 +363,15 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 
 	init_iova_domain(iovad, 1UL << order, base_pfn);
 
-	if (!cookie->fq_domain && !dev_is_untrusted(dev) &&
-	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict(domain)) {
+	if (domain->type == IOMMU_DOMAIN_DMA_FQ && !cookie->fq_domain &&
+	    domain->ops->flush_iotlb_all) {
 		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
-					  iommu_dma_entry_dtor))
+					  iommu_dma_entry_dtor)) {
 			pr_warn("iova flush queue initialization failed\n");
-		else
+			domain->type = IOMMU_DOMAIN_DMA;
+		} else {
 			cookie->fq_domain = domain;
+		}
 	}
 
 	return iova_reserve_iommu_regions(dev, domain);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8333c334891e..d7eaacae0944 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -135,6 +135,9 @@ static int __init iommu_subsys_init(void)
 		}
 	}
 
+	if (!iommu_default_passthrough() && !iommu_dma_strict)
+		iommu_def_domain_type = IOMMU_DOMAIN_DMA_FQ;
+
 	pr_info("Default domain type: %s %s\n",
 		iommu_domain_type_str(iommu_def_domain_type),
 		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
@@ -352,15 +355,6 @@ void iommu_set_dma_strict(bool strict)
 		iommu_dma_strict = strict;
 }
 
-bool iommu_get_dma_strict(struct iommu_domain *domain)
-{
-	/* only allow lazy flushing for DMA domains */
-	if (domain->type == IOMMU_DOMAIN_DMA)
-		return iommu_dma_strict;
-	return true;
-}
-EXPORT_SYMBOL_GPL(iommu_get_dma_strict);
-
 static ssize_t iommu_group_attr_show(struct kobject *kobj,
 				     struct attribute *__attr, char *buf)
 {
@@ -764,7 +758,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 	unsigned long pg_size;
 	int ret = 0;
 
-	if (!domain || domain->type != IOMMU_DOMAIN_DMA)
+	if (!domain || !(domain->type & __IOMMU_DOMAIN_DMA_API))
 		return 0;
 
 	BUG_ON(!domain->pgsize_bitmap);
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 56519110d43f..557c4c12e2cf 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -484,7 +484,6 @@ int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks);
 
 void iommu_set_dma_strict(bool val);
-bool iommu_get_dma_strict(struct iommu_domain *domain);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
