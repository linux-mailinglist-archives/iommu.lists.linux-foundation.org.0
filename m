Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3BC3A220F
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A3F4059D;
	Thu, 10 Jun 2021 02:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDsCTFx1Y1zi; Thu, 10 Jun 2021 02:03:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B6A5140599;
	Thu, 10 Jun 2021 02:03:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8F9C000B;
	Thu, 10 Jun 2021 02:03:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E598DC000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3280831AC
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anUodkZBf3y8 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:03:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4D18831A5
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:03:30 +0000 (UTC)
IronPort-SDR: o7nLXjwFLtH0k5/KW5GVXOAvxGe11DhYv1FOLCFdrpshC0cK6ZN0O6iYRlcWOZw/o1mGdhJLTr
 oLiBfSBRN8lw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184240"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184240"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:03:30 -0700
IronPort-SDR: Ag/uFiR5AwOu1VGpSDUU4KISQMyaz2kpfDCUSex3Lp8EFuSuGlOKF5n5VIcMVOM+GQnY6fFKGs
 gNqrK+Rt4JUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500406"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:03:27 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 11/23] iommu/vt-d: Report prq to io-pgfault framework
Date: Thu, 10 Jun 2021 10:01:03 +0800
Message-Id: <20210610020115.1637656-12-baolu.lu@linux.intel.com>
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

Let the IO page fault requests get handled through the io-pgfault
framework.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210520031531.712333-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/iommu.c | 14 ++++++-
 drivers/iommu/intel/svm.c   | 84 +++----------------------------------
 2 files changed, 17 insertions(+), 81 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index e78773d46d7d..c45d4946f92d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5343,6 +5343,7 @@ static int intel_iommu_enable_sva(struct device *dev)
 {
 	struct device_domain_info *info = get_domain_info(dev);
 	struct intel_iommu *iommu = info->iommu;
+	int ret;
 
 	if (!info || !iommu || dmar_disabled)
 		return -EINVAL;
@@ -5356,15 +5357,24 @@ static int intel_iommu_enable_sva(struct device *dev)
 	if (!info->pasid_enabled || !info->pri_enabled || !info->ats_enabled)
 		return -EINVAL;
 
-	return iopf_queue_add_device(iommu->iopf_queue, dev);
+	ret = iopf_queue_add_device(iommu->iopf_queue, dev);
+	if (!ret)
+		ret = iommu_register_device_fault_handler(dev, iommu_queue_iopf, dev);
+
+	return ret;
 }
 
 static int intel_iommu_disable_sva(struct device *dev)
 {
 	struct device_domain_info *info = get_domain_info(dev);
 	struct intel_iommu *iommu = info->iommu;
+	int ret;
+
+	ret = iommu_unregister_device_fault_handler(dev);
+	if (!ret)
+		ret = iopf_queue_remove_device(iommu->iopf_queue, dev);
 
-	return iopf_queue_remove_device(iommu->iopf_queue, dev);
+	return ret;
 }
 
 /*
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 4dc3ab36e9ae..ade157b64ce7 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -724,22 +724,6 @@ struct page_req_dsc {
 
 #define PRQ_RING_MASK	((0x1000 << PRQ_ORDER) - 0x20)
 
-static bool access_error(struct vm_area_struct *vma, struct page_req_dsc *req)
-{
-	unsigned long requested = 0;
-
-	if (req->exe_req)
-		requested |= VM_EXEC;
-
-	if (req->rd_req)
-		requested |= VM_READ;
-
-	if (req->wr_req)
-		requested |= VM_WRITE;
-
-	return (requested & ~vma->vm_flags) != 0;
-}
-
 static bool is_canonical_address(u64 addr)
 {
 	int shift = 64 - (__VIRTUAL_MASK_SHIFT + 1);
@@ -809,6 +793,8 @@ static void intel_svm_drain_prq(struct device *dev, u32 pasid)
 		goto prq_retry;
 	}
 
+	iopf_queue_flush_dev(dev);
+
 	/*
 	 * Perform steps described in VT-d spec CH7.10 to drain page
 	 * requests and responses in hardware.
@@ -924,61 +910,6 @@ static void handle_bad_prq_event(struct intel_iommu *iommu,
 	qi_submit_sync(iommu, &desc, 1, 0);
 }
 
-static void handle_single_prq_event(struct intel_iommu *iommu,
-				    struct mm_struct *mm,
-				    struct page_req_dsc *req)
-{
-	u64 address = (u64)req->addr << VTD_PAGE_SHIFT;
-	int result = QI_RESP_INVALID;
-	struct vm_area_struct *vma;
-	struct qi_desc desc;
-	unsigned int flags;
-	vm_fault_t ret;
-
-	/* If the mm is already defunct, don't handle faults. */
-	if (!mmget_not_zero(mm))
-		goto response;
-
-	mmap_read_lock(mm);
-	vma = find_extend_vma(mm, address);
-	if (!vma || address < vma->vm_start)
-		goto invalid;
-
-	if (access_error(vma, req))
-		goto invalid;
-
-	flags = FAULT_FLAG_USER | FAULT_FLAG_REMOTE;
-	if (req->wr_req)
-		flags |= FAULT_FLAG_WRITE;
-
-	ret = handle_mm_fault(vma, address, flags, NULL);
-	if (!(ret & VM_FAULT_ERROR))
-		result = QI_RESP_SUCCESS;
-invalid:
-	mmap_read_unlock(mm);
-	mmput(mm);
-
-response:
-	if (!(req->lpig || req->priv_data_present))
-		return;
-
-	desc.qw0 = QI_PGRP_PASID(req->pasid) |
-			QI_PGRP_DID(req->rid) |
-			QI_PGRP_PASID_P(req->pasid_present) |
-			QI_PGRP_PDP(req->priv_data_present) |
-			QI_PGRP_RESP_CODE(result) |
-			QI_PGRP_RESP_TYPE;
-	desc.qw1 = QI_PGRP_IDX(req->prg_index) |
-			QI_PGRP_LPIG(req->lpig);
-	desc.qw2 = 0;
-	desc.qw3 = 0;
-
-	if (req->priv_data_present)
-		memcpy(&desc.qw2, req->priv_data, sizeof(req->priv_data));
-
-	qi_submit_sync(iommu, &desc, 1, 0);
-}
-
 static irqreturn_t prq_event_thread(int irq, void *d)
 {
 	struct intel_svm_dev *sdev = NULL;
@@ -1049,14 +980,8 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 		 * If prq is to be handled outside iommu driver via receiver of
 		 * the fault notifiers, we skip the page response here.
 		 */
-		if (svm->flags & SVM_FLAG_GUEST_MODE) {
-			if (!intel_svm_prq_report(sdev->dev, req))
-				goto prq_advance;
-			else
-				goto bad_req;
-		}
-
-		handle_single_prq_event(iommu, svm->mm, req);
+		if (intel_svm_prq_report(sdev->dev, req))
+			handle_bad_prq_event(iommu, req, QI_RESP_INVALID);
 prq_advance:
 		head = (head + sizeof(*req)) & PRQ_RING_MASK;
 	}
@@ -1073,6 +998,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 		head = dmar_readq(iommu->reg + DMAR_PQH_REG) & PRQ_RING_MASK;
 		tail = dmar_readq(iommu->reg + DMAR_PQT_REG) & PRQ_RING_MASK;
 		if (head == tail) {
+			iopf_queue_discard_partial(iommu->iopf_queue);
 			writel(DMA_PRS_PRO, iommu->reg + DMAR_PRS_REG);
 			pr_info_ratelimited("IOMMU: %s: PRQ overflow cleared",
 					    iommu->name);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
