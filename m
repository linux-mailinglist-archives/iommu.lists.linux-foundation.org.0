Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AB256C62
	for <lists.iommu@lfdr.de>; Sun, 30 Aug 2020 08:31:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C66E6860FF;
	Sun, 30 Aug 2020 06:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bql3w5Yf2pfX; Sun, 30 Aug 2020 06:31:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B0DB9860ED;
	Sun, 30 Aug 2020 06:31:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96F63C0891;
	Sun, 30 Aug 2020 06:31:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0808C0051
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 06:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A22AB85618
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 06:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qpBPHmVy8GN for <iommu@lists.linux-foundation.org>;
 Sun, 30 Aug 2020 06:31:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 53DCA850E9
 for <iommu@lists.linux-foundation.org>; Sun, 30 Aug 2020 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=w4rdv8966e/ci26pS2v3qeUYzDOBI3t7rgVpxPk1vag=; b=cnqnp0AESXTufJkmw+5NN2Xb/N
 4VPK2PuL1Sb8xnYL1iTN85h2qjRgCTzmInTNmiD4bzi/dRt30jGHhWUJgBD9HoMUZHOEIxAlFOS/8
 6/uTTlDaGRYoM9B5M64KwwP0+/XACA1pkscZxMsyHnr+eGBQzuQff/XMVDpoYAtJ/LH5d76nES6W9
 jqNY6pn2xSfnaXvOXuWSbtxV1lfb1uuDxCLOLUX2zy3u0wPwBtuFyeyQs5buvRYcMM0CRZ1tCcvJq
 WZhHHvE6jh0mUlV2vvOCX7JwhwIby+dKVcp6vUlzYNP6YzYnpzwriIZxZaUlV8ikXrgSEBA/8t8lc
 nzBEVQ+w==;
Received: from [2001:4bb8:18c:45ba:9892:9e86:5202:32f0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCGsK-00035u-EN; Sun, 30 Aug 2020 06:31:36 +0000
Date: Sun, 30 Aug 2020 08:31:35 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fix for 5.9
Message-ID: <20200830063135.GA1224156@infradead.org>
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

The following changes since commit 15bc20c6af4ceee97a1f90b43c0e386643c071b4:

  Merge tag 'tty-5.9-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty (2020-08-26 10:58:20 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.9-2

for you to fetch changes up to 892fc9f6835ecf075efac20789b012c5c9997fcc:

  dma-pool: Fix an uninitialized variable bug in atomic_pool_expand() (2020-08-27 09:22:56 +0200)

----------------------------------------------------------------
dma-mapping fixes:

 - fix a possibly uninitialized variable (Dan Carpenter)

----------------------------------------------------------------
Dan Carpenter (1):
      dma-pool: Fix an uninitialized variable bug in atomic_pool_expand()

 kernel/dma/pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
