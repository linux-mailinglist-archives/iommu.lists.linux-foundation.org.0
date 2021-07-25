Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2CA3D4C41
	for <lists.iommu@lfdr.de>; Sun, 25 Jul 2021 08:03:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 786A260614;
	Sun, 25 Jul 2021 06:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y70385Hl1k9S; Sun, 25 Jul 2021 06:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF0F560611;
	Sun, 25 Jul 2021 06:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B066C001F;
	Sun, 25 Jul 2021 06:03:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A078C000E
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 06:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D87C831CB
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 06:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIhLL5QTRjWg for <iommu@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 06:03:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40BB4831AE
 for <iommu@lists.linux-foundation.org>; Sun, 25 Jul 2021 06:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=u8Y6L+Rco34iM+E3rhGHsG8KSlyhUxu63ehVuhEIgzQ=; b=ThGLr0xDamavUqwJ6uf55u8NYC
 O2khtWaERytaQu3aLCF0t1DtrEZymrZlybqfocct8yMV4uT4pcpUv7DlwJxTR5AfiKZA0axrkUSWe
 LKwXIxdKkeEvh2wG6sWW4/Utwic9DhFwKwMKgi/RFJ0u6oGodCDQzJ2J7BBi2EulTjPVsKwCMwrno
 7N9CdpVcZfd+V9Htq+jG1RbpXz7smdhcduHe9MPJhEk6MPeYh6WYw8iYxD13t5ztN+Idgw/rzOffj
 A2YnlZZm0YAJKiNCPYgGO7CD+rM1lvtSS1hey5Fe+q9gPlGzsJaxaYYYmdi4dcpXxtiTJnBZAJ99P
 QUTTw4ug==;
Received: from [2001:4bb8:184:87c5:a8b3:bdfd:fc9b:6250] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7XEQ-00Cq3Y-KS; Sun, 25 Jul 2021 06:03:26 +0000
Date: Sun, 25 Jul 2021 08:03:21 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fix for Linux 5.14
Message-ID: <YPz+qQ6dbZVDbMwu@infradead.org>
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

The following changes since commit d936eb23874433caa3e3d841cfa16f5434b85dcf:

  Revert "Makefile: Enable -Wimplicit-fallthrough for Clang" (2021-07-15 18:05:31 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.14-1

for you to fetch changes up to 40ac971eab89330d6153e7721e88acd2d98833f9:

  dma-mapping: handle vmalloc addresses in dma_common_{mmap,get_sgtable} (2021-07-16 11:30:26 +0200)

----------------------------------------------------------------
dma-mapping fix for Lonux 5.14

  - handle vmalloc addresses in dma_common_{mmap,get_sgtable}
    (Roman Skakun)

----------------------------------------------------------------
Roman Skakun (1):
      dma-mapping: handle vmalloc addresses in dma_common_{mmap,get_sgtable}

 kernel/dma/ops_helpers.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
