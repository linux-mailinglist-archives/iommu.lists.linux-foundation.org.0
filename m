Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C01FD228E47
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 04:48:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B4E18860D;
	Wed, 22 Jul 2020 02:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUzyOtL7tOJ8; Wed, 22 Jul 2020 02:48:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 40BB788609;
	Wed, 22 Jul 2020 02:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E0B6C016F;
	Wed, 22 Jul 2020 02:48:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A446EC016F
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0ACD86A2D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_l3Z9NIlUld for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 02:48:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1545785F7C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 02:48:42 +0000 (UTC)
IronPort-SDR: 7JW86zbKjIO3/GpDrxUxgOt+ddX/LVlp73W4+VCceE7ZVuyhpbrRO6aFzb5Hgya5ErduC6qGiS
 oI2pOn0NclDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="148199450"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="148199450"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 19:48:41 -0700
IronPort-SDR: scpZNHuQAquY5BZHrw9dys84tZRFSJT1mTDvjCfvT4iE9aiLMKrVCQeJnxjMbMNMNFXEQ+j5Fi
 TjfLfAcqfu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="392542213"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2020 19:48:40 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/vt-d: Rename intel-pasid.h to pasid.h
Date: Wed, 22 Jul 2020 10:43:48 +0800
Message-Id: <20200722024348.5893-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

As Intel VT-d files have been move to its own subdirectory, the prefix
makes no sense.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/debugfs.c                  | 2 +-
 drivers/iommu/intel/iommu.c                    | 2 +-
 drivers/iommu/intel/pasid.c                    | 2 +-
 drivers/iommu/intel/{intel-pasid.h => pasid.h} | 2 +-
 drivers/iommu/intel/svm.c                      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/iommu/intel/{intel-pasid.h => pasid.h} (98%)

diff --git a/drivers/iommu/intel/debugfs.c b/drivers/iommu/intel/debugfs.c
index cf1ebb98e418..efea7f02abd9 100644
--- a/drivers/iommu/intel/debugfs.c
+++ b/drivers/iommu/intel/debugfs.c
@@ -15,7 +15,7 @@
 
 #include <asm/irq_remapping.h>
 
-#include "intel-pasid.h"
+#include "pasid.h"
 
 struct tbl_walk {
 	u16 bus;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5228f2c18a90..60de9daea62e 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -48,7 +48,7 @@
 #include <trace/events/intel_iommu.h>
 
 #include "../irq_remapping.h"
-#include "intel-pasid.h"
+#include "pasid.h"
 
 #define ROOT_SIZE		VTD_PAGE_SIZE
 #define CONTEXT_SIZE		VTD_PAGE_SIZE
diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index fa0154cce537..e6faedf42fd4 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -19,7 +19,7 @@
 #include <linux/pci-ats.h>
 #include <linux/spinlock.h>
 
-#include "intel-pasid.h"
+#include "pasid.h"
 
 /*
  * Intel IOMMU system wide PASID name space:
diff --git a/drivers/iommu/intel/intel-pasid.h b/drivers/iommu/intel/pasid.h
similarity index 98%
rename from drivers/iommu/intel/intel-pasid.h
rename to drivers/iommu/intel/pasid.h
index c5318d40e0fa..c9850766c3a9 100644
--- a/drivers/iommu/intel/intel-pasid.h
+++ b/drivers/iommu/intel/pasid.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * intel-pasid.h - PASID idr, table and entry header
+ * pasid.h - PASID idr, table and entry header
  *
  * Copyright (C) 2018 Intel Corporation
  *
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 85ce8daa3177..442623ac4b47 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -20,7 +20,7 @@
 #include <linux/ioasid.h>
 #include <asm/page.h>
 
-#include "intel-pasid.h"
+#include "pasid.h"
 
 static irqreturn_t prq_event_thread(int irq, void *d);
 static void intel_svm_drain_prq(struct device *dev, int pasid);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
