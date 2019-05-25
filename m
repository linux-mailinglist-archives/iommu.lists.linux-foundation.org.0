Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1412A317
	for <lists.iommu@lfdr.de>; Sat, 25 May 2019 07:49:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5ABFEDD2;
	Sat, 25 May 2019 05:49:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 99E26D93
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:49:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30C51A9
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:49:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2019 22:49:13 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga006.fm.intel.com with ESMTP; 24 May 2019 22:49:10 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v4 13/15] iommu/vt-d: Remove startup parameter from
	device_def_domain_type()
Date: Sat, 25 May 2019 13:41:34 +0800
Message-Id: <20190525054136.27810-14-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190525054136.27810-1-baolu.lu@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

It isn't used anywhere. Remove it to make code concise.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 59cd8b7e793f..ba425db8cfc6 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2974,7 +2974,7 @@ static bool device_is_rmrr_locked(struct device *dev)
  *  - IOMMU_DOMAIN_IDENTITY: device requires an identical mapping domain
  *  - 0: both identity and dynamic domains work for this device
  */
-static int device_def_domain_type(struct device *dev, int startup)
+static int device_def_domain_type(struct device *dev)
 {
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
@@ -3028,16 +3028,16 @@ static int device_def_domain_type(struct device *dev, int startup)
 			IOMMU_DOMAIN_IDENTITY : 0;
 }
 
-static inline int iommu_should_identity_map(struct device *dev, int startup)
+static inline int iommu_should_identity_map(struct device *dev)
 {
-	return device_def_domain_type(dev, startup) == IOMMU_DOMAIN_IDENTITY;
+	return device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY;
 }
 
 static int __init dev_prepare_static_identity_mapping(struct device *dev, int hw)
 {
 	int ret;
 
-	if (!iommu_should_identity_map(dev, 1))
+	if (!iommu_should_identity_map(dev))
 		return 0;
 
 	ret = domain_add_dev_info(si_domain, dev);
@@ -4590,7 +4590,7 @@ static int device_notifier(struct notifier_block *nb,
 
 		dmar_remove_one_dev_info(dev);
 	} else if (action == BUS_NOTIFY_ADD_DEVICE) {
-		if (iommu_should_identity_map(dev, 1))
+		if (iommu_should_identity_map(dev))
 			domain_add_dev_info(si_domain, dev);
 	}
 
@@ -5551,7 +5551,7 @@ static int intel_iommu_add_device(struct device *dev)
 	domain = iommu_get_domain_for_dev(dev);
 	dmar_domain = to_dmar_domain(domain);
 	if (domain->type == IOMMU_DOMAIN_DMA) {
-		if (device_def_domain_type(dev, 1) == IOMMU_DOMAIN_IDENTITY) {
+		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
 			ret = iommu_request_dm_for_dev(dev);
 			if (ret) {
 				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
@@ -5564,7 +5564,7 @@ static int intel_iommu_add_device(struct device *dev)
 			return -ENODEV;
 		}
 	} else {
-		if (device_def_domain_type(dev, 1) == IOMMU_DOMAIN_DMA) {
+		if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {
 			ret = iommu_request_dma_domain_for_dev(dev);
 			if (ret) {
 				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
