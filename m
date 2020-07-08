Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE2218B35
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5F9188C36;
	Wed,  8 Jul 2020 15:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2HOoGk+P3nH; Wed,  8 Jul 2020 15:28:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C853C88B87;
	Wed,  8 Jul 2020 15:28:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF01AC016F;
	Wed,  8 Jul 2020 15:28:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0C57C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF99389696
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqeorJP9Lqa2 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:28:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C47589692
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=N8lHywqGbtnmlIc888+bV79uuU+fuqr8NT0KCg3mTcg=; b=viyDx+ee5J2iBJ3SHuhkTe64ex
 nPggVaOCNbVbq3gLYgaZn/l9njs3icaTSUoD2+VtbEHFctvNdK67a4IcxTeamhz9ucJm5ski4dEO9
 SUMBENSbNZVJ61wfmqFFiqHdlbUGQXpCZc+u/1FF1jRy62DxPVVzMdSRobfQ4xjGEZu/cciBdvZXu
 wacHtK8QaMqFAMl3xVXcdP9QTzFIy/Dvafd40JRsN0fjgpoYKuFaDepQybQwX13pVKyXQcnZISmPZ
 Q5q3+RdAwhwGOaH14t0dGyNhFA6pQpsNfGKTwS7qChg1UbMSaJtGEKdacdn7hZ4CLrnGSFSNGb8EU
 FA572Rtg==;
Received: from 213-225-32-40.nat.highway.a1.net ([213.225.32.40]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtByQ-0002A2-VT; Wed, 08 Jul 2020 15:27:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: generic DMA bypass flag v4
Date: Wed,  8 Jul 2020 17:24:44 +0200
Message-Id: <20200708152449.316476-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linuxppc-dev@lists.ozlabs.org
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

Hi all,

I've recently beeing chatting with Lu about using dma-iommu and
per-device DMA ops in the intel IOMMU driver, and one missing feature
in dma-iommu is a bypass mode where the direct mapping is used even
when an iommu is attached to improve performance.  The powerpc
code already has a similar mode, so I'd like to move it to the core
DMA mapping code.  As part of that I noticed that the current
powerpc code has a little bug in that it used the wrong check in the
dma_sync_* routines to see if the direct mapping code is used.

These two patches just add the generic code and move powerpc over,
the intel IOMMU bits will require a separate discussion.

The x86 AMD Gart code also has a bypass mode, but it is a lot
strange, so I'm not going to touch it for now.

Note that as-is this breaks the XSK buffer pool, which unfortunately
poked directly into DMA internals.  A fix for that is already queued
up in the netdev tree.

Jesper and XDP gang: this should not regress any performance as
the dma-direct calls are now inlined into the out of line DMA mapping
calls.  But if you can verify the performance numbers that would be
greatly appreciated.

A git tree is available here:

    git://git.infradead.org/users/hch/misc.git dma-bypass.4

Gitweb:

    git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-bypass.4


Changes since v3:
 - add config options for the dma ops bypass and dma ops themselves
   to not increase the size of tinyconfig builds

Changes since v2:
 - move the dma mapping helpers out of line
 - check for possible direct mappings using the dma mask

Changes since v1:
 - rebased to the current dma-mapping-for-next tree


Diffstat:
 arch/alpha/Kconfig                |    1 
 arch/arm/Kconfig                  |    1 
 arch/ia64/Kconfig                 |    1 
 arch/mips/Kconfig                 |    1 
 arch/parisc/Kconfig               |    1 
 arch/powerpc/Kconfig              |    2 
 arch/powerpc/include/asm/device.h |    5 
 arch/powerpc/kernel/dma-iommu.c   |   90 +------------
 arch/s390/Kconfig                 |    1 
 arch/sparc/Kconfig                |    1 
 arch/x86/Kconfig                  |    1 
 drivers/iommu/Kconfig             |    2 
 drivers/misc/mic/Kconfig          |    1 
 drivers/vdpa/Kconfig              |    1 
 drivers/xen/Kconfig               |    1 
 include/linux/device.h            |   11 +
 include/linux/dma-direct.h        |  104 +++++++++++++++
 include/linux/dma-mapping.h       |  251 ++++----------------------------------
 kernel/dma/Kconfig                |   12 +
 kernel/dma/Makefile               |    3 
 kernel/dma/direct.c               |   74 -----------
 kernel/dma/mapping.c              |  214 ++++++++++++++++++++++++++++++--
 22 files changed, 385 insertions(+), 394 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
