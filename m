Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50C9022B
	for <lists.iommu@lfdr.de>; Fri, 16 Aug 2019 15:00:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A4E8BEE6;
	Fri, 16 Aug 2019 13:00:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51A6CEB9
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 13:00:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6E0AC8A0
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/X/Y59hfbuhTR8R0c4UgnC40L7hK5mDNJVq0+XW9gto=;
	b=G725rYDoFuoO8BgzUWXYW7cYc
	vauQ7kYdyqJ03f6IcxS9qhkhtTmZSRgMnnYxZeryutg+Or3A6urZMN2jJluDdlxdncHZWpUIggkNp
	FIGRFbfJPkz+UpCMvy9Aq6BmUgXZPvKWgcUX1aiSoG8VSBe/izzbR8P9ybUABxNcXUpKkrQzY2dtN
	+n7NobpBi0tHSNiaZMPAvLsENRC7iX8PH3sPVxhS8QjeNKVXzwsaHPpodXNCAoCLr9rdPPl+1o/nE
	kb+dhjHMpvC7kQbARBJEcA5Dpjxzpt+DODNBBTry1vcpyNgTzkcaIl0bYjVSln4kbmyHwy4059iKB
	xurXgSUwQ==;
Received: from [91.112.187.46] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hybq4-0006GQ-61; Fri, 16 Aug 2019 13:00:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: swiotlb-xen cleanups
Date: Fri, 16 Aug 2019 15:00:02 +0200
Message-Id: <20190816130013.31154-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
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

Hi Xen maintainers and friends,

please take a look at this series that cleans up the parts of swiotlb-xen
that deal with non-coherent caches.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
