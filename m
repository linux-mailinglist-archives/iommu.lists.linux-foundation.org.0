Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C952408B2B
	for <lists.iommu@lfdr.de>; Mon, 13 Sep 2021 14:40:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D7264029F;
	Mon, 13 Sep 2021 12:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND4m1fTCHw-w; Mon, 13 Sep 2021 12:40:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6C630401CD;
	Mon, 13 Sep 2021 12:40:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55DFBC000D;
	Mon, 13 Sep 2021 12:40:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A586C000D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE02C80F2D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pBlT23n9_2Jw for <iommu@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD32A80EE4
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB65C1042;
 Mon, 13 Sep 2021 05:40:13 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 266423F59C;
 Mon, 13 Sep 2021 05:40:13 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 2/2] iommu/dma: Unexport IOVA cookie management
Date: Mon, 13 Sep 2021 13:40:06 +0100
Message-Id: <ef89db54a27df7d8bc0af094c7d7b204fd61774c.1631531973.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631531973.git.robin.murphy@arm.com>
References: <cover.1631531973.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

IOVA cookies are now got and put by core code, so we no longer need to
export these to modular drivers. The export for getting MSI cookies
stays, since VFIO can still be a module, but it was already relying on
someone else putting them, so that aspect is unaffected.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 7 -------
 drivers/iommu/iommu.c     | 3 +--
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 896bea04c347..26cb95d3830a 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -98,9 +98,6 @@ static struct iommu_dma_cookie *cookie_alloc(enum iommu_dma_cookie_type type)
 /**
  * iommu_get_dma_cookie - Acquire DMA-API resources for a domain
  * @domain: IOMMU domain to prepare for DMA-API usage
- *
- * IOMMU drivers should normally call this from their domain_alloc
- * callback when domain->type == IOMMU_DOMAIN_DMA.
  */
 int iommu_get_dma_cookie(struct iommu_domain *domain)
 {
@@ -113,7 +110,6 @@ int iommu_get_dma_cookie(struct iommu_domain *domain)
 
 	return 0;
 }
-EXPORT_SYMBOL(iommu_get_dma_cookie);
 
 /**
  * iommu_get_msi_cookie - Acquire just MSI remapping resources
@@ -151,8 +147,6 @@ EXPORT_SYMBOL(iommu_get_msi_cookie);
  * iommu_put_dma_cookie - Release a domain's DMA mapping resources
  * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie() or
  *          iommu_get_msi_cookie()
- *
- * IOMMU drivers should normally call this from their domain_free callback.
  */
 void iommu_put_dma_cookie(struct iommu_domain *domain)
 {
@@ -172,7 +166,6 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 	kfree(cookie);
 	domain->iova_cookie = NULL;
 }
-EXPORT_SYMBOL(iommu_put_dma_cookie);
 
 /**
  * iommu_dma_get_resv_regions - Reserved region driver helper
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3303d707bab4..a80f13867bed 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1953,8 +1953,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 	/* Assume all sizes by default; the driver may override this later */
 	domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
 
-	/* Temporarily avoid -EEXIST while drivers still get their own cookies */
-	if (iommu_is_dma_domain(domain) && !domain->iova_cookie && iommu_get_dma_cookie(domain)) {
+	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
 		domain = NULL;
 	}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
