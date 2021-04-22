Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B43367AE2
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 09:20:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E58D83DB3;
	Thu, 22 Apr 2021 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prAWu-icAjaB; Thu, 22 Apr 2021 07:19:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F32483E08;
	Thu, 22 Apr 2021 07:19:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9BD1C0023;
	Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4731C001B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E446069A
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7N5YIZ3me3K for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 07:19:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE8DA60686
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uecr72uR4S7RBlQH3PaVDyORw5/pv2frUuL1UFgzCPE=; b=nhiKI19LhclhWHaCMD71/Cry2I
 ad6ySo/VVhMQiMubBTbcXCyyZlDNjzYbPA+tZk8BiT5hw3n0w6mKDxom0sj0rvkAgg0i1yyn8o7oo
 1WIEdVXIC6LTk0UxAy1ehak/xKXq6XQPbaGVDUPwPborS1UiEulB3qS7UESlVagzJt4QCZaO9CtEI
 fcQs+SXYcRWhy5a8sDZTyC08Ri/E79nWiQSVrG4ZiR8v9uKg/DTl1oamETbfl6gUflJKqvh2ddxOi
 BdTobsRp+kpB65cIWtJVMzOi3UY9DmsWvx7DOMlmgKmk3irvAqkEQdojJ/k//Qspi8SEXYbVYNPNh
 pTGVPpvQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTck-00DRlu-Sv; Thu, 22 Apr 2021 07:19:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 7/7] swiotlb: don't override the command line in
 swiotlb_adjust_size
Date: Thu, 22 Apr 2021 09:19:21 +0200
Message-Id: <20210422071921.1428607-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linuxppc-dev@lists.ozlabs.org
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

When the user specified an explicit swiotlb size on the command line,
the achitecture code should not override it.

Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87d06ddf4753f3..aef02a3825b494 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -106,7 +106,9 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return swiotlb_default_size;
+	if (swiotlb_default_size)
+		return swiotlb_default_size;
+	return IO_TLB_DEFAULT_SIZE;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
+	if (swiotlb_default_size)
+		return;
 	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
 		swiotlb_default_size >> 20);
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
