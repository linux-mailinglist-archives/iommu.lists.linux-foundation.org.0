Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501C249573
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 08:57:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A28286C53;
	Wed, 19 Aug 2020 06:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPh+G2jiPeQt; Wed, 19 Aug 2020 06:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0168F86BB7;
	Wed, 19 Aug 2020 06:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D35B3C0051;
	Wed, 19 Aug 2020 06:56:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CF35C0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 33FD386542
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn1fCrg95DMo for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 06:56:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADEAB87AFF
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=X8i7nxueqjYiXXABx6iAbSqyBXetjeuy5DnMYgOTSbg=; b=MIBdEjIoLTHUEBHUGUn2hxEK+5
 BevUewh66/hAJEodxv37XHol1UkTJvsD7JDl+I4rW2ckgBABThtPp31SAHD8ICQgZg9JKLfxRcH4k
 kvTpdncuF+HUCxaXssYT/w0O4ikj+Sa+Lyaln7QVFgqhX6bxyjj0pvaSW2wvw4j8/oBw/WQ88dOqN
 Q3mRJmv4cM/nFVeWy5kNDxSA93Axsk8QBY2jkY9bRnSUGTtFij8Kiwsj0O2Rue4Vw4+6MrVBOLl4l
 sw31W2/w6nJQFhVEeODf45+zE6F1ZoCoe3LFOUxDAEiAGB56VL+rjQdReZWkrm5RWIPjt6oDiXNpz
 MmYdslVQ==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I18-0008NZ-2u; Wed, 19 Aug 2020 06:56:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 09/28] MIPS/jazzdma: remove the unused vdma_remap function
Date: Wed, 19 Aug 2020 08:55:36 +0200
Message-Id: <20200819065555.1802761-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/include/asm/jazzdma.h |  2 -
 arch/mips/jazz/jazzdma.c        | 70 ---------------------------------
 2 files changed, 72 deletions(-)

diff --git a/arch/mips/include/asm/jazzdma.h b/arch/mips/include/asm/jazzdma.h
index d13f940022d5f9..c831da7fa89803 100644
--- a/arch/mips/include/asm/jazzdma.h
+++ b/arch/mips/include/asm/jazzdma.h
@@ -10,8 +10,6 @@
  */
 extern unsigned long vdma_alloc(unsigned long paddr, unsigned long size);
 extern int vdma_free(unsigned long laddr);
-extern int vdma_remap(unsigned long laddr, unsigned long paddr,
-		      unsigned long size);
 extern unsigned long vdma_phys2log(unsigned long paddr);
 extern unsigned long vdma_log2phys(unsigned long laddr);
 extern void vdma_stats(void);		/* for debugging only */
diff --git a/arch/mips/jazz/jazzdma.c b/arch/mips/jazz/jazzdma.c
index 014773f0bfcd74..fe40dbed04c1d6 100644
--- a/arch/mips/jazz/jazzdma.c
+++ b/arch/mips/jazz/jazzdma.c
@@ -209,76 +209,6 @@ int vdma_free(unsigned long laddr)
 
 EXPORT_SYMBOL(vdma_free);
 
-/*
- * Map certain page(s) to another physical address.
- * Caller must have allocated the page(s) before.
- */
-int vdma_remap(unsigned long laddr, unsigned long paddr, unsigned long size)
-{
-	int first, pages;
-
-	if (laddr > 0xffffff) {
-		if (vdma_debug)
-			printk
-			    ("vdma_map: Invalid logical address: %08lx\n",
-			     laddr);
-		return -EINVAL; /* invalid logical address */
-	}
-	if (paddr > 0x1fffffff) {
-		if (vdma_debug)
-			printk
-			    ("vdma_map: Invalid physical address: %08lx\n",
-			     paddr);
-		return -EINVAL; /* invalid physical address */
-	}
-
-	pages = (((paddr & (VDMA_PAGESIZE - 1)) + size) >> 12) + 1;
-	first = laddr >> 12;
-	if (vdma_debug)
-		printk("vdma_remap: first=%x, pages=%x\n", first, pages);
-	if (first + pages > VDMA_PGTBL_ENTRIES) {
-		if (vdma_debug)
-			printk("vdma_alloc: Invalid size: %08lx\n", size);
-		return -EINVAL;
-	}
-
-	paddr &= ~(VDMA_PAGESIZE - 1);
-	while (pages > 0 && first < VDMA_PGTBL_ENTRIES) {
-		if (pgtbl[first].owner != laddr) {
-			if (vdma_debug)
-				printk("Trying to remap other's pages.\n");
-			return -EPERM;	/* not owner */
-		}
-		pgtbl[first].frame = paddr;
-		paddr += VDMA_PAGESIZE;
-		first++;
-		pages--;
-	}
-
-	/*
-	 * Update translation table
-	 */
-	r4030_write_reg32(JAZZ_R4030_TRSTBL_INV, 0);
-
-	if (vdma_debug > 2) {
-		int i;
-		pages = (((paddr & (VDMA_PAGESIZE - 1)) + size) >> 12) + 1;
-		first = laddr >> 12;
-		printk("LADDR: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", i << 12);
-		printk("\nPADDR: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", pgtbl[i].frame);
-		printk("\nOWNER: ");
-		for (i = first; i < first + pages; i++)
-			printk("%08x ", pgtbl[i].owner);
-		printk("\n");
-	}
-
-	return 0;
-}
-
 /*
  * Translate a physical address to a logical address.
  * This will return the logical address of the first
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
