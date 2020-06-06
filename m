Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B84161F07D2
	for <lists.iommu@lfdr.de>; Sat,  6 Jun 2020 18:09:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 641868855D;
	Sat,  6 Jun 2020 16:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGPTsG60ndo5; Sat,  6 Jun 2020 16:09:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC1788855A;
	Sat,  6 Jun 2020 16:09:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C125BC016E;
	Sat,  6 Jun 2020 16:09:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B648C016E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 16:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 818318628E
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 16:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7lKKej+GP+w for <iommu@lists.linux-foundation.org>;
 Sat,  6 Jun 2020 16:09:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D530280585
 for <iommu@lists.linux-foundation.org>; Sat,  6 Jun 2020 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=13YtnQ2W0ggJKbLEu3bFimjEIxdnhaslWMy02eqYWY0=; b=l9zrYwamZIr/QfDf2aUeD7ffBG
 I0I0Ako+vDy/Jre5SIY9GzQifYG9b1oEDSlQll9rP0d0klsfvIdzcvrSJFG5wLQpcgnpUc7IZD9Jx
 fcO7YhGI5nBzKAYvkKH7epU/Ql4T7MiwMhrTwoDm5RmhFV9eb68Vg7kY69FLcMLS7aI3ED8zWEnmO
 YbV4PRnmIgd12P1WMer2dNopVBk2igda0koAjKZ4S1j/FruSa82nZnr+C6i5IpZt13+9AE2+krnxW
 9NNnPQb4gTY9zUfNR+N6dIelmgdENGPC0geo30zFF/uvCz7COP9E1ma0tgg9KOw95qlTcN6HjYXL1
 Uh5CdKdw==;
Received: from 213-225-38-56.nat.highway.a1.net ([213.225.38.56]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhbNf-0002F7-N1; Sat, 06 Jun 2020 16:09:12 +0000
Date: Sat, 6 Jun 2020 18:06:57 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping updates for 5.8, part 1
Message-ID: <20200606160657.GA3482728@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8

for you to fetch changes up to 298f3db6ee690259927b105d5ad1079563361323:

  dma-contiguous: fix comment for dma_release_from_contiguous (2020-04-25 13:17:06 +0200)

----------------------------------------------------------------
dma-mapping updates for 5.8, part 1

 - enhance the dma pool to allow atomic allocation on x86 with AMD SEV
   (David Rientjes)
 - two small cleanups (Jason Yan and Peter Collingbourne)

----------------------------------------------------------------
David Rientjes (7):
      dma-remap: separate DMA atomic pools from direct remap code
      dma-pool: add additional coherent pools to map to gfp mask
      dma-pool: dynamically expanding atomic pools
      dma-direct: atomic allocations must come from atomic coherent pools
      dma-pool: add pool sizes to debugfs
      x86/mm: unencrypted non-blocking DMA allocations use coherent pools
      dma-pool: scale the default DMA coherent pool size with memory capacity

Jason Yan (1):
      dma-debug: make __dma_entry_alloc_check_leak() static

Peter Collingbourne (1):
      dma-contiguous: fix comment for dma_release_from_contiguous

 arch/x86/Kconfig            |   1 +
 drivers/iommu/dma-iommu.c   |   5 +-
 include/linux/dma-direct.h  |   2 +
 include/linux/dma-mapping.h |   6 +-
 kernel/dma/Kconfig          |   6 +-
 kernel/dma/Makefile         |   1 +
 kernel/dma/contiguous.c     |   4 +-
 kernel/dma/debug.c          |   2 +-
 kernel/dma/direct.c         |  56 ++++++++--
 kernel/dma/pool.c           | 264 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/dma/remap.c          | 121 +-------------------
 11 files changed, 327 insertions(+), 141 deletions(-)
 create mode 100644 kernel/dma/pool.c
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
