Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFE34E54D
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 12:21:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E41B40383;
	Tue, 30 Mar 2021 10:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yj5sPyNBWodi; Tue, 30 Mar 2021 10:21:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012E840360;
	Tue, 30 Mar 2021 10:21:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C12ADC000A;
	Tue, 30 Mar 2021 10:21:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61EFBC000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43247400FC
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EygRpceYIba for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 10:21:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67392400D3
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 10:21:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 737E5ED1;
 Tue, 30 Mar 2021 03:21:30 -0700 (PDT)
Received: from [10.57.27.121] (unknown [10.57.27.121])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B79213F792;
 Tue, 30 Mar 2021 03:21:29 -0700 (PDT)
Subject: Re: [PATCH] dma-mapping: add unlikely hint to error path in
 dma_mapping_error
To: Heiner Kallweit <hkallweit1@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <78757abc-ef8f-9a29-9020-967370eec365@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d0bf2035-76d3-aea1-8867-8e6cf523e2fd@arm.com>
Date: Tue, 30 Mar 2021 11:21:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <78757abc-ef8f-9a29-9020-967370eec365@gmail.com>
Content-Language: en-GB
Cc: "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>
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

On 2021-03-26 21:03, Heiner Kallweit wrote:
> Zillions of drivers use the unlikely() hint when checking the result of
> dma_mapping_error(). This is an inline function anyway, so we can move
> the hint into the function and remove it from drivers over time.

I'm pretty sure I reviewed this last time - please remember to pick up 
tags from previous versions when reposting.

Thanks,
Robin.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> This is a resend of a patch from Dec 2020 when I tried to do it
> tree-wide. Now start with the actual change, drivers can be changed
> afterwards, maybe per subsystem.
> ---
>   include/linux/dma-mapping.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index e9d19b974..183e7103a 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -95,7 +95,7 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>   {
>   	debug_dma_mapping_error(dev, dma_addr);
>   
> -	if (dma_addr == DMA_MAPPING_ERROR)
> +	if (unlikely(dma_addr == DMA_MAPPING_ERROR))
>   		return -ENOMEM;
>   	return 0;
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
