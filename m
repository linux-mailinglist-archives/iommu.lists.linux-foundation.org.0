Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0B9162C4F
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 18:16:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAAFC86D5A;
	Tue, 18 Feb 2020 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRji6EcsVehC; Tue, 18 Feb 2020 17:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4DA9486C3A;
	Tue, 18 Feb 2020 17:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3927CC013E;
	Tue, 18 Feb 2020 17:16:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91729C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 88E9F86C3A
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQhkZ2IL6PzZ for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:16:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 521C986727
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DtnUK1xASlzt/HMPi6EpJNZIY4HCkmIAFuNb2drX+S0=; b=nC+ckAaT3f0TAwRj0Ixv6COnz/
 bA8ppTmtfdRbDRfBmTwGTFcdaCHxAYu9PVgc0w5snowjNkbT+n4eLW1hs54bAMcv0OKxlJTjHavJd
 H6gMAgypDPoZMtrY7/TZ82zhFO8PUHqCaXqU1KHWKMmFgJ/uZeuC9/w7wTfEN+SwvyLl934e1cw4n
 VO/cEhnVRwSmNe+zRgzOM+E0iq5RN3m2K4Xf6CQ+Kvud+VDqfpWJDDXeN4h2iwPQ0rrYI4Xs6yWZc
 hweugJeJIVA6jl7GSvXKH8i0l9nvCgc9svIb+7fOJo7kt/zfvx30a/iQevoRSoy8JZuPYPa3NFrVu
 6tnzLF2w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j46Tp-0005de-Ng; Tue, 18 Feb 2020 17:16:17 +0000
Date: Tue, 18 Feb 2020 09:16:17 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 2/5] iommu/vt-d: Move deferred device attachment into
 helper function
Message-ID: <20200218171617.GB7067@infradead.org>
References: <20200217193858.26990-1-joro@8bytes.org>
 <20200217193858.26990-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217193858.26990-3-joro@8bytes.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> +static void do_deferred_attach(struct device *dev)
>  {
> +	struct iommu_domain *domain;
>  
> +	dev->archdata.iommu = NULL;
> +	domain = iommu_get_domain_for_dev(dev);
> +	if (domain)
> +		intel_iommu_attach_device(domain, dev);
> +}
> +
> +static struct dmar_domain *deferred_attach_domain(struct device *dev)
> +{
> +	if (unlikely(attach_deferred(dev)))
> +		do_deferred_attach(dev);
>  
>  	return find_domain(dev);
>  }

Can we start using proper sybmbol prefixes and avoid do_* names where
possible?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
