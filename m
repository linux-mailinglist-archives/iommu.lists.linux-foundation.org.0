Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 47323278DE9
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 18:18:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E40EC87627;
	Fri, 25 Sep 2020 16:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRbwuZPIOD2F; Fri, 25 Sep 2020 16:18:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1944B875A9;
	Fri, 25 Sep 2020 16:18:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAFA9C1AD6;
	Fri, 25 Sep 2020 16:18:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8DFEC0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 929C486980
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5ipPTcBiTAK for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 16:18:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B50A8694A
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:18:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 39A7E68AFE; Fri, 25 Sep 2020 18:17:55 +0200 (CEST)
Date: Fri, 25 Sep 2020 18:17:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 08/18] dma-mapping: add a new dma_alloc_noncoherent API
Message-ID: <20200925161754.GA18721@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-9-hch@lst.de>
 <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Fri, Sep 25, 2020 at 12:15:37PM +0100, Robin Murphy wrote:
> On 2020-09-15 16:51, Christoph Hellwig wrote:
> [...]
>> +These APIs allow to allocate pages in the kernel direct mapping that are
>> +guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
>> +virt_to_page can be called on the resulting address, and the resulting
>
> Nit: if we explicitly describe this as if it's a guarantee that can be 
> relied upon...
>
>> +struct page can be used for everything a struct page is suitable for.
>
> [...]
>> +This routine allocates a region of <size> bytes of consistent memory.  It
>> +returns a pointer to the allocated region (in the processor's virtual address
>> +space) or NULL if the allocation failed.  The returned memory may or may not
>> +be in the kernels direct mapping.  Drivers must not call virt_to_page on
>> +the returned memory region.
>
> ...then forbid this document's target audience from relying on it, 
> something seems off. At the very least it's unhelpfully unclear :/
>
> Given patch #17, I suspect that the first paragraph is the one that's no 
> longer true.

Yes.  dma_alloc_pages is the replacement for allocations that need the
direct mapping.  I'll send a patch to document dma_alloc_pages and
fixes this up
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
