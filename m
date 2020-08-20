Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08524AE4D
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 07:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94D9387D2C;
	Thu, 20 Aug 2020 05:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1wB5tr7oWYP; Thu, 20 Aug 2020 05:15:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22AA7876D4;
	Thu, 20 Aug 2020 05:15:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1E02C0051;
	Thu, 20 Aug 2020 05:15:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 497D5C0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 05:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 29C00863E0
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 05:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59FvW93bgyIO for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 05:15:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 64E5A86396
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 05:15:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A894C68BEB; Thu, 20 Aug 2020 07:15:12 +0200 (CEST)
Date: Thu, 20 Aug 2020 07:15:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 19/28] dma-mapping: replace DMA_ATTR_NON_CONSISTENT
 with dma_{alloc, free}_pages
Message-ID: <20200820051512.GA5141@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-20-hch@lst.de>
 <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
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

On Wed, Aug 19, 2020 at 05:03:52PM +0200, Tomasz Figa wrote:
> >
> > -Warning: These pieces of the DMA API should not be used in the
> > -majority of cases, since they cater for unlikely corner cases that
> > -don't belong in usual drivers.
> > +These APIs allow to allocate pages that can be used like normal pages
> > +in the kernel direct mapping, but are guaranteed to be DMA addressable.
> 
> Could we elaborate a bit more on what "like normal pages in kernel
> direct mapping" mean from the driver perspective?

It mostly means you can call virt_to_page and then do anything you'd
do with a page struct.  Unlike dma_alloc_attrs that just return an
opaque virtual address that the caller is not allowed to poke into.

> There is one aspect that the existing dma_alloc_attrs() handles, but
> this new function doesn't: IOMMU support. The function will always
> allocate a physically-contiguous block memory, which is a costly
> operation and not even guaranteed to succeed, even if enough free
> memory is available.
> 
> Modern SoCs employ IOMMUs to avoid the need to allocate
> physically-contiguous memory and those happen to be also the devices
> that could benefit from non-coherent allocations a lot. One of the
> tasks of the DMA API was making it possible to allocate suitable
> memory for a given device, without having the driver know about the
> SoC integration details, such as the presence of an IOMMU.

This is completely out of scope for this API exactly because it
guarantees a page in the direct mapping.  But see my previous mail
in reply to Robin on how you can implement the funtionality you
want right now without any help from the dma-mapping subsystem.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
