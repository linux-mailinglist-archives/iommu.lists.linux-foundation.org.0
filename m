Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC8A2A63
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 00:57:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 71AAD59BB;
	Thu, 29 Aug 2019 22:56:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D84C249F0
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:56:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A462CE6
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 22:56:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 11A082189D;
	Thu, 29 Aug 2019 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567119366;
	bh=0kUMYx7gzVlJowquO77IfOfcqdoB3q98qT54dRfDbCg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EqimipHf7BH6EosF+GwoK6BM8E2syjcI0kMZftzMiYm6rAZSnLaWOt686dkvfGR/T
	9IkxHwg9ivTMCQi2vw/hoW7Ups6jtlB+W006m6+Xm+1RpSUCK4StjNRtFJvRRfnwIg
	in2Z0zXILN00ru92/mCbUQrfTw7f3x/nZElUXS60=
Date: Thu, 29 Aug 2019 15:55:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
Subject: Re: swiotlb-xen cleanups v2
In-Reply-To: <20190826121944.515-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908291554270.4927@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
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

On Mon, 26 Aug 2019, Christoph Hellwig wrote:
> Hi Xen maintainers and friends,
> 
> please take a look at this series that cleans up the parts of swiotlb-xen
> that deal with non-coherent caches.
> 
> Changes since v1:
>  - rewrite dma_cache_maint to be much simpler
>  - improve various comments and commit logs
>  - remove page-coherent.h entirely

Thanks for your work on this, it really makes the code better. I tested
it on ARM64 with a non-coherent network device and verified it works as
intended (Cadence GEM on ZynqMP).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
