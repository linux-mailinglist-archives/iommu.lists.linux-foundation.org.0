Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 128058FBC8
	for <lists.iommu@lfdr.de>; Fri, 16 Aug 2019 09:12:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 011ADCC6;
	Fri, 16 Aug 2019 07:12:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2F7B4CB5
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 07:12:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB2D6786
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M7aCOncE9cdu2lm40wE0sX+3YWUOlwEH41YvffpGGBk=;
	b=CRP6GQ1Lw34CR/2cSWO1S3ZZo7
	e3qzMt3uC65GaHDy3QSzuRl1aPq3CtXFktR5fKF090cwLGuGBZGa6eAieGRaAnKnpuNfu5cGOn4Tf
	FVjPlPIBzyavJz1TLlKfnWsPNcl0+ZzV951/W6lBM8PV+37b/MZSD/tEOS3Wwr8m51GBht62ZOyFU
	sz7lXUAbthR+KCik65ooNskt93tJYvV69EyKiI2UMWnqSEDzM895lTxZfL/2oEOMUWlZWaQw2DyPt
	PZuyiX/vzX6bI0w3BLRkuuu7yKSXeOODuvIg9eDLOccgfkc0J/tDK1E0fF7L/hCHctEEtVKipkDnM
	aRayUKSA==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hyWPO-0006sq-Qm; Fri, 16 Aug 2019 07:12:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/6] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
Date: Fri, 16 Aug 2019 09:07:49 +0200
Message-Id: <20190816070754.15653-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816070754.15653-1-hch@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
	linux-m68k@lists.linux-m68k.org, Guan Xuetao <gxt@pku.edu.cn>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Mips uses the KSEG1 kernel memory segment do map dma coherent
allocations for non-coherent devices as uncachable, and does not have
any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
lead to multiple mappings with different caching attributes.

Fixes: 8c172467be36 ("MIPS: Add implementation of dma_map_ops.mmap()")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              | 1 -
 arch/mips/mm/dma-noncoherent.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..86e6760ef0d0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1119,7 +1119,6 @@ config DMA_PERDEV_COHERENT
 
 config DMA_NONCOHERENT
 	bool
-	select ARCH_HAS_DMA_MMAP_PGPROT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_UNCACHED_SEGMENT
 	select NEED_DMA_MAP_STATE
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ed56c6fa7be2..1d4d57dd9acf 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -65,14 +65,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
 	return page_to_pfn(virt_to_page(cached_kernel_address(cpu_addr)));
 }
 
-pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
-		unsigned long attrs)
-{
-	if (attrs & DMA_ATTR_WRITE_COMBINE)
-		return pgprot_writecombine(prot);
-	return pgprot_noncached(prot);
-}
-
 static inline void dma_sync_virt(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
