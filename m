Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC542FDF03
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 02:53:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EDE9187151;
	Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKHOa3ADgDBd; Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76AC287150;
	Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61E6FC013A;
	Thu, 21 Jan 2021 01:53:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB32AC013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6F082050F
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MszA6DKYAfSQ for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 01:53:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A06E2050D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:35 +0000 (UTC)
IronPort-SDR: qPifz6uz8jUULGX1noHK+SLJcSf/dWC9pIgKdbalt6p6sMKW0U4V/1O0LPJJjJti1HWTXKwLtT
 pcXb3yrys4Gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197938365"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="197938365"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:53:34 -0800
IronPort-SDR: 3k9uywaSMdFyyUz24lP5uLRP7uCP4WNv3wP7iolkairLK8NJct3J3L4ui6vbBD8ln0LrPnDqV5
 6f3DtT4t2N8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="391762248"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 17:53:32 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 1/3] iommu/vt-d: Add rate limited information when PRQ
 overflows
Date: Thu, 21 Jan 2021 09:45:03 +0800
Message-Id: <20210121014505.1659166-2-baolu.lu@linux.intel.com>
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

So that the uses could get chances to know what happened.

Suggested-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 033b25886e57..f49fe715477b 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -895,6 +895,7 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 	struct intel_iommu *iommu = d;
 	struct intel_svm *svm = NULL;
 	int head, tail, handled = 0;
+	struct page_req_dsc *req;
 
 	/* Clear PPR bit before reading head/tail registers, to
 	 * ensure that we get a new interrupt if needed. */
@@ -904,7 +905,6 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 	head = dmar_readq(iommu->reg + DMAR_PQH_REG) & PRQ_RING_MASK;
 	while (head != tail) {
 		struct vm_area_struct *vma;
-		struct page_req_dsc *req;
 		struct qi_desc resp;
 		int result;
 		vm_fault_t ret;
@@ -1042,8 +1042,14 @@ static irqreturn_t prq_event_thread(int irq, void *d)
 	 * Clear the page request overflow bit and wake up all threads that
 	 * are waiting for the completion of this handling.
 	 */
-	if (readl(iommu->reg + DMAR_PRS_REG) & DMA_PRS_PRO)
+	if (readl(iommu->reg + DMAR_PRS_REG) & DMA_PRS_PRO) {
+		head = dmar_readq(iommu->reg + DMAR_PQH_REG) & PRQ_RING_MASK;
+		req = &iommu->prq[head / sizeof(*req)];
+		pr_warn_ratelimited("IOMMU: %s: Page request overflow: HEAD: %08llx %08llx",
+				    iommu->name, ((unsigned long long *)req)[0],
+				    ((unsigned long long *)req)[1]);
 		writel(DMA_PRS_PRO, iommu->reg + DMAR_PRS_REG);
+	}
 
 	if (!completion_done(&iommu->prq_complete))
 		complete(&iommu->prq_complete);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
