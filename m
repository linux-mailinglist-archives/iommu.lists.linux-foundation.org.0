Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54182D7559
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:43:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A544CA4;
	Tue, 15 Oct 2019 11:43:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9BB48C7C
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:43:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 965936D6
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:43:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39529337;
	Tue, 15 Oct 2019 04:43:34 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6F43F68E;
	Tue, 15 Oct 2019 04:43:33 -0700 (PDT)
Subject: Re: [PATCH] iommu: rockchip: Free domain on .domain_free
To: Ezequiel Garcia <ezequiel@collabora.com>, Joerg Roedel <joro@8bytes.org>, 
	Heiko Stuebner <heiko@sntech.de>
References: <20191002172923.22430-1-ezequiel@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <815abfca-a15f-365d-438c-5616a05b0513@arm.com>
Date: Tue, 15 Oct 2019 12:43:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191002172923.22430-1-ezequiel@collabora.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
	kernel@collabora.com, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 02/10/2019 18:29, Ezequiel Garcia wrote:
> IOMMU domain resource life is well-defined, managed
> by .domain_alloc and .domain_free.
> 
> Therefore, domain-specific resources shouldn't be tied to
> the device life, but instead to its domain.

FWIW,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   drivers/iommu/rockchip-iommu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 26290f310f90..e845bd01a1a2 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -979,13 +979,13 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
>   	if (!dma_dev)
>   		return NULL;
>   
> -	rk_domain = devm_kzalloc(dma_dev, sizeof(*rk_domain), GFP_KERNEL);
> +	rk_domain = kzalloc(sizeof(*rk_domain), GFP_KERNEL);
>   	if (!rk_domain)
>   		return NULL;
>   
>   	if (type == IOMMU_DOMAIN_DMA &&
>   	    iommu_get_dma_cookie(&rk_domain->domain))
> -		return NULL;
> +		goto err_free_domain;
>   
>   	/*
>   	 * rk32xx iommus use a 2 level pagetable.
> @@ -1020,6 +1020,8 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
>   err_put_cookie:
>   	if (type == IOMMU_DOMAIN_DMA)
>   		iommu_put_dma_cookie(&rk_domain->domain);
> +err_free_domain:
> +	kfree(rk_domain);
>   
>   	return NULL;
>   }
> @@ -1048,6 +1050,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
>   
>   	if (domain->type == IOMMU_DOMAIN_DMA)
>   		iommu_put_dma_cookie(&rk_domain->domain);
> +	kfree(rk_domain);
>   }
>   
>   static int rk_iommu_add_device(struct device *dev)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
