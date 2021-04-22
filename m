Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id DB01C367AD7
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 09:19:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A2D83E0E;
	Thu, 22 Apr 2021 07:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qg8uuaaSXUGg; Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E7883DD8;
	Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABFAC000B;
	Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 282D4C0019
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F375E404F9
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJ0lxua3f7sK for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 07:19:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF70540143
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dYyH/8K4Q8sCxeRfrx+sXZtnFZXl8dFeAAsbGjqR53E=; b=OYuuEeJvdRaOhc/KxZZh+gdgIc
 Pp/EPZXmB/fYLLqsRz/c0KwUZj/GOo1pdbdH6soycjs2KejEXIVJNZ7tQ+lf9O/LsH+jTFSSDOzZd
 t+gxtZRNuq7rxDeh6ySTt1AVSqrH2MQViV22MbxnRmy068+lzX+O0JLxqXQH/5IrHfRCI5qY6KpdA
 kaiQpAzWqDtiwzjkobuFUj9pclIHoEBzbD+b8LiqZ2sMabrUaOwnYHY7zIP1d8+0eoimCFxhiNNI9
 fJTUcQe8yUYVqIZp8UrHTvtUKr17zjKQySXJ4neE19YZy4WQ85r+8TPO/CfTvbmt0vZI1mUJDDUES
 tQclwPXQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTcd-00DRlK-3P; Thu, 22 Apr 2021 07:19:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 4/7] powerpc/pseries: simplify svm_swiotlb_init
Date: Thu, 22 Apr 2021 09:19:18 +0200
Message-Id: <20210422071921.1428607-5-hch@lst.de>
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

The value returned by swiotlb_size_or_default is always properly
aligned now, so don't duplicate the work.

Signed-off-by: Christoph Hellwig <hch@lst.de>dddd
---
 arch/powerpc/platforms/pseries/svm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 4d281ff56ce96f..9187d2a1ed568d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -43,20 +43,14 @@ machine_early_initcall(pseries, init_svm);
  */
 void __init svm_swiotlb_init(void)
 {
+	unsigned long bytes = swiotlb_size_or_default();
 	unsigned char *vstart;
-	unsigned long bytes, io_tlb_nslabs;
-
-	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
-
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (vstart && !swiotlb_init_with_tbl(vstart, bytes, false))
 		return;
 
-	memblock_free_early(__pa(vstart),
-			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	memblock_free_early(__pa(vstart), PAGE_ALIGN(bytes));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
