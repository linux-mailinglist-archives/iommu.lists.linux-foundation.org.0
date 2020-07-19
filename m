Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 552DF225075
	for <lists.iommu@lfdr.de>; Sun, 19 Jul 2020 09:39:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DEC13869E1;
	Sun, 19 Jul 2020 07:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vL62fp4edOpE; Sun, 19 Jul 2020 07:39:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48582869CA;
	Sun, 19 Jul 2020 07:39:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BF04C1797;
	Sun, 19 Jul 2020 07:39:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 682B9C016F
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 07:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5002887B3E
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 07:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9mC4cW+rF1W7 for <iommu@lists.linux-foundation.org>;
 Sun, 19 Jul 2020 07:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 857E987635
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jul 2020 07:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=cNsbswgmt5UoWdjIXqDw0mZBByTg/kfR0BZVwY68014=; b=ghtU5skADnySWERfccuHaUPDLU
 xw5ZNDLYS8qTNezw5W/6s6oEP0HWgA1JUGbQPw67eJ1PJhSBJXv5VOjjvMmQ1ZgAzDpRYYV6Ri9OK
 uIubRA4ivmUEKXzNFttfrPbrn03mPshlB7XAYf+amj8tfUf6dQmjwFjRNgB6vEH2imqVBJx2T5MAn
 WCNSIQSI5YYkxxdPz1fzt84g/5gMFF3PI+skmmQNxpJO/UclCJYSmBm+iQTU01ZExKMIvDGC22k1W
 0DkksMIwpiaXDNwT8r7I6QWwpWA9QIS1Bd3vrxoRYfXHrNP1Rws8IbFxNZCUn3wcfm8sh8O+N0K36
 XYcWTenA==;
Received: from [2001:4bb8:105:4a81:4ef5:9f24:cda4:103f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jx3uy-0001IV-2o; Sun, 19 Jul 2020 07:39:28 +0000
Date: Sun, 19 Jul 2020 09:39:27 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.8
Message-ID: <20200719073927.GA114439@infradead.org>
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

The following changes since commit 0dc589da873b58b70f4caf4b070fb0cf70fdd1dc:

  Merge tag 'iommu-fixes-v5.8-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu (2020-07-13 12:34:05 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-6

for you to fetch changes up to d9765e41d8e9ea2251bf73735a2895c8bad546fc:

  dma-pool: do not allocate pool memory from CMA (2020-07-14 15:46:32 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.8:

 - ensure we always have fully addressable memory in the dma coherent
   pool (Nicolas Saenz Julienne)

----------------------------------------------------------------
Nicolas Saenz Julienne (5):
      dma-direct: provide function to check physical memory area validity
      dma-pool: get rid of dma_in_atomic_pool()
      dma-pool: introduce dma_guess_pool()
      dma-pool: make sure atomic pool suits device
      dma-pool: do not allocate pool memory from CMA

 include/linux/dma-direct.h |  1 +
 kernel/dma/direct.c        |  2 +-
 kernel/dma/pool.c          | 91 ++++++++++++++++++++++++++++------------------
 3 files changed, 58 insertions(+), 36 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
