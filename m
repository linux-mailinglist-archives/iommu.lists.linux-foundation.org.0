Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9BE3279DE
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 09:49:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F8A606C9;
	Mon,  1 Mar 2021 08:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqnDlb67apEN; Mon,  1 Mar 2021 08:49:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C956F60694;
	Mon,  1 Mar 2021 08:49:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC7AC000F;
	Mon,  1 Mar 2021 08:49:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BF9BC0001;
 Mon,  1 Mar 2021 08:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26A17606BF;
 Mon,  1 Mar 2021 08:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slmLJuOygPcK; Mon,  1 Mar 2021 08:49:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57CC5606A2;
 Mon,  1 Mar 2021 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xjnrpEXxWqN295Q5FQN/MKyM59zP4it+2k/oCX23gCw=; b=GUTHjhjVLRbJTH2y8N0f5pXfQt
 BpcjyqebHUSqkrTfxo9sNnMxsXXi553XjQV00V9WvEhU+FZoA+NR+7JFRo7V+AcJrTEM2A0/NWoUY
 UQcG1jJvPEvJ62t0+skQ3GOQwTgz9bkJrgJ5bnVxZaxWSLvpKWL69ICJDko8VZPR7xnOkfCwL79i7
 gSKcArm/UWJvBLWZ3LQ2LKR9uhK0zIeUIiMijW/QfWAXEvydnu+GXr4VH9gDQxN7matDN8yNDTwzc
 mzOmEyht23pCYSJg+mpQkr9XEd1UDX2UeQck2jKCZcJqclZ3cNse2Oooee5h2NDsQSuznxuuEfST1
 vhs+o1kA==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGeES-00FUwW-Vk; Mon, 01 Mar 2021 08:48:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 17/17] iommu: remove iommu_domain_set_attr
Date: Mon,  1 Mar 2021 09:42:57 +0100
Message-Id: <20210301084257.945454-18-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301084257.945454-1-hch@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/iommu.c | 17 -----------------
 include/linux/iommu.h | 27 ---------------------------
 2 files changed, 44 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8490aefd4b41f8..b04e6cefe8520d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2668,23 +2668,6 @@ bool iommu_dma_use_flush_queue(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL_GPL(iommu_dma_use_flush_queue);
 
-int iommu_domain_set_attr(struct iommu_domain *domain,
-			  enum iommu_attr attr, void *data)
-{
-	int ret = 0;
-
-	switch (attr) {
-	default:
-		if (domain->ops->domain_set_attr == NULL)
-			return -EINVAL;
-
-		ret = domain->ops->domain_set_attr(domain, attr, data);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(iommu_domain_set_attr);
-
 int iommu_domain_enable_nesting(struct iommu_domain *domain)
 {
 	if (!domain->ops->domain_enable_nesting)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 39d3ed4d2700ac..62535f563aa491 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -97,20 +97,6 @@ enum iommu_cap {
 	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
 };
 
-/*
- * Following constraints are specifc to FSL_PAMUV1:
- *  -aperture must be power of 2, and naturally aligned
- *  -number of windows must be power of 2, and address space size
- *   of each window is determined by aperture size / # of windows
- *  -the actual size of the mapped region of a window must be power
- *   of 2 starting with 4KB and physical address must be naturally
- *   aligned.
- */
-
-enum iommu_attr {
-	DOMAIN_ATTR_MAX,
-};
-
 /* These are the possible reserved region types */
 enum iommu_resv_type {
 	/* Memory regions which must be mapped 1:1 at all times */
@@ -194,7 +180,6 @@ struct iommu_iotlb_gather {
  * @device_group: find iommu group for a particular device
  * @dma_use_flush_queue: Returns %true if a DMA flush queue is used
  * @dma_enable_flush_queue: Try to enable the DMA flush queue
- * @domain_set_attr: Change domain attributes
  * @domain_enable_nesting: Enable nesting
  * @domain_set_pgtable_attr: Set io page table attributes
  * @get_resv_regions: Request list of reserved regions for a device
@@ -247,8 +232,6 @@ struct iommu_ops {
 	struct iommu_group *(*device_group)(struct device *dev);
 	bool (*dma_use_flush_queue)(struct iommu_domain *domain);
 	void (*dma_enable_flush_queue)(struct iommu_domain *domain);
-	int (*domain_set_attr)(struct iommu_domain *domain,
-			       enum iommu_attr attr, void *data);
 	int (*domain_enable_nesting)(struct iommu_domain *domain);
 	int (*domain_set_pgtable_attr)(struct iommu_domain *domain,
 			struct io_pgtable_domain_attr *pgtbl_cfg);
@@ -498,11 +481,7 @@ extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 bool iommu_dma_use_flush_queue(struct iommu_domain *domain);
 int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
 		struct io_pgtable_domain_attr *pgtbl_cfg);
-extern int iommu_domain_set_attr(struct iommu_domain *domain, enum iommu_attr,
-				 void *data);
 int iommu_domain_enable_nesting(struct iommu_domain *domain);
-int iommu_domain_set_pgtable_attr(struct iommu_domain *domain,
-		struct io_pgtable_domain_attr *pgtbl_cfg);
 
 extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
 			      unsigned long iova, int flags);
@@ -869,12 +848,6 @@ static inline int iommu_group_id(struct iommu_group *group)
 	return -ENODEV;
 }
 
-static inline int iommu_domain_set_attr(struct iommu_domain *domain,
-					enum iommu_attr attr, void *data)
-{
-	return -EINVAL;
-}
-
 static inline int  iommu_device_register(struct iommu_device *iommu)
 {
 	return -ENODEV;
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
