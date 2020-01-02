Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC912E13E
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 01:19:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA0A887404;
	Thu,  2 Jan 2020 00:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EI4RKqRgmqH; Thu,  2 Jan 2020 00:19:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4C658754B;
	Thu,  2 Jan 2020 00:19:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0D33C077D;
	Thu,  2 Jan 2020 00:19:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41131C077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2FA3085D5C
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP-NK5lq0CFE for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 00:19:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B5C1E856F4
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jan 2020 16:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,384,1571727600"; d="scan'208";a="244475919"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jan 2020 16:19:41 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 10/22] iommu/vt-d: trace: Extend map_sg trace event
Date: Thu,  2 Jan 2020 08:18:11 +0800
Message-Id: <20200102001823.21976-11-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102001823.21976-1-baolu.lu@linux.intel.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
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

Current map_sg stores trace message in a coarse manner. This
extends it so that more detailed messages could be traced.

The map_sg trace message looks like:

map_sg: dev=0000:00:17.0 [1/9] dev_addr=0xf8f90000 phys_addr=0x158051000 size=4096
map_sg: dev=0000:00:17.0 [2/9] dev_addr=0xf8f91000 phys_addr=0x15a858000 size=4096
map_sg: dev=0000:00:17.0 [3/9] dev_addr=0xf8f92000 phys_addr=0x15aa13000 size=4096
map_sg: dev=0000:00:17.0 [4/9] dev_addr=0xf8f93000 phys_addr=0x1570f1000 size=8192
map_sg: dev=0000:00:17.0 [5/9] dev_addr=0xf8f95000 phys_addr=0x15c6d0000 size=4096
map_sg: dev=0000:00:17.0 [6/9] dev_addr=0xf8f96000 phys_addr=0x157194000 size=4096
map_sg: dev=0000:00:17.0 [7/9] dev_addr=0xf8f97000 phys_addr=0x169552000 size=4096
map_sg: dev=0000:00:17.0 [8/9] dev_addr=0xf8f98000 phys_addr=0x169dde000 size=4096
map_sg: dev=0000:00:17.0 [9/9] dev_addr=0xf8f99000 phys_addr=0x148351000 size=4096

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c        |  7 +++--
 include/trace/events/intel_iommu.h | 48 ++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0d100741cf2e..fb21a7745db2 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3776,8 +3776,8 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 		return 0;
 	}
 
-	trace_map_sg(dev, iova_pfn << PAGE_SHIFT,
-		     sg_phys(sglist), size << VTD_PAGE_SHIFT);
+	for_each_sg(sglist, sg, nelems, i)
+		trace_map_sg(dev, i + 1, nelems, sg);
 
 	return nelems;
 }
@@ -3989,6 +3989,9 @@ bounce_map_sg(struct device *dev, struct scatterlist *sglist, int nelems,
 		sg_dma_len(sg) = sg->length;
 	}
 
+	for_each_sg(sglist, sg, nelems, i)
+		trace_bounce_map_sg(dev, i + 1, nelems, sg);
+
 	return nelems;
 
 out_unmap:
diff --git a/include/trace/events/intel_iommu.h b/include/trace/events/intel_iommu.h
index 54e61d456cdf..112bd06487bf 100644
--- a/include/trace/events/intel_iommu.h
+++ b/include/trace/events/intel_iommu.h
@@ -49,12 +49,6 @@ DEFINE_EVENT(dma_map, map_single,
 	TP_ARGS(dev, dev_addr, phys_addr, size)
 );
 
-DEFINE_EVENT(dma_map, map_sg,
-	TP_PROTO(struct device *dev, dma_addr_t dev_addr, phys_addr_t phys_addr,
-		 size_t size),
-	TP_ARGS(dev, dev_addr, phys_addr, size)
-);
-
 DEFINE_EVENT(dma_map, bounce_map_single,
 	TP_PROTO(struct device *dev, dma_addr_t dev_addr, phys_addr_t phys_addr,
 		 size_t size),
@@ -99,6 +93,48 @@ DEFINE_EVENT(dma_unmap, bounce_unmap_single,
 	TP_ARGS(dev, dev_addr, size)
 );
 
+DECLARE_EVENT_CLASS(dma_map_sg,
+	TP_PROTO(struct device *dev, int index, int total,
+		 struct scatterlist *sg),
+
+	TP_ARGS(dev, index, total, sg),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__field(dma_addr_t, dev_addr)
+		__field(phys_addr_t, phys_addr)
+		__field(size_t,	size)
+		__field(int, index)
+		__field(int, total)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name, dev_name(dev));
+		__entry->dev_addr = sg->dma_address;
+		__entry->phys_addr = sg_phys(sg);
+		__entry->size = sg->dma_length;
+		__entry->index = index;
+		__entry->total = total;
+	),
+
+	TP_printk("dev=%s [%d/%d] dev_addr=0x%llx phys_addr=0x%llx size=%zu",
+		  __get_str(dev_name), __entry->index, __entry->total,
+		  (unsigned long long)__entry->dev_addr,
+		  (unsigned long long)__entry->phys_addr,
+		  __entry->size)
+);
+
+DEFINE_EVENT(dma_map_sg, map_sg,
+	TP_PROTO(struct device *dev, int index, int total,
+		 struct scatterlist *sg),
+	TP_ARGS(dev, index, total, sg)
+);
+
+DEFINE_EVENT(dma_map_sg, bounce_map_sg,
+	TP_PROTO(struct device *dev, int index, int total,
+		 struct scatterlist *sg),
+	TP_ARGS(dev, index, total, sg)
+);
 #endif /* _TRACE_INTEL_IOMMU_H */
 
 /* This part must be outside protection */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
