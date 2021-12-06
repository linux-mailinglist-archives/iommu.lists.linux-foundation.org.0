Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676246A171
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 17:33:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14AF607A9;
	Mon,  6 Dec 2021 16:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VqovOyS-rNVb; Mon,  6 Dec 2021 16:33:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0F4E3607A6;
	Mon,  6 Dec 2021 16:33:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7440C0012;
	Mon,  6 Dec 2021 16:33:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55FABC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 16:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 434594022D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 16:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6Md9MGbKO3X for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 16:33:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82F71400FB
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 16:33:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4C661042;
 Mon,  6 Dec 2021 08:33:32 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51D9C3F73B;
 Mon,  6 Dec 2021 08:33:32 -0800 (PST)
Message-ID: <b0b70acc-20f7-67dc-042a-5a9ddf19e32c@arm.com>
Date: Mon, 6 Dec 2021 16:33:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 07/11] dma-direct: fail allocations that can't be made
 coherent
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20211111065028.32761-1-hch@lst.de>
 <20211111065028.32761-8-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211111065028.32761-8-hch@lst.de>
Cc: David Rientjes <rientjes@google.com>
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

On 2021-11-11 06:50, Christoph Hellwig wrote:
> If the architecture can't remap or set an address uncached there is no way
> to fullfill a request for a coherent allocation.  Return NULL in that case.
> Note that this case currently does not happen, so this is a theoretical
> fixup and/or a preparation for eventually supporting platforms that
> can't support coherent allocations with the generic code.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index f9658fe18498c..a13017656ecae 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -233,8 +233,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   				return dma_direct_alloc_from_pool(dev, size,
>   						dma_handle, gfp);
>   		} else {
> -			if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
> -				set_uncached = true;
> +			if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
> +				return NULL;
> +			set_uncached = true;
>   		}
>   	}
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
