Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E73C24335F5
	for <lists.iommu@lfdr.de>; Tue, 19 Oct 2021 14:29:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67FE980E41;
	Tue, 19 Oct 2021 12:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHEqLPkRVy1T; Tue, 19 Oct 2021 12:29:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82DF080EC7;
	Tue, 19 Oct 2021 12:29:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F987C0022;
	Tue, 19 Oct 2021 12:29:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4DE2C000D
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 12:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C03BD60B96
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 12:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEew3aFXYQdj for <iommu@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 12:29:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9751B60B95
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=D2EdOHj3w1D+ALquOX8L67YwOi2t62nGC9hbUIODr5k=; b=MKwPHE2+v+MztLO3oqiU5WaBeW
 h+DrgvIbqISIlJm55nVM5PoSBRu+FPuEvxbEBMRWso5BTOmeHQ13zIqd9e395i85Aee8bKbBiujk5
 vu9kQxX5cQXjk+mBwwDo+K8PSd+Kvt7ntIdiE0w50Gu0WS4SXmaYa+MKIkHGl/RYaS72dd4SSVIMP
 pYTRk+iqcUCMOaTGApyFOZZYigB1bh77jNqNggvMR3MyvxkTdLkF4oafE9OgPxKPXGg4GjOIK/79g
 76FStza+S11Q9H2pWDsu3MQcdRy9XDrOHFhBN8kgTCqum2Cw5eS/mC9Dul6AzS9xWle37IH1FTKx0
 fdL5axlg==;
Received: from [2001:4bb8:180:8777:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcoF4-001C1x-Tr; Tue, 19 Oct 2021 12:29:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: dma-direct cleanups
Date: Tue, 19 Oct 2021 14:29:12 +0200
Message-Id: <20211019122916.2468032-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>, id Rientjes <rientjes@google.com>
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

Linus complained about the complex flow in dma_direct_alloc, so this
tries to simplify it a bit, and while I was at it I also made sure that
unencrypted pages never leak back into the page allocator.

Diffstat
 direct.c |  133 +++++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 74 insertions(+), 59 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
