Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521C273A9A
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 08:17:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF05F85C32;
	Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nilBugS8OrFn; Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D3A385C05;
	Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22F22C0051;
	Tue, 22 Sep 2020 06:17:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A596FC0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9461485B78
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FAh9ohvEiZ0e for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 06:17:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 090CD85C4C
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:17:06 +0000 (UTC)
IronPort-SDR: Go8zh7chbdst7t9Fp86jA1hGCbr26d1iwL/cndNLQMa9ooMlFPNUTONtkP7D+6vayIenTy3NYQ
 67AgfQwgetIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148206706"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="148206706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 23:17:06 -0700
IronPort-SDR: 7daS5tNwrWWqpl3taPoJ6/0qgFYro8nsiX7I+NgbHENCuINJfavq8dK3F4n2FXE0i0OMqRTjE+
 mTe4v5vFj90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="334877460"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2020 23:17:03 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v5 4/5] vfio/type1: Use iommu_aux_at(de)tach_group() APIs
Date: Tue, 22 Sep 2020 14:10:41 +0800
Message-Id: <20200922061042.31633-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922061042.31633-1-baolu.lu@linux.intel.com>
References: <20200922061042.31633-1-baolu.lu@linux.intel.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Replace iommu_aux_at(de)tach_device() with iommu_at(de)tach_subdev_group().

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/vfio/vfio_iommu_type1.c | 43 +++++----------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index c255a6683f31..869a71c258d1 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1690,45 +1690,13 @@ static struct device *vfio_mdev_get_iommu_device(struct device *dev)
 	return NULL;
 }
 
-static int vfio_mdev_attach_domain(struct device *dev, void *data)
-{
-	struct iommu_domain *domain = data;
-	struct device *iommu_device;
-
-	iommu_device = vfio_mdev_get_iommu_device(dev);
-	if (iommu_device) {
-		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
-			return iommu_aux_attach_device(domain, iommu_device);
-		else
-			return iommu_attach_device(domain, iommu_device);
-	}
-
-	return -EINVAL;
-}
-
-static int vfio_mdev_detach_domain(struct device *dev, void *data)
-{
-	struct iommu_domain *domain = data;
-	struct device *iommu_device;
-
-	iommu_device = vfio_mdev_get_iommu_device(dev);
-	if (iommu_device) {
-		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
-			iommu_aux_detach_device(domain, iommu_device);
-		else
-			iommu_detach_device(domain, iommu_device);
-	}
-
-	return 0;
-}
-
 static int vfio_iommu_attach_group(struct vfio_domain *domain,
 				   struct vfio_group *group)
 {
 	if (group->mdev_group)
-		return iommu_group_for_each_dev(group->iommu_group,
-						domain->domain,
-						vfio_mdev_attach_domain);
+		return iommu_attach_subdev_group(domain->domain,
+						 group->iommu_group,
+						 vfio_mdev_get_iommu_device);
 	else
 		return iommu_attach_group(domain->domain, group->iommu_group);
 }
@@ -1737,8 +1705,9 @@ static void vfio_iommu_detach_group(struct vfio_domain *domain,
 				    struct vfio_group *group)
 {
 	if (group->mdev_group)
-		iommu_group_for_each_dev(group->iommu_group, domain->domain,
-					 vfio_mdev_detach_domain);
+		iommu_detach_subdev_group(domain->domain,
+					  group->iommu_group,
+					  vfio_mdev_get_iommu_device);
 	else
 		iommu_detach_group(domain->domain, group->iommu_group);
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
