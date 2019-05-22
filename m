Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A72FC263D5
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 14:29:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E6C4D3D;
	Wed, 22 May 2019 12:29:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8BFE0D2A
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 12:29:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 24367102
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nxaaWX0j8rFdFCm/Kf6KfpdTfcr9NsWGTpWvZ3FHBhY=;
	b=hv+PrGcylD/RhViTAbwni3aq1
	xe+7U3VaHnwsgGlkvd6kOaP3tj0cLVstCL+jvUkotoawj7TvJkprlo8xC8sdmbgZZz/5CGp9TayKo
	+38KKYlYkz7v0fEugB/tLaHxcEA5tOnG/Jo9XASNI3pUW4nlcqjHm5tfRib9ZKMX0bHss9nMvyfyZ
	xETV4B2pzSyFYFzRc3IY7//hjt/rI0yWMhUnlFB3F4rH1rlPBgE9yai1f1GavQKEaz2jeQmOpDARB
	wr0tmLu1YVa50sjtikBE4l9nW0qFp0d6fdWq2KLZmKuSU2IGdpPtVDpygUOvJQxPlaDLHvK1iD0WC
	U1I0r1KYg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hTQMg-0002qe-3G; Wed, 22 May 2019 12:29:02 +0000
Date: Wed, 22 May 2019 05:29:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: use multiple segments if
	possible
Message-ID: <20190522122901.GA4583@infradead.org>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1558520319-16452-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558520319-16452-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-block@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	wsa+renesas@sang-engineering.com, iommu@lists.linux-foundation.org
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

On Wed, May 22, 2019 at 07:18:39PM +0900, Yoshihiro Shimoda wrote:
> In IOMMU environment, since it's possible to merge scatter gather
> buffers of memory requests to one iova, this patch changes the max_segs
> value when init_card of mmc_host timing to improve the transfer
> performance on renesas_sdhi_internal_dmac.

Well, you can't merge everything with an IOMMU.  For one not every
IOMMU can merge multiple scatterlist segments, second even it can merge
segements the segments need to be aligned to the IOMMU page size.  And
then of course we might have an upper limit on the total mapping.

> +	if (host->pdata->max_segs < SDHI_MAX_SEGS_IN_IOMMU &&
> +	    host->pdev->dev.iommu_group &&
> +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> +		host->mmc->max_segs = SDHI_MAX_SEGS_IN_IOMMU;

This is way to magic.  We'll need a proper DMA layer API to expose
this information, and preferably a block layer helper to increase
max_segs instead of hacking that up in the driver.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
