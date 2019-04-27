Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B88AB3FF
	for <lists.iommu@lfdr.de>; Sat, 27 Apr 2019 18:47:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C50F81A5F;
	Sat, 27 Apr 2019 16:47:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5329A1A59
	for <iommu@lists.linux-foundation.org>;
	Sat, 27 Apr 2019 16:46:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A0EBB875
	for <iommu@lists.linux-foundation.org>;
	Sat, 27 Apr 2019 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3A4MMVFyJaHzHHkM6gHiD57x9smeH3QHU7KPXmbZSDw=;
	b=JFslVtbqb8Xk7UezEFwCOzsYq
	Z5Aq2Y8zTTk/51MJN1Ed1yMVT19PprZKmDEFj46MAfuXJV5chkPuzPZqP0Lplm7tgTy+m9hW1IPMI
	Dlvjg0nWkgVsCdsVf0JGrGxcrLXnafW00jFTiJxun/0fMpr10ILMzOjXnhdKzwuNpGy6Xzh4kw8Hi
	fa/PPcK89psBW4qLC510FYerG4xn0hYW8TuaG+SnKEdUvdEnIc47HCZGllN6BlIFHTrxiuQnVgilo
	vSqlQ/Ov084psRj/0LeF7fevR94oXo07muDL90zv2NWuemOC+yjiDtNedJg0sR/cw8Or3XA1cLRa7
	WErQZxx0Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hKQSr-0004Wb-09; Sat, 27 Apr 2019 16:46:13 +0000
Date: Sat, 27 Apr 2019 09:46:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: laurentiu.tudor@nxp.com
Subject: Re: [PATCH v2 7/9] dpaa_eth: fix iova handling for contiguous frames
Message-ID: <20190427164612.GA12450@infradead.org>
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
	<20190427071031.6563-8-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190427071031.6563-8-laurentiu.tudor@nxp.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, roy.pledge@nxp.com,
	linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
	iommu@lists.linux-foundation.org, camelia.groza@nxp.com,
	linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
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

On Sat, Apr 27, 2019 at 10:10:29AM +0300, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> The driver relies on the no longer valid assumption that dma addresses
> (iovas) are identical to physical addressees and uses phys_to_virt() to
> make iova -> vaddr conversions. Fix this by adding a function that does
> proper iova -> phys conversions using the iommu api and update the code
> to use it.
> Also, a dma_unmap_single() call had to be moved further down the code
> because iova -> vaddr conversions were required before the unmap.
> For now only the contiguous frame case is handled and the SG case is
> split in a following patch.
> While at it, clean-up a redundant dpaa_bpid2pool() and pass the bp
> as parameter.

Err, this is broken.  A driver using the DMA API has no business
call IOMMU APIs.  Just save the _virtual_ address used for the mapping
away and use that again.  We should not go through crazy gymnastics
like this.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
