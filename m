Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F665E8F
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 19:29:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6C79254B6;
	Thu, 11 Jul 2019 17:28:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C386530E
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C321F89B
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:53 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4DBF2216C4;
	Thu, 11 Jul 2019 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562865593;
	bh=nz8DadbCUrw7HNGlYVbl8QppcMT0N61PTvDR4LgO4ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xqr9OR8KMIdQMDx+dnts/5dG+cZfaW2rRRkbHJGAkYpiE6OmrT/KUvh+MeI/WLt+x
	2rZmKpEMt2oQPUJ50expNAXcfclY2RxthgK3VKcU7trVZRYWMBHuj7G5ncC8rl4JPr
	y24fw7PcKtbWb5ebCVFN18yQLmnIZOEZYBPF92U8=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH v2 07/19] iommu/io-pgtable: Introduce tlb_flush_walk() and
	tlb_flush_leaf()
Date: Thu, 11 Jul 2019 18:19:15 +0100
Message-Id: <20190711171927.28803-8-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711171927.28803-1-will@kernel.org>
References: <20190711171927.28803-1-will@kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Will Deacon <will@kernel.org>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, Robin Murphy <robin.murphy@arm.com>
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

In preparation for deferring TLB flushes to iommu_tlb_sync(), introduce
two new synchronous invalidation helpers to the io-pgtable API, which
allow the unmap() code to force invalidation in cases where it cannot be
deferred (e.g. when replacing a table with a block or when TLBI_ON_MAP
is set).

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/io-pgtable.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 6292ea15d674..27275575b305 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -19,17 +19,31 @@ enum io_pgtable_fmt {
 /**
  * struct iommu_flush_ops - IOMMU callbacks for TLB and page table management.
  *
- * @tlb_flush_all: Synchronously invalidate the entire TLB context.
- * @tlb_add_flush: Queue up a TLB invalidation for a virtual address range.
- * @tlb_sync:      Ensure any queued TLB invalidation has taken effect, and
- *                 any corresponding page table updates are visible to the
- *                 IOMMU.
+ * @tlb_flush_all:  Synchronously invalidate the entire TLB context.
+ * @tlb_flush_walk: Synchronously invalidate all intermediate TLB state
+ *                  (sometimes referred to as the "walk cache") for a virtual
+ *                  address range.
+ * @tlb_flush_leaf: Synchronously invalidate all leaf TLB state for a virtual
+ *                  address range.
+ * @tlb_add_flush:  Optional callback to queue up leaf TLB invalidation for a
+ *                  virtual address range.  This function exists purely as an
+ *                  optimisation for IOMMUs that cannot batch TLB invalidation
+ *                  operations efficiently and are therefore better suited to
+ *                  issuing them early rather than deferring them until
+ *                  iommu_tlb_sync().
+ * @tlb_sync:       Ensure any queued TLB invalidation has taken effect, and
+ *                  any corresponding page table updates are visible to the
+ *                  IOMMU.
  *
  * Note that these can all be called in atomic context and must therefore
  * not block.
  */
 struct iommu_flush_ops {
 	void (*tlb_flush_all)(void *cookie);
+	void (*tlb_flush_walk)(unsigned long iova, size_t size, size_t granule,
+			       void *cookie);
+	void (*tlb_flush_leaf)(unsigned long iova, size_t size, size_t granule,
+			       void *cookie);
 	void (*tlb_add_flush)(unsigned long iova, size_t size, size_t granule,
 			      bool leaf, void *cookie);
 	void (*tlb_sync)(void *cookie);
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
