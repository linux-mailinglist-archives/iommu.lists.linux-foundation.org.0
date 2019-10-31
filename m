Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB87EB45F
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 16:57:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 62DF0CA4;
	Thu, 31 Oct 2019 15:57:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00D45C7F
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 15:57:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9BAEF87C
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 15:57:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4F39B68BE1; Thu, 31 Oct 2019 16:57:50 +0100 (CET)
Date: Thu, 31 Oct 2019 16:57:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
Message-ID: <20191031155750.GA7394@lst.de>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
	<20191031154759.GA7162@lst.de>
	<40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
	linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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

On Thu, Oct 31, 2019 at 04:53:13PM +0100, Nicolas Saenz Julienne wrote:
> > > +#define ARM64_ZONE_DMA_BITS	30
> > > +
> > >  /*
> > >   * We need to be able to catch inadvertent references to memstart_addr
> > >   * that occur (potentially in generic code) before arm64_memblock_init()
> > > @@ -424,6 +427,8 @@ void __init arm64_memblock_init(void)
> > >  	else
> > >  		arm64_dma_phys_limit = PHYS_MASK + 1;
> > >  
> > > +	zone_dma_bits = ARM64_ZONE_DMA_BITS;
> > > +
> > >  	reserve_crashkernel();
> > 
> > This actually adds a new limit, as there wasn't one before for arm64.
> 
> Well, as zone_dma_bits is only relevant in dma/direct when ZONE_DMA is defined
> I figured it doesn't matter if the variable is set conditionally to ZONE_DMA or
> not.

I'd much prefer that to do separately.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
