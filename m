Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F901739A9
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 15:19:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 155038816B;
	Fri, 28 Feb 2020 14:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WpSSG-ZHoOa; Fri, 28 Feb 2020 14:19:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6087F87F0C;
	Fri, 28 Feb 2020 14:19:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 537F9C0177;
	Fri, 28 Feb 2020 14:19:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88053C0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 14:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 848CF86AB3
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 14:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uduby-jRTo1P for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 14:19:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37ADD8685A
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 14:19:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A90ED31B;
 Fri, 28 Feb 2020 06:19:09 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBACC3F7B4;
 Fri, 28 Feb 2020 06:19:08 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Subject: [PATCH] iommu/io-pgtable-arm: Fix IOVA validation for 32-bit
Date: Fri, 28 Feb 2020 14:18:55 +0000
Message-Id: <dd330453ed31099b5b3b76db02fe79d55aa9bce3.1582899080.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
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

Since we ony support the TTB1 quirk for AArch64 contexts, and
consequently only for 64-bit builds, the sign-extension aspect of the
"are all bits above IAS consistent?" check should implicitly only apply
to 64-bit IOVAs. Change the type of the cast to ensure that 32-bit longs
don't inadvertently get sign-extended, and thus considered invalid, if
they happen to be above 2GB in the TTB0 region.

Reported-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---

Logically there may also have been a UBSAN "shift greater than size of
type" warning too, but arch/arm doesn't support UBSAN_SANITIZE_ALL,
and that's now my only easy "spin up a 32-bit VM" option to hand :)

 drivers/iommu/io-pgtable-arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 983b08477e64..04fbd4bf0ff9 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -468,7 +468,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 	arm_lpae_iopte *ptep = data->pgd;
 	int ret, lvl = data->start_level;
 	arm_lpae_iopte prot;
-	long iaext = (long)iova >> cfg->ias;
+	long iaext = (s64)iova >> cfg->ias;
 
 	/* If no access, then nothing to do */
 	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
@@ -645,7 +645,7 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct io_pgtable_cfg *cfg = &data->iop.cfg;
 	arm_lpae_iopte *ptep = data->pgd;
-	long iaext = (long)iova >> cfg->ias;
+	long iaext = (s64)iova >> cfg->ias;
 
 	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
 		return 0;
-- 
2.23.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
