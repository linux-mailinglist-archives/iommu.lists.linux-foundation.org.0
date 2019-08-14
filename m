Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B18D541
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 15:46:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DAABF104F;
	Wed, 14 Aug 2019 13:46:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 527D9103B
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:46:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ADE17711
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RmX8WjIupDdnINeFjwa1Y0zzdLqr8cYRTyEmffBOcmQ=;
	b=oav8mtDciXTWkq/r2god3JxID
	k2qVomfIwQb70tmiSUMOe8ww4/LGHcbYaN5ZhYo8G0o04CtjY4DKG9lz6Eir6idNuDN+23SK+bVq5
	jbMicth+DKqO+DHmRPE+trfuMeX515LryxzeseVdGMop8aMzN+EiN8DOwJmkmn44ZLIbch02MBYl8
	agnKWYT3dBQoKdCiCLYlF1gnu8RTCC8gGyP7OqJM4jE1lNrUPYOYM/iCbyNvuhFUy1Ask6j3M1Ack
	9gI0mii+pNm5aAB2w4x6W6qNPHVjcvmkxxR0smER+EI11tW+3PUsZXQ4makNhZEhpv6F+FQH1tWo8
	yp75P0fQQ==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hxtbV-0003Z3-UA; Wed, 14 Aug 2019 13:46:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Subject: convert sh to the generic dma remap allocator
Date: Wed, 14 Aug 2019 15:46:14 +0200
Message-Id: <20190814134615.29442-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Hi Rich and Yoshinori,

can you take a quick look at this patch that moves sh over to the
generic DMA remap allocator?  I've been trying to slowly get all
architectures over to the generic code, and I'd like merge this one
for 5.4 now that it has been posted a handful of times without any
feedback.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
