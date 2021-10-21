Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7114369BF
	for <lists.iommu@lfdr.de>; Thu, 21 Oct 2021 19:50:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DFA6073C;
	Thu, 21 Oct 2021 17:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 125l-AGoOUiO; Thu, 21 Oct 2021 17:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBE1260F1C;
	Thu, 21 Oct 2021 17:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA810C0011;
	Thu, 21 Oct 2021 17:50:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD84EC0011
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 885E440100
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 17:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NgbyycvGCNFJ for <iommu@lists.linux-foundation.org>;
 Thu, 21 Oct 2021 17:50:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 035FA4023B
 for <iommu@lists.linux-foundation.org>; Thu, 21 Oct 2021 17:50:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E3B2D6E;
 Thu, 21 Oct 2021 10:50:45 -0700 (PDT)
Received: from [10.57.27.231] (unknown [10.57.27.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27F713F70D;
 Thu, 21 Oct 2021 10:50:44 -0700 (PDT)
Subject: Re: [PATCH][next] iommu/dma: Use kvcalloc() instead of kvzalloc()
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
References: <20210928222229.GA280355@embeddedor>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <15e7ed54-2a4d-3e96-7181-d15b65ff5138@arm.com>
Date: Thu, 21 Oct 2021 18:50:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928222229.GA280355@embeddedor>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-09-28 23:22, Gustavo A. R. Silva wrote:
> Use 2-factor argument form kvcalloc() instead of kvzalloc().

If we have a thing for that now, then sure, why not. FWIW this can't 
ever overflow due to where "count" comes from, but it has no reason to 
be special.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/iommu/dma-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 896bea04c347..18c6edbe5fbf 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -616,7 +616,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
>   	if (!order_mask)
>   		return NULL;
>   
> -	pages = kvzalloc(count * sizeof(*pages), GFP_KERNEL);
> +	pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
>   	if (!pages)
>   		return NULL;
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
