Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4487E26A91A
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 17:54:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BA7C22052E;
	Tue, 15 Sep 2020 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjGaxmoPVhZB; Tue, 15 Sep 2020 15:54:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2DA84203DA;
	Tue, 15 Sep 2020 15:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18897C0051;
	Tue, 15 Sep 2020 15:54:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1904C0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A37B6868B7
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLGcxICcPA1P for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 15:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 311FD868BC
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2UlbGdiZDTOnbAr3xs1aHbeR9XTzI0Lit7D+l7hf2I4=; b=oc+kgjLwN6z7KfpzJBCa7G7OBj
 xMg3Fwxams8c4EpKokR8UZQx2ybyjDj6drc+aW/2LIv1O+PR2BmjXm+WhI4RUptwlI8TGWRoAeWLn
 tDzzTX6C7Wcaz+wjCgZzqB/SScThzcLyj8JgUrilV2pjnlwL2WrjnmkdPgkjiBopQKBs17NlwGyrT
 ONpkConNykQRC+jrpDpmqw3ajb1dphcelbcTILjH85oTRbiw7nNGsu7203+03im4y0uv272kq3shG
 s0VEBKB5Z/ya3O5D9oa/TJdMgnhrtizoC8G9P+/zAzkC5+arP3EQvUavmCF3BtD/B11AifbDQWTH6
 Z2mcOZcw==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDGv-0003AQ-TI; Tue, 15 Sep 2020 15:53:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: a saner API for allocating DMA addressable pages v3
Date: Tue, 15 Sep 2020 17:51:04 +0200
Message-Id: <20200915155122.1768241-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

this series replaced the DMA_ATTR_NON_CONSISTENT flag to dma_alloc_attrs
with a separate new dma_alloc_pages API, which is available on all
platforms.  In addition to cleaning up the convoluted code path, this
ensures that other drivers that have asked for better support for
non-coherent DMA to pages with incurring bounce buffering over can finally
be properly supported.

As a follow up I plan to move the implementation of the
DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
that is also is a fundamentally non coherent allocation.  The replacement
for that flag would then return a struct page, as it is allowed to
actually return pages without a kernel mapping as the name suggested
(although most of the time they will actually have a kernel mapping..)

In addition to the conversions of the existing non-coherent DMA users,
I've also added a patch to convert the firewire ohci driver to use
the new dma_alloc_pages API.

The first patch is queued up for 5.9 in the media tree, but included here
for completeness.


A git tree is available here:

    git://git.infradead.org/users/hch/misc.git dma_alloc_pages

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages


Changes since v2:
 - fix up the patch reshuffle which wasn't quite correct
 - fix up a few commit messages

Changes since v1:
 - rebased on the latests dma-mapping tree, which merged many of the
   cleanups
 - fix an argument passing typo in 53c700, caught by sparse
 - rename a few macro arguments in 53c700
 - pass the right device to the DMA API in the lib82596 drivers
 - fix memory ownershiptransfers in sgiseeq
 - better document what a page in the direct kernel mapping means
 - split into dma_alloc_pages that returns a struct page and is in the
   direct mapping vs dma_alloc_noncoherent that can be vmapped
 - conver the firewire ohci driver to dma_alloc_pages

Diffstat:
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
