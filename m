Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 715EF6A84A
	for <lists.iommu@lfdr.de>; Tue, 16 Jul 2019 14:10:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 00BADCA1;
	Tue, 16 Jul 2019 12:10:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF638AC7
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 12:10:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5D24363D
	for <iommu@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 12:10:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9A83F227A81; Tue, 16 Jul 2019 14:10:26 +0200 (CEST)
Date: Tue, 16 Jul 2019 14:10:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: cma_remap when using dma_alloc_attr :- DMA_ATTR_NO_KERNEL_MAPPING
Message-ID: <20190716121026.GB2388@lst.de>
References: <CACDBo56EoKca9FJCnbztWZAARdUQs+B=dmCs+UxW27yHNu5pzQ@mail.gmail.com>
	<57f8aa35-d460-9933-a547-fbf578ea42d3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57f8aa35-d460-9933-a547-fbf578ea42d3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pankaj.suryawanshi@einfochips.com,
	Pankaj Suryawanshi <pankajssuryawanshi@gmail.com>,
	linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	minchan.kim@gmail.com, minchan@kernel.org,
	Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>
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

On Tue, Jul 16, 2019 at 01:02:19PM +0100, Robin Murphy wrote:
>> Lets say 4k video allocation required 300MB cma memory but not required
>> virtual mapping for all the 300MB, its require only 20MB virtually mapped
>> at some specific use case/point of video, and unmap virtual mapping after
>> uses, at that time this functions will be useful, it works like ioremap()
>> for cma_alloc() using dma apis.
>
> Hmm, is there any significant reason that this case couldn't be handled 
> with just get_vm_area() plus dma_mmap_attrs(). I know it's only *intended* 
> for userspace mappings, but since the basic machinery is there...

Because the dma helper really are a black box abstraction.

That being said DMA_ATTR_NO_KERNEL_MAPPING and DMA_ATTR_NON_CONSISTENT
have been a constant pain in the b**t.  I've been toying with replacing
them with a dma_alloc_pages or similar abstraction that just returns
a struct page that is guaranteed to be dma addressable by the passed
in device.  Then the driver can call dma_map_page / dma_unmap_page /
dma_sync_* on it at well.  This would replace DMA_ATTR_NON_CONSISTENT
with a sensible API, and also DMA_ATTR_NO_KERNEL_MAPPING when called
with PageHighmem, while providing an easy to understand API and
something that can easily be fed into the various page based APIs
in the kernel.

That being said until we get arm moved over the common dma direct
and dma-iommu code, and x86 fully moved over to dma-iommu it just
seems way too much work to even get it into the various architectures
that matter, never mind all the fringe IOMMUs.  So for now I've just
been trying to contain the DMA_ATTR_NON_CONSISTENT and
DMA_ATTR_NO_KERNEL_MAPPING in fewer places while also killing bogus
or pointless users of these APIs.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
