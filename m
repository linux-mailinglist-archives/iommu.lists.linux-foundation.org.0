Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1B21E7CD
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 08:02:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE40C8B030;
	Tue, 14 Jul 2020 06:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9G1ZB3pK0vr5; Tue, 14 Jul 2020 06:02:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BD0D8B043;
	Tue, 14 Jul 2020 06:02:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8806C0733;
	Tue, 14 Jul 2020 06:02:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19D9CC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0DADD8A6E1
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeaCGG+RqQMN for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 06:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BB2008A6D4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 06:01:58 +0000 (UTC)
IronPort-SDR: mdhc0sLhyb8cjuMSP4Qmg9sovdfTfeeWgSZBAJE2vl9RJkypMqGbdCq3D6qs7zl12PvnP8S6bn
 xCVv5vc38IOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="147947588"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="147947588"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 23:01:58 -0700
IronPort-SDR: rTEgJcSxIi++CMfnT+nngPUTP0N3kw4b1QGT3C0ZWXgc/CTL1WEwNKTMFvxK2405AHpjNDZaEM
 B0fV5qZj/pcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="324450203"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2020 23:01:55 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 3/4] iommu: Add iommu_aux_get_domain_for_dev()
Date: Tue, 14 Jul 2020 13:57:02 +0800
Message-Id: <20200714055703.5510-4-baolu.lu@linux.intel.com>
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

The device driver needs an API to get its aux-domain. A typical usage
scenario is:

        unsigned long pasid;
        struct iommu_domain *domain;
        struct device *dev = mdev_dev(mdev);
        struct device *iommu_device = vfio_mdev_get_iommu_device(dev);

        domain = iommu_aux_get_domain_for_dev(dev);
        if (!domain)
                return -ENODEV;

        pasid = iommu_aux_get_pasid(domain, iommu_device);
        if (pasid <= 0)
                return -EINVAL;

         /* Program the device context */
         ....

This adds an API for such use case.

Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 18 ++++++++++++++++++
 include/linux/iommu.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cad5a19ebf22..434bf42b6b9b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2817,6 +2817,24 @@ void iommu_aux_detach_group(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_aux_detach_group);
 
+struct iommu_domain *iommu_aux_get_domain_for_dev(struct device *dev)
+{
+	struct iommu_domain *domain = NULL;
+	struct iommu_group *group;
+
+	group = iommu_group_get(dev);
+	if (!group)
+		return NULL;
+
+	if (group->aux_domain_attached)
+		domain = group->domain;
+
+	iommu_group_put(group);
+
+	return domain;
+}
+EXPORT_SYMBOL_GPL(iommu_aux_get_domain_for_dev);
+
 /**
  * iommu_sva_bind_device() - Bind a process address space to a device
  * @dev: the device
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9506551139ab..cda6cef7579e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -639,6 +639,7 @@ int iommu_aux_attach_group(struct iommu_domain *domain,
 			   struct iommu_group *group, struct device *dev);
 void iommu_aux_detach_group(struct iommu_domain *domain,
 			   struct iommu_group *group, struct device *dev);
+struct iommu_domain *iommu_aux_get_domain_for_dev(struct device *dev);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
@@ -1040,6 +1041,12 @@ iommu_aux_detach_group(struct iommu_domain *domain,
 {
 }
 
+static inline struct iommu_domain *
+iommu_aux_get_domain_for_dev(struct device *dev)
+{
+	return NULL;
+}
+
 static inline struct iommu_sva *
 iommu_sva_bind_device(struct device *dev, struct mm_struct *mm, void *drvdata)
 {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
