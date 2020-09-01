Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D20259FB2
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 22:13:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CFE78459A;
	Tue,  1 Sep 2020 20:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwt8iBlUkL4x; Tue,  1 Sep 2020 20:13:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E23B84640;
	Tue,  1 Sep 2020 20:13:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28036C0051;
	Tue,  1 Sep 2020 20:13:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87495C0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7644B84BCF
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fyi68aD8GfiE for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 20:13:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 62CF28452A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 20:13:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA181FB;
 Tue,  1 Sep 2020 13:13:33 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1FE3F66F;
 Tue,  1 Sep 2020 13:13:31 -0700 (PDT)
Subject: Re: [PATCH v9 24/32] drm: host1x: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063542eucas1p1713d37f4589ddaca27e1968b5fe44027@eucas1p1.samsung.com>
 <20200826063316.23486-25-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ee8392f8-36eb-4e60-5a3a-965369465dac@arm.com>
Date: Tue, 1 Sep 2020 21:13:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-25-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On 2020-08-26 07:33, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
> 
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
> 
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/host1x/job.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 89b6c14b7392..82d0a60ba3f7 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -170,11 +170,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>   				goto unpin;
>   			}
>   
> -			err = dma_map_sg(dev, sgt->sgl, sgt->nents, dir);
> -			if (!err) {
> -				err = -ENOMEM;
> +			err = dma_map_sgtable(dev, sgt, dir, 0);
> +			if (err)
>   				goto unpin;
> -			}
>   
>   			job->unpins[job->num_unpins].dev = dev;
>   			job->unpins[job->num_unpins].dir = dir;
> @@ -228,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>   		}
>   
>   		if (host->domain) {
> -			for_each_sg(sgt->sgl, sg, sgt->nents, j)
> +			for_each_sgtable_sg(sgt, sg, j)
>   				gather_size += sg->length;
>   			gather_size = iova_align(&host->iova, gather_size);
>   
> @@ -240,9 +238,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>   				goto put;
>   			}
>   
> -			err = iommu_map_sg(host->domain,
> +			err = iommu_map_sgtable(host->domain,
>   					iova_dma_addr(&host->iova, alloc),
> -					sgt->sgl, sgt->nents, IOMMU_READ);
> +					sgt, IOMMU_READ);
>   			if (err == 0) {
>   				__free_iova(&host->iova, alloc);
>   				err = -EINVAL;
> @@ -252,12 +250,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>   			job->unpins[job->num_unpins].size = gather_size;
>   			phys_addr = iova_dma_addr(&host->iova, alloc);
>   		} else if (sgt) {
> -			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
> -					 DMA_TO_DEVICE);
> -			if (!err) {
> -				err = -ENOMEM;
> +			err = dma_map_sgtable(host->dev, sgt, DMA_TO_DEVICE, 0);
> +			if (err)
>   				goto put;
> -			}
>   
>   			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
>   			job->unpins[job->num_unpins].dev = host->dev;
> @@ -660,8 +655,7 @@ void host1x_job_unpin(struct host1x_job *job)
>   		}
>   
>   		if (unpin->dev && sgt)
> -			dma_unmap_sg(unpin->dev, sgt->sgl, sgt->nents,
> -				     unpin->dir);
> +			dma_unmap_sgtable(unpin->dev, sgt, unpin->dir, 0);
>   
>   		host1x_bo_unpin(dev, unpin->bo, sgt);
>   		host1x_bo_put(unpin->bo);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
