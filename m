Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E124D9C0D1
	for <lists.iommu@lfdr.de>; Sun, 25 Aug 2019 00:41:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2EAEC87;
	Sat, 24 Aug 2019 22:41:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E3E1EC6F;
	Sat, 24 Aug 2019 22:41:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE2ED735;
	Sat, 24 Aug 2019 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tPOE4Ko2NQO863SdIwCTZol1z9/vjcbnUu9WQHeGjfE=;
	b=PkhxhVAUMsw3rpDDQ9Elsjsnh
	Tx/iXaKWEjKlRJVlNbFtCS9joDf449b5e/w2fS4ZGBtElHzrjgp0jfXF96y03Tsu9Pt5UHeDGE0E8
	DsMrs2baF0USaDHeb8Px5bDApXhzaulHN0jg70EDDERhXzEKeUu12ArTY7c/al2DtsXvV2r72wIGP
	AQr+qmf3K2Jx9+6A+N5G+/n+NF89CzPFpakodIGX8OBDPm8xwOV8yqA7bO3MEZjwJwZLJp0fVR2go
	v5lx4WoO7R5Y5/QjJlI5U7JpNRMgfgYPe4vfnm86L1UXFJ5gsUfvINzi1bOEcmGUV88+qXVR1M94i
	tgB2WGYWw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1i1eiy-0003rr-8F; Sat, 24 Aug 2019 22:41:32 +0000
Date: Sat, 24 Aug 2019 15:41:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Tom Murphy <murphyt7@tcd.ie>
Subject: Re: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD
	iommu driver
Message-ID: <20190824224132.GA14806@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
	<20190815110944.3579-2-murphyt7@tcd.ie>
	<20190820094143.GA24154@infradead.org>
	<CALQxJussiGDzWFT1xhko6no5jZNOezWCFuJQUCr4XwH4NHri3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALQxJussiGDzWFT1xhko6no5jZNOezWCFuJQUCr4XwH4NHri3Q@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, virtualization@lists.linux-foundation.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
	linux-s390@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

Thank for the explanation Tom. It might make sense to add a condensed
version of it to commit log for the next iteration.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
