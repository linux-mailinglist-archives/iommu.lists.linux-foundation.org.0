Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DB162CD
	for <lists.iommu@lfdr.de>; Tue,  7 May 2019 13:29:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 661AE130D;
	Tue,  7 May 2019 11:29:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3661E12C3
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 11:29:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6424A87B
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 06:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XYiVJaYipElgO5DnYZ9IrtCvXPhrJsC2Tw1fwQg5GSA=;
	b=M2nM+YCCYmiZNNCEpsr9d0tYK
	BlAg0kfZ2aS0QA5DIszm27dGTcv88VTH3ZzJDRYu9kQ75lDbMSp3+LisfFLwmzrNs6grL8QaJsO47
	pFii8fgK5x+Pt2gxCY9TeHgRHbiic1pONVMSR+7oDKxlNJarKhYCKWQEtbKh1fTS+XOx+JM7FG7B3
	ggIgXtbupg5yvc0ORzsOrBV23ECv/AdUqbIpBkiV849J+2N9GDEKIuJ+LLLjBmI9T95YzXhbEPMUA
	bVjERUFjbkl0Z91J1BcS9bFD+QGStzRPb+mF9beVASs+FiesV2/vSyTBHhmy35tu0L4hThVRAwXH7
	Q3cz+FZdw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hNtlg-0002k3-HT; Tue, 07 May 2019 06:40:00 +0000
Date: Mon, 6 May 2019 23:40:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <tmurphy@arista.com>
Subject: Re: [PATCH v3 2/4] iommu/dma-iommu: Handle deferred devices
Message-ID: <20190507064000.GB5173@infradead.org>
References: <20190506185207.31069-1-tmurphy@arista.com>
	<20190506185207.31069-3-tmurphy@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506185207.31069-3-tmurphy@arista.com>
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
	iommu@lists.linux-foundation.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	Andy Gross <andy.gross@linaro.org>, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, murphyt7@tcd.ie,
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

On Mon, May 06, 2019 at 07:52:04PM +0100, Tom Murphy wrote:
> +static int handle_deferred_device(struct device *dev)
> +{
> +	struct iommu_domain *domain;
> +	const struct iommu_ops *ops;
> +
> +	if (!is_kdump_kernel())
> +		return 0;
> +
> +	domain = iommu_get_domain_for_dev(dev);

> -	dma_handle =__iommu_dma_map(dev, phys, size,
> +	if (unlikely(handle_deferred_device(dev)))
> +		return DMA_MAPPING_ERROR;
> +
> +	dma_handle = __iommu_dma_map(dev, phys, size,

__iommu_dma_map already looks up the domain, and as far as I can
tell all callers need the handle_deferred_device call.  Should we
just move it to there and pass the domain from the caller?

Also shouldn't the iommu_attach_device call inside
handle_deferred_device also get an unlikely marker?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
