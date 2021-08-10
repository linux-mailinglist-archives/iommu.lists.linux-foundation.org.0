Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72E3E0682
	for <lists.iommu@lfdr.de>; Wed,  4 Aug 2021 19:16:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50ECC60A57;
	Wed,  4 Aug 2021 17:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTY7sqIcyVdC; Wed,  4 Aug 2021 17:16:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1D860A53;
	Wed,  4 Aug 2021 17:16:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39CBFC000E;
	Wed,  4 Aug 2021 17:16:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98501C000E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FCF83B9B
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMv7r2vQzlBO for <iommu@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 17:16:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD2B283BC9
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F2E41063;
 Wed,  4 Aug 2021 10:16:42 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 372583F66F;
 Wed,  4 Aug 2021 10:16:40 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v3 16/25] iommu: Introduce explicit type for non-strict DMA
 domains
Date: Wed,  4 Aug 2021 18:15:44 +0100
Message-Id: <20ae6dfa288ad93dcbcdd772263c23a182817296.1628094601.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628094600.git.robin.murphy@arm.com>
References: <cover.1628094600.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
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

Promote the difference between strict and non-strict DMA domains from an
internal detail to a distinct domain feature and type, to pave the road
for exposing it through the sysfs default domain interface.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c |  2 +-
 drivers/iommu/iommu.c     |  8 ++++++--
 include/linux/iommu.h     | 11 +++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index d63b30a7dc82..207c8febdac9 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1312,7 +1312,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
 	 * The IOMMU core code allocates the default DMA domain, which the
 	 * underlying IOMMU driver needs to support via the dma-iommu layer.
 	 */
-	if (domain->type == IOMMU_DOMAIN_DMA) {
+	if (iommu_is_dma_domain(domain)) {
 		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
 			goto out_err;
 		dev->dma_ops = &iommu_dma_ops;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fa8109369f74..982545234cf3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -115,6 +115,7 @@ static const char *iommu_domain_type_str(unsigned int t)
 	case IOMMU_DOMAIN_UNMANAGED:
 		return "Unmanaged";
 	case IOMMU_DOMAIN_DMA:
+	case IOMMU_DOMAIN_DMA_FQ:
 		return "Translated";
 	default:
 		return "Unknown";
@@ -552,6 +553,9 @@ static ssize_t iommu_group_show_type(struct iommu_group *group,
 		case IOMMU_DOMAIN_DMA:
 			type = "DMA\n";
 			break;
+		case IOMMU_DOMAIN_DMA_FQ:
+			type = "DMA-FQ\n";
+			break;
 		}
 	}
 	mutex_unlock(&group->mutex);
@@ -765,7 +769,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 	unsigned long pg_size;
 	int ret = 0;
 
-	if (!domain || domain->type != IOMMU_DOMAIN_DMA)
+	if (!domain || !iommu_is_dma_domain(domain))
 		return 0;
 
 	BUG_ON(!domain->pgsize_bitmap);
@@ -1947,7 +1951,7 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
 	/* Assume all sizes by default; the driver may override this later */
 	domain->pgsize_bitmap  = bus->iommu_ops->pgsize_bitmap;
 
-	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(domain)) {
+	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
 		domain = NULL;
 	}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index f7679f6684b1..5629ae42951f 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -61,6 +61,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_API	(1U << 1)  /* Domain for use in DMA-API
 					      implementation              */
 #define __IOMMU_DOMAIN_PT	(1U << 2)  /* Domain is identity mapped   */
+#define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 /*
  * This are the possible domain-types
@@ -73,12 +74,17 @@ struct iommu_domain_geometry {
  *	IOMMU_DOMAIN_DMA	- Internally used for DMA-API implementations.
  *				  This flag allows IOMMU drivers to implement
  *				  certain optimizations for these domains
+ *	IOMMU_DOMAIN_DMA_FQ	- As above, but definitely using batched TLB
+ *				  invalidation.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
 #define IOMMU_DOMAIN_UNMANAGED	(__IOMMU_DOMAIN_PAGING)
 #define IOMMU_DOMAIN_DMA	(__IOMMU_DOMAIN_PAGING |	\
 				 __IOMMU_DOMAIN_DMA_API)
+#define IOMMU_DOMAIN_DMA_FQ	(__IOMMU_DOMAIN_PAGING |	\
+				 __IOMMU_DOMAIN_DMA_API |	\
+				 __IOMMU_DOMAIN_DMA_FQ)
 
 struct iommu_domain {
 	unsigned type;
@@ -90,6 +96,11 @@ struct iommu_domain {
 	struct iommu_dma_cookie *iova_cookie;
 };
 
+static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
+{
+	return domain->type & __IOMMU_DOMAIN_DMA_API;
+}
+
 enum iommu_cap {
 	IOMMU_CAP_CACHE_COHERENCY,	/* IOMMU can enforce cache coherent DMA
 					   transactions */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
