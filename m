Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394D3B7283
	for <lists.iommu@lfdr.de>; Tue, 29 Jun 2021 14:52:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 015BE605FF;
	Tue, 29 Jun 2021 12:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SxJwhthnc7d6; Tue, 29 Jun 2021 12:52:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1EA46605B2;
	Tue, 29 Jun 2021 12:52:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFCE6C000E;
	Tue, 29 Jun 2021 12:52:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A1D8C000E
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 12:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76B894046E
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 12:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30BnkxxfIOOC for <iommu@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 12:52:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C00040298
 for <iommu@lists.linux-foundation.org>; Tue, 29 Jun 2021 12:52:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04B5B106F;
 Tue, 29 Jun 2021 05:52:20 -0700 (PDT)
Received: from [10.57.46.146] (unknown [10.57.46.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67C163F718;
 Tue, 29 Jun 2021 05:52:18 -0700 (PDT)
Subject: Re: [PATCH v2] swiotlb: fix implicit debugfs_create_dir declaration
To: Claire Chang <tientzu@chromium.org>, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, Will Deacon <will@kernel.org>,
 sstabellini@kernel.org
References: <20210629121625.3633999-1-tientzu@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7f544c68-721c-bbcc-3614-cbadce7261a9@arm.com>
Date: Tue, 29 Jun 2021 13:52:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629121625.3633999-1-tientzu@chromium.org>
Content-Language: en-GB
Cc: kernel test robot <lkp@intel.com>, iommu@lists.linux-foundation.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org
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

On 2021-06-29 13:16, Claire Chang wrote:
> Remove the ifdef to fix implicit function declaration for other pools.
> 
> Fixes: 1d9f94400a7a ("swiotlb: Refactor swiotlb_create_debugfs")

There doesn't appear to be a problem with that commit - AFAICS it's 
461021875c50 ("swiotlb: Add restricted DMA pool initialization") which 
introduces a reference to debugfs_create_dir() outside the existing 
#ifdef guards.

FWIW (assuming it's the real problem) I'd be inclined to factor out the 
debugfs bits from rmem_swiotlb_device_init() into a separate 
rmem_swiotlb_debugfs_init() (or similar) function which can live 
alongside the others under the #ifdef and be stubbed out in an #else case.

Robin.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   kernel/dma/swiotlb.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 0ffbaae9fba2..8ae0bef392c3 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -36,9 +36,7 @@
>   #include <linux/scatterlist.h>
>   #include <linux/mem_encrypt.h>
>   #include <linux/set_memory.h>
> -#ifdef CONFIG_DEBUG_FS
>   #include <linux/debugfs.h>
> -#endif
>   #ifdef CONFIG_DMA_RESTRICTED_POOL
>   #include <linux/io.h>
>   #include <linux/of.h>
> @@ -686,7 +684,6 @@ bool is_swiotlb_active(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(is_swiotlb_active);
>   
> -#ifdef CONFIG_DEBUG_FS
>   static struct dentry *debugfs_dir;
>   
>   static void swiotlb_create_debugfs_files(struct io_tlb_mem *mem)
> @@ -709,8 +706,6 @@ static int __init swiotlb_create_default_debugfs(void)
>   
>   late_initcall(swiotlb_create_default_debugfs);
>   
> -#endif
> -
>   #ifdef CONFIG_DMA_RESTRICTED_POOL
>   struct page *swiotlb_alloc(struct device *dev, size_t size)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
