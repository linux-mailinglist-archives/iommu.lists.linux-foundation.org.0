Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF5259E93
	for <lists.iommu@lfdr.de>; Tue,  1 Sep 2020 20:55:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08A9E86956;
	Tue,  1 Sep 2020 18:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 680a4hViySnY; Tue,  1 Sep 2020 18:55:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0261386C14;
	Tue,  1 Sep 2020 18:55:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED1F9C0051;
	Tue,  1 Sep 2020 18:55:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8C4FC0051
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 18:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BCA4A870C6
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 18:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApYxyIW48ckC for <iommu@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 18:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id E68AE870B0
 for <iommu@lists.linux-foundation.org>; Tue,  1 Sep 2020 18:55:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3121FB;
 Tue,  1 Sep 2020 11:55:00 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 168583F71F;
 Tue,  1 Sep 2020 11:54:56 -0700 (PDT)
Subject: Re: [PATCH v9 11/32] drm: mediatek: use common helper for extracting
 pages array
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063534eucas1p2647f5e9679f79f568e184b092f743f8b@eucas1p2.samsung.com>
 <20200826063316.23486-12-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <30f20ad6-783b-89c3-17b5-30c6a2587d23@arm.com>
Date: Tue, 1 Sep 2020 19:54:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826063316.23486-12-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
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

On 2020-08-26 07:32, Marek Szyprowski wrote:
> Use common helper for converting a sg_table object into struct
> page pointer array.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Side note: is mtk_drm_gem_prime_vmap() missing a call to 
sg_free_table(sgt) before its kfree(sgt)?

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 3654ec732029..0583e557ad37 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -233,9 +233,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   {
>   	struct mtk_drm_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
>   	struct sg_table *sgt;
> -	struct sg_page_iter iter;
>   	unsigned int npages;
> -	unsigned int i = 0;
>   
>   	if (mtk_gem->kvaddr)
>   		return mtk_gem->kvaddr;
> @@ -249,11 +247,8 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *obj)
>   	if (!mtk_gem->pages)
>   		goto out;
>   
> -	for_each_sg_page(sgt->sgl, &iter, sgt->orig_nents, 0) {
> -		mtk_gem->pages[i++] = sg_page_iter_page(&iter);
> -		if (i > npages)
> -			break;
> -	}
> +	drm_prime_sg_to_page_addr_arrays(sgt, mtk_gem->pages, NULL, npages);
> +
>   	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
>   			       pgprot_writecombine(PAGE_KERNEL));
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
