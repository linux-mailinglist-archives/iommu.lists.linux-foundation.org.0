Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 733401D1491
	for <lists.iommu@lfdr.de>; Wed, 13 May 2020 15:23:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 930652045A;
	Wed, 13 May 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlNQMjo7piGb; Wed, 13 May 2020 13:23:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 497F721F6F;
	Wed, 13 May 2020 13:23:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F08DBC0890;
	Wed, 13 May 2020 13:23:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE53FC016F
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A3E428703D
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZZp9eAeO4EM for <iommu@lists.linux-foundation.org>;
 Wed, 13 May 2020 13:23:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A74AE87051
 for <iommu@lists.linux-foundation.org>; Wed, 13 May 2020 13:23:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2877A30E;
 Wed, 13 May 2020 06:23:14 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F5103F71E;
 Wed, 13 May 2020 06:23:12 -0700 (PDT)
Subject: Re: [PATCH v4 01/38] dma-mapping: add generic helpers for mapping
 sgtable objects
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <CGME20200512090107eucas1p13a38ce5ce4c15cd0033acaea7b26c9b0@eucas1p1.samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <400501ec-c56b-edb7-7def-36ad43264123@arm.com>
Date: Wed, 13 May 2020 14:23:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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

On 2020-05-12 10:00 am, Marek Szyprowski wrote:
> struct sg_table is a common structure used for describing a memory
> buffer. It consists of a scatterlist with memory pages and DMA addresses
> (sgl entry), as well as the number of scatterlist entries: CPU pages
> (orig_nents entry) and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg
> function.
> 
> To avoid such issues, lets introduce a common wrappers operating directly

Nit: "let's"

> on the struct sg_table objects, which take care of the proper use of
> the nents and orig_nents entries.

A few more documentation nitpicks below, but either way the 
implementation itself (modulo Christoph's fixup) looks good;

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> For more information, see '[PATCH v4 00/38] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread:
> https://lore.kernel.org/dri-devel/20200512085710.14688-1-m.szyprowski@samsung.com/T/
> ---
>   include/linux/dma-mapping.h | 79 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index b43116a..88f01cc 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -609,6 +609,85 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
>   	return dma_sync_single_for_device(dev, addr + offset, size, dir);
>   }
>   
> +/**
> + * dma_map_sgtable - Map the given buffer for the DMA operations

Either "for DMA operations", "for the DMA operation", or "for a DMA 
operation", depending on the exact context. Or at that point, perhaps 
just "for DMA".

> + * @dev:	The device to perform a DMA operation

That doesn't quite parse, maybe "the device performing the DMA 
operation", or "the device for which to perform the DMA operation", 
depending on whether "DMA operation" means the mapping or the actual 
hardware access?

> + * @sgt:	The sg_table object describing the buffer
> + * @dir:	DMA direction
> + * @attrs:	Optional DMA attributes for the map operation
> + *
> + * Maps a buffer described by a scatterlist stored in the given sg_table
> + * object for the @dir DMA operation by the @dev device. After success
> + * the ownership for the buffer is transferred to the DMA domain. One has
> + * to call dma_sync_sgtable_for_cpu() or dma_unmap_sgtable() to move the
> + * ownership of the buffer back to the CPU domain before touching the
> + * buffer by the CPU.
> + * Returns 0 on success or -EINVAL on error during mapping the buffer.

Maybe make that a proper "Return:" section?

> + */
> +static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
> +		enum dma_data_direction dir, unsigned long attrs)
> +{
> +	int n = dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
> +
> +	if (n > 0) {
> +		sgt->nents = n;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
> +
> +/**
> + * dma_unmap_sgtable - Unmap the given buffer for the DMA operations
> + * @dev:	The device to perform a DMA operation

Same two points as before.

> + * @sgt:	The sg_table object describing the buffer
> + * @dir:	DMA direction
> + * @attrs:	Optional DMA attributes for the map operation

Presumably "the unmap operation", although it *is* true that some 
attributes are expected to match those originally passed to 
dma_map_sgtable()... not sure if kerneldoc can can stretch to that level 
of detail concisely ;)

> + *
> + * Unmaps a buffer described by a scatterlist stored in the given sg_table
> + * object for the @dir DMA operation by the @dev device. After this function
> + * the ownership of the buffer is transferred back to the CPU domain.
> + */
> +static inline void dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
> +		enum dma_data_direction dir, unsigned long attrs)
> +{
> +	dma_unmap_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
> +}
> +
> +/**
> + * dma_sync_sgtable_for_cpu - Synchronize the given buffer for the CPU access

s/the CPU/CPU/

> + * @dev:	The device to perform a DMA operation

As before.

> + * @sgt:	The sg_table object describing the buffer
> + * @dir:	DMA direction
> + *
> + * Performs the needed cache synchronization and moves the ownership of the
> + * buffer back to the CPU domain, so it is safe to perform any access to it
> + * by the CPU. Before doing any further DMA operations, one has to transfer
> + * the ownership of the buffer back to the DMA domain by calling the
> + * dma_sync_sgtable_for_device().
> + */
> +static inline void dma_sync_sgtable_for_cpu(struct device *dev,
> +		struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	dma_sync_sg_for_cpu(dev, sgt->sgl, sgt->orig_nents, dir);
> +}
> +
> +/**
> + * dma_sync_sgtable_for_device - Synchronize the given buffer for the DMA

That one doesn't even

> + * @dev:	The device to perform a DMA operation

As before.

But of course, many thanks for taking the effort to add such complete 
documentation in the first place :)

Cheers,
Robin.

> + * @sgt:	The sg_table object describing the buffer
> + * @dir:	DMA direction
> + *
> + * Performs the needed cache synchronization and moves the ownership of the
> + * buffer back to the DMA domain, so it is safe to perform the DMA operation.
> + * Once finished, one has to call dma_sync_sgtable_for_cpu() or
> + * dma_unmap_sgtable().
> + */
> +static inline void dma_sync_sgtable_for_device(struct device *dev,
> +		struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	dma_sync_sg_for_device(dev, sgt->sgl, sgt->orig_nents, dir);
> +}
> +
>   #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
>   #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
>   #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
