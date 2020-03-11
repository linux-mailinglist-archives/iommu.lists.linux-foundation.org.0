Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 78903181D9F
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:19:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 315E5886D2;
	Wed, 11 Mar 2020 16:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWhJFtn2JnYq; Wed, 11 Mar 2020 16:19:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 004CC886D1;
	Wed, 11 Mar 2020 16:19:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC01BC18D3;
	Wed, 11 Mar 2020 16:19:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08576C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E90EC869C9
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krQfuMh7nzLq for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:19:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFC59869AC
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:19:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6873F31B;
 Wed, 11 Mar 2020 09:19:03 -0700 (PDT)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59EFC3F6CF;
 Wed, 11 Mar 2020 09:19:02 -0700 (PDT)
Subject: Re: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
To: Christoph Hellwig <hch@lst.de>, torvalds@linux-foundation.org,
 gregkh@linuxfoundation.org
References: <20200311160710.376090-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8dda3bc4-d64c-e532-b992-614be8a2ab7c@arm.com>
Date: Wed, 11 Mar 2020 16:19:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311160710.376090-1-hch@lst.de>
Content-Language: en-GB
Cc: aros@gmx.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 11/03/2020 4:07 pm, Christoph Hellwig wrote:
> Ever since the generic platform device code started allocating DMA masks
> itself the code to allocate and leak a private DMA mask in
> platform_device_register_full has been superflous.  More so the fact that
> it unconditionally frees the DMA mask allocation in the failure path
> can lead to slab corruption if the function fails later on for a device
> where it didn't allocate the mask.  Just remove the offending code.

I'm sure I mentioned this in passing at the time, but only in the 
context of a cleanup; I never noticed it could be cause for an actual bug :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: cdfee5623290 ("driver core: initialize a default DMA mask for platform device")
> Reported-by: Artem S. Tashkinov <aros@gmx.com>
> Tested-by: Artem S. Tashkinov <aros@gmx.com>
> ---
>   drivers/base/platform.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 7fa654f1288b..47d3e6187a1c 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -662,19 +662,6 @@ struct platform_device *platform_device_register_full(
>   	pdev->dev.of_node_reused = pdevinfo->of_node_reused;
>   
>   	if (pdevinfo->dma_mask) {
> -		/*
> -		 * This memory isn't freed when the device is put,
> -		 * I don't have a nice idea for that though.  Conceptually
> -		 * dma_mask in struct device should not be a pointer.
> -		 * See http://thread.gmane.org/gmane.linux.kernel.pci/9081
> -		 */
> -		pdev->dev.dma_mask =
> -			kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
> -		if (!pdev->dev.dma_mask)
> -			goto err;
> -
> -		kmemleak_ignore(pdev->dev.dma_mask);
> -
>   		*pdev->dev.dma_mask = pdevinfo->dma_mask;
>   		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
>   	}
> @@ -700,7 +687,6 @@ struct platform_device *platform_device_register_full(
>   	if (ret) {
>   err:
>   		ACPI_COMPANION_SET(&pdev->dev, NULL);
> -		kfree(pdev->dev.dma_mask);
>   		platform_device_put(pdev);
>   		return ERR_PTR(ret);
>   	}
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
