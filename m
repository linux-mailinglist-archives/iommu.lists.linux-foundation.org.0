Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F0389BB8
	for <lists.iommu@lfdr.de>; Thu, 20 May 2021 05:17:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A2283BF8;
	Thu, 20 May 2021 03:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2eO6yA4Yizz; Thu, 20 May 2021 03:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7F583BE3;
	Thu, 20 May 2021 03:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51044C001C;
	Thu, 20 May 2021 03:17:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21E0CC0001
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 03:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113944017E
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 03:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yH34KGeVv7qO for <iommu@lists.linux-foundation.org>;
 Thu, 20 May 2021 03:17:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53671404A7
 for <iommu@lists.linux-foundation.org>; Thu, 20 May 2021 03:17:01 +0000 (UTC)
IronPort-SDR: G3I92EsPVCWdyt0fpcjshUW8y+GoMP3NVEJSBtCWlmCPCEkiO/qyHmKHakNjxlN3M84nZNw3fe
 yMR3B+QrK0fg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="286659643"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="286659643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 20:17:01 -0700
IronPort-SDR: dYbrMlEP9mgvbV6MqF4nOxQPdKmohC6NN/odaJ1EGyuE/ngO5MbU6ZpRrQ9/wsiHpJdejIdTco
 E7n9QmtAynng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395527270"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2021 20:16:59 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 07/11] iommu/vt-d: Add prq_report trace event
Date: Thu, 20 May 2021 11:15:27 +0800
Message-Id: <20210520031531.712333-8-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210520031531.712333-1-baolu.lu@linux.intel.com>
References: <20210520031531.712333-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

This adds a new trace event to track the page fault request report.
This event will provide almost all information defined in a page
request descriptor.

A sample output:
| prq_report: dmar0/0000:00:0a.0 seq# 1: rid=0x50 addr=0x559ef6f97 r---- pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 2: rid=0x50 addr=0x559ef6f9c rw--l pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 3: rid=0x50 addr=0x559ef6f98 r---- pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 4: rid=0x50 addr=0x559ef6f9d rw--l pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 5: rid=0x50 addr=0x559ef6f99 r---- pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 6: rid=0x50 addr=0x559ef6f9e rw--l pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 7: rid=0x50 addr=0x559ef6f9a r---- pasid=0x2 index=0x1
| prq_report: dmar0/0000:00:0a.0 seq# 8: rid=0x50 addr=0x559ef6f9f rw--l pasid=0x2 index=0x1

