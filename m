Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC94230293
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 08:21:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E53D87587;
	Tue, 28 Jul 2020 06:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyolYf0Sn1pn; Tue, 28 Jul 2020 06:21:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74C7986EAC;
	Tue, 28 Jul 2020 06:21:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C211C004D;
	Tue, 28 Jul 2020 06:21:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A8A1C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E314A2039A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3eGzTKDYz9u for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:20:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 520F92271C
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:20:57 +0000 (UTC)
IronPort-SDR: sMucZpqXeRdA/vEcb/ycHlU8KzG5wTEoiSGcLwQ7dZDjaYJ8Lf+a/aXaA5gV2l/6E7hKdteO5j
 EwcZVaXfkV3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="130719793"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="130719793"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 23:20:56 -0700
IronPort-SDR: xvjf5PtkcPQgm7AR95CxbgOgrSazgjBfu89393uir7w1aVzksYTSPS827N5MjKwSR3ajhNvl16
 2sMC42l6KL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="320274420"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 27 Jul 2020 23:20:56 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v6 12/15] vfio/type1: Add vSVA support for IOMMU-backed mdevs
Date: Mon, 27 Jul 2020 23:27:41 -0700
Message-Id: <1595917664-33276-13-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
References: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com, hao.wu@intel.com
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

Recent years, mediated device pass-through framework (e.g. vfio-mdev)
is used to achieve flexible device sharing across domains (e.g. VMs).
Also there are hardware assisted mediated pass-through solutions from
platform vendors. e.g. Intel VT-d scalable mode which supports Intel
Scalable I/O Virtualization technology. Such mdevs are called IOMMU-
backed mdevs as there are IOMMU enforced DMA isolation for such mdevs.
In kernel, IOMMU-backed mdevs are exposed to IOMMU layer by aux-domain
concept, which means mdevs are protected by an iommu domain which is
auxiliary to the domain that the kernel driver primarily uses for DMA
API. Details can be found in the KVM presentation as below:

https://events19.linuxfoundation.org/wp-content/uploads/2017/12/\
Hardware-Assisted-Mediated-Pass-Through-with-VFIO-Kevin-Tian-Intel.pdf

This patch extends NESTING_IOMMU ops to IOMMU-backed mdev devices. The
main requirement is to use the auxiliary domain associated with mdev.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
CC: Jun Tian <jun.j.tian@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
v5 -> v6:
*) add review-by from Eric Auger.

v1 -> v2:
*) check the iommu_device to ensure the handling mdev is IOMMU-backed
---
 drivers/vfio/vfio_iommu_type1.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index bf95a0f..9d8f252 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2379,20 +2379,41 @@ static int vfio_iommu_resv_refresh(struct vfio_iommu *iommu,
 	return ret;
 }
 
+static struct device *vfio_get_iommu_device(struct vfio_group *group,
+					    struct device *dev)
+{
+	if (group->mdev_group)
+		return vfio_mdev_get_iommu_device(dev);
+	else
+		return dev;
+}
+
 static int vfio_dev_bind_gpasid_fn(struct device *dev, void *data)
 {
 	struct domain_capsule *dc = (struct domain_capsule *)data;
 	unsigned long arg = *(unsigned long *)dc->data;
+	struct device *iommu_device;
+
+	iommu_device = vfio_get_iommu_device(dc->group, dev);
+	if (!iommu_device)
+		return -EINVAL;
 
-	return iommu_uapi_sva_bind_gpasid(dc->domain, dev, (void __user *)arg);
+	return iommu_uapi_sva_bind_gpasid(dc->domain, iommu_device,
+					  (void __user *)arg);
 }
 
 static int vfio_dev_unbind_gpasid_fn(struct device *dev, void *data)
 {
 	struct domain_capsule *dc = (struct domain_capsule *)data;
 	unsigned long arg = *(unsigned long *)dc->data;
+	struct device *iommu_device;
 
-	iommu_uapi_sva_unbind_gpasid(dc->domain, dev, (void __user *)arg);
+	iommu_device = vfio_get_iommu_device(dc->group, dev);
+	if (!iommu_device)
+		return -EINVAL;
+
+	iommu_uapi_sva_unbind_gpasid(dc->domain, iommu_device,
+				     (void __user *)arg);
 	return 0;
 }
 
@@ -2401,8 +2422,13 @@ static int __vfio_dev_unbind_gpasid_fn(struct device *dev, void *data)
 	struct domain_capsule *dc = (struct domain_capsule *)data;
 	struct iommu_gpasid_bind_data *unbind_data =
 				(struct iommu_gpasid_bind_data *)dc->data;
+	struct device *iommu_device;
+
+	iommu_device = vfio_get_iommu_device(dc->group, dev);
+	if (!iommu_device)
+		return -EINVAL;
 
-	iommu_sva_unbind_gpasid(dc->domain, dev, unbind_data);
+	iommu_sva_unbind_gpasid(dc->domain, iommu_device, unbind_data);
 	return 0;
 }
 
@@ -3060,8 +3086,14 @@ static int vfio_dev_cache_invalidate_fn(struct device *dev, void *data)
 {
 	struct domain_capsule *dc = (struct domain_capsule *)data;
 	unsigned long arg = *(unsigned long *)dc->data;
+	struct device *iommu_device;
+
+	iommu_device = vfio_get_iommu_device(dc->group, dev);
+	if (!iommu_device)
+		return -EINVAL;
 
-	iommu_uapi_cache_invalidate(dc->domain, dev, (void __user *)arg);
+	iommu_uapi_cache_invalidate(dc->domain, iommu_device,
+				    (void __user *)arg);
 	return 0;
 }
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
