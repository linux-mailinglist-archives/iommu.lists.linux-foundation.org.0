Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995D162BA
	for <lists.iommu@lfdr.de>; Tue,  7 May 2019 13:24:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8C5DA130D;
	Tue,  7 May 2019 11:24:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 042031311
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 11:24:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A181E834
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TvZeaeAy9vEIfKAGEKlI3TfoHOJ88dzRbyl1QHu6By8=;
	b=HpsUMi8JcABK4F7j/9suEVKoC
	YfA5GEgzPRqcD773WA24aESnahNs4znn6YYBLoU2Lz/vCywoOAJRvRLcYCj+DKvvKswYMc2wy9iue
	2mkAbF4QIgapRI5B0taVSEsgIATttbKsqd0S4tonG9hYL2wHVQ4eHzU+siokbr6x9eZeNsZtzsPoj
	gImA6EOSte1xBX5RH+xyv2ojahSuE479j8LisTBYabH12VVM+XJuK+g7AfyhGT9KvbUXRcb/x87Jf
	6kthw/hML0UWcZs93wCHkduD10ly9LN2Ofrz/9RZ98MH3AyLeNL91EwGE0hZmj1ZO4c8lCU+rYiPi
	rYry1GA8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hNth5-0001AM-FV; Tue, 07 May 2019 06:35:15 +0000
Date: Mon, 6 May 2019 23:35:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <tmurphy@arista.com>
Subject: Re: [PATCH v2 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
Message-ID: <20190507063515.GA5173@infradead.org>
References: <20190430002952.18909-1-tmurphy@arista.com>
	<20190430002952.18909-4-tmurphy@arista.com>
	<20190430111222.GA3191@infradead.org>
	<da835ce2-f73e-3035-e1d7-d3028cc1a838@arm.com>
	<20190430113253.GA23210@infradead.org>
	<96ebb6fc-a889-fa94-09ba-65d505b85724@arm.com>
	<CAPL0++61WytVhs63tvt+hdpZKXGinrkYx=4nDtNx1UoNTRWWjw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPL0++61WytVhs63tvt+hdpZKXGinrkYx=4nDtNx1UoNTRWWjw@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Mon, May 06, 2019 at 06:56:13PM +0100, Tom Murphy wrote:
> Just to make this clear, I won't apply Christoph's patch (the one in
> this email thread) and instead the only change I will make is to
> rename dma_limit to dma_mask.

Sounds good for now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