This will be helpful for I/O page fault related debugging.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/intel-iommu.h        | 29 +++++++++++++++++++++++
 include/trace/events/intel_iommu.h | 37 ++++++++++++++++++++++++++++++
 drivers/iommu/intel/svm.c          |  7 ++++++
 3 files changed, 73 insertions(+)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 222520d149c1..98b04fa9373e 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -778,6 +778,7 @@ struct intel_svm_dev {
 	struct device *dev;
 	struct intel_iommu *iommu;
 	struct iommu_sva sva;
+	unsigned long prq_seq_number;
 	u32 pasid;
 	int users;
 	u16 did;
@@ -828,4 +829,32 @@ static inline int iommu_calculate_max_sagaw(struct intel_iommu *iommu)
 #define intel_iommu_enabled (0)
 #endif
 
+static inline const char *decode_prq_descriptor(char *str, size_t size,
+		u64 dw0, u64 dw1, u64 dw2, u64 dw3)
+{
+	char *buf = str;
+	int bytes;
+
+	bytes = snprintf(buf, size,
+			 "rid=0x%llx addr=0x%llx %c%c%c%c%c pasid=0x%llx index=0x%llx",
+			 FIELD_GET(GENMASK_ULL(31, 16), dw0),
+			 FIELD_GET(GENMASK_ULL(63, 12), dw1),
+			 dw1 & BIT_ULL(0) ? 'r' : '-',
+			 dw1 & BIT_ULL(1) ? 'w' : '-',
+			 dw0 & BIT_ULL(52) ? 'x' : '-',
+			 dw0 & BIT_ULL(53) ? 'p' : '-',
+			 dw1 & BIT_ULL(2) ? 'l' : '-',
+			 FIELD_GET(GENMASK_ULL(51, 32), dw0),
+			 FIELD_GET(GENMASK_ULL(11, 3), dw1));
+
+	/* Private Data */
+	if (dw0 & BIT_ULL(9)) {
+		size -= bytes;
+		buf += bytes;
+		snprintf(buf, size, " private=0x%llx/0x%llx\n", dw2, dw3);
+	}
+
+	return str;
+}
+
 #endif
diff --git a/include/trace/events/intel_iommu.h b/include/trace/events/intel_iommu.h
index d233f2916584..e5c1ca6d16ee 100644
--- a/include/trace/events/intel_iommu.h
+++ b/include/trace/events/intel_iommu.h
@@ -15,6 +15,8 @@
 #include <linux/tracepoint.h>
 #include <linux/intel-iommu.h>
 
+#define MSG_MAX		256
+
 TRACE_EVENT(qi_submit,
 	TP_PROTO(struct intel_iommu *iommu, u64 qw0, u64 qw1, u64 qw2, u64 qw3),
 
@@ -51,6 +53,41 @@ TRACE_EVENT(qi_submit,
 		__entry->qw0, __entry->qw1, __entry->qw2, __entry->qw3
 	)
 );
+
+TRACE_EVENT(prq_report,
+	TP_PROTO(struct intel_iommu *iommu, struct device *dev,
+		 u64 dw0, u64 dw1, u64 dw2, u64 dw3,
+		 unsigned long seq),
+
+	TP_ARGS(iommu, dev, dw0, dw1, dw2, dw3, seq),
+
+	TP_STRUCT__entry(
+		__field(u64, dw0)
+		__field(u64, dw1)
+		__field(u64, dw2)
+		__field(u64, dw3)
+		__field(unsigned long, seq)
+		__string(iommu, iommu->name)
+		__string(dev, dev_name(dev))
+		__dynamic_array(char, buff, MSG_MAX)
+	),
+
+	TP_fast_assign(
+		__entry->dw0 = dw0;
+		__entry->dw1 = dw1;
+		__entry->dw2 = dw2;
+		__entry->dw3 = dw3;
+		__entry->seq = seq;
+		__assign_str(iommu, iommu->name);
+		__assign_str(dev, dev_name(dev));
+	),
+
+	TP_printk("%s/%s seq# %ld: %s",
+		__get_str(iommu), __get_str(dev), __entry->seq,
+		decode_prq_descriptor(__get_str(buff), MSG_MAX, __entry->dw0,
+				      __entry->dw1, __entry->dw2, __entry->dw3)
+	)
+);
 #endif /* _TRACE_INTEL_IOMMU_H */
 
 /* This part must be outside protection */
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index ade157b64ce7..d3d028c6a727 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -21,6 +21,7 @@
 #include <linux/ioasid.h>
 #include <asm/page.h>
 #include <asm/fpu/api.h>
+#include <trace/events/intel_iommu.h>
 
 #include "pasid.h"
 #include "../iommu-sva-lib.h"
@@ -976,12 +977,18 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 				goto bad_req;
 		}
 
+		sdev->prq_seq_number++;
+
 		/*
 		 * If prq is to be handled outside iommu driver via receiver of
 		 * the fault notifiers, we skip the page response here.
 		 */
 		if (intel_svm_prq_report(sdev->dev, req))
 			handle_bad_prq_event(iommu, req, QI_RESP_INVALID);
+
+		trace_prq_report(iommu, sdev->dev, req->qw_0, req->qw_1,
+				 req->priv_data[0], req->priv_data[1],
+				 sdev->prq_seq_number);
 prq_advance:
 		head = (head + sizeof(*req)) & PRQ_RING_MASK;
 	}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
