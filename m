Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D181A4EED
	for <lists.iommu@lfdr.de>; Sat, 11 Apr 2020 10:28:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7D95A22654;
	Sat, 11 Apr 2020 08:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8MXhrwTRYdpU; Sat, 11 Apr 2020 08:28:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE96E204F0;
	Sat, 11 Apr 2020 08:28:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B900BC1D87;
	Sat, 11 Apr 2020 08:28:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC6FC0177
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 08:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 94E9685F72
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TVMLcYyQGpz for <iommu@lists.linux-foundation.org>;
 Sat, 11 Apr 2020 08:28:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 696A485F68
 for <iommu@lists.linux-foundation.org>; Sat, 11 Apr 2020 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KfuGWUe+2Mm9mM6Tq6DQzvlxZlTVJLQ8Twm6DUylGx0=; b=SNfkwFxFTzvmT9W6Vu4e3A3hT2
 bTlFmVVNjr1HLot9N1LHO/aY0mV5b1s+LHhNHfhIBf09UW9QQcHaK4ZqUzSchx+lThpnTAA+2kju+
 SIgkS85jYu802NOc6Cb9oq/FNbHzjY6JZUxKLtZX92zG4Z7W4hQBFDyLEYiF0tmqpf8KeJfEPpphG
 /oyFF0r35c9F+RMiHB5CORzlap4qGWYN+3jbNKhO/uU6rFQ+AVlU4QW8UkT2Muv+EEeLJIbNx5aGL
 5FME3ZaDTwgpXMMUsRBiXF+myUU006aZDscpsINyoDYqdHGHNFdb+4X20r8I8boyuzYXuv8DbpH3z
 eBlWitcQ==;
Received: from [2001:4bb8:180:5765:8cdf:b820:7ed9:b80c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNBUf-0002nz-VN; Sat, 11 Apr 2020 08:28:02 +0000
Date: Sat, 11 Apr 2020 10:28:00 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.7
Message-ID: <20200411082800.GA1807013@infradead.org>
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

The following changes since commit f5e94d10e4c468357019e5c28d48499f677b284f:

  Merge tag 'drm-next-2020-04-08' of git://anongit.freedesktop.org/drm/drm (2020-04-07 20:24:34 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.7-1

for you to fetch changes up to 9bb50ed7470944238ec8e30a94ef096caf9056ee:

  dma-debug: fix displaying of dma allocation type (2020-04-08 21:46:57 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.7

 - fix an integer truncation in dma_direct_get_required_mask
   (Kishon Vijay Abraham)
 - fix the display of dma mapping types (Grygorii Strashko)

----------------------------------------------------------------
Grygorii Strashko (1):
      dma-debug: fix displaying of dma allocation type

Kishon Vijay Abraham I (1):
      dma-direct: fix data truncation in dma_direct_get_required_mask()

 kernel/dma/debug.c  | 9 ++++++---
 kernel/dma/direct.c | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
