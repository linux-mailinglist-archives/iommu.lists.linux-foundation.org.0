Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5317A913
	for <lists.iommu@lfdr.de>; Thu,  5 Mar 2020 16:42:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4519F86155;
	Thu,  5 Mar 2020 15:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id moItUclaQ6NE; Thu,  5 Mar 2020 15:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4605E86135;
	Thu,  5 Mar 2020 15:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39989C18DA;
	Thu,  5 Mar 2020 15:42:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 306A8C013E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 250E986AC7
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RszVkteayq2X for <iommu@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 15:42:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9B81E83491
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 15:42:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BD43668B05; Thu,  5 Mar 2020 16:42:33 +0100 (CET)
Date: Thu, 5 Mar 2020 16:42:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc 2/6] dma-remap: add additional atomic pools to map to gfp
 mask
Message-ID: <20200305154233.GA5332@lst.de>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011537000.213582@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003011537000.213582@chino.kir.corp.google.com>
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

On Sun, Mar 01, 2020 at 04:05:13PM -0800, David Rientjes wrote:
> The single atomic pool is allocated from the lowest zone possible since
> it is guaranteed to be applicable for any DMA allocation.
> 
> Devices may allocate through the DMA API but not have a strict reliance
> on GFP_DMA memory.  Since the atomic pool will be used for all
> non-blockable allocations, returning all memory from ZONE_DMA may
> unnecessarily deplete the zone.
> 
> Provision for multiple atomic pools that will map to the optimal gfp
> mask of the device.  These will be wired up in a subsequent patch.
> 
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  kernel/dma/remap.c | 75 +++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
> --- a/kernel/dma/remap.c
> +++ b/kernel/dma/remap.c
> @@ -100,6 +100,8 @@ void dma_common_free_remap(void *cpu_addr, size_t size)
>  
>  #ifdef CONFIG_DMA_DIRECT_REMAP
>  static struct gen_pool *atomic_pool __ro_after_init;
> +static struct gen_pool *atomic_pool_dma32 __ro_after_init;
> +static struct gen_pool *atomic_pool_normal __ro_after_init;

Maybe rename atomic_pool as well as it really kinda looks like the
default at the moment?

>  
>  #define DEFAULT_DMA_COHERENT_POOL_SIZE  SZ_256K
>  static size_t atomic_pool_size __initdata = DEFAULT_DMA_COHERENT_POOL_SIZE;
> @@ -111,66 +113,79 @@ static int __init early_coherent_pool(char *p)
>  }
>  early_param("coherent_pool", early_coherent_pool);
>  
> -static gfp_t dma_atomic_pool_gfp(void)
> +static int __init __dma_atomic_pool_init(struct gen_pool **pool,
> +					 size_t pool_size, gfp_t gfp)
>  {

Can this just return the pool and return NULL (or an ERR_PTR) on
failure?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
