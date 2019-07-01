Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CAD12CA7
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 13:46:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 10EA3393D;
	Fri,  3 May 2019 11:46:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFE9F378B
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 11:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 91BD087
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 11:44:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EBDF374;
	Fri,  3 May 2019 04:44:58 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	DA2A53F220; Fri,  3 May 2019 04:44:56 -0700 (PDT)
Date: Fri, 3 May 2019 12:44:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/25] iommu/dma: Remove the flush_page callback
Message-ID: <20190503114454.GD55449@arrakis.emea.arm.com>
References: <20190430105214.24628-1-hch@lst.de>
	<20190430105214.24628-5-hch@lst.de>
	<20190503114335.GC55449@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503114335.GC55449@arrakis.emea.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Will Deacon <will.deacon@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, May 03, 2019 at 12:43:35PM +0100, Catalin Marinas wrote:
> On Tue, Apr 30, 2019 at 06:51:53AM -0400, Christoph Hellwig wrote:
> > We now have a arch_dma_prep_coherent architecture hook that is used
> > for the generic DMA remap allocator, and we should use the same
> > interface for the dma-iommu code.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >  arch/arm64/mm/dma-mapping.c | 8 +-------
> >  drivers/iommu/dma-iommu.c   | 8 +++-----
> >  include/linux/dma-iommu.h   | 3 +--
> >  3 files changed, 5 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> > index 674860e3e478..10a8852c8b6a 100644
> > --- a/arch/arm64/mm/dma-mapping.c
> > +++ b/arch/arm64/mm/dma-mapping.c
> > @@ -104,12 +104,6 @@ arch_initcall(arm64_dma_init);
> >  #include <linux/platform_device.h>
> >  #include <linux/amba/bus.h>
> >  
> > -/* Thankfully, all cache ops are by VA so we can ignore phys here */
> > -static void flush_page(struct device *dev, const void *virt, phys_addr_t phys)
> > -{
> > -	__dma_flush_area(virt, PAGE_SIZE);
> > -}
> 
> Rather than removing, should this not become arch_dma_prep_coherent()?
> With patch 2 selecting the corresponding Kconfig option, I think with
> this patch you'd get a build error (haven't tried).

Ah, sorry, it was already there.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
