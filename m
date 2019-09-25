Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB7BDEDC
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 15:23:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80F4FE36;
	Wed, 25 Sep 2019 13:23:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EFACFE2A
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BFF5E8A
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:03 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id AB8DD4A6; Wed, 25 Sep 2019 15:23:01 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/6] iommu/amd: Remove amd_iommu_devtable_lock
Date: Wed, 25 Sep 2019 15:22:56 +0200
Message-Id: <20190925132300.3038-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925132300.3038-1-joro@8bytes.org>
References: <20190925132300.3038-1-joro@8bytes.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Filippo Sironi <sironi@amazon.de>, jroedel@suse.de
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Joerg Roedel <jroedel@suse.de>

The lock is not necessary because the device table does not
contain shared state that needs protection. Locking is only
needed on an individual entry basis, and that needs to
happen on the iommu_dev_data level.

Fixes: 92d420ec028d ("iommu/amd: Relax locking in dma_ops path")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 042854bbc5bc..37a9c04fc728 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -70,7 +70,6 @@
  */
 #define AMD_IOMMU_PGSIZES	((~0xFFFUL) & ~(2ULL << 38))
 
-static DEFINE_SPINLOCK(amd_iommu_devtable_lock);
 static DEFINE_SPINLOCK(pd_bitmap_lock);
 
 /* List of all available dev_data structures */
@@ -2080,10 +2079,11 @@ static void do_detach(struct iommu_dev_data *dev_data)
 static int __attach_device(struct iommu_dev_data *dev_data,
 			   struct protection_domain *domain)
 {
+	unsigned long flags;
 	int ret;
 
 	/* lock domain */
-	spin_lock(&domain->lock);
+	spin_lock_irqsave(&domain->lock, flags);
 
 	ret = -EBUSY;
 	if (dev_data->domain != NULL)
@@ -2097,7 +2097,7 @@ static int __attach_device(struct iommu_dev_data *dev_data,
 out_unlock:
 
 	/* ready */
-	spin_unlock(&domain->lock);
+	spin_unlock_irqrestore(&domain->lock, flags);
 
 	return ret;
 }
@@ -2181,7 +2181,6 @@ static int attach_device(struct device *dev,
 {
 	struct pci_dev *pdev;
 	struct iommu_dev_data *dev_data;
-	unsigned long flags;
 	int ret;
 
 	dev_data = get_dev_data(dev);
@@ -2209,9 +2208,7 @@ static int attach_device(struct device *dev,
 	}
 
 skip_ats_check:
-	spin_lock_irqsave(&amd_iommu_devtable_lock, flags);
 	ret = __attach_device(dev_data, domain);
-	spin_unlock_irqrestore(&amd_iommu_devtable_lock, flags);
 
 	/*
 	 * We might boot into a crash-kernel here. The crashed kernel
@@ -2231,14 +2228,15 @@ static int attach_device(struct device *dev,
 static void __detach_device(struct iommu_dev_data *dev_data)
 {
 	struct protection_domain *domain;
+	unsigned long flags;
 
 	domain = dev_data->domain;
 
-	spin_lock(&domain->lock);
+	spin_lock_irqsave(&domain->lock, flags);
 
 	do_detach(dev_data);
 
-	spin_unlock(&domain->lock);
+	spin_unlock_irqrestore(&domain->lock, flags);
 }
 
 /*
@@ -2248,7 +2246,6 @@ static void detach_device(struct device *dev)
 {
 	struct protection_domain *domain;
 	struct iommu_dev_data *dev_data;
-	unsigned long flags;
 
 	dev_data = get_dev_data(dev);
 	domain   = dev_data->domain;
@@ -2262,10 +2259,7 @@ static void detach_device(struct device *dev)
 	if (WARN_ON(!dev_data->domain))
 		return;
 
-	/* lock device table */
-	spin_lock_irqsave(&amd_iommu_devtable_lock, flags);
 	__detach_device(dev_data);
-	spin_unlock_irqrestore(&amd_iommu_devtable_lock, flags);
 
 	if (!dev_is_pci(dev))
 		return;
@@ -2910,9 +2904,6 @@ int __init amd_iommu_init_dma_ops(void)
 static void cleanup_domain(struct protection_domain *domain)
 {
 	struct iommu_dev_data *entry;
-	unsigned long flags;
-
-	spin_lock_irqsave(&amd_iommu_devtable_lock, flags);
 
 	while (!list_empty(&domain->dev_list)) {
 		entry = list_first_entry(&domain->dev_list,
@@ -2920,8 +2911,6 @@ static void cleanup_domain(struct protection_domain *domain)
 		BUG_ON(!entry->domain);
 		__detach_device(entry);
 	}
-
-	spin_unlock_irqrestore(&amd_iommu_devtable_lock, flags);
 }
 
 static void protection_domain_free(struct protection_domain *domain)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
