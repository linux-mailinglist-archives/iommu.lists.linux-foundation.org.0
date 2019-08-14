Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB18D584
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 16:03:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E131E7F;
	Wed, 14 Aug 2019 14:03:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ABDE1C84
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:03:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 65C60711
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=noq9D28/MFUyTTAkpQb2LOKGLfTUJVojb3JEcNK7ESc=;
	b=dIkrneJpUUE5jFGK9cE4sKex1
	RuQo1h61KDw7YU4VPSL0P7EhIyGX31V57BcI96RTwFzp6p3tXHlpmXLyglFPWhIeThPiHWwusCLLn
	Xton+x5r10Ah1SjAdOk8QfzK7ZmjtvQ98Ne+KP2q9etTK1zouPZ7Z1HRactqllCAvsTlg8Bedf5o3
	uBFMh9AmiSu7tSvBoCGTOJPyzYWxj4FoKz+glo/CnxZNuczqhDNZsL0EOHJgEGxsuMZkRknRYMLKw
	mTh+UlmBHiVtBxEgt/7K18UVFEOuOTTbJiejNz/kqhhsrHZ/lauPLkISpO1SXwCwserE9GY5ezzTB
	nhnVvydyQ==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hxtsU-00012q-TA; Wed, 14 Aug 2019 14:03:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Michal Simek <monstr@monstr.eu>
Subject: convert microblaze to the generic dma remap allocator
Date: Wed, 14 Aug 2019 16:03:46 +0200
Message-Id: <20190814140348.3339-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Michal,

can you take a look at this patch that moves microblaze over to the
generic DMA remap allocator?  I've been trying to slowly get all
architectures over to the generic code, and microblaze is one that
seems very straightfoward to convert.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
