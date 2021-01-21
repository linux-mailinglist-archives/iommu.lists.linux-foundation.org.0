Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C92FDF05
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 02:53:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8083885022;
	Thu, 21 Jan 2021 01:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD2V2ZFaWQ6S; Thu, 21 Jan 2021 01:53:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A230A84906;
	Thu, 21 Jan 2021 01:53:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D0DAC013A;
	Thu, 21 Jan 2021 01:53:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A59FC013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7F57720512
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0uc0TdVaYx8 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B5272050D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
IronPort-SDR: RRT0cye/gARDOKmEHmszS9hFFVhOk5CqZqFe37F91pkH/8nIAj/v7RSUfmdM9X6oe0EId0VKLr
 iZkI9IiVVnjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197938367"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="197938367"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:53:37 -0800
IronPort-SDR: HnFbT9vwqZ+WTWj5snMY+iVOaMPzKidldjhU6V+31SpKtsuHu/Lynbws7rUxxlIP0H2T6SGX5K
 818FahgJYUeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="391762261"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 17:53:34 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/3] iommu/vt-d: Allow devices to have more than 32
 outstanding PRQ
Date: Thu, 21 Jan 2021 09:45:04 +0800
Message-Id: <20210121014505.1659166-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121014505.1659166-1-baolu.lu@linux.intel.com>
References: <20210121014505.1659166-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

The minimum per-IOMMU PRQ queue size is one 4K page, this is more entries
than the hardcoded limit of 32 in the current VT-d code. Some devices can
support up to 512 outstanding PRQs but underutilized by this limit of 32.
Although, 32 gives some rough fairness when multiple devices share the same
IOMMU PRQ queue, but far from optimal for customized use cases.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 3 ++-
 drivers/iommu/intel/svm.c   | 4 ----
 include/linux/intel-svm.h   | 5 +++++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index be85af612bc1..7dee1cb9d6c1 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -33,6 +33,7 @@
 #include <linux/iommu.h>
 #include <linux/dma-iommu.h>
 #include <linux/intel-iommu.h>
+#include <linux/intel-svm.h>
 #include <linux/syscore_ops.h>
 #include <linux/tboot.h>
 #include <linux/dmi.h>
@@ -1527,7 +1528,7 @@ static void iommu_enable_dev_iotlb(struct device_domain_info *info)
 
 	if (info->pri_supported &&
 	    (info->pasid_enabled ? pci_prg_resp_pasid_required(pdev) : 1)  &&
-	    !pci_reset_pri(pdev) && !pci_enable_pri(pdev, 32))
+	    !pci_reset_pri(pdev) && !pci_enable_pri(pdev, PRQ_DEPTH))
 		info->pri_enabled = 1;
 #endif
 	if (info->ats_supported && pci_ats_page_aligned(pdev) &&
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index f49fe715477b..77509a0a863e 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -26,8 +26,6 @@
 static irqreturn_t prq_event_thread(int irq, void *d);
 static void intel_svm_drain_prq(struct device *dev, u32 pasid);
 
-#define PRQ_ORDER 0
-
 int intel_svm_enable_prq(struct intel_iommu *iommu)
 {
 	struct page *pages;
@@ -722,8 +720,6 @@ struct page_req_dsc {
 	u64 priv_data[2];
 };
 
-#define PRQ_RING_MASK	((0x1000 << PRQ_ORDER) - 0x20)
-
 static bool access_error(struct vm_area_struct *vma, struct page_req_dsc *req)
 {
 	unsigned long requested = 0;
diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
index 39d368a810b8..5f7b5abefdec 100644
--- a/include/linux/intel-svm.h
+++ b/include/linux/intel-svm.h
@@ -21,6 +21,11 @@ struct svm_dev_ops {
 #define SVM_REQ_EXEC	(1<<1)
 #define SVM_REQ_PRIV	(1<<0)
 
+/* Page Request Queue depth */
+#define PRQ_ORDER	0
+#define PRQ_RING_MASK	((0x1000 << PRQ_ORDER) - 0x20)
+#define PRQ_DEPTH	((0x1000 << PRQ_ORDER) >> 5)
+
 /*
  * The SVM_FLAG_PRIVATE_PASID flag requests a PASID which is *not* the "main"
  * PASID for the current process. Even if a PASID already exists, a new one
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
