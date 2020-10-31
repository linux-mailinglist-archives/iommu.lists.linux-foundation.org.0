Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACCA2A14E3
	for <lists.iommu@lfdr.de>; Sat, 31 Oct 2020 10:40:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B701187311;
	Sat, 31 Oct 2020 09:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wiufv+wqM8q; Sat, 31 Oct 2020 09:40:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24388872F8;
	Sat, 31 Oct 2020 09:40:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15C80C0051;
	Sat, 31 Oct 2020 09:40:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5DCC0051
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 09:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E394085888
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 09:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QBr7DFZKRhl for <iommu@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 09:40:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E310871D0
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=l/8xBspK/egJQgWp9wEyakLNsvCi5RbuiwpHLDEpSY4=; b=rydcv2zGRMIzbXFsWs84kqi7WF
 9fiCgSfauC3vD2m3KmzfjUoMUS23MPxWccHnS7xE+tLDn2hax5YmWyzSuPkftRmLaCX8PO+90FrmD
 7TQWBAf8Ew/+ECIzADyZjuXNymKQmWnGMR0Ndj/eh0/U6sk4Q9RGB+P49LXKhloltmOZlk6vEw6G4
 cm4lqM+hDy5BYcEQpm3r4ZJ5DamMeSgLexfali5z7PAbqKQmLqiLMUAZj5qavBwMXXPjYOBv8K9Kv
 Jm4ieGeRDAMT+nBZufKCZIOnP7LSaGJUuUSYQwBkgfAcLa1L0QcqO6mCFvN3EGeuf5DXglscBJQeZ
 LEywkMfQ==;
Received: from 089144193201.atnat0002.highway.a1.net ([89.144.193.201]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYnNC-0000zk-Fa; Sat, 31 Oct 2020 09:40:35 +0000
Date: Sat, 31 Oct 2020 10:38:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fix for 5.10
Message-ID: <20201031093823.GA453843@infradead.org>
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

The following changes since commit ed8780e3f2ecc82645342d070c6b4e530532e680:

  Merge tag 'x86-urgent-2020-10-27' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2020-10-27 14:39:29 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.10-2

for you to fetch changes up to 48ab6d5d1f096d6fac5b59f94af0aa394115a001:

  dma-mapping: fix 32-bit overflow with CONFIG_ARM_LPAE=n (2020-10-29 16:59:34 +0100)

----------------------------------------------------------------
dma-mapping fix for 5.10:

 - fix an integer overflow on 32-bit platforms in the new DMA range code
   (Geert Uytterhoeven)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dma-mapping: fix 32-bit overflow with CONFIG_ARM_LPAE=n

 drivers/of/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
