Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B84B91F8EC8
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 08:55:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 633C186C23;
	Mon, 15 Jun 2020 06:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsUiuKmjV-nt; Mon, 15 Jun 2020 06:55:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EF1486C2F;
	Mon, 15 Jun 2020 06:55:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82E0BC016E;
	Mon, 15 Jun 2020 06:55:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58879C016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 06:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 47320226E9
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 06:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-WYTKJeucyi for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 06:55:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 5F7E0220D0
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 06:55:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 82E9968B02; Mon, 15 Jun 2020 08:54:55 +0200 (CEST)
Date: Mon, 15 Jun 2020 08:54:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [patch for-5.8 1/4] dma-direct: always align allocation size
 in dma_direct_alloc_pages()
Message-ID: <20200615065455.GA21248@lst.de>
References: <alpine.DEB.2.22.394.2006111218200.153880@chino.kir.corp.google.com>
 <alpine.DEB.2.22.394.2006111218570.153880@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2006111218570.153880@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Thu, Jun 11, 2020 at 12:20:28PM -0700, David Rientjes wrote:
> dma_alloc_contiguous() does size >> PAGE_SHIFT and set_memory_decrypted()
> works at page granularity.  It's necessary to page align the allocation
> size in dma_direct_alloc_pages() for consistent behavior.
> 
> This also fixes an issue when arch_dma_prep_coherent() is called on an
> unaligned allocation size for dma_alloc_need_uncached() when
> CONFIG_DMA_DIRECT_REMAP is disabled but CONFIG_ARCH_HAS_DMA_SET_UNCACHED
> is enabled.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  kernel/dma/direct.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -112,11 +112,12 @@ static inline bool dma_should_free_from_pool(struct device *dev,
>  struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  		gfp_t gfp, unsigned long attrs)
>  {
> -	size_t alloc_size = PAGE_ALIGN(size);
>  	int node = dev_to_node(dev);
>  	struct page *page = NULL;
>  	u64 phys_limit;
>  
> +	VM_BUG_ON(!PAGE_ALIGNED(size));

This really should be a WARN_ON_ONCE, but I've fixed this up before
applying.  I've also added a prep patch to mark __dma_direct_alloc_pages
static as part of auditing for other callers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
