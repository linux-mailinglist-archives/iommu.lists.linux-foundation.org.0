Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BED6F02B
	for <lists.iommu@lfdr.de>; Sat, 20 Jul 2019 19:29:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23D16FDA;
	Sat, 20 Jul 2019 17:29:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CC626FD3
	for <iommu@lists.linux-foundation.org>;
	Sat, 20 Jul 2019 17:29:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 27D1E71C
	for <iommu@lists.linux-foundation.org>;
	Sat, 20 Jul 2019 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4u1UOOluIxzpChbBbBSB5WjUOAsP++Ttncv2ljBjqr4=;
	b=TYB3ehpK45DbHzMLjElDZFdEgT
	BWsGY7vVVkBDsGd5ZwN28+yzOtO3hPDvoWtQfoG3dCbG0IcuYyw8DlIfFMN0ySS1i6HepXsVr1T9f
	KWrM3efShVAhHknbh4NIlzbH8t46Wj+wz/jl7uxEOPgdbl4FsSbdliD6VAnfdf+V8fQbyHnqjXjk+
	JVcCumn9IhxkbYuqXsJkPnucLp4tvwS0My2jZGSycB8/qtK6VTkPX3i4JHeHa3vi64HhbusL5Ruat
	oP63hhsz2KQsg1q/XJEqKEBArPQZFy7l7/9hYw0IqglTvwtqEWnNEw9gjCKT6XYdYWmkKuQLr0OLl
	32QaUt0A==;
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hotAX-0004Zo-Pi; Sat, 20 Jul 2019 17:29:14 +0000
Date: Sat, 20 Jul 2019 19:29:11 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.3
Message-ID: <20190720172911.GA11099@infradead.org>
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

The following changes since commit 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd:

  Merge tag 'for-linus-20190715' of git://git.kernel.dk/linux-block (2019-07-15 21:20:52 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.3-1

for you to fetch changes up to 449fa54d6815be8c2c1f68fa9dbbae9384a7c03e:

  dma-direct: correct the physical addr in dma_direct_sync_sg_for_cpu/device (2019-07-19 14:09:40 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.3-rc1

Fix various regressions:

 - force unencrypted dma-coherent buffers if encryption bit can't fit
   into the dma coherent mask (Tom Lendacky)
 - avoid limiting request size if swiotlb is not used (me)
 - fix swiotlb handling in dma_direct_sync_sg_for_cpu/device
   (Fugang Duan)

----------------------------------------------------------------
Christoph Hellwig (2):
      dma-mapping: add a dma_addressing_limited helper
      dma-direct: only limit the mapping size if swiotlb could be used

Fugang Duan (1):
      dma-direct: correct the physical addr in dma_direct_sync_sg_for_cpu/device

Tom Lendacky (1):
      dma-direct: Force unencrypted DMA under SME for certain DMA masks

 arch/s390/Kconfig           |  1 +
 arch/s390/mm/init.c         |  7 ++++++-
 arch/x86/Kconfig            |  1 +
 arch/x86/mm/mem_encrypt.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/dma-direct.h  |  9 +++++++++
 include/linux/dma-mapping.h | 14 ++++++++++++++
 kernel/dma/Kconfig          |  3 +++
 kernel/dma/direct.c         | 44 +++++++++++++++++++-------------------------
 8 files changed, 83 insertions(+), 26 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
