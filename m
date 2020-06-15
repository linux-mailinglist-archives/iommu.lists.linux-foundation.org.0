Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 313751F8EF1
	for <lists.iommu@lfdr.de>; Mon, 15 Jun 2020 09:00:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED3F6868AB;
	Mon, 15 Jun 2020 07:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvPbny4jUq2Q; Mon, 15 Jun 2020 07:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83150867A5;
	Mon, 15 Jun 2020 07:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75EF3C016E;
	Mon, 15 Jun 2020 07:00:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F169BC016E
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D4BFA87F5F
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NftHk6whjmzs for <iommu@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:00:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3227387C5A
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 07:00:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 010A568B05; Mon, 15 Jun 2020 09:00:14 +0200 (CEST)
Date: Mon, 15 Jun 2020 09:00:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [patch for-5.8 4/4] dma-direct: add missing
 set_memory_decrypted() for coherent mapping
Message-ID: <20200615070014.GC21248@lst.de>
References: <alpine.DEB.2.22.394.2006111218200.153880@chino.kir.corp.google.com>
 <alpine.DEB.2.22.394.2006111220010.153880@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2006111220010.153880@chino.kir.corp.google.com>
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

On Thu, Jun 11, 2020 at 12:20:32PM -0700, David Rientjes wrote:
> When a coherent mapping is created in dma_direct_alloc_pages(), it needs
> to be decrypted if the device requires unencrypted DMA before returning.
> 
> Fixes: 3acac065508f ("dma-mapping: merge the generic remapping helpers
> into dma-direct")
> Cc: stable@vger.kernel.org # 5.5+
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  kernel/dma/direct.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -195,6 +195,12 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
>  				__builtin_return_address(0));
>  		if (!ret)
>  			goto out_free_pages;
> +		if (force_dma_unencrypted(dev)) {
> +			err = set_memory_decrypted((unsigned long)ret,
> +						   1 << get_order(size));
> +			if (err)
> +				goto out_free_pages;
> +		}

Note that ret is a vmalloc address here.  Does set_memory_decrypted
work for that case?  Again this should be mostly theoretical, so I'm
not too worried for now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
