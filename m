Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5579F3A2214
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3C1405A2;
	Thu, 10 Jun 2021 02:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hf9wi3gffe1i; Thu, 10 Jun 2021 02:03:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D37AD4059D;
	Thu, 10 Jun 2021 02:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE55AC000B;
	Thu, 10 Jun 2021 02:03:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CEB7C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EB408333F
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KpUXCvVvgLQc for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8881183404
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:47 +0000 (UTC)
IronPort-SDR: kqn9ge7FnRoI9LL/Ws6fN+r6XqzQLdNwL4e74bnuc7CejNTgq+wZFWGqFqNwjqrcHcoSafSQxh
 rX/GppFpeoQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184283"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184283"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:03:47 -0700
IronPort-SDR: 5K/AwzEvO1gU1+/FwTEPMSOa/UZQdGqQ7WaX4rTzC4gwHutgFNHuY7pHgf+R6TLA6BPwPekIHX
 /jbdJhymKIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500490"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:03:43 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 16/23] iommu/vt-d: Add PRQ handling latency sampling
Date: Thu, 10 Jun 2021 10:01:08 +0800
Message-Id: <20210610020115.1637656-17-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
 Will Deacon <will@kernel.org>
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

The execution time for page fault request handling is performance critical
and needs to be monitored. This adds code to sample the execution time of
page fault request handling.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210520031531.712333-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/svm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index d3d028c6a727..6bff9a7f9133 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -24,6 +24,7 @@
 #include <trace/events/intel_iommu.h>
 
 #include "pasid.h"
+#include "perf.h"
 #include "../iommu-sva-lib.h"
 
 static irqreturn_t prq_event_thread(int irq, void *d);
@@ -838,8 +839,8 @@ static int prq_to_iommu_prot(struct page_req_dsc *req)
 	return prot;
 }
 
-static int
-intel_svm_prq_report(struct device *dev, struct page_req_dsc *desc)
+static int intel_svm_prq_report(struct intel_iommu *iommu, struct device *dev,
+				struct page_req_dsc *desc)
 {
 	struct iommu_fault_event event;
 
@@ -871,6 +872,12 @@ intel_svm_prq_report(struct device *dev, struct page_req_dsc *desc)
 		event.fault.prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA;
 		memcpy(event.fault.prm.private_data, desc->priv_data,
 		       sizeof(desc->priv_data));
+	} else if (dmar_latency_enabled(iommu, DMAR_LATENCY_PRQ)) {
+		/*
+		 * If the private data fields are not used by hardware, use it
+		 * to monitor the prq handle latency.
+		 */
+		event.fault.prm.private_data[0] = ktime_to_ns(ktime_get());
 	}
 
 	return iommu_report_device_fault(dev, &event);
@@ -983,7 +990,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 		 * If prq is to be handled outside iommu driver via receiver of
 		 * the fault notifiers, we skip the page response here.
 		 */
-		if (intel_svm_prq_report(sdev->dev, req))
+		if (intel_svm_prq_report(iommu, sdev->dev, req))
 			handle_bad_prq_event(iommu, req, QI_RESP_INVALID);
 
 		trace_prq_report(iommu, sdev->dev, req->qw_0, req->qw_1,
@@ -1172,6 +1179,9 @@ int intel_svm_page_response(struct device *dev,
 		if (private_present)
 			memcpy(&desc.qw2, prm->private_data,
 			       sizeof(prm->private_data));
+		else if (prm->private_data[0])
+			dmar_latency_update(iommu, DMAR_LATENCY_PRQ,
+				ktime_to_ns(ktime_get()) - prm->private_data[0]);
 
 		qi_submit_sync(iommu, &desc, 1, 0);
 	}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
