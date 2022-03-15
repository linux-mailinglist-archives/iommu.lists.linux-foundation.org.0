Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2814D9380
	for <lists.iommu@lfdr.de>; Tue, 15 Mar 2022 06:04:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CD6E40909;
	Tue, 15 Mar 2022 05:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAR1QMRF9Eay; Tue, 15 Mar 2022 05:04:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02288408F3;
	Tue, 15 Mar 2022 05:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4C05C0012;
	Tue, 15 Mar 2022 05:04:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E3CFC0033
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 05:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E3A408FA
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 05:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dC8lDxCROttf for <iommu@lists.linux-foundation.org>;
 Tue, 15 Mar 2022 05:04:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2F64408F3
 for <iommu@lists.linux-foundation.org>; Tue, 15 Mar 2022 05:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647320640; x=1678856640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6uSpqGl1pbsEqnfIlo3vVDu6SwoYiBP9Hzf6kLLgWR8=;
 b=Jv+/4UW86NbK6+ey4JYghEwnlIU6VL1ZB9TUYuOG46VozQfdnyk4urnA
 4eMXoy8W5bQM+xYnQnrqKqmAsCE5mhMDN8RVKYj4HHpwZc7T3zFYvl6E4
 NS+Zp0kHQAE4S3tuU0wwRnRFbgcTuV/ELM5cCANHwbhZi8strsOGtm0vF
 O/Ptskybnhe7Yc9y/YQa1Nrtx23xR1XuoMg7rZG6E24eKSR/7UVSVH/NV
 iZf8lWsTcVn2drYHOho6LtVjjytDdXgy67PQSsaWINyLj3SgJBvFkTw41
 9G8gasAgd8xh2y5wAKleWb2DLtsgF8BAnbFnXrpmY+9JGyFtBu/JTpi6y g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342640157"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="342640157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 22:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="580383598"
Received: from otc-wp-03.jf.intel.com (HELO jacob-builder.jf.intel.com)
 ([10.54.39.79])
 by orsmga001.jf.intel.com with ESMTP; 14 Mar 2022 22:04:00 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH v2 9/9] dmaengine: idxd: separate user and kernel pasid
 enabling
Date: Mon, 14 Mar 2022 22:07:13 -0700
Message-Id: <20220315050713.2000518-10-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315050713.2000518-1-jacob.jun.pan@linux.intel.com>
References: <20220315050713.2000518-1-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Tony Luck <tony.luck@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Raj Ashok <ashok.raj@intel.com>, "Zanussi,
 Tom" <tom.zanussi@intel.com>, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Dan Williams <dan.j.williams@intel.com>
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

From: Dave Jiang <dave.jiang@intel.com>

The idxd driver always gated the pasid enabling under a single knob and
this assumption is incorrect. The pasid used for kernel operation can be
independently toggled and has no dependency on the user pasid (and vice
versa). Split the two so they are independent "enabled" flags.

Signed-off-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/dma/idxd/cdev.c |  4 ++--
 drivers/dma/idxd/idxd.h |  6 ++++++
 drivers/dma/idxd/init.c | 30 ++++++++++++++++++------------
 3 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/idxd/cdev.c b/drivers/dma/idxd/cdev.c
index 312ec37ebf91..addaebca7683 100644
--- a/drivers/dma/idxd/cdev.c
+++ b/drivers/dma/idxd/cdev.c
@@ -99,7 +99,7 @@ static int idxd_cdev_open(struct inode *inode, struct file *filp)
 	ctx->wq = wq;
 	filp->private_data = ctx;
 
