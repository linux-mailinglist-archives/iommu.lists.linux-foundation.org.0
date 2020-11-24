Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB92C26DE
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 14:13:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A29485DF5;
	Tue, 24 Nov 2020 13:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrnjAKSdA539; Tue, 24 Nov 2020 13:13:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0960785DFD;
	Tue, 24 Nov 2020 13:13:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8B02C0052;
	Tue, 24 Nov 2020 13:13:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7756CC0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6603485DFD
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl25WtC1AidI for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 13:13:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7199C85C95
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:13:33 +0000 (UTC)
IronPort-SDR: xfVcxOHWBZtkmC9rpslbtvZl+aQ30qcz86B3gRMsRtwIVbe6DKwbB7fbrPeB6+4keie04eii74
 3RSFzeLqQS1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="172037946"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172037946"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 05:13:33 -0800
IronPort-SDR: BsN7WY6mgsevZQ6oHgQQYwVL5JOLXU7ImYeIwx2vVQtvU9fXWr4sO4vG4YATnaEFHmrNO8VtqK
 WcG4CalfiNCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="432602199"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2020 05:13:30 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v10 1/4] iommu: Move def_domain type check for untrusted
 device into core
Date: Tue, 24 Nov 2020 21:06:01 +0800
Message-Id: <20201124130604.2912899-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124130604.2912899-1-baolu.lu@linux.intel.com>
References: <20201124130604.2912899-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

So that the vendor iommu drivers are no more required to provide the
def_domain_type callback to always isolate the untrusted devices.

Link: https://lore.kernel.org/linux-iommu/243ce89c33fe4b9da4c56ba35acebf81@huawei.com/
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c |  7 -------
 drivers/iommu/iommu.c       | 16 +++++++---------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0233d2438c44..8f51980023a2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2916,13 +2916,6 @@ static int device_def_domain_type(struct device *dev)
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 
-		/*
-		 * Prevent any device marked as untrusted from getting
-		 * placed into the statically identity mapping domain.
-		 */
-		if (pdev->untrusted)
-			return IOMMU_DOMAIN_DMA;
-
 		if ((iommu_identity_mapping & IDENTMAP_AZALIA) && IS_AZALIA(pdev))
 			return IOMMU_DOMAIN_IDENTITY;
 
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5236c4e4dd4c..f8ee0e86b7fb 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1462,12 +1462,14 @@ EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 static int iommu_get_def_domain_type(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
-	unsigned int type = 0;
+
+	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
+		return IOMMU_DOMAIN_DMA;
 
 	if (ops->def_domain_type)
-		type = ops->def_domain_type(dev);
+		return ops->def_domain_type(dev);
 
-	return (type == 0) ? iommu_def_domain_type : type;
+	return 0;
 }
 
 static int iommu_group_alloc_default_domain(struct bus_type *bus,
@@ -1509,7 +1511,7 @@ static int iommu_alloc_default_domain(struct iommu_group *group,
 	if (group->default_domain)
 		return 0;
 
-	type = iommu_get_def_domain_type(dev);
+	type = iommu_get_def_domain_type(dev) ? : iommu_def_domain_type;
 
 	return iommu_group_alloc_default_domain(dev->bus, group, type);
 }
@@ -1647,12 +1649,8 @@ struct __group_domain_type {
 
 static int probe_get_default_domain_type(struct device *dev, void *data)
 {
-	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct __group_domain_type *gtype = data;
-	unsigned int type = 0;
-
-	if (ops->def_domain_type)
-		type = ops->def_domain_type(dev);
+	unsigned int type = iommu_get_def_domain_type(dev);
 
 	if (type) {
 		if (gtype->type && gtype->type != type) {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
