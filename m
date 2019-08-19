Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60694C79
	for <lists.iommu@lfdr.de>; Mon, 19 Aug 2019 20:19:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 77388EBE;
	Mon, 19 Aug 2019 18:19:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D867ADF2
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:19:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7D2CA8B1
	for <iommu@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:19:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3747715A2;
	Mon, 19 Aug 2019 11:19:40 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 503363F246; 
	Mon, 19 Aug 2019 11:19:39 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 4/4] iommu/io-pgtable-arm: Prepare for TTBR1 usage
Date: Mon, 19 Aug 2019 19:19:31 +0100
Message-Id: <6596469d5fa1e918145fdd4e6b1a3ad67f7cde2e.1566238530.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1566238530.git.robin.murphy@arm.com>
References: <cover.1566238530.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Now that callers are free to use a given table for TTBR1 if they wish
(all they need do is shift the provided attributes when constructing
their final TCR value), the only remaining impediment is the address
validation on map/unmap. The fact that the LPAE address space split is
symmetric makes this easy to accommodate - by simplifying the current
range checks into explicit tests that address bits above IAS are all
zero, it then follows straightforwardly to add the inverse test to
allow the all-ones case as well.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 09cb20671fbb..f39c50356351 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -475,13 +475,13 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 	arm_lpae_iopte *ptep = data->pgd;
 	int ret, lvl = ARM_LPAE_START_LVL(data);
 	arm_lpae_iopte prot;
+	long iaext = (long)iova >> data->iop.cfg.ias;
 
 	/* If no access, then nothing to do */
 	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
 		return 0;
 
-	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
-		    paddr >= (1ULL << data->iop.cfg.oas)))
+	if (WARN_ON((iaext && ~iaext) || paddr >> data->iop.cfg.oas))
 		return -ERANGE;
 
 	prot = arm_lpae_prot_to_pte(data, iommu_prot);
@@ -647,8 +647,9 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	arm_lpae_iopte *ptep = data->pgd;
 	int lvl = ARM_LPAE_START_LVL(data);
+	long iaext = (long)iova >> data->iop.cfg.ias;
 
-	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
+	if (WARN_ON(iaext && ~iaext))
 		return 0;
 
 	return __arm_lpae_unmap(data, iova, size, lvl, ptep);
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
