Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1726F8BD
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 10:55:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7FDC204F7;
	Fri, 18 Sep 2020 08:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUEsZI7MRXbT; Fri, 18 Sep 2020 08:55:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E1935203FA;
	Fri, 18 Sep 2020 08:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB901C0051;
	Fri, 18 Sep 2020 08:55:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DF06C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFDC8203FA
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srqTOqE5apHz for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 08:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id B696B203E6
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 08:55:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 496CB396; Fri, 18 Sep 2020 10:55:03 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:55:01 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Murphy <murphyt7@tcd.ie>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] Handle init_iova_flush_queue failure in dma-iommu path
Message-ID: <20200918085501.GJ31590@8bytes.org>
References: <20200910122539.3662-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910122539.3662-1-murphyt7@tcd.ie>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Thu, Sep 10, 2020 at 01:25:38PM +0100, Tom Murphy wrote:
> init_iova_flush_queue can fail if we run out of memory. Fall back to noflush
>  queue if it fails.
> 
> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>  drivers/iommu/dma-iommu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 4959f5df21bd..5f69126f3e91 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -343,8 +343,11 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
>  
>  	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
>  			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
> -		cookie->fq_domain = domain;
> -		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all, NULL);
> +		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
> +					NULL))
> +			pr_warn("iova flush queue initialization failed\n");
> +		else
> +			cookie->fq_domain = domain;
>  	}
>  
>  	if (!dev)

Looks good to me, but Robin should also have a look.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
