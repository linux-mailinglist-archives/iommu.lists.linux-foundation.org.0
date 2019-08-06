Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4180182871
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 02:15:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E510CD80;
	Tue,  6 Aug 2019 00:15:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEDEEB7D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 00:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B76384C3
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 00:15:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 17:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="373246767"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2019 17:15:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/2] iommu/vt-d: Detach domain before using a private one
Date: Tue,  6 Aug 2019 08:14:08 +0800
Message-Id: <20190806001409.3293-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	Alex Williamson <alex.williamson@redhat.com>, jacob.jun.pan@intel.com
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

When the default domain of a group doesn't work for a device,
the iommu driver will try to use a private domain. The domain
which was previously attached to the device must be detached.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Fixes: 942067f1b6b97 ("iommu/vt-d: Identify default domains replaced with private")
Reported-by: Alex Williamson <alex.williamson@redhat.com>
Link: https://lkml.org/lkml/2019/8/2/1379
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 3e22fa6ae8c8..37259b7f95a7 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3449,6 +3449,7 @@ static bool iommu_need_mapping(struct device *dev)
 				dmar_domain = to_dmar_domain(domain);
 				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
 			}
+			dmar_remove_one_dev_info(dev);
 			get_private_domain_for_dev(dev);
 		}
 
@@ -4803,7 +4804,8 @@ static void dmar_remove_one_dev_info(struct device *dev)
 
 	spin_lock_irqsave(&device_domain_lock, flags);
 	info = dev->archdata.iommu;
-	__dmar_remove_one_dev_info(info);
+	if (info)
+		__dmar_remove_one_dev_info(info);
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
@@ -5281,6 +5283,7 @@ static int intel_iommu_add_device(struct device *dev)
 		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
 			ret = iommu_request_dm_for_dev(dev);
 			if (ret) {
+				dmar_remove_one_dev_info(dev);
 				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
 				domain_add_dev_info(si_domain, dev);
 				dev_info(dev,
@@ -5291,6 +5294,7 @@ static int intel_iommu_add_device(struct device *dev)
 		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
 			ret = iommu_request_dma_domain_for_dev(dev);
 			if (ret) {
+				dmar_remove_one_dev_info(dev);
 				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
 				if (!get_private_domain_for_dev(dev)) {
 					dev_warn(dev,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
