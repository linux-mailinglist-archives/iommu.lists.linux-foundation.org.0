Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9B297CC6
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 16:19:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BBA4B86EB4;
	Sat, 24 Oct 2020 14:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DO3C7GluKBBe; Sat, 24 Oct 2020 14:19:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D386886EB2;
	Sat, 24 Oct 2020 14:19:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0EE3C0051;
	Sat, 24 Oct 2020 14:19:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1AB0C0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 14:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 95B27204D2
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 14:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YypMihgkYlp1 for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 14:19:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 1086220466
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=sEUK5AB+cZzLDZ8v3U1z1qBO8qdntzRB3qX7knShG1Q=; b=D5r/Kwk8dGKkS/BjOJEZiZnad2
 +LF/d27dOMNIpkFvt7V5U1zrwb7OFLkQBMNohXeq6n9WU6Pi6XCrVH67IMSsVXOdLr1EzXeHHC28m
 0ObND1AL4AN/fjWLjdgJ/74mEKr+s06w/CKCWVNOvTOwzzy2PL0859//spuQADB/mIWGwrssvk0A+
 EL6DbZB1B9oEv9CmPXzp5CPivm0lf6HTYnXPuyM5j/W3oxGPco6i7oLDstlmv3+SK2jIz46DxTGHz
 qWSYxknswglGxqiTpQzU9esibOGiVi9OVs9djIvPwt8Lc+vr4MqI/gBC7UI+rzSF2xtBsU9WIiZkn
 49uVIS3Q==;
Received: from [2001:4bb8:18c:20bd:dc4a:c0cd:d943:64ae] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWKOQ-0007gM-OL; Sat, 24 Oct 2020 14:19:39 +0000
Date: Sat, 24 Oct 2020 16:19:35 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.10
Message-ID: <20201024141935.GA3556641@infradead.org>
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

The following changes since commit 270315b8235e3d10c2e360cff56c2f9e0915a252:

  Merge tag 'riscv-for-linus-5.10-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2020-10-19 18:18:30 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.10-1

for you to fetch changes up to 6857a5ebaabc5b9d989872700b4b71dd2a6d6453:

  dma-mapping: document dma_{alloc,free}_pages (2020-10-23 12:07:46 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.10:

 - document the new document dma_{alloc,free}_pages API
 - two fixups for the dma-mapping.h split

----------------------------------------------------------------
Christoph Hellwig (3):
      ARM/sa1111: add a missing include of dma-map-ops.h
      dma-mapping: move more functions to dma-map-ops.h
      dma-mapping: document dma_{alloc,free}_pages

 Documentation/core-api/dma-api.rst | 49 +++++++++++++++++++++++++++++++++-----
 arch/arm/common/sa1111.c           |  2 +-
 include/linux/dma-map-ops.h        | 23 ++++++++++++++++++
 include/linux/dma-mapping.h        | 24 -------------------
 kernel/dma/remap.c                 |  2 +-
 5 files changed, 68 insertions(+), 32 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
