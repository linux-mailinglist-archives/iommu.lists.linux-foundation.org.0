Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6184439
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 08:04:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DAB7CDCF;
	Wed,  7 Aug 2019 06:04:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4C1D6C6A
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:04:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D5BCE7D2
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 06:04:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BFD0A68CEE; Wed,  7 Aug 2019 08:04:33 +0200 (CEST)
Date: Wed, 7 Aug 2019 08:04:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Shawn Anastasio <shawn@anastas.io>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190807060432.GD6627@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
	<20190805080145.5694-2-hch@lst.de>
	<7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	iommu@lists.linux-foundation.org, Paul Burton <paul.burton@mips.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Hogan <jhogan@kernel.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>
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

On Tue, Aug 06, 2019 at 09:39:06PM +0200, Shawn Anastasio wrote:
>> -#ifdef CONFIG_ARCH_HAS_DMA_MMAP_PGPROT
>>   pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>>   		unsigned long attrs);
>> -#else
>> -# define arch_dma_mmap_pgprot(dev, prot, attrs)	pgprot_noncached(prot)
>> -#endif
>
> Nit, but maybe the prototype should still be ifdef'd here? It at least
> could prevent a reader from incorrectly thinking that the function is
> always present.

Actually it is typical modern Linux style to just provide a prototype
and then use "if (IS_ENABLED(CONFIG_FOO))" to guard the call(s) to it.

>
> Also, like Will mentioned earlier, the function name isn't entirely
> accurate anymore. I second the suggestion of using something like
> arch_dma_noncoherent_pgprot().

As mentioned I plan to remove arch_dma_mmap_pgprot for 5.4, so I'd
rather avoid churn for the short period of time.

> As for your idea of defining
> pgprot_dmacoherent for all architectures as
>
> #ifndef pgprot_dmacoherent
> #define pgprot_dmacoherent pgprot_noncached
> #endif
>
> I think that the name here is kind of misleading too, since this
> definition will only be used when there is no support for proper
> DMA coherency.

Do you have a suggestion for a better name?  I'm pretty bad at naming,
so just reusing the arm name seemed like a good way to avoid having
to make naming decisions myself.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
