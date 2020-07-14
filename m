Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 410EE21E7CB
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 08:02:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AABBC23730;
	Tue, 14 Jul 2020 06:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vDePcCXgsRU; Tue, 14 Jul 2020 06:01:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8772E204D7;
	Tue, 14 Jul 2020 06:01:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8168EC0733;
	Tue, 14 Jul 2020 06:01:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62147C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D33E38A6D2
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A181eYe3GQZa for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 06:01:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 986B68A6D4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:52 +0000 (UTC)
IronPort-SDR: 8gulZIqPoigBZHNBTrnXczqmkIFUogkmoeDR5+lhsF9BT6pzQpuVeVUQtt1BIqYb2BIjodHTss
 CTmJ8daamaOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="147947573"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="147947573"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 23:01:52 -0700
IronPort-SDR: DRuNNznlShmbBg/hXeyZXOHyQnvBnJVGJ9EUL1tNG54hFH5bs+YqLyY98X7Se6oqPAhLF2n9Vr
 xJMj4wloh6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="324450171"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2020 23:01:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 1/4] iommu: Check IOMMU_DEV_FEAT_AUX feature in aux api's
Date: Tue, 14 Jul 2020 13:57:00 +0800
Message-Id: <20200714055703.5510-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714055703.5510-1-baolu.lu@linux.intel.com>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
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

The iommu aux-domain api's work only when IOMMU_DEV_FEAT_AUX is enabled
for the device. Add this check to avoid misuse.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1ed1e14a1f0c..e1fdd3531d65 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2725,11 +2725,13 @@ EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
  */
 int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
 {
-	int ret = -ENODEV;
+	int ret;
 
-	if (domain->ops->aux_attach_dev)
-		ret = domain->ops->aux_attach_dev(domain, dev);
+	if (!iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
+	    !domain->ops->aux_attach_dev)
+		return -ENODEV;
 
+	ret = domain->ops->aux_attach_dev(domain, dev);
 	if (!ret)
 		trace_attach_device_to_domain(dev);
 
@@ -2748,12 +2750,12 @@ EXPORT_SYMBOL_GPL(iommu_aux_detach_device);
 
 int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
 {
-	int ret = -ENODEV;
+	if (!iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
+	    !domain->ops->aux_get_pasid)
+		return -ENODEV;
 
-	if (domain->ops->aux_get_pasid)
-		ret = domain->ops->aux_get_pasid(domain, dev);
+	return domain->ops->aux_get_pasid(domain, dev);
 
-	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_aux_get_pasid);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
