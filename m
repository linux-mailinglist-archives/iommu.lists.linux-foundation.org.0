Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1321A28D4
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 20:51:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B41C684537;
	Wed,  8 Apr 2020 18:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m29Ozrv4NkbR; Wed,  8 Apr 2020 18:50:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D6C584506;
	Wed,  8 Apr 2020 18:50:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58630C1D89;
	Wed,  8 Apr 2020 18:50:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B68FCC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE206882E7
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KNbE+6U3iCaH for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 18:50:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4FFC688368
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 18:50:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C976168C4E; Wed,  8 Apr 2020 20:49:58 +0200 (CEST)
Date: Wed, 8 Apr 2020 20:49:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] dma-debug: fix displaying of dma allocation type
Message-ID: <20200408184958.GA9945@lst.de>
References: <20200408184804.30522-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408184804.30522-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
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

On Wed, Apr 08, 2020 at 09:48:04PM +0300, Grygorii Strashko wrote:
> The commit 2e05ea5cdc1a ("dma-mapping: implement dma_map_single_attrs using
> dma_map_page_attrs") removed "dma_debug_page" enum, but missed to update
> type2name string table. This causes incorrect displaying of dma allocation
> type. Fix it by removing "page" string from type2name string table.
> 
> Before (dma_alloc_coherent()):
> k3-ringacc 4b800000.ringacc: scather-gather idx 2208 P=d1140000 N=d114 D=d1140000 L=40 DMA_BIDIRECTIONAL dma map error check not applicable
> k3-ringacc 4b800000.ringacc: scather-gather idx 2216 P=d1150000 N=d115 D=d1150000 L=40 DMA_BIDIRECTIONAL dma map error check not applicable
> 
> After:
> k3-ringacc 4b800000.ringacc: coherent idx 2208 P=d1140000 N=d114 D=d1140000 L=40 DMA_BIDIRECTIONAL dma map error check not applicable
> k3-ringacc 4b800000.ringacc: coherent idx 2216 P=d1150000 N=d115 D=d1150000 L=40 DMA_BIDIRECTIONAL dma map error check not applicable
> 
> Fixes: 2e05ea5cdc1a ("dma-mapping: implement dma_map_single_attrs using dma_map_page_attrs")
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>  kernel/dma/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 2031ed1ad7fa..09b85ba0c137 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -137,7 +137,7 @@ static const char *const maperr2str[] = {
>  	[MAP_ERR_CHECKED] = "dma map error checked",
>  };
>  
> -static const char *type2name[5] = { "single", "page",
> +static const char *type2name[5] = { "single",
>  				    "scather-gather", "coherent",
>  				    "resource" };

To make sure this doesn't happen anymore, can you switch to
named initializers?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
