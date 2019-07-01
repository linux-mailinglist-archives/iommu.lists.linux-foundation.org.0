Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837C2B0CD
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 10:57:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5E1F164A;
	Mon, 27 May 2019 08:57:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12C8C1632
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A43187C
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96568BCD24;
	Mon, 27 May 2019 08:56:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D6AE5D978;
	Mon, 27 May 2019 08:56:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Subject: [PATCH v4 8/8] iommu/vt-d: Differentiate relaxable and non relaxable
	RMRRs
Date: Mon, 27 May 2019 10:55:41 +0200
Message-Id: <20190527085541.5294-9-eric.auger@redhat.com>
In-Reply-To: <20190527085541.5294-1-eric.auger@redhat.com>
References: <20190527085541.5294-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 27 May 2019 08:56:48 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Now we have a new IOMMU_RESV_DIRECT_RELAXABLE reserved memory
region type, let's report USB and GFX RMRRs as relaxable ones.

We introduce a new device_rmrr_is_relaxable() helper to check
whether the rmrr belongs to the relaxable category.

This allows to have a finer reporting at IOMMU API level of
reserved memory regions. This will be exploitable by VFIO to
define the usable IOVA range and detect potential conflicts
between the guest physical address space and host reserved
regions.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- introduce device_rmrr_is_relaxable and reshuffle the comments
---
 drivers/iommu/intel-iommu.c | 55 +++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index a36604f4900f..ed24a11accb8 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2920,6 +2920,36 @@ static bool device_has_rmrr(struct device *dev)
 	return false;
 }
 
+/*
+ * device_rmrr_is_relaxable - Test whether the RMRR of this device
+ * is relaxable (ie. is allowed to be not enforced under some conditions)
+ *
+ * @dev: device handle
+ *
+ * We assume that PCI USB devices with RMRRs have them largely
+ * for historical reasons and that the RMRR space is not actively used post
+ * boot.  This exclusion may change if vendors begin to abuse it.
+ *
+ * The same exception is made for graphics devices, with the requirement that
+ * any use of the RMRR regions will be torn down before assigning the device
+ * to a guest.
+ *
+ * Return: true if the RMRR is relaxable
+ */
+static bool device_rmrr_is_relaxable(struct device *dev)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(dev))
+		return false;
+
+	pdev = to_pci_dev(dev);
+	if (IS_USB_DEVICE(pdev) || IS_GFX_DEVICE(pdev))
+		return true;
+	else
+		return false;
+}
+
 /*
  * There are a couple cases where we need to restrict the functionality of
  * devices associated with RMRRs.  The first is when evaluating a device for
@@ -2934,25 +2964,16 @@ static bool device_has_rmrr(struct device *dev)
  * We therefore prevent devices associated with an RMRR from participating in
  * the IOMMU API, which eliminates them from device assignment.
  *
- * In both cases we assume that PCI USB devices with RMRRs have them largely
- * for historical reasons and that the RMRR space is not actively used post
- * boot.  This exclusion may change if vendors begin to abuse it.
- *
- * The same exception is made for graphics devices, with the requirement that
- * any use of the RMRR regions will be torn down before assigning the device
- * to a guest.
+ * In both cases, devices which have relaxable RMRRs are not concerned by this
+ * restriction. See device_rmrr_is_relaxable comment.
  */
 static bool device_is_rmrr_locked(struct device *dev)
 {
 	if (!device_has_rmrr(dev))
 		return false;
 
-	if (dev_is_pci(dev)) {
-		struct pci_dev *pdev = to_pci_dev(dev);
-
-		if (IS_USB_DEVICE(pdev) || IS_GFX_DEVICE(pdev))
-			return false;
-	}
+	if (device_rmrr_is_relaxable(dev))
+		return false;
 
 	return true;
 }
@@ -5494,6 +5515,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 		for_each_active_dev_scope(rmrr->devices, rmrr->devices_cnt,
 					  i, i_dev) {
 			struct iommu_resv_region *resv;
+			enum iommu_resv_type type;
 			size_t length;
 
 			if (i_dev != device &&
@@ -5501,9 +5523,12 @@ static void intel_iommu_get_resv_regions(struct device *device,
 				continue;
 
 			length = rmrr->end_address - rmrr->base_address + 1;
+
+			type = device_rmrr_is_relaxable(device) ?
+				IOMMU_RESV_DIRECT_RELAXABLE : IOMMU_RESV_DIRECT;
+
 			resv = iommu_alloc_resv_region(rmrr->base_address,
-						       length, prot,
-						       IOMMU_RESV_DIRECT,
+						       length, prot, type,
 						       GFP_ATOMIC);
 			if (!resv)
 				break;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
