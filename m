Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EFEBDEDB
	for <lists.iommu@lfdr.de>; Wed, 25 Sep 2019 15:23:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EA20E28;
	Wed, 25 Sep 2019 13:23:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C9F47AF0
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2DC748B7
	for <iommu@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 13:23:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id EF9424E1; Wed, 25 Sep 2019 15:23:01 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/6] iommu/amd: Check for busy devices earlier in
	attach_device()
Date: Wed, 25 Sep 2019 15:22:58 +0200
Message-Id: <20190925132300.3038-5-joro@8bytes.org>
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

Check early in attach_device whether the device is already attached to a
domain. This also simplifies the code path so that __attach_device() can
be removed.

Fixes: 92d420ec028d ("iommu/amd: Relax locking in dma_ops path")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 2919168577ff..459247c32dc0 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2072,23 +2072,6 @@ static void do_detach(struct iommu_dev_data *dev_data)
 	domain->dev_cnt                 -= 1;
 }
 
-/*
- * If a device is not yet associated with a domain, this function makes the
- * device visible in the domain
- */
-static int __attach_device(struct iommu_dev_data *dev_data,
-			   struct protection_domain *domain)
-{
-	if (dev_data->domain != NULL)
-		return -EBUSY;
-
-	/* Attach alias group root */
-	do_attach(dev_data, domain);
-
-	return 0;
-}
-
-
 static void pdev_iommuv2_disable(struct pci_dev *pdev)
 {
 	pci_disable_ats(pdev);
@@ -2174,6 +2157,10 @@ static int attach_device(struct device *dev,
 
 	dev_data = get_dev_data(dev);
 
+	ret = -EBUSY;
+	if (dev_data->domain != NULL)
+		goto out;
+
 	if (!dev_is_pci(dev))
 		goto skip_ats_check;
 
@@ -2198,7 +2185,9 @@ static int attach_device(struct device *dev,
 	}
 
 skip_ats_check:
-	ret = __attach_device(dev_data, domain);
+	ret = 0;
+
+	do_attach(dev_data, domain);
 
 	/*
 	 * We might boot into a crash-kernel here. The crashed kernel
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
