Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C492340F6AB
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 13:23:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F376840272;
	Fri, 17 Sep 2021 11:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvblcP8bUaWr; Fri, 17 Sep 2021 11:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED9BC40249;
	Fri, 17 Sep 2021 11:23:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA992C000D;
	Fri, 17 Sep 2021 11:23:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 741E2C000D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 11:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5612E4003F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 11:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogcYRhpEptmo for <iommu@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 11:23:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E7F40249
 for <iommu@lists.linux-foundation.org>; Fri, 17 Sep 2021 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=R/oDDB1X8KW8mjUHzbdJN1KMLEZY1CFlvWgnnv8S4Uc=; b=nzwFrW1SKy3hCJNV/zS+6rAnwJ
 t7tRbpFxxIV8VeKhqsaoqS9PjTazZLt/gM5ePreDeuEFhHxaDwkzZr8Px8m2/+UY3srD6CjRTkdEy
 mz3t8GkQt/NckHA3rI3JQB9XgrtF2N1D3UUMEIF52TLQKoxY5MeVdPYv6PtHQUSseY24HcjBvFd9e
 XrN2TiSQGqUSzjP1PFSO7V/XP0tmCfOjyRgAuv/C3OE+BLFoP4Ig6OEBkKzPV5vDBsenTm55F2p9S
 DyvJUCb3PvzmnsHartOuZF8Y2KQdbVJwfEigapHFnI49u6ubqOXHUwTysPGIbAhoyu7XKE14mZRB6
 Cr7x7naA==;
Received: from [2001:4bb8:184:72db:2935:708c:157b:6f23] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRBx6-000Bo8-Gh; Fri, 17 Sep 2021 11:22:53 +0000
Date: Fri, 17 Sep 2021 13:22:42 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for Linux 5.15
Message-ID: <YUR6gpm+mTWqdil6@infradead.org>
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

The following changes since commit 67f3b2f822b7e71cfc9b42dbd9f3144fa2933e0b:

  blk-mq: avoid to iterate over stale request (2021-09-12 19:32:43 -0600)

are available in the Git repository at:

  git://git.infradead.org/nvme.git tags/nvme-5.15-2021-09-15

for you to fetch changes up to 70f437fb4395ad4d1d16fab9a1ad9fbc9fc0579b:

  nvme-tcp: fix io_work priority inversion (2021-09-14 10:32:05 +0200)

----------------------------------------------------------------
nvme fixes for Linux 5.15

 - fix ANA state updates when a namespace is not present (Anton Eidelman)
 - nvmet: fix a width vs precision bug in nvmet_subsys_attr_serial_show
   (Dan Carpenter)
 - avoid race in shutdown namespace removal (Daniel Wagner)
 - fix io_work priority inversion in nvme-tcp (Keith Busch)
 - destroy cm id before destroy qp to avoid use after free (Ruozhu Li)

----------------------------------------------------------------
Anton Eidelman (1):
      nvme-multipath: fix ANA state updates when a namespace is not present

Dan Carpenter (1):
      nvmet: fix a width vs precision bug in nvmet_subsys_attr_serial_show()

Daniel Wagner (1):
      nvme: avoid race in shutdown namespace removal

Keith Busch (1):
      nvme-tcp: fix io_work priority inversion

Ruozhu Li (1):
      nvme-rdma: destroy cm id before destroy qp to avoid use after free

 drivers/nvme/host/core.c       | 15 +++++++--------
 drivers/nvme/host/multipath.c  |  7 +++++--
 drivers/nvme/host/rdma.c       | 16 +++-------------
 drivers/nvme/host/tcp.c        | 20 ++++++++++----------
 drivers/nvme/target/configfs.c |  2 +-
 5 files changed, 26 insertions(+), 34 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
