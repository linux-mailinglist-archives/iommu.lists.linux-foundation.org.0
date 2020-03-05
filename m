Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0F17A920
	for <lists.iommu@lfdr.de>; Thu,  5 Mar 2020 16:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFD9B86B2D;
	Thu,  5 Mar 2020 15:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1LCk9fsCEnJc; Thu,  5 Mar 2020 15:45:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6074986B33;
	Thu,  5 Mar 2020 15:45:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57C3DC013E;
	Thu,  5 Mar 2020 15:45:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77F30C013E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 62BE187D8B
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNwKLGtFvvg2 for <iommu@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:45:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DC71287D7B
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:44:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C4FC168B05; Thu,  5 Mar 2020 16:44:56 +0100 (CET)
Date: Thu, 5 Mar 2020 16:44:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc 5/6] dma-direct: atomic allocations must come from
 unencrypted pools
Message-ID: <20200305154456.GC5332@lst.de>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011538040.213582@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003011538040.213582@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 baekhw@google.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Sun, Mar 01, 2020 at 04:05:23PM -0800, David Rientjes wrote:
> When AMD memory encryption is enabled, all non-blocking DMA allocations
> must originate from the atomic pools depending on the device and the gfp
> mask of the allocation.
> 
> Keep all memory in these pools unencrypted.
> 
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  arch/x86/Kconfig    | 1 +
>  kernel/dma/direct.c | 9 ++++-----
>  kernel/dma/remap.c  | 2 ++
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1523,6 +1523,7 @@ config X86_CPA_STATISTICS
>  config AMD_MEM_ENCRYPT
>  	bool "AMD Secure Memory Encryption (SME) support"
>  	depends on X86_64 && CPU_SUP_AMD
> +	select DMA_DIRECT_REMAP

I think we need to split the pool from remapping so that we don't drag
in the remap code for x86.

>  	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    dma_alloc_need_uncached(dev, attrs) &&

We still need a check here for either uncached or memory encryption.

> @@ -141,6 +142,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	if (!addr)
>  		goto free_page;
>  
> +	set_memory_decrypted((unsigned long)page_to_virt(page), nr_pages);

This probably warrants a comment.

Also I think the infrastructure changes should be split from the x86
wire up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
