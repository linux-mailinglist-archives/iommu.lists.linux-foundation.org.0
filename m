Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 078303E0690
	for <lists.iommu@lfdr.de>; Wed,  4 Aug 2021 19:17:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF33760A62;
	Wed,  4 Aug 2021 17:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rWtU_5ybM3l3; Wed,  4 Aug 2021 17:17:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B4A4A60A69;
	Wed,  4 Aug 2021 17:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 915E4C001C;
	Wed,  4 Aug 2021 17:17:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85FE0C001F
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7562540673
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4TkxUIEewmJ for <iommu@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 17:16:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id B51F44066E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410FD1063;
 Wed,  4 Aug 2021 10:16:58 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83E653F66F;
 Wed,  4 Aug 2021 10:16:56 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v3 24/25] iommu/dma: Factor out flush queue init
Date: Wed,  4 Aug 2021 18:15:52 +0100
Message-Id: <3b5284ee394f267ba966839173f874fc9a996bb2.1628094601.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628094600.git.robin.murphy@arm.com>
References: <cover.1628094600.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, rajatja@google.com,
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

Factor out flush queue setup from the initial domain init so that we
can potentially trigger it from sysfs later on in a domain's lifetime.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: John Garry <john.garry@huawei.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 30 ++++++++++++++++++++----------
 include/linux/dma-iommu.h |  9 ++++++---
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 2e19505dddf9..f51b8dc99ac6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -310,6 +310,25 @@ static bool dev_is_untrusted(struct device *dev)
 	return dev_is_pci(dev) && to_pci_dev(dev)->untrusted;
 }
 
+int iommu_dma_init_fq(struct iommu_domain *domain)
+{
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+
+	if (domain->type != IOMMU_DOMAIN_DMA_FQ)
+		return -EINVAL;
+	if (cookie->fq_domain)
+		return 0;
+
+	if (init_iova_flush_queue(&cookie->iovad, iommu_dma_flush_iotlb_all,
+				  iommu_dma_entry_dtor)) {
+		pr_warn("iova flush queue initialization failed\n");
+		domain->type = IOMMU_DOMAIN_DMA;
+		return -ENODEV;
+	}
+	cookie->fq_domain = domain;
+	return 0;
+}
+
 /**
  * iommu_dma_init_domain - Initialise a DMA mapping domain
  * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie()
@@ -362,16 +381,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	}
 
 	init_iova_domain(iovad, 1UL << order, base_pfn);
-
-	if (domain->type == IOMMU_DOMAIN_DMA_FQ && !cookie->fq_domain) {
-		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
-					  iommu_dma_entry_dtor)) {
-			pr_warn("iova flush queue initialization failed\n");
-			domain->type = IOMMU_DOMAIN_DMA;
-		} else {
-			cookie->fq_domain = domain;
-		}
-	}
+	iommu_dma_init_fq(domain);
 
 	return iova_reserve_iommu_regions(dev, domain);
 }
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 758ca4694257..81ab647f1618 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -20,6 +20,7 @@ void iommu_put_dma_cookie(struct iommu_domain *domain);
 
 /* Setup call for arch DMA mapping code */
 void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
+int iommu_dma_init_fq(struct iommu_domain *domain);
 
 /* The DMA API isn't _quite_ the whole story, though... */
 /*
@@ -37,9 +38,6 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
-void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
-		struct iommu_domain *domain);
-
 extern bool iommu_dma_forcedac;
 
 #else /* CONFIG_IOMMU_DMA */
@@ -54,6 +52,11 @@ static inline void iommu_setup_dma_ops(struct device *dev, u64 dma_base,
 {
 }
 
+static inline int iommu_dma_init_fq(struct iommu_domain *domain)
+{
+	return -EINVAL;
+}
+
 static inline int iommu_get_dma_cookie(struct iommu_domain *domain)
 {
 	return -ENODEV;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
