Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F982AB765
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 12:43:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8261D854E7;
	Mon,  9 Nov 2020 11:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULvflNWHyzg8; Mon,  9 Nov 2020 11:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7776385EA5;
	Mon,  9 Nov 2020 11:43:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BF20C016F;
	Mon,  9 Nov 2020 11:43:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1EB1C016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 11:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 984FE20519
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 11:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64tWJC8rusyv for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 11:43:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 2522720517
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 11:43:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9901106F;
 Mon,  9 Nov 2020 03:43:36 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE423F718;
 Mon,  9 Nov 2020 03:43:32 -0800 (PST)
Subject: Re: [PATCH] dma-pool: no need to check return value of debugfs_create
 functions
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <1604743392-21601-1-git-send-email-yangtiezhu@loongson.cn>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <936ffd36-8814-a8d2-ab94-3edc0642e5a7@arm.com>
Date: Mon, 9 Nov 2020 11:43:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1604743392-21601-1-git-send-email-yangtiezhu@loongson.cn>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, Xuefeng Li <lixuefeng@loongson.cn>,
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

On 2020-11-07 10:03, Tiezhu Yang wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

Well, the only difference in behaviour is that it won't attempt to call 
further debugfs functions if they're definitely going to fail anyway, so 
no "real" logic is affected. AFAICS it's not possible for 
debugfs_create_dir() to return NULL, so this check makes no practical 
difference, just means that if it did ever fail we would save a bit of 
unnecessary work by not subsequently calling all the way down to the "if 
(IS_ERR(parent))" check in start_creating() several times.

So the given justification is a little overdramatic for this particular 
situation, when it's really just that it's not worth optimising an 
unexpected failure case, but the change itself is obviously fine.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   kernel/dma/pool.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index d4637f7..5f84e6c 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -38,9 +38,6 @@ static void __init dma_atomic_pool_debugfs_init(void)
>   	struct dentry *root;
>   
>   	root = debugfs_create_dir("dma_pools", NULL);
> -	if (IS_ERR_OR_NULL(root))
> -		return;
> -
>   	debugfs_create_ulong("pool_size_dma", 0400, root, &pool_size_dma);
>   	debugfs_create_ulong("pool_size_dma32", 0400, root, &pool_size_dma32);
>   	debugfs_create_ulong("pool_size_kernel", 0400, root, &pool_size_kernel);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
