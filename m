Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31FDB245
	for <lists.iommu@lfdr.de>; Thu, 17 Oct 2019 18:25:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1C052F81;
	Thu, 17 Oct 2019 16:24:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D5B7FF73
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 16:24:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8ED28608
	for <iommu@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tM11n8HxbnKWuIhVBFZir6ZW0eaOohaPCZqy9IypX4U=;
	b=SFBW3KU2AFnuPudmAUQJa1JCr
	lzNCY42eqxDiR5TpNp5EuDL8nzHiMAQ48K5MeYMzAxKbrGFWSDWMk8nwju4mlbJTvAvLQ+hE0IPXH
	wW6N08roi74hu6tGILnTfvmhDThfE55UeyADHlEOntoNPWirpMlWavoCHICueEnFAG6sWhJHWx6Cw
	cj9RGPjUb8JTHrccwaeYX3JtE/Coju00bGauyGPykagxvMPlG/cOuiXRXQgzh8FX1h6VHS30t6Ngq
	ImVcFe7rnAxwd9JQj8INAsbLw+PQP10U7atjrXkNsLllu8GjFi9/4yAo5AkcuQoqV7hKkcB7BrxLW
	vMka7sSwA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iL8a5-0005qh-Mk; Thu, 17 Oct 2019 16:24:53 +0000
Date: Thu, 17 Oct 2019 09:24:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Relax locking in iommu_dma_prepare_msi()
Message-ID: <20191017162453.GA6012@infradead.org>
References: <5af5e77102ca52576cb96816f0abcf6398820055.1571245656.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5af5e77102ca52576cb96816f0abcf6398820055.1571245656.git.robin.murphy@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: maz@kernel.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, julien.grall@arm.com
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

On Wed, Oct 16, 2019 at 06:07:36PM +0100, Robin Murphy wrote:
> @@ -1180,7 +1179,7 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>  	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>  	struct iommu_dma_cookie *cookie;
>  	struct iommu_dma_msi_page *msi_page;
> -	unsigned long flags;
> +	static DEFINE_MUTEX(msi_prepare_lock);

Just a style nitpick, but I find locks declared inside functions
really weird.  In addition to that locks not embedded into a structure
and not directly next to variables or data structures they protect
really need a comment explaining what they are trying to serialize.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
