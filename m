Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0113D9296
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 17:59:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EEE040520;
	Wed, 28 Jul 2021 15:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJkkuVNve3UE; Wed, 28 Jul 2021 15:59:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0E90240523;
	Wed, 28 Jul 2021 15:59:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E828EC0022;
	Wed, 28 Jul 2021 15:59:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E21FC000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F086405EC
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kf1Y6WO25Tx for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 15:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9726A405E6
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33F89113E;
 Wed, 28 Jul 2021 08:59:38 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8C763F70D;
 Wed, 28 Jul 2021 08:59:36 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 18/24] iommu: Express DMA strictness via the domain type
Date: Wed, 28 Jul 2021 16:58:39 +0100
Message-Id: <50bee17e9248ccfccb33a10238210d4ff4f4cf4d.1627468309.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627468308.git.robin.murphy@arm.com>
References: <cover.1627468308.git.robin.murphy@arm.com>
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
 - Ensures that we only end up using flush queues for drivers
   which are aware of them and can actually benefit.
 - Allows us to handle flush queue init failure by falling back
   to strict mode instead of leaving it to possibly blow up later.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  2 +-
 drivers/iommu/dma-iommu.c                   |  9 +++++----
 drivers/iommu/iommu.c                       | 12 +++---------
 include/linux/iommu.h                       |  1 -
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a1f0d83d1eb5..19400826eba7 100644
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
index 936c5e9d5e82..109e4723f9f5 100644
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
index 8b3545c01077..7f3968865387 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -363,13 +363,14 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 
 	init_iova_domain(iovad, 1UL << order, base_pfn);
 
-	if (!cookie->fq_domain && !dev_is_untrusted(dev) &&
-	    domain->ops->flush_iotlb_all && !iommu_get_dma_strict(domain)) {
+	if (domain->type == IOMMU_DOMAIN_DMA_FQ && !cookie->fq_domain) {
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
index 982545234cf3..eecb5657de69 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -136,6 +136,9 @@ static int __init iommu_subsys_init(void)
 		}
 	}
 
+	if (!iommu_default_passthrough() && !iommu_dma_strict)
+		iommu_def_domain_type = IOMMU_DOMAIN_DMA_FQ;
+
 	pr_info("Default domain type: %s %s\n",
 		iommu_domain_type_str(iommu_def_domain_type),
 		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
@@ -357,15 +360,6 @@ void iommu_set_dma_strict(void)
 	iommu_dma_strict = true;
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
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 046ba4d54cd2..edfe2fdb8368 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -498,7 +498,6 @@ int iommu_set_pgtable_quirks(struct iommu_domain *domain,
 		unsigned long quirks);
 
 void iommu_set_dma_strict(void);
-bool iommu_get_dma_strict(struct iommu_domain *domain);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