-	if (device_pasid_enabled(idxd)) {
+	if (device_user_pasid_enabled(idxd)) {
 		sva = iommu_sva_bind_device(dev, current->mm);
 		if (IS_ERR(sva)) {
 			rc = PTR_ERR(sva);
@@ -152,7 +152,7 @@ static int idxd_cdev_release(struct inode *node, struct file *filep)
 	if (wq_shared(wq)) {
 		idxd_device_drain_pasid(idxd, ctx->pasid);
 	} else {
-		if (device_pasid_enabled(idxd)) {
+		if (device_user_pasid_enabled(idxd)) {
 			/* The wq disable in the disable pasid function will drain the wq */
 			rc = idxd_wq_disable_pasid(wq);
 			if (rc < 0)
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index a09ab4a6e1c1..190b08bd7c08 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -239,6 +239,7 @@ enum idxd_device_flag {
 	IDXD_FLAG_CONFIGURABLE = 0,
 	IDXD_FLAG_CMD_RUNNING,
 	IDXD_FLAG_PASID_ENABLED,
+	IDXD_FLAG_USER_PASID_ENABLED,
 };
 
 struct idxd_dma_dev {
@@ -468,6 +469,11 @@ static inline bool device_pasid_enabled(struct idxd_device *idxd)
 	return test_bit(IDXD_FLAG_PASID_ENABLED, &idxd->flags);
 }
 
+static inline bool device_user_pasid_enabled(struct idxd_device *idxd)
+{
+	return test_bit(IDXD_FLAG_USER_PASID_ENABLED, &idxd->flags);
+}
+
 static inline bool device_swq_supported(struct idxd_device *idxd)
 {
 	return (support_enqcmd && device_pasid_enabled(idxd));
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 5d1f8dd4abf6..981150b7d09b 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -500,16 +500,19 @@ static int idxd_probe(struct idxd_device *idxd)
 
 	if (IS_ENABLED(CONFIG_INTEL_IDXD_SVM) && sva) {
 		rc = iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_SVA);
-		if (rc == 0) {
-			rc = idxd_enable_system_pasid(idxd);
-			if (rc < 0) {
-				iommu_dev_disable_feature(dev, IOMMU_DEV_FEAT_SVA);
-				dev_warn(dev, "Failed to enable PASID. No SVA support: %d\n", rc);
-			} else {
-				set_bit(IDXD_FLAG_PASID_ENABLED, &idxd->flags);
-			}
-		} else {
+		if (rc) {
+			/*
+			 * Do not bail here since legacy DMA is still
+			 * supported, both user and in-kernel DMA with
+			 * PASID rely on SVA feature.
+			 */
 			dev_warn(dev, "Unable to turn on SVA feature.\n");
+		} else {
+			set_bit(IDXD_FLAG_USER_PASID_ENABLED, &idxd->flags);
+			if (idxd_enable_system_pasid(idxd))
+				dev_warn(dev, "No in-kernel DMA with PASID.\n");
+			else
+				set_bit(IDXD_FLAG_PASID_ENABLED, &idxd->flags);
 		}
 	}
 	idxd_read_caps(idxd);
@@ -545,7 +548,8 @@ static int idxd_probe(struct idxd_device *idxd)
  err:
 	if (device_pasid_enabled(idxd))
 		idxd_disable_system_pasid(idxd);
-	iommu_dev_disable_feature(dev, IOMMU_DEV_FEAT_SVA);
+	if (device_user_pasid_enabled(idxd) || device_pasid_enabled(idxd))
+		iommu_dev_disable_feature(dev, IOMMU_DEV_FEAT_SVA);
 	return rc;
 }
 
@@ -558,7 +562,8 @@ static void idxd_cleanup(struct idxd_device *idxd)
 	idxd_cleanup_internals(idxd);
 	if (device_pasid_enabled(idxd))
 		idxd_disable_system_pasid(idxd);
-	iommu_dev_disable_feature(dev, IOMMU_DEV_FEAT_SVA);
+	if (device_user_pasid_enabled(idxd) || device_pasid_enabled(idxd))
+		iommu_dev_disable_feature(dev, IOMMU_DEV_FEAT_SVA);
 }
 
 static int idxd_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -677,7 +682,8 @@ static void idxd_remove(struct pci_dev *pdev)
 	free_irq(irq_entry->vector, irq_entry);
 	pci_free_irq_vectors(pdev);
 	pci_iounmap(pdev, idxd->reg_base);
-	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
+	if (device_user_pasid_enabled(idxd) || device_pasid_enabled(idxd))
+		iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
 	pci_disable_device(pdev);
 	destroy_workqueue(idxd->wq);
 	perfmon_pmu_remove(idxd);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
