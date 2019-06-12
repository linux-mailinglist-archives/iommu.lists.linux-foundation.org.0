Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7DD429BD
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 16:45:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9AC731C8E;
	Wed, 12 Jun 2019 14:45:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F08F19B2
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 14:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 16B6979
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 14:43:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5B7BF206BB;
	Wed, 12 Jun 2019 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560350596;
	bh=h2Bchl3fm8cHz77yA3RKmWDD+wNAyvpC99xUg7/1lpo=;
	h=Date:From:To:Cc:Subject:From;
	b=DZNv0eArMANRmbM0lTze2FFaCiUQoZrRz8LckDFsLejkh60VU+uk1U2j12P5ePsE1
	QPc10DeCfw8ckQ0bTYJnotM5VNHH8xR4ns01kaf8QvjA3xrbiRG+cFebBGA/A+bBZT
	kLjC4MsygFwRrrUSZnLpuG/PWQHoiQbPIwg1xHn8=
Date: Wed, 12 Jun 2019 16:43:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] swiotlb: no need to check return value of debugfs_create
	functions
Message-ID: <20190612144314.GA16803@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
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

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 kernel/dma/swiotlb.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 13f0cb080a4d..62fa5a82a065 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -696,29 +696,12 @@ bool is_swiotlb_active(void)
 
 static int __init swiotlb_create_debugfs(void)
 {
-	struct dentry *d_swiotlb_usage;
-	struct dentry *ent;
-
-	d_swiotlb_usage = debugfs_create_dir("swiotlb", NULL);
-
-	if (!d_swiotlb_usage)
-		return -ENOMEM;
-
-	ent = debugfs_create_ulong("io_tlb_nslabs", 0400,
-				   d_swiotlb_usage, &io_tlb_nslabs);
-	if (!ent)
-		goto fail;
-
-	ent = debugfs_create_ulong("io_tlb_used", 0400,
-				   d_swiotlb_usage, &io_tlb_used);
-	if (!ent)
-		goto fail;
+	struct dentry *root;
 
+	root = debugfs_create_dir("swiotlb", NULL);
+	debugfs_create_ulong("io_tlb_nslabs", 0400, root, &io_tlb_nslabs);
+	debugfs_create_ulong("io_tlb_used", 0400, root, &io_tlb_used);
 	return 0;
-
-fail:
-	debugfs_remove_recursive(d_swiotlb_usage);
-	return -ENOMEM;
 }
 
 late_initcall(swiotlb_create_debugfs);
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
