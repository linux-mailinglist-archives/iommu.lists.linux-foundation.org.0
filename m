Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BED2F523
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 13:11:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1564AE54;
	Tue, 30 Apr 2019 11:11:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62633E42
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:10:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2896D5F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3Xy1bF8Wi5NVGLFCvIkaMkXFvZgNVtaIEsOwlocOpa8=;
	b=FVteQbElIFLrLRScMi0IGrrKLV
	IfHvcUjEhQclgQEIYfQlTDPC4h+kXCY3mybGeyGJxw/8QD04gTXHoDeOcdBUOiDihzQ5ko9rJCnpX
	PajdpExsVPCZFXMBwOH9w8k9nloM8T4jFDNJvhdeTK9cdfMTG0iYYRfhKlwiWf/dV9KeMQj8DOUQR
	h6+SSpn/K03HfkTBiQFpZgHL047EcNRBFuJFMi+K4Py9mNpGeRiSgjaGvx8kHXiYOmOtH4+yCVV/8
	i/enaApttRIWfsuDCTDCE/FJHEyij2G169hThFMgPzZoXYkKkwaupnh5OsVTuPlzGEhQAvmeG9JBJ
	JWUKvUCw==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLQVb-0000GX-PN; Tue, 30 Apr 2019 11:01:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
	James Hogan <jhogan@kernel.org>, Ley Foon Tan <lftan@altera.com>,
	Michal Simek <monstr@monstr.eu>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/7] MIPS: remove the _dma_cache_wback_inv export
Date: Tue, 30 Apr 2019 07:00:26 -0400
Message-Id: <20190430110032.25301-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430110032.25301-1-hch@lst.de>
References: <20190430110032.25301-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
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

This export is not used in modular code, which is a good thing as
everyone should use the proper DMA API instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/mm/cache.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 3da216988672..33b409391ddb 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -62,8 +62,6 @@ void (*_dma_cache_wback_inv)(unsigned long start, unsigned long size);
 void (*_dma_cache_wback)(unsigned long start, unsigned long size);
 void (*_dma_cache_inv)(unsigned long start, unsigned long size);
 
-EXPORT_SYMBOL(_dma_cache_wback_inv);
-
 #endif /* CONFIG_DMA_NONCOHERENT */
 
 /*
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
