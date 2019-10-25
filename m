Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A29E533D
	for <lists.iommu@lfdr.de>; Fri, 25 Oct 2019 20:08:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D7ACDCB;
	Fri, 25 Oct 2019 18:08:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9D4FDD4
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 18:08:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5927D87E
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 18:08:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14DE0492;
	Fri, 25 Oct 2019 11:08:45 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 635EE3F6C4; 
	Fri, 25 Oct 2019 11:08:44 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH v2 02/10] iommu/io-pgtable-arm: Rationalise size check
Date: Fri, 25 Oct 2019 19:08:31 +0100
Message-Id: <cc922d355329ca346958e634b84abc7f6f3011b2.1572024120.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
In-Reply-To: <cover.1572024119.git.robin.murphy@arm.com>
References: <cover.1572024119.git.robin.murphy@arm.com>
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

It makes little sense to only validate the requested size after we think
we've found a matching block size - making the check up-front is simple,
and far more logical than waiting to walk off the bottom of the table to
infer that we must have been passed a bogus size to start with.

We're missing an equivalent check on the unmap path, so add that as well
for consistency.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index afa61b32b052..2cef0f5335e4 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -392,7 +392,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
 	ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
 
 	/* If we can install a leaf entry at this level, then do so */
-	if (size == block_size && (size & cfg->pgsize_bitmap))
+	if (size == block_size)
 		return arm_lpae_init_pte(data, iova, paddr, prot, lvl, ptep);
 
 	/* We can't allocate tables at the final level */
@@ -479,6 +479,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 			phys_addr_t paddr, size_t size, int iommu_prot)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	arm_lpae_iopte *ptep = data->pgd;
 	int ret, lvl = ARM_LPAE_START_LVL(data);
 	arm_lpae_iopte prot;
@@ -487,6 +488,9 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
 		return 0;
 
+	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
+		return -EINVAL;
+
 	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
 		    paddr >= (1ULL << data->iop.cfg.oas)))
 		return -ERANGE;
@@ -652,9 +656,13 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 			     size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	arm_lpae_iopte *ptep = data->pgd;
 	int lvl = ARM_LPAE_START_LVL(data);
 
+	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
+		return 0;
+
 	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
 		return 0;
 
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
