Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CBCD37D
	for <lists.iommu@lfdr.de>; Sun,  6 Oct 2019 18:30:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 39DFFD9F;
	Sun,  6 Oct 2019 16:29:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 10563D9A
	for <iommu@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 16:29:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BE8DA5F4
	for <iommu@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fQHPal319uXdVbBLOPVrt8n9xI6EBxPDz/8t7OE1Y0w=;
	b=XDSy7Jjyh6TR2x5L+YbJI07jSS
	9AZijgCkfuVARv4MHOW/4Qegx6uk42JZ7pMV1NMdAdBLxSRv+Sb189Q93fkE4vgEbFVOawF8NcHj8
	hu8AuWowJS9Xc7pfXD/kGThczZKnsBbq5jEEh1i9SpTt1s991smjzQZmRiYduhj/ggGNuTKWL6o22
	/yDgi209kKZOKlkLYa3vdB1mXjYOHkV3p/ddlU1G7Z5mgV7TCQwEHDcJ0NPo6IfxtvEwlyy37pPb5
	/12SPreeIqB6EJVvklNomcePzsBDI+63ppZJPsuRhsRRlBG3l3JqE9jK/6DXHuNhxGI06OoU2/oBV
	maSTOSig==;
Received: from 089144211233.atnat0020.highway.a1.net ([89.144.211.233]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iH9Pt-0005XS-GE; Sun, 06 Oct 2019 16:29:53 +0000
Date: Sun, 6 Oct 2019 18:27:40 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping regression fix for 5.4-rc2
Message-ID: <20191006162740.GA27870@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Linus,

this has only sat in my tree for a day, but it is a very obvious bug
fix for a regression introduced this merge window reported by two
people, and simply is a revert of a bogus hunk.


The following changes since commit 4ea655343ce4180fe9b2c7ec8cb8ef9884a47901:

  Merge tag 'mips_fixes_5.4_1' of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux (2019-10-04 13:31:56 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.4-1

for you to fetch changes up to 2cf2aa6a69db0b17b3979144287af8775c1c1534:

  dma-mapping: fix false positivse warnings in dma_common_free_remap() (2019-10-05 10:24:17 +0200)

----------------------------------------------------------------
dma-mapping regression fix for 5.4-rc2

 - revert an incorret hunk from a patch that caused problems
   on various arm boards (Andrey Smirnov)

----------------------------------------------------------------
Andrey Smirnov (1):
      dma-mapping: fix false positivse warnings in dma_common_free_remap()

 kernel/dma/remap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
