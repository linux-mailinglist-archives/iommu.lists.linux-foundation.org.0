Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B741167B2
	for <lists.iommu@lfdr.de>; Mon,  9 Dec 2019 08:54:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13FEC87688;
	Mon,  9 Dec 2019 07:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlqP8BxfECip; Mon,  9 Dec 2019 07:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 650BD87666;
	Mon,  9 Dec 2019 07:54:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A8F0C1D8B;
	Mon,  9 Dec 2019 07:54:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C839AC0881
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 07:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B64C72078B
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 07:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zl30CPE+5hA2 for <iommu@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 07:54:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 544AC20528
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 07:54:23 +0000 (UTC)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EAA2206D3;
 Mon,  9 Dec 2019 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575878063;
 bh=l5RNIqY71fgRQ4gflWGJ6VKGFQXsfgVwTeBzBRWCnmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdeQwFjYFMVzFUr+WBxPM2UoXcUM34dHDHDlXse6W6pGhUNw4fXvyRJZsZxwoSt7e
 /90E+MSe4ehpwRUS2sdbf77ubqB8d1DrkO2CSKEuGO9YsT9AvJPnhG7JbgbZEksY6H
 qnqAaymyoD4xlJ8PxUL70giW5qfYCn6C8GYHBKGs=
Date: Mon, 9 Dec 2019 09:54:15 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: ensure that swiotlb buffer is allocated from
 low memory
Message-ID: <20191209075413.GA4137@rapoport-lnx>
References: <20191204123524.22919-1-rppt@kernel.org>
 <87h82aqcju.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h82aqcju.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: linux-arch@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Robin Murphy <robin.murphy@arm.com>
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

On Mon, Dec 09, 2019 at 04:43:17PM +1100, Michael Ellerman wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Some powerpc platforms (e.g. 85xx) limit DMA-able memory way below 4G. If a
> > system has more physical memory than this limit, the swiotlb buffer is not
> > addressable because it is allocated from memblock using top-down mode.
> >
> > Force memblock to bottom-up mode before calling swiotlb_init() to ensure
> > that the swiotlb buffer is DMA-able.
> >
> > Link: https://lkml.kernel.org/r/F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de
> 
> This wasn't bisected, but I thought it was a regression. Do we know what
> commit caused it?
> 
> Was it 25078dc1f74b ("powerpc: use mm zones more sensibly") ?

swiotlb buffer is initialized before zones are actually used, so probably
not :)
 
> Or was that a red herring?
> 
> cheers
> 
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Darren Stevens <darren@stevens-zone.net>
> > Cc: mad skateman <madskateman@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  arch/powerpc/mm/mem.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index be941d382c8d..14c2c53e3f9e 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -260,6 +260,14 @@ void __init mem_init(void)
> >  	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
> >  
> >  #ifdef CONFIG_SWIOTLB
> > +	/*
> > +	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
> > +	 * 4G. We force memblock to bottom-up mode to ensure that the
> > +	 * memory allocated in swiotlb_init() is DMA-able.
> > +	 * As it's the last memblock allocation, no need to reset it
> > +	 * back to to-down.
> > +	 */
> > +	memblock_set_bottom_up(true);
> >  	swiotlb_init(0);
> >  #endif
> >  
> > -- 
> > 2.24.0

-- 
Sincerely yours,
Mike.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
