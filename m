Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A91DA222810
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 18:12:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F7B986E71;
	Thu, 16 Jul 2020 16:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c5LVTyvmYI0F; Thu, 16 Jul 2020 16:12:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E8FA86E78;
	Thu, 16 Jul 2020 16:12:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 235B2C0733;
	Thu, 16 Jul 2020 16:12:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8DCFC0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 16:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A738420480
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 16:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyd23Oy-nDIr for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 16:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id A1E8020408
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 16:12:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F4F30E;
 Thu, 16 Jul 2020 09:12:32 -0700 (PDT)
Received: from [10.57.35.46] (unknown [10.57.35.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64DE43F68F;
 Thu, 16 Jul 2020 09:12:32 -0700 (PDT)
Subject: Re: [PATCH] dma-debug: use named initializers for dir2name
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20200716150112.476896-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c31374eb-855a-839b-5d52-96bc93ca69f3@arm.com>
Date: Thu, 16 Jul 2020 17:12:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716150112.476896-1-hch@lst.de>
Content-Language: en-GB
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

On 2020-07-16 16:01, Christoph Hellwig wrote:
> Make dir2name a little more readable and maintainable by using
> named initializers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/debug.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index 36c962a86bf25d..41e720c3ab20c5 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -144,8 +144,12 @@ static const char *type2name[] = {
>   	[dma_debug_resource] = "resource",
>   };
>   
> -static const char *dir2name[4] = { "DMA_BIDIRECTIONAL", "DMA_TO_DEVICE",
> -				   "DMA_FROM_DEVICE", "DMA_NONE" };
> +static const char *dir2name[4] = {

Nit: I think you can probably drop the explicit array size here.

Otherwise, very welcome clarity!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +	[DMA_BIDIRECTIONAL]	= "DMA_BIDIRECTIONAL",
> +	[DMA_TO_DEVICE]		= "DMA_TO_DEVICE",
> +	[DMA_FROM_DEVICE]	= "DMA_FROM_DEVICE",
> +	[DMA_NONE]		= "DMA_NONE",
> +};
>   
>   /*
>    * The access to some variables in this macro is racy. We can't use atomic_t
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
