Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548F40FE06
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 18:40:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C073B40765;
	Fri, 17 Sep 2021 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BixkO5j3-Ckx; Fri, 17 Sep 2021 16:40:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3E5B4075D;
	Fri, 17 Sep 2021 16:40:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87994C000D;
	Fri, 17 Sep 2021 16:40:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 812E2C000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 577024075D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeHP05iJjlsD for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 16:39:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D74574013A
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mUkQRbyk6HgsN6EI+V8Ut5t9uOqEFk/bK805sRdA1qk=; b=MvLF58negozTqmwCoqkawYXf1S
 SLnnkfA1T544Wp5uh7pRxcHIR30qolf3LDrfUnIBmOtoVBJtqIqT8XH/ofyI99Zj09IWw2pv7wqep
 3ICz1YXBHpDfV/lQkIF5A+bZySDG8FWikyTUlQG+ocf6kZ1jvnIyDvzk/zvb/tOmXew+S47vBdBOf
 2CTUx/8R8tTJw+dOouquzMYaUIsPWm3yC1p4c7249vJvPJl6SYrfd+ZqHTBqWCBYMBDz5jUZxjT65
 CMaBDllvdjw2nxudUr20YIXuIDTKW4hYXM6xk/4+hfOqwRMHvuRdKe99Y37VdTcj1oezV27fbqN36
 ixsAjI1w==;
Received: from [2001:4bb8:184:72db:ef3e:3e1e:83c8:e434] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRGt3-000RfV-7s; Fri, 17 Sep 2021 16:39:16 +0000
Date: Fri, 17 Sep 2021 18:38:52 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for Linux 5.15 (2nd attempt)
Message-ID: <YUTEnFAls4dyIyJ1@infradead.org>
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

The following changes since commit c1dec343d7abdf8e71aab2a289ab45ce8b1afb7e:

  hexagon: use the generic global coherent pool (2021-08-19 09:02:40 +0200)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.15-1

for you to fetch changes up to 59583f747664046aaae5588d56d5954fab66cce8:

  sparc32: page align size in arch_dma_alloc (2021-09-14 14:35:17 +0200)

----------------------------------------------------------------
dma-mapping fixes for Linux 5.15

 - page align size in sparc32 arch_dma_alloc (Andreas Larsson)
 - tone down a new dma-debug message (Hamza Mahfooz)
 - fix the kerneldoc for dma_map_sg_attrs (me)

----------------------------------------------------------------
Andreas Larsson (1):
      sparc32: page align size in arch_dma_alloc

Christoph Hellwig (1):
      dma-mapping: fix the kerneldoc for dma_map_sg_attrs

Hamza Mahfooz (1):
      dma-debug: prevent an error message from causing runtime problems

 arch/sparc/kernel/ioport.c | 4 +++-
 kernel/dma/debug.c         | 3 ++-
 kernel/dma/mapping.c       | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
