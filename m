Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909DA5714
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 15:04:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C15FFE48;
	Mon,  2 Sep 2019 13:04:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 659E0E3A
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:04:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0C536709
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zpw5MllFX9fhxx6EO9p2LOeJ5F0J0z3R/HLMi2TPdSQ=;
	b=EFwPojdcTFtbmMxJO5jtupsmx1
	0tkTmctlO9fhUz5pZDZcKWWaI/hsFfRBeODr7tpq2Gvpi3l2cF8wkkTTOE7SpqXyvwM+/3ZdPSJhk
	V7+1WpI9EgCTq837af7201iLXeuE7wvQNZJ2B66q4aSjrGgsTDB5O29MuMoavMru0ooGjSP/SpGI+
	nnfV7Xv5NVo4xIR0g5R3u9Df9GfGws/LVk4JdSzEi2+ilgFKy0ghvDyMhWndfjsjiJKalerzMcKaD
	8xCOwxM7l0dEzaweHZA5RtKiGT0A/B01FL2NCMwfPiWBdRSTvv1AgDp03eEDbZtQlmitPXIy/pQs7
	UQ2B6nXA==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i4m01-0001Ua-Mj; Mon, 02 Sep 2019 13:04:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [PATCH 06/13] xen: remove the exports for xen_{create,
	destroy}_contiguous_region
Date: Mon,  2 Sep 2019 15:03:32 +0200
Message-Id: <20190902130339.23163-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

These routines are only used by swiotlb-xen, which cannot be modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm/xen/mm.c     | 2 --
 arch/x86/xen/mmu_pv.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 11d5ad26fcfe..9d73fa4a5991 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -154,13 +154,11 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 	*dma_handle = pstart;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(xen_create_contiguous_region);
 
 void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 {
 	return;
 }
-EXPORT_SYMBOL_GPL(xen_destroy_contiguous_region);
 
 int __init xen_mm_init(void)
 {
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 26e8b326966d..c8dbee62ec2a 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2625,7 +2625,6 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
 	*dma_handle = virt_to_machine(vstart).maddr;
 	return success ? 0 : -ENOMEM;
 }
-EXPORT_SYMBOL_GPL(xen_create_contiguous_region);
 
 void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 {
@@ -2660,7 +2659,6 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 
 	spin_unlock_irqrestore(&xen_reservation_lock, flags);
 }
-EXPORT_SYMBOL_GPL(xen_destroy_contiguous_region);
 
 static noinline void xen_flush_tlb_all(void)
 {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
