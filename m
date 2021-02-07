Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0F312600
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:26:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 66A48859CC;
	Sun,  7 Feb 2021 16:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOJMnkP_K28G; Sun,  7 Feb 2021 16:26:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06032858D4;
	Sun,  7 Feb 2021 16:26:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDE42C013A;
	Sun,  7 Feb 2021 16:26:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DE86C013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 11CAD20133
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yThJ1i20fOUE for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:26:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id EFA7220131
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=oyOjEuJbaUrZDVi6UGKFq49upkI+s55d99FAd7+Mq7w=; b=qbvGukdAbhx4ukLix1XzXe3ubg
 VZs6q8VrGPboR1IsRvsJhE07wh0WeYDjgMv17EquwBMJp6IVN0FNUNB11NuEB4ls9mLcxu9eVAjnm
 Pw3W2PXghA3x1puBVaK0iLdR+8UFZ3RUev9OqWmi1TXkXhad9SiK3LVw4U5voPL1ez4hdYAN0GyV6
 JzvrsojyPybHB5ygNgFzez3pu0fadojegg6K/jzoHQSc38uOQpBCQAHJx5YuvwaGg/dzjWFDerHHu
 wblBBeZ/vE3IFq7S7ASLokdKRaBJfwGqaP8p6sMo/q3mAqaN+kB73qdXQ+FfX/OryvCcTg6BDvrqG
 ljrxeMdQ==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8msw-004uha-Gz; Sun, 07 Feb 2021 16:26:08 +0000
Date: Sun, 7 Feb 2021 17:26:05 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fix for 5.11
Message-ID: <YCAUnVvH3rA24ZCa@infradead.org>
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

The following changes since commit dd86e7fa07a3ec33c92c957ea7b642c4702516a0:

  Merge tag 'pci-v5.11-fixes-2' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci (2021-02-04 16:05:40 -0800)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.11-2

for you to fetch changes up to 9f5f8ec50165630cfc49897410b30997d4d677b5:

  dma-mapping: benchmark: use u8 for reserved field in uAPI structure (2021-02-05 12:48:46 +0100)

----------------------------------------------------------------
dma-mapping fixes for 5.11:

 - fix a 32 vs 64-bit padding issue in the new benchmark code
   (Barry Song)

----------------------------------------------------------------
Barry Song (1):
      dma-mapping: benchmark: use u8 for reserved field in uAPI structure

 kernel/dma/map_benchmark.c                      | 2 +-
 tools/testing/selftests/dma/dma_map_benchmark.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
