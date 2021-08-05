Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3F3E1174
	for <lists.iommu@lfdr.de>; Thu,  5 Aug 2021 11:38:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4990682CFD;
	Thu,  5 Aug 2021 09:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfbPHlUXY0RA; Thu,  5 Aug 2021 09:38:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7012E83134;
	Thu,  5 Aug 2021 09:38:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ED17C000E;
	Thu,  5 Aug 2021 09:38:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFA2FC000E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 09:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B76D340435
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 09:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2y9QRLAu_laM for <iommu@lists.linux-foundation.org>;
 Thu,  5 Aug 2021 09:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B678403E2
 for <iommu@lists.linux-foundation.org>; Thu,  5 Aug 2021 09:38:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168B16D;
 Thu,  5 Aug 2021 02:38:05 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFEED3F719;
 Thu,  5 Aug 2021 02:38:03 -0700 (PDT)
Subject: Re: [PATCH v3 02/25] iommu/amd: Drop IOVA cookie management
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org, will@kernel.org
References: <cover.1628094600.git.robin.murphy@arm.com>
 <ebc82f082d5fde58557efbec66f34b1be6a12599.1628094600.git.robin.murphy@arm.com>
Message-ID: <44f5c699-1177-7f1d-479e-59a8a42efab6@arm.com>
Date: Thu, 5 Aug 2021 10:37:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ebc82f082d5fde58557efbec66f34b1be6a12599.1628094600.git.robin.murphy@arm.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, rajatja@google.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
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

On 2021-08-04 18:15, Robin Murphy wrote:
> The core code bakes its own cookies now.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> 
> v3: Also remove unneeded include
> ---
>   drivers/iommu/amd/iommu.c | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 52fe2326042a..92f7cbe3d14a 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -20,7 +20,6 @@
>   #include <linux/scatterlist.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/dma-direct.h>
> -#include <linux/dma-iommu.h>

Oh dear, how embarrassing... I went through all the drivers making that 
decision based on iommu_dma* references but totally forgot about 
iommu_setup_dma_ops() here. And then of course fell into the trap of 
"such a minor change I don't need to re-rest it" hubris... sigh, roll 
back to v2 for this one.

Apologies,
Robin.

>   #include <linux/iommu-helper.h>
>   #include <linux/delay.h>
>   #include <linux/amd-iommu.h>
> @@ -1918,16 +1917,7 @@ static struct iommu_domain *amd_iommu_domain_alloc(unsigned type)
>   	domain->domain.geometry.aperture_end   = ~0ULL;
>   	domain->domain.geometry.force_aperture = true;
>   
> -	if (type == IOMMU_DOMAIN_DMA &&
> -	    iommu_get_dma_cookie(&domain->domain) == -ENOMEM)
> -		goto free_domain;
> -
>   	return &domain->domain;
> -
> -free_domain:
> -	protection_domain_free(domain);
> -
> -	return NULL;
>   }
>   
>   static void amd_iommu_domain_free(struct iommu_domain *dom)
> @@ -1944,9 +1934,6 @@ static void amd_iommu_domain_free(struct iommu_domain *dom)
>   	if (!dom)
>   		return;
>   
> -	if (dom->type == IOMMU_DOMAIN_DMA)
> -		iommu_put_dma_cookie(&domain->domain);
> -
>   	if (domain->flags & PD_IOMMUV2_MASK)
>   		free_gcr3_table(domain);
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
