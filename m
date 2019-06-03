Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084E328DE
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 08:53:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 996CFC59;
	Mon,  3 Jun 2019 06:53:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6B6B6B59
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 06:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1B6C3A3
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k1Y72xAeyNQVGy9ylmCGgXDESvm5qgLMBgCfXm7Ynkg=;
	b=GZoDqhYFhv5g1uAHC5JnRv239
	ZMRLSrun0b20rFY7TlkmLMxFsdjGFYRdViecZ9Sy7z6SP5t9sZOtcJ+TdXPBq7Mk28fdFGc4W4MSH
	UXbnE1fatuw6apfWRA1cwrJYv00rj0fUeY9Mo3zsE/VTkojoSlyz+8BpO64knBfnUpE5sRdicLhFb
	erP4rZZNQZx382ZEUQh7flR5dchAQgl5mLJktiyB/TzJd6Bn4b+AkQhhyceeSZU7iZY20Vz9PzwD7
	SA78IjF4Wu3S4jfDGGqx7ufSAZBDPsoJ04gHaZBls1Zdoy3lz6q55jp9EF431FTjS4+KIKu/Hh19i
	X3oIM3WtQ==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXgqV-00064i-D9; Mon, 03 Jun 2019 06:53:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Ley Foon Tan <lftan@altera.com>,
	Michal Simek <monstr@monstr.eu>
Subject: switch nios2 and microblaze to use the generic uncached segement
	support
Date: Mon,  3 Jun 2019 08:53:22 +0200
Message-Id: <20190603065324.9724-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
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

Hi all,

can you take a look at this series?  It switches niops2 and microblaze to
use the generic dma layer support for uncached segements.

The dma mapping for-next git tree that includes the support is available
here:

    git://git.infradead.org/users/hch/dma-mapping.git for-next

Gitweb:

    http://git.infradead.org/users/hch/dma-mapping.git/shortlog/refs/heads/for-next
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
