Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A81475F12
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 08:30:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1C3F7B7A;
	Fri, 26 Jul 2019 06:30:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E6FBB59
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 06:30:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B1661709
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 06:30:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CEB8F227A81; Fri, 26 Jul 2019 08:30:25 +0200 (CEST)
Date: Fri, 26 Jul 2019 08:30:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 2/2] dma-contiguous: page-align the size in
	dma_free_contiguous()
Message-ID: <20190726063025.GF22881@lst.de>
References: <20190725233959.15129-1-nicoleotsuka@gmail.com>
	<20190725233959.15129-3-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725233959.15129-3-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dafna.hirschfeld@collabora.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de
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

On Thu, Jul 25, 2019 at 04:39:59PM -0700, Nicolin Chen wrote:
> According to the original dma_direct_alloc_pages() code:
> {
> 	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
> 
> 	if (!dma_release_from_contiguous(dev, page, count))
> 		__free_pages(page, get_order(size));
> }
> 
> The count parameter for dma_release_from_contiguous() was page
> aligned before the right-shifting operation, while the new API
> dma_free_contiguous() forgets to have PAGE_ALIGN() at the size.
> 
> So this patch simply adds it to prevent any corner case.
> 
> Fixes: fdaeec198ada ("dma-contiguous: add dma_{alloc,free}_contiguous() helpers")
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
