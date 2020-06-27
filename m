Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3620BFE1
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 09:49:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C88A186F9C;
	Sat, 27 Jun 2020 07:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6EF9OODDmzQ; Sat, 27 Jun 2020 07:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B34B586F55;
	Sat, 27 Jun 2020 07:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A10B2C0895;
	Sat, 27 Jun 2020 07:49:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFED1C016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D997585BF7
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dAZgrqWd6N4L for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 07:49:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E5F9985BBD
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=VISRGRVX3KTYFQ5h7gP2VwYP1BiwOz4Oy4J0zolFtuE=; b=aAeel0Tk4D0FgLHXHU22f2R1z0
 kItD/+v4kQfOgGNPMUZJCFliF5C8/S9d9XdqLvIMK8u68LEys7hOBBn57WWaNTD1g4ytQdZTkUrQM
 BPhPjU/XbeRkVc7VwWi44UdY7CgAvlQyPMogGuYIYwPSHyH2llS1DY3QVwWTjFZa5Kzx+lQOnGCF8
 XLi07T7Do/BzvkUQXhtRsqA79TThw6jyxzvwE7Pfpm+NeieVls7UOkphIG7/kucx8TDLm/xZEPD5O
 9FJPKRm8mzRLtIopZt5eLzAL+3B/yjYjRvR1sCyZmz6FokT11nvdRshlpce94T1QLmtteOAJajd07
 STxBmgkw==;
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp5aC-0007Xl-DJ; Sat, 27 Jun 2020 07:49:05 +0000
Date: Sat, 27 Jun 2020 09:49:02 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.8
Message-ID: <20200627074902.GA2447682@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

The following changes since commit dbed452a078d56bc7f1abecc3edd6a75e8e4484e:

  dma-pool: decouple DMA_REMAP from DMA_COHERENT_POOL (2020-06-15 08:35:30 +0200)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-4

for you to fetch changes up to 8e36baf97b252cdcafa53589e8227cbb1e85f0b0:

  dma-remap: align the size in dma_common_*_remap() (2020-06-23 14:14:41 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.8:

 - fix dma coherent mmap in nommu (me)
 - more AMD SEV fallout (David Rientjes, me)
 - fix alignment in dma_common_*_remap (Eric Auger)

----------------------------------------------------------------
Christoph Hellwig (3):
      dma-direct: re-enable mmap for !CONFIG_MMU
      dma-direct: mark __dma_direct_alloc_pages static
      dma-mapping: DMA_COHERENT_POOL should select GENERIC_ALLOCATOR

David Rientjes (4):
      dma-direct: always align allocation size in dma_direct_alloc_pages()
      dma-direct: re-encrypt memory if dma_direct_alloc_pages() fails
      dma-direct: check return value when encrypting or decrypting memory
      dma-direct: add missing set_memory_decrypted() for coherent mapping

Eric Auger (1):
      dma-remap: align the size in dma_common_*_remap()

 include/linux/dma-direct.h |  2 --
 kernel/dma/Kconfig         |  3 ++-
 kernel/dma/direct.c        | 59 ++++++++++++++++++++++++++--------------------
 kernel/dma/remap.c         |  5 ++--
 4 files changed, 39 insertions(+), 30 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
