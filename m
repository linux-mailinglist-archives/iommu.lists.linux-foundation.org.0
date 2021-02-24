Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4032380C
	for <lists.iommu@lfdr.de>; Wed, 24 Feb 2021 08:48:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC626F5D0;
	Wed, 24 Feb 2021 07:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1lynW1C4YBV; Wed, 24 Feb 2021 07:48:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB426F5C7;
	Wed, 24 Feb 2021 07:48:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE22C0001;
	Wed, 24 Feb 2021 07:48:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51319C0001
 for <iommu@lists.linux-foundation.org>; Wed, 24 Feb 2021 07:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 255034EBC9
 for <iommu@lists.linux-foundation.org>; Wed, 24 Feb 2021 07:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbrFm0heFqYd for <iommu@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 07:48:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A58104EBC5
 for <iommu@lists.linux-foundation.org>; Wed, 24 Feb 2021 07:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=vml+hkIwuOnmZog02I4fUIFk3ENnUomHJWuHDEIs+N8=; b=A8I3Z3HaOAG6Lae6lrwpudICvK
 B3Kn9NTFTuFDqbcdW4n5r0RijFjXTKcVk5E3iZAek+q3ib4YBiiNqRlF1IYxxnljfA3qW8Hy68gO9
 wg44Ve6EfK8tlzQrzYIZwixZ28VYuELzLE4AzDA9zO/cr/k+5pQTqm0evHRbhkb+IdEZvEhbxTfNz
 LHTrX/m8b22+var4MgDfdKKXCUahOw5TR++T/Gscgp1nrBWSqNqhb6szmMKL1lbmaCtikCpSc2uge
 009ykv6heSsDeoU3sUKLdFhkdUNejbYWgdTpxAPVYx0182+gPQvfpFvTzHJvxYsCBNT6n74InyYWT
 OHBebxvw==;
Received: from 213-225-9-156.nat.highway.a1.net ([213.225.9.156]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lEou3-0097qn-I7; Wed, 24 Feb 2021 07:48:18 +0000
Date: Wed, 24 Feb 2021 08:46:01 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping updates for 5.12
Message-ID: <YDYEOTIu02GKL8T2@infradead.org>
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

The following changes since commit 9f5f8ec50165630cfc49897410b30997d4d677b5:

  dma-mapping: benchmark: use u8 for reserved field in uAPI structure (2021-02-05 12:48:46 +0100)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.12

for you to fetch changes up to 81d88ce55092edf1a1f928efb373f289c6b90efd:

  dma-mapping: remove the {alloc,free}_noncoherent methods (2021-02-09 18:01:38 +0100)

----------------------------------------------------------------
dma-mapping updates for 5.12:

 - add support to emulate processing delays in the DMA API benchmark
   selftest (Barry Song)
 - remove support for non-contiguous noncoherent allocations,
   which aren't used and will be replaced by a different API

----------------------------------------------------------------
Barry Song (1):
      dma-mapping: benchmark: pretend DMA is transmitting

Christoph Hellwig (1):
      dma-mapping: remove the {alloc,free}_noncoherent methods

 Documentation/core-api/dma-api.rst              | 64 +++++++++----------------
 drivers/iommu/dma-iommu.c                       | 30 ------------
 include/linux/dma-map-ops.h                     |  5 --
 include/linux/dma-mapping.h                     | 17 +++++--
 kernel/dma/map_benchmark.c                      | 12 ++++-
 kernel/dma/mapping.c                            | 40 ----------------
 tools/testing/selftests/dma/dma_map_benchmark.c | 21 ++++++--
 7 files changed, 64 insertions(+), 125 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
