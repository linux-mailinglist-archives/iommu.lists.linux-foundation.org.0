Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 006063125D0
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:10:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B319B822C6;
	Sun,  7 Feb 2021 16:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zH0IF75b9wIs; Sun,  7 Feb 2021 16:09:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BC1D585A9E;
	Sun,  7 Feb 2021 16:09:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7E5AC013A;
	Sun,  7 Feb 2021 16:09:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B71DBC013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7903420418
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1pShDL+GBxj for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id B29A720356
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9exQlU2bM+z89vz4InpfIN+OgEoSYW+vKDhpQvUzWEc=; b=fmNr0UgbkUNuM/6xYoYIl1Rrvu
 NjXGGNO7rb6ADI6vT40u/zONLvuSngV72/jHsqgPSgPdAN+wEUDyiIdoRTVpEZmLqJSlRXchWUKGA
 eluKXm1mFdJJn++1DfZvR2YO+X0JUshTE3gzwf6gjtlHNPTzbVGePGmIGFxgBXOxNKJfI1KkyC2Pb
 nMwmcXMNzuG2JOFRxdZzeeKNS4HQwVd/0Q/gujMYFOHIZXrOk3w8PuAmWcqmAE1DUqnlU6d7QuM6s
 o+Kwv+YAPHNTcLEXNvfSe7Cnz+d04XyeVlR7knzJwEz+D3x/VVO20+JVl3mfPkAXYtMUG2hKTNqpL
 Zvtma1Pw==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md9-004tnJ-Fd; Sun, 07 Feb 2021 16:09:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 6/8] swiotlb: lift the double initialization protection from
 xen-swiotlb
Date: Sun,  7 Feb 2021 17:09:32 +0100
Message-Id: <20210207160934.2955931-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
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

Lift the double initialization protection from xen-swiotlb to the core
code to avoid exposing too many swiotlb internals.  Also upgrade the
check to a warning as it should not happen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 -------
 kernel/dma/swiotlb.c      | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 6e0f2c5ecd1a2f..e6c8556e879ee6 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -172,12 +172,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	bytes = nslabs << IO_TLB_SHIFT;
 	order = get_order(bytes);
 
-	/*
-	 * IO TLB memory already allocated. Just use it.
-	 */
-	if (io_tlb_start != 0)
-		goto end;
-
 	/*
 	 * Get IO TLB memory from any location.
 	 */
@@ -232,7 +226,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 	} else
 		rc = swiotlb_late_init_with_tbl(start, nslabs);
 
-end:
 	if (!rc)
 		swiotlb_set_max_segment(PAGE_SIZE);
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index adcc3c87e10078..a3737961ae5769 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -224,6 +224,10 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 	unsigned long i, bytes;
 	size_t alloc_size;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
@@ -355,6 +359,10 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
 	unsigned long i, bytes;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(io_tlb_start))
+		return -ENOMEM;
+
 	bytes = nslabs << IO_TLB_SHIFT;
 
 	io_tlb_nslabs = nslabs;
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
