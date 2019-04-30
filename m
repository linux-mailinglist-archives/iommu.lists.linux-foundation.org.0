Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5DF5BB
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 13:33:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E5971067;
	Tue, 30 Apr 2019 11:33:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DCC4B1028
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D96787D
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bTJakeGtXfCFO8teZRiPCc85hwY+hi5jOYp83RF2vK8=;
	b=dDD5+vZ4p7vFzthS3GF6A0TlP
	ou3DVrSmopmodYFGsBbdcncayzVXwQG3COqT57jRiBZUGiydOiTieZk5+UCHSbNOGdwMhA3TK3I5f
	tZ3149OtnCiWjvgs+yLvDEwj3ntD3Kf0bfxa/+FEReeeRVjYs5JGFmBcNOf9H1ulIRxXk5aILadkd
	8td8Z7QYGelf3PNUPabK7mtdtZ/YBJie8Lr7Jfb3avfZnu6GGONkihvjPeK56qnyAEgV4CSxuMSKS
	5VCu/Q1DOFX/FBg7oC5ZE6sEaKbjonvJSX/oXJGOGcS4KM4fNZ2FfQzjL/fS2ZaHkhjEDrsU5wjOp
	SkVGgORmA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hLR0H-00069j-G0; Tue, 30 Apr 2019 11:32:53 +0000
Date: Tue, 30 Apr 2019 04:32:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
Message-ID: <20190430113253.GA23210@infradead.org>
References: <20190430002952.18909-1-tmurphy@arista.com>
	<20190430002952.18909-4-tmurphy@arista.com>
	<20190430111222.GA3191@infradead.org>
	<da835ce2-f73e-3035-e1d7-d3028cc1a838@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da835ce2-f73e-3035-e1d7-d3028cc1a838@arm.com>
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
	Tom Murphy <tmurphy@arista.com>, linux-kernel@vger.kernel.org,
	murphyt7@tcd.ie, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
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

On Tue, Apr 30, 2019 at 12:27:02PM +0100, Robin Murphy wrote:
> > Hmm, I don't think we need the DMA mask for the MSI mapping, this
> > should probably always use a 64-bit mask.
> 
> If that were true then we wouldn't need DMA masks for regular mappings
> either. If we have to map the MSI doorbell at all, then we certainly have to
> place it at an IOVA that the relevant device is actually capable of
> addressing.

Well, as shown by the patch below we don't even look at the DMA mask
for the MSI page - we just allocate from bottom to top.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
