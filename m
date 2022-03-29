Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA14EA73C
	for <lists.iommu@lfdr.de>; Tue, 29 Mar 2022 07:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D0C641799;
	Tue, 29 Mar 2022 05:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kWqR8Twb6JRA; Tue, 29 Mar 2022 05:40:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4A78941763;
	Tue, 29 Mar 2022 05:40:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12EDDC0073;
	Tue, 29 Mar 2022 05:40:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EED7C0012
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 05:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C0B140377
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 05:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o424x3EefsIk for <iommu@lists.linux-foundation.org>;
 Tue, 29 Mar 2022 05:40:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C789640588
 for <iommu@lists.linux-foundation.org>; Tue, 29 Mar 2022 05:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648532452; x=1680068452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfGjVHRgrpt8QUxiPQxKQ7422++u6wuqZXu+sum80fQ=;
 b=B4aSTVmffRyGJjLRBEjaJZ31AqWmSjJ4sM4EUkFsEvBPJ5eo3PjhWS59
 WEJdWAoKp5+QDwQrjWWpsijWIY1YLVpAD3WjauHAkIWyzt2QgGYe9EnUf
 DnwjXmiBhfpQiu6fxCl1WSdsr5jAu0hE7gU84XBl7sVEN5bfIwLgt6Gp7
 pVv6nSmNfK++FfLpBxqh71N+VnaGqiUQz+ZVXRDFYQ/IfGMyN/+QVvZ5Q
 SnSTm6bQ8rKlDpK/MCqu7m6bPQF7IpQsZJF9T1zoZAbKy7v4xzAQp4U5m
 YL/HJBJE2nQzrP+bnTbdSljLanPLtvoebZN5mLBoNlgrvWThMIL66ozzn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239099199"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="239099199"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 22:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="694603691"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2022 22:40:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH RFC v2 11/11] iommu: Rename iommu-sva-lib.{c,h}
Date: Tue, 29 Mar 2022 13:38:00 +0800
Message-Id: <20220329053800.3049561-12-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329053800.3049561-1-baolu.lu@linux.intel.com>
References: <20220329053800.3049561-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>
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

Rename iommu-sva-lib.c[h] to iommu-sva.c[h] as it contains all code
for SVA implementation in iommu core.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/{iommu-sva-lib.h => iommu-sva.h}  | 0
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 2 +-
 drivers/iommu/intel/iommu.c                     | 2 +-
 drivers/iommu/intel/svm.c                       | 2 +-
 drivers/iommu/io-pgfault.c                      | 2 +-
 drivers/iommu/{iommu-sva-lib.c => iommu-sva.c}  | 2 +-
 drivers/iommu/iommu.c                           | 2 +-
 drivers/iommu/Makefile                          | 2 +-
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename drivers/iommu/{iommu-sva-lib.h => iommu-sva.h} (100%)
 rename drivers/iommu/{iommu-sva-lib.c => iommu-sva.c} (99%)

diff --git a/drivers/iommu/iommu-sva-lib.h b/drivers/iommu/iommu-sva.h
similarity index 100%
rename from drivers/iommu/iommu-sva-lib.h
rename to drivers/iommu/iommu-sva.h
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 5591321f9e11..a13543aa9df4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -9,7 +9,7 @@
 #include <linux/slab.h>
 
 #include "arm-smmu-v3.h"
-#include "../../iommu-sva-lib.h"
+#include "../../iommu-sva.h"
 #include "../../io-pgtable-arm.h"
 
 struct arm_smmu_mmu_notifier {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 543d3ef1c102..ca2bd17eec41 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -31,7 +31,7 @@
 #include <linux/amba/bus.h>
 
 #include "arm-smmu-v3.h"
-#include "../../iommu-sva-lib.h"
+#include "../../iommu-sva.h"
 
 static bool disable_bypass = true;
 module_param(disable_bypass, bool, 0444);
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 1d6a62512bca..57a3d54c414b 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -27,7 +27,7 @@
 #include <linux/tboot.h>
 
 #include "../irq_remapping.h"
-#include "../iommu-sva-lib.h"
+#include "../iommu-sva.h"
 #include "pasid.h"
 #include "cap_audit.h"
 
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index c76b99b46626..b6b83ca705d5 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -25,7 +25,7 @@
 
 #include "pasid.h"
 #include "perf.h"
-#include "../iommu-sva-lib.h"
+#include "../iommu-sva.h"
 
 static irqreturn_t prq_event_thread(int irq, void *d);
 static void intel_svm_drain_prq(struct device *dev, u32 pasid);
diff --git a/drivers/iommu/io-pgfault.c b/drivers/iommu/io-pgfault.c
index 159e4f107fe3..5468993c8c6c 100644
--- a/drivers/iommu/io-pgfault.c
+++ b/drivers/iommu/io-pgfault.c
@@ -11,7 +11,7 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 
-#include "iommu-sva-lib.h"
+#include "iommu-sva.h"
 
 /**
  * struct iopf_queue - IO Page Fault queue
diff --git a/drivers/iommu/iommu-sva-lib.c b/drivers/iommu/iommu-sva.c
similarity index 99%
rename from drivers/iommu/iommu-sva-lib.c
rename to drivers/iommu/iommu-sva.c
index a53574f9559a..dbe4b9958e48 100644
--- a/drivers/iommu/iommu-sva-lib.c
+++ b/drivers/iommu/iommu-sva.c
@@ -7,7 +7,7 @@
 #include <linux/slab.h>
 #include <linux/sched/mm.h>
 
-#include "iommu-sva-lib.h"
+#include "iommu-sva.h"
 
 static DEFINE_MUTEX(iommu_sva_lock);
 static DECLARE_IOASID_SET(iommu_sva_pasid);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6b51ead9d63b..f4a5d6351421 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -27,7 +27,7 @@
 #include <linux/cc_platform.h>
 #include <trace/events/iommu.h>
 
-#include "iommu-sva-lib.h"
+#include "iommu-sva.h"
 
 static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 44475a9b3eea..c1763476162b 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -27,6 +27,6 @@ obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
 obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
 obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
-obj-$(CONFIG_IOMMU_SVA) += iommu-sva-lib.o io-pgfault.o
+obj-$(CONFIG_IOMMU_SVA) += iommu-sva.o io-pgfault.o
 obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
 obj-$(CONFIG_APPLE_DART) += apple-dart.o
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
