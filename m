Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E5259F45
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 21:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E95F586582;
	Tue,  1 Sep 2020 19:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ew6-VUnsZS4; Tue,  1 Sep 2020 19:34:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8D0E86529;
	Tue,  1 Sep 2020 19:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B46DAC0051;
	Tue,  1 Sep 2020 19:34:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89B8CC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7833F8710D
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W10dFJ9grUnp for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 19:34:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id F3AAF8710C
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 19:34:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63F041FB;
 Tue,  1 Sep 2020 12:34:32 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91FB3F71F;
 Tue,  1 Sep 2020 12:34:29 -0700 (PDT)
Subject: Re: [PATCH v9 16/32] drm: rockchip: use common helper for a
 scatterlist contiguity check
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063537eucas1p1462d4761c8eb6d762fe5ea0fbd3b6e3b@eucas1p1.samsung.com>
 <20200826063316.23486-17-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <263143f0-8b39-6daa-1d26-54ef32b54c27@arm.com>
Date: Tue, 1 Sep 2020 20:34:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-17-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
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
> Use common helper for checking the contiguity of the imported dma-buf.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 19 +------------------
>   1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index b9275ba7c5a5..2970e534e2bb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -460,23 +460,6 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	return sgt;
>   }
>   
> -static unsigned long rockchip_sg_get_contiguous_size(struct sg_table *sgt,
> -						     int count)
> -{
> -	struct scatterlist *s;
> -	dma_addr_t expected = sg_dma_address(sgt->sgl);
> -	unsigned int i;
> -	unsigned long size = 0;
> -
> -	for_each_sg(sgt->sgl, s, count, i) {
> -		if (sg_dma_address(s) != expected)
> -			break;
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> -		size += sg_dma_len(s);
> -	}
> -	return size;
> -}
> -
>   static int
>   rockchip_gem_iommu_map_sg(struct drm_device *drm,
>   			  struct dma_buf_attachment *attach,
> @@ -498,7 +481,7 @@ rockchip_gem_dma_map_sg(struct drm_device *drm,
>   	if (!count)
>   		return -EINVAL;
>   
> -	if (rockchip_sg_get_contiguous_size(sg, count) < attach->dmabuf->size) {
> +	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
>   		DRM_ERROR("failed to map sg_table to contiguous linear address.\n");
>   		dma_unmap_sg(drm->dev, sg->sgl, sg->nents,
>   			     DMA_BIDIRECTIONAL);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
