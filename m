Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BCA51C16
	for <lists.iommu@lfdr.de>; Mon, 24 Jun 2019 22:14:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F183FDB4;
	Mon, 24 Jun 2019 20:14:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A010DA7
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 20:14:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1E80B7FB
	for <iommu@lists.linux-foundation.org>;
	Mon, 24 Jun 2019 20:14:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jun 2019 13:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="336610673"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga005.jf.intel.com with ESMTP; 24 Jun 2019 13:14:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, LKML <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org
Subject: [PATCH] irq_remapping/vt-d: cleanup unused variable
Date: Mon, 24 Jun 2019 13:17:42 -0700
Message-Id: <1561407462-23083-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.2 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Linux IRQ number virq is not used in IRTE allocation. Remove it.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel_irq_remapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_irq_remapping.c
index 4160aa9..4786ca0 100644
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@ -101,7 +101,7 @@ static void init_ir_status(struct intel_iommu *iommu)
 		iommu->flags |= VTD_FLAG_IRQ_REMAP_PRE_ENABLED;
 }
 
-static int alloc_irte(struct intel_iommu *iommu, int irq,
+static int alloc_irte(struct intel_iommu *iommu,
 		      struct irq_2_iommu *irq_iommu, u16 count)
 {
 	struct ir_table *table = iommu->ir_table;
@@ -1374,7 +1374,7 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
 		goto out_free_parent;
 
 	down_read(&dmar_global_lock);
-	index = alloc_irte(iommu, virq, &data->irq_2_iommu, nr_irqs);
+	index = alloc_irte(iommu, &data->irq_2_iommu, nr_irqs);
 	up_read(&dmar_global_lock);
 	if (index < 0) {
 		pr_warn("Failed to allocate IRTE\n");
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
