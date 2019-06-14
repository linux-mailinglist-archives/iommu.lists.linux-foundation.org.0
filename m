Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 394FA45A44
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 12:21:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 231371135;
	Fri, 14 Jun 2019 10:21:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78C171135
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 10:21:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30B7AE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C/mJGHsUXNarC0adgGvdVnC+DHqIGH0Q83nZGJCdLIM=;
	b=RezFpL5px34ciiZ/i44h9iOt1
	Tg9UgniUaV7oeWDNZZe8opEoXrmda1RA+qPswhrUyGH39B5/OfH+F3Gk1VnLilmuZY44mFMXIUfjz
	ZW+mMb75M1z75WHPiEM2FIhKJ8pp43OS8PHyHgkFEHD7Elhly0/vW8p9LOeDFuyerjMpf2i0monI+
	zVJLfNcLAAnzUszYuLIMu7i0JLsNS5BCEqTZDMYXy/Zngs8NNqxpguEu1ih1aXU7BuP619rOI7TKo
	2kI9RfJ+8MFwjJycGqu72i8wA72y5eKcPKTSc9Xjp+YaEp5EUdU+ycnit2ROvjjMTlvk5XUwTUIkm
	SF4kfJbAg==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hbjKr-0005Kj-Lf; Fri, 14 Jun 2019 10:21:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [RFC] switch m68k to use the generic remapping DMA allocator
Date: Fri, 14 Jun 2019 12:21:24 +0200
Message-Id: <20190614102126.8402-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	SUSPICIOUS_RECIPS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-m68k@lists.linux-m68k.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
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

Hi Geert and Greg,

can you take a look at the (untested) patches below?  They convert m68k
to use the generic remapping DMA allocator, which is also used by
arm64 and csky.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
