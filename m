Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A050FCA8
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 17:21:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D9AC1AEF;
	Tue, 30 Apr 2019 15:21:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 509201A8D
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 15:21:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE51E879
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 15:21:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 18DE167358; Tue, 30 Apr 2019 17:20:59 +0200 (CEST)
Date: Tue, 30 Apr 2019 17:20:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC/RFT PATCH 1/2] dma-contiguous: Simplify
	dma_*_from_contiguous() function calls
Message-ID: <20190430152058.GC25447@lst.de>
References: <20190430015521.27734-1-nicoleotsuka@gmail.com>
	<20190430015521.27734-2-nicoleotsuka@gmail.com>
	<d43e1cfe-1d12-c0c6-d76b-81330918d9ab@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d43e1cfe-1d12-c0c6-d76b-81330918d9ab@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: tony@atomide.com, catalin.marinas@arm.com, will.deacon@arm.com,
	jcmvbkbc@gmail.com, hch@lst.de, sfr@canb.auug.org.au,
	linux@armlinux.org.uk, treding@nvidia.com,
	linux-xtensa@linux-xtensa.org, keescook@chromium.org,
	Nicolin Chen <nicoleotsuka@gmail.com>, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, chris@zankel.net,
	wsa+renesas@sang-engineering.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, iamjoonsoo.kim@lge.com,
	dwmw2@infradead.org
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

On Tue, Apr 30, 2019 at 01:52:26PM +0100, Robin Murphy wrote:
> As Catalin pointed out before, many of the users above may still have 
> implicit assumptions about the default CMA area, i.e. that this won't 
> return something above the limit they originally passed to 
> dma_contiguous_reserve(). I'm not sure how straightforward that is to 
> resolve - at the very least we may have to monkey around with GFP_DMA{32} 
> flags based on where dma_contiguous_default_area lies :(

Or just convert the callers one by one.  The two most interesting ones
are dma-direct which always check addressability after the allocation,
and dma-iommu, which doesn't care.  dma-iommu.c and intel-iommu.c also
don't care, but should use dma-iommu by next merge window anyway,
which leaves arm which is so complicated that we better don't touch
it for now, and xtensa, which I hope to switch to dma-direct in the
next merge window or two.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
