Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9841FC75B
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 09:27:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9074D2050A;
	Wed, 17 Jun 2020 07:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyH3Pv6-n8lF; Wed, 17 Jun 2020 07:27:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 950E82041F;
	Wed, 17 Jun 2020 07:27:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73F86C016E;
	Wed, 17 Jun 2020 07:27:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E52BFC016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE9B12041F
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VDBj5UooY9RF for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 07:27:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id ED32E20412
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=NRn8O7QYdNpRrlpQXqZW82Rfx5PaLTNAyku21vFzCVU=; b=fIldEh8F0gwl0Xcrw20BWI7wS5
 mS05t+cN5LkOX+nposGs10vbzg0P6uJFl8vFD3VCSwGeEn4to17QJtaqmvbkmcgsooV1odPuO8QLv
 EmtvCecJoB6DVODf+B8IEMbXXR5HEMdrmNcTybSgXRZtAncvjjPmJsjHVti3Y+FdU2LIniiWQ4804
 XCWT7EtndQfzact0uZ4cgKPYO43d+xrUNR47ou3Ei4RMM3FFZ8gpgCMYxDiPQcI/7Bhd6PvovI33q
 Xyi8UstkcnnSulnbbJxy7b0osokUiNLYdeJd//ZL4crd+3tHi2JWGK9Rr0wSAGlG57wcVLzBWmkP0
 iFQzVATw==;
Received: from 195-192-102-148.dyn.cablelink.at ([195.192.102.148]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlSTf-0003eU-IM; Wed, 17 Jun 2020 07:27:19 +0000
Date: Wed, 17 Jun 2020 09:27:16 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] dma-mapping fixes for 5.8
Message-ID: <20200617072716.GA7356@infradead.org>
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

The following changes since commit abfbb29297c27e3f101f348dc9e467b0fe70f919:

  Merge tag 'rproc-v5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc (2020-06-08 13:01:08 -0700)

are available in the Git repository at:

  git://git.infradead.org/users/hch/dma-mapping.git tags/dma-mapping-5.8-3

for you to fetch changes up to dbed452a078d56bc7f1abecc3edd6a75e8e4484e:

  dma-pool: decouple DMA_REMAP from DMA_COHERENT_POOL (2020-06-15 08:35:30 +0200)

----------------------------------------------------------------
dma-mapping fixes for 5.8

 - fixes for the SEV atomic pool (Geert Uytterhoeven and David Rientjes)

----------------------------------------------------------------
David Rientjes (1):
      dma-pool: decouple DMA_REMAP from DMA_COHERENT_POOL

Geert Uytterhoeven (1):
      dma-pool: fix too large DMA pools on medium memory size systems

 kernel/dma/Kconfig | 10 +++++-----
 kernel/dma/pool.c  |  7 +++----
 2 files changed, 8 insertions(+), 9 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
