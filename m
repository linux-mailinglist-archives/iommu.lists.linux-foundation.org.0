Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 116517EE89
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 10:14:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAEF6E96;
	Fri,  2 Aug 2019 08:14:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58472E8F
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 08:14:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 66707E7
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 08:14:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9F17E68B05; Fri,  2 Aug 2019 10:14:41 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:14:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190802081441.GA9725@lst.de>
References: <20190801142118.21225-1-hch@lst.de>
	<20190801142118.21225-2-hch@lst.de>
	<20190801162305.3m32chycsdjmdejk@willie-the-truck>
	<20190801163457.GB26588@lst.de>
	<20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	linux-arm-kernel@lists.infradead.org
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

On Thu, Aug 01, 2019 at 05:44:12PM +0100, Will Deacon wrote:
> > > Although arch_dma_mmap_pgprot() is a bit of a misnomer now that it only
> > > gets involved in the non-coherent case.
> > 
> > A better name is welcome.
> 
> How about arch_dma_noncoherent_mmap_pgprot() ? Too long?

Sounds a little long yes.  And doesn't fix the additional problem that
we don't just it for mmap but also for the in-kernel remapping these
days.

> > But my worry is how this interacts with architectures that have an
> > uncached segment (mips, nios2, microblaze, extensa) where we'd have
> > the kernel access DMA_ATTR_WRITE_COMBINE mappigns using the uncached
> > segment, and userspace mmaps using pgprot_writecombine, which could
> > lead to aliasing issues.  But then again mips already supports
> > DMA_ATTR_WRITE_COMBINE, so this must be ok somehow.  I guess I'll
> > need to field that question to the relevant parties.
> 
> Or it's always been busted and happens to work out in practice...

I've sent a ping to the mips folks.  While we'are at it:  arm64
and arm32 (optionally) map dma coherent allocations as write combine.
I suspect this hasn't always just been busted but intentional (of course!),
but is there any chance to get a quote from the arm architecture spec
on why this is fine as it looks rather confusion?

Also if we assume mips is buggy DMA_ATTR_WRITE_COMBINE really just seems
to be there for old arm platforms, which makes the scope pretty limited.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
