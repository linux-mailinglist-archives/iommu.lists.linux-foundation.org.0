Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E084B3F19
	for <lists.iommu@lfdr.de>; Mon, 14 Feb 2022 02:58:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 022F181420;
	Mon, 14 Feb 2022 01:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSAxBd5WgYPf; Mon, 14 Feb 2022 01:58:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0970D814BA;
	Mon, 14 Feb 2022 01:58:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8C21C000B;
	Mon, 14 Feb 2022 01:58:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 822F3C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70EE8401DD
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yFj9SjKs4aj for <iommu@lists.linux-foundation.org>;
 Mon, 14 Feb 2022 01:57:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC7974009B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Feb 2022 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644803879; x=1676339879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GGPcPGkbkHt1Y4H+/VPbuoavbqaUa2IcnRax9XTlCs8=;
 b=gjYFHfhQa7kizjnKF2ymt4BdUKimqx1gJDzKaBj5fxL6uBSI9T5Uy8KU
 9ji/Bwa4VLXyQu7tqBulYo+o4zTQnkz5rOgIozxiHIqOhFMg9qsbr8/KP
 APAbILWPtniefZddr+gFOM7T9+8XuCpH2lbTcrOL3IZScRNErquollBTt
 4W+tlyIUCI0PxRu0oDXcndQsSeX4SXY5MhFbIWVNRG57vMHvMx/CIzSxy
 WMQxMRVBkVn+lWc6pXuPcFU9rb+aQPX8lfW94TIvwY+3GdhKwtVHpdXag
 Prj5pwmLvYSsbGm0ZMVIFdv8MQSfk+8EzYOcQ65IeBtPebhTopjyW/Z3U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="249938528"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="249938528"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2022 17:57:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; d="scan'208";a="680137341"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2022 17:57:55 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 07/10] iommu: Use right way to retrieve iommu_ops
Date: Mon, 14 Feb 2022 09:55:35 +0800
Message-Id: <20220214015538.2828933-8-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
References: <20220214015538.2828933-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
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

The common iommu_ops is hooked to both device and domain. When a helper
has both device and domain pointer, the way to get the iommu_ops looks
messy in iommu core. This sorts out the way to get iommu_ops. The device
related helpers go through device pointer, while the domain related ones
go through domain pointer.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h | 14 ++++++++++++++
 drivers/iommu/iommu.c | 20 +++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9ffa2e88f3d0..eb2684f95018 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -381,6 +381,20 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 	};
 }
 
+static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
+{
+	/*
+	 * Assume that valid ops must be installed if iommu_probe_device()
+	 * has succeeded. The device ops are essentially for internal use
+	 * within the IOMMU subsystem itself, so we should be able to trust
+	 * ourselves not to misuse the helper.
+	 */
+	WARN_ON(!dev || !dev->iommu || !dev->iommu->iommu_dev ||
+		!dev->iommu->iommu_dev->ops);
+
+	return dev->iommu->iommu_dev->ops;
+}
+
 #define IOMMU_GROUP_NOTIFY_ADD_DEVICE		1 /* Device added */
 #define IOMMU_GROUP_NOTIFY_DEL_DEVICE		2 /* Pre Device removed */
 #define IOMMU_GROUP_NOTIFY_BIND_DRIVER		3 /* Pre Driver bind */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7cf073c56036..d290d8be6133 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -833,8 +833,10 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 static bool iommu_is_attach_deferred(struct iommu_domain *domain,
 				     struct device *dev)
 {
-	if (domain->ops->is_attach_deferred)
-		return domain->ops->is_attach_deferred(domain, dev);
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
+
+	if (ops->is_attach_deferred)
+		return ops->is_attach_deferred(domain, dev);
 
 	return false;
 }
@@ -1252,10 +1254,10 @@ int iommu_page_response(struct device *dev,
 	struct iommu_fault_event *evt;
 	struct iommu_fault_page_request *prm;
 	struct dev_iommu *param = dev->iommu;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	bool has_pasid = msg->flags & IOMMU_PAGE_RESP_PASID_VALID;
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 
-	if (!domain || !domain->ops->page_response)
+	if (!ops->page_response)
 		return -ENODEV;
 
 	if (!param || !param->fault_param)
@@ -1296,7 +1298,7 @@ int iommu_page_response(struct device *dev,
 			msg->pasid = 0;
 		}
 
-		ret = domain->ops->page_response(dev, evt, msg);
+		ret = ops->page_response(dev, evt, msg);
 		list_del(&evt->list);
 		kfree(evt);
 		break;
@@ -1759,10 +1761,10 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
 
 static int iommu_group_do_probe_finalize(struct device *dev, void *data)
 {
-	struct iommu_domain *domain = data;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 
-	if (domain->ops->probe_finalize)
-		domain->ops->probe_finalize(dev);
+	if (ops->probe_finalize)
+		ops->probe_finalize(dev);
 
 	return 0;
 }
@@ -2020,7 +2022,7 @@ EXPORT_SYMBOL_GPL(iommu_attach_device);
 
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 {
-	const struct iommu_ops *ops = domain->ops;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 
 	if (ops->is_attach_deferred && ops->is_attach_deferred(domain, dev))
 		return __iommu_attach_device(domain, dev);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
