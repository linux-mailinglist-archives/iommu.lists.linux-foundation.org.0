Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EA3064A0
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 21:01:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C656861D7;
	Wed, 27 Jan 2021 20:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJA48ZuGBWsd; Wed, 27 Jan 2021 20:01:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4E2E086287;
	Wed, 27 Jan 2021 20:01:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AB5CC013A;
	Wed, 27 Jan 2021 20:01:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D838C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AC5987391
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KMF0l-EqOQPH for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 20:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CFC0287331
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 20:01:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F21E464DA4;
 Wed, 27 Jan 2021 20:01:00 +0000 (UTC)
Subject: [PATCH RFC 6/9] iommu/io-pgtable-arm-v7s: Hook up map_sg()
From: Chuck Lever <chuck.lever@oracle.com>
To: baolu.lu@linux.intel.com
Date: Wed, 27 Jan 2021 15:01:00 -0500
Message-ID: <161177766017.1311.12086807499757808332.stgit@manet.1015granger.net>
In-Reply-To: <161177711359.1311.417185373365934204.stgit@manet.1015granger.net>
References: <161177711359.1311.417185373365934204.stgit@manet.1015granger.net>
User-Agent: StGit/0.23-29-ga622f1
MIME-Version: 1.0
Cc: isaacm@codeaurora.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, will@kernel.org
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

From: Isaac J. Manjarres <isaacm@codeaurora.org>

Implement the map_sg io-pgtable op for the ARMv7s io-pgtable
code, so that IOMMU drivers can call it when they need to map
a scatter-gather list.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c |   90 ++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 1d92ac948db7..8665dabb753b 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -545,6 +545,95 @@ static int arm_v7s_map(struct io_pgtable_ops *ops, unsigned long iova,
 	return ret;
 }
 
+static int arm_v7s_map_by_pgsize(struct io_pgtable_ops *ops,
+				 unsigned long iova, phys_addr_t paddr,
+				 size_t size, int prot, gfp_t gfp,
+				 size_t *mapped)
+{
+	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable *iop = &data->iop;
+	struct io_pgtable_cfg *cfg = &iop->cfg;
+	unsigned int min_pagesz = 1 << __ffs(cfg->pgsize_bitmap);
+	int ret;
+	size_t pgsize;
+
+	if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
+		pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%x\n",
+		       iova, &paddr, size, min_pagesz);
+		return -EINVAL;
+	}
+
+	if (WARN_ON((iova + size - 1) >= (1ULL << cfg->ias) ||
+		    (paddr + size - 1) >= (1ULL << cfg->oas)))
+		return -ERANGE;
+
+	while (size) {
+		pgsize = iommu_pgsize(cfg->pgsize_bitmap, iova | paddr, size);
+		ret = __arm_v7s_map(data, iova, paddr, pgsize, prot, 1,
+				    data->pgd, gfp);
+
+		if (iop->cfg.quirks & IO_PGTABLE_QUIRK_TLBI_ON_MAP) {
+			io_pgtable_tlb_flush_walk(&data->iop, iova, size,
+						  ARM_V7S_BLOCK_SIZE(2));
+		} else {
+			wmb();
+		}
+
+		if (ret)
+			return ret;
+
+		iova += pgsize;
+		paddr += pgsize;
+		*mapped += pgsize;
+		size -= pgsize;
+	}
+
+	return 0;
+}
+
+static int arm_v7s_map_sg(struct io_pgtable_ops *ops, unsigned long iova,
+			  struct scatterlist *sg, unsigned int nents,
+			  int iommu_prot, gfp_t gfp, size_t *mapped)
+{
+	size_t len = 0;
+	unsigned int i = 0;
+	int ret;
+	phys_addr_t start;
+
+	*mapped = 0;
+
+	/* If no access, then nothing to do */
+	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
+		return 0;
+
+	while (i <= nents) {
+		phys_addr_t s_phys = sg_phys(sg);
+
+		if (len && s_phys != start + len) {
+			ret = arm_v7s_map_by_pgsize(ops, iova + *mapped, start,
+						    len, iommu_prot, gfp,
+						    mapped);
+
+			if (ret)
+				return ret;
+
+			len = 0;
+		}
+
+		if (len) {
+			len += sg->length;
+		} else {
+			len = sg->length;
+			start = s_phys;
+		}
+
+		if (++i < nents)
+			sg = sg_next(sg);
+	}
+
+	return 0;
+}
+
 static void arm_v7s_free_pgtable(struct io_pgtable *iop)
 {
 	struct arm_v7s_io_pgtable *data = io_pgtable_to_data(iop);
@@ -783,6 +872,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map		= arm_v7s_map,
+		.map_sg		= arm_v7s_map_sg,
 		.unmap		= arm_v7s_unmap,
 		.iova_to_phys	= arm_v7s_iova_to_phys,
 	};


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
