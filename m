Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA96ECAAE
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 23:02:32 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E606F21;
	Fri,  1 Nov 2019 22:02:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03139F11
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 22:02:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3DBE114D
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 22:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tafFLZmewLbEDx8TiinbeGDWVo8wkmBodv2ClgdKJQE=;
	b=MToHrMyRirf32af8dC0Djrwmt
	CzD5HgreXYVjw3epEIOHMynSifSgvdf5Q6p1qYJxtEfmiF/MkkaXxCzKC5DgBBNAw0E66IayQScZK
	+lrMcr4N09gUG8IXMVULJ0lXA3aNZ1tcugjjAxujKCT57n5fJwb5BvLgXHoL6Z7k6WOq/0PU9+hBe
	U06beuroEKt+mcSxuQIIIC6ncP55URjWGmjZPXIm92fnwVYCAAMuY8/pLcxQ1243FKDy+xnQKyk+7
	nly7GDsv2Fyx68f4Ymtmjo2C1S0Bntl67ZpmWQPUmTFnMlu4iIhgmMLMunPMA1btRILnu7vpDmIqS
	HNy6axjBg==;
Received: from [199.255.44.128] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQezu-0004FP-VO; Fri, 01 Nov 2019 22:02:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Max Filippov <jcmvbkbc@gmail.com>, Chris Zankel <chris@zankel.net>,
	iommu@lists.linux-foundation.org
Subject: switch xtensa over to the generic DMA remap / uncached segment code
Date: Fri,  1 Nov 2019 15:02:08 -0700
Message-Id: <20191101220213.28949-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-xtensa@linux-xtensa.org
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

this series switches over xtensa to use the generic DMA remap and
uncached code.  Xtensa is a little special because it uses an uncached
segment by default, but can still use page table bits for remapping
highmem.  To facilitate that there is some major refactoring in the
common DMA code that merges the remapping code into the main direct
mapping alloc / free routines.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
