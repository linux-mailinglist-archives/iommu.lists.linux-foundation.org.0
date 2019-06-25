Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF85452764
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 11:01:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D83DCCC;
	Tue, 25 Jun 2019 09:01:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E69F5CC7
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 09:01:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9ECAE710
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LHgyWTRPcVpDvWhZbPOCqS5v8RHTbXiDcQRTEjmDFOI=;
	b=k570TjvB7grF3smBg6Uzpa48y7
	9OPkhnknPz1bXd+ZsYgiKlbgae3M06EE0nbP5/TcOdE14pHFeV65si1vZf/Ex7CkFpPYvwH/X0pZS
	AlRIsc46RmaWu/JBW43hIFp3VuuMun9kp6fl8b8dB/WeyRfqlAj2XWBr/ae9BkuDO03qOaxDRc3Ec
	Sg8x8LoR9ESu1W2aJtOTqZY5Xme8CCNxzBa+uE3ERPEMOdOKa21yrtujuCSxole5xrv9TrlhLNq2L
	XEp5sLfNhWOS18q4Bq/iNBp76j4/+BkMd1mTswu+2RSxm9jbeqnzddOv1u/MmAd5jF5v1pqaREzQr
	GCt10lbQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hfhKg-0004CW-JD; Tue, 25 Jun 2019 09:01:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k: implement arch_dma_prep_coherent
Date: Tue, 25 Jun 2019 11:01:35 +0200
Message-Id: <20190625090135.18872-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625090135.18872-1-hch@lst.de>
References: <20190625090135.18872-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-m68k@lists.linux-m68k.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
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

When we remap memory as non-cached to be used as a DMA coherent buffer
we should writeback all cache and invalidate the cache lines so that
we make sure we have a clean slate.  Implement this using the
cache_push() helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/Kconfig      | 1 +
 arch/m68k/kernel/dma.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 3a52bf46e043..00f5c98a5e05 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -4,6 +4,7 @@ config M68K
 	default y
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_DMA_MMAP_PGPROT if MMU && !COLDFIRE
+	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
 	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
 	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index 9c6a350a16d8..e720e6eed838 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -18,6 +18,11 @@
 #include <asm/pgalloc.h>
 
 #if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	cache_push(page_to_phys(page), size);
+}
+
 pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
 		unsigned long attrs)
 {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
