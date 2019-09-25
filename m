Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB5BDEDD
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 15:23:43 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A92AEE38;
	Wed, 25 Sep 2019 13:23:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BBFBBDA4
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 490988A
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:14 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 224C5528; Wed, 25 Sep 2019 15:23:02 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 5/6] iommu/amd: Lock dev_data in attach/detach code paths
Date: Wed, 25 Sep 2019 15:22:59 +0200
Message-Id: <20190925132300.3038-6-joro@8bytes.org>
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

Make sure that attaching a detaching a device can't race against each
other and protect the iommu_dev_data with a spin_lock in these code
paths.

Fixes: 92d420ec028d ("iommu/amd: Relax locking in dma_ops path")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c       | 9 +++++++++
 drivers/iommu/amd_iommu_types.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 459247c32dc0..bac4e20a5919 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -201,6 +201,7 @@ static struct iommu_dev_data *alloc_dev_data(u16 devid)
 	if (!dev_data)
 		return NULL;
 
+	spin_lock_init(&dev_data->lock);
 	dev_data->devid = devid;
 	ratelimit_default_init(&dev_data->rs);
 
@@ -2157,6 +2158,8 @@ static int attach_device(struct device *dev,
 
 	dev_data = get_dev_data(dev);
 
+	spin_lock(&dev_data->lock);
+
 	ret = -EBUSY;
 	if (dev_data->domain != NULL)
 		goto out;
@@ -2199,6 +2202,8 @@ static int attach_device(struct device *dev,
 	domain_flush_complete(domain);
 
 out:
+	spin_unlock(&dev_data->lock);
+
 	spin_unlock_irqrestore(&domain->lock, flags);
 
 	return ret;
@@ -2218,6 +2223,8 @@ static void detach_device(struct device *dev)
 
 	spin_lock_irqsave(&domain->lock, flags);
 
+	spin_lock(&dev_data->lock);
+
 	/*
 	 * First check if the device is still attached. It might already
 	 * be detached from its domain because the generic
@@ -2240,6 +2247,8 @@ static void detach_device(struct device *dev)
 	dev_data->ats.enabled = false;
 
 out:
+	spin_unlock(&dev_data->lock);
+
 	spin_unlock_irqrestore(&domain->lock, flags);
 }
 
diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index 0186501ab971..c9c1612d52e0 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -633,6 +633,9 @@ struct devid_map {
  * This struct contains device specific data for the IOMMU
  */
 struct iommu_dev_data {
+	/*Protect against attach/detach races */
+	spinlock_t lock;
+
 	struct list_head list;		  /* For domain->dev_list */
 	struct llist_node dev_data_list;  /* For global dev_data_list */
 	struct protection_domain *domain; /* Domain the device is bound to */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
