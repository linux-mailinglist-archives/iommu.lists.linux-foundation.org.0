Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF39C0D9
	for <lists.iommu@lfdr.de>; Sun, 25 Aug 2019 00:50:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 098D2C83;
	Sat, 24 Aug 2019 22:50:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B484DC6F
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 22:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41D34B0
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 22:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wv1CsQX3LIg+M7myrfeQ/31wD/BQEbIvRY+D24DlEsI=;
	b=O6/5T8TQe1mJEH4PK7j1g3/Nuz
	7oQUV8IP4h0gEY/xcTThHfZUPMwwMc9h2YtAQiTBXbq8wKfOGBa17lOISDEqLfAgBAZ5TiId11nwQ
	EkQP6GkRhilKc6hGIeRe9dvvab8VIBvaLFVY0sKescqrz2CxeSuGkDXizLQ0Keho2u52ezH7NZ4E4
	MpvN1R2GfuqeBBMfpwu5ZzLT6v1ybMxsWr285ZuQxKqCstzJnPv13lmrEdhBDfiAj9hiiSiwyO7N5
	AvjksDLEoopLePNv72KhXr1Ra8ayakJV3FSfxXROhJ4hOPDLySc2SDyN6LaSUySW3sjGFEMyvAZWO
	1a+NkzWg==;
Received: from softbank060117181124.bbtec.net ([60.117.181.124] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i1erM-0006oX-4O; Sat, 24 Aug 2019 22:50:12 +0000
Date: Sun, 25 Aug 2019 07:50:10 +0900
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.3-rc
Message-ID: <20190824225010.GA18590@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:

  Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-5

for you to fetch changes up to 90ae409f9eb3bcaf38688f9ec22375816053a08e:

  dma-direct: fix zone selection after an unaddressable CMA allocation (2019-08-21 07:14:10 +0900)

----------------------------------------------------------------
dma-mapping fixes for 5.3-rc

Two fixes for regressions in this merge window:

 - select the Kconfig symbols for the noncoherent dma arch helpers
   on arm if swiotlb is selected, not just for LPAE to not break then
   Xen build, that uses swiotlb indirectly through swiotlb-xen
 - fix the page allocator fallback in dma_alloc_contiguous if the CMA
   allocation fails

----------------------------------------------------------------
Christoph Hellwig (2):
      arm: select the dma-noncoherent symbols for all swiotlb builds
      dma-direct: fix zone selection after an unaddressable CMA allocation

 arch/arm/Kconfig               |  4 ++++
 arch/arm/mm/Kconfig            |  4 ----
 drivers/iommu/dma-iommu.c      |  3 +++
 include/linux/dma-contiguous.h |  5 +----
 kernel/dma/contiguous.c        |  8 ++------
 kernel/dma/direct.c            | 10 +++++++++-
 6 files changed, 19 insertions(+), 15 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
