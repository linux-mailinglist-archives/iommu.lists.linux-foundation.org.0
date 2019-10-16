Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA35D9838
	for <lists.iommu@lfdr.de>; Wed, 16 Oct 2019 19:07:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91C8AE52;
	Wed, 16 Oct 2019 17:07:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FBCCDDE
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 17:07:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id F276C6C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 17:07:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C81928;
	Wed, 16 Oct 2019 10:07:43 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A83F3F6C4; 
	Wed, 16 Oct 2019 10:07:42 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH] iommu/dma: Relax locking in iommu_dma_prepare_msi()
Date: Wed, 16 Oct 2019 18:07:36 +0100
Message-Id: <5af5e77102ca52576cb96816f0abcf6398820055.1571245656.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: maz@kernel.org, iommu@lists.linux-foundation.org, julien.grall@arm.com,
	linux-kernel@vger.kernel.org
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

Since commit ece6e6f0218b ("iommu/dma-iommu: Split iommu_dma_map_msi_msg()
in two parts"), iommu_dma_prepare_msi() should no longer have to worry
about preempting itself, nor being called in atomic context at all. Thus
we can downgrade the IRQ-safe locking to a simple mutex to avoid angering
the new might_sleep() check in iommu_map().

Reported-by: Qian Cai <cai@lca.pw>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f321279baf9e..4ba3c49de017 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -19,6 +19,7 @@
 #include <linux/iova.h>
 #include <linux/irq.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
@@ -43,7 +44,6 @@ struct iommu_dma_cookie {
 		dma_addr_t		msi_iova;
 	};
 	struct list_head		msi_page_list;
-	spinlock_t			msi_lock;
 
 	/* Domain for flush queue callback; NULL if flush queue not in use */
 	struct iommu_domain		*fq_domain;
@@ -62,7 +62,6 @@ static struct iommu_dma_cookie *cookie_alloc(enum iommu_dma_cookie_type type)
 
 	cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
 	if (cookie) {
-		spin_lock_init(&cookie->msi_lock);
 		INIT_LIST_HEAD(&cookie->msi_page_list);
 		cookie->type = type;
 	}
@@ -1150,7 +1149,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		if (msi_page->phys == msi_addr)
 			return msi_page;
 
-	msi_page = kzalloc(sizeof(*msi_page), GFP_ATOMIC);
+	msi_page = kzalloc(sizeof(*msi_page), GFP_KERNEL);
 	if (!msi_page)
 		return NULL;
 
@@ -1180,7 +1179,7 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_dma_cookie *cookie;
 	struct iommu_dma_msi_page *msi_page;
-	unsigned long flags;
+	static DEFINE_MUTEX(msi_prepare_lock);
 
 	if (!domain || !domain->iova_cookie) {
 		desc->iommu_cookie = NULL;
@@ -1190,13 +1189,12 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	cookie = domain->iova_cookie;
 
 	/*
-	 * We disable IRQs to rule out a possible inversion against
-	 * irq_desc_lock if, say, someone tries to retarget the affinity
-	 * of an MSI from within an IPI handler.
+	 * In fact we should already be serialised by irq_domain_mutex
+	 * here, but that's way subtle, so belt and braces...
 	 */
-	spin_lock_irqsave(&cookie->msi_lock, flags);
+	mutex_lock(&msi_prepare_lock);
 	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
-	spin_unlock_irqrestore(&cookie->msi_lock, flags);
+	mutex_unlock(&msi_prepare_lock);
 
 	msi_desc_set_iommu_cookie(desc, msi_page);
 
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
