Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE67200597
	for <lists.iommu@lfdr.de>; Fri, 19 Jun 2020 11:43:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B19288B76;
	Fri, 19 Jun 2020 09:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uI9jEBx7dKNz; Fri, 19 Jun 2020 09:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 409B388C5C;
	Fri, 19 Jun 2020 09:43:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF3CC089E;
	Fri, 19 Jun 2020 09:43:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE69EC016E
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 09:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C725B2039C
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 09:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fWE8d1M26Q9 for <iommu@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 09:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 355EA20020
 for <iommu@lists.linux-foundation.org>; Fri, 19 Jun 2020 09:43:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D1392B;
 Fri, 19 Jun 2020 02:43:49 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BE7C3F71F;
 Fri, 19 Jun 2020 02:43:47 -0700 (PDT)
Subject: Re: [PATCH v6 35/36] videobuf2: use sgtable-based scatterlist wrappers
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20200618153956.29558-1-m.szyprowski@samsung.com>
 <CGME20200618154038eucas1p1acd4fcdd183de4c19c4004778527a755@eucas1p1.samsung.com>
 <20200618153956.29558-36-m.szyprowski@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c2808024-943a-f46e-6ad8-5579a507bfdf@arm.com>
Date: Fri, 19 Jun 2020 10:43:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618153956.29558-36-m.szyprowski@samsung.com>
Content-Language: en-GB
Cc: Pawel Osciak <pawel@osciak.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On 2020-06-18 16:39, Marek Szyprowski wrote:
> Use recently introduced common wrappers operating directly on the struct
> sg_table objects and scatterlist page iterators to make the code a bit
> more compact, robust, easier to follow and copy/paste safe.
> 
> No functional change, because the code already properly did all the
> scaterlist related calls.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   .../common/videobuf2/videobuf2-dma-contig.c   | 41 ++++++++-----------
>   .../media/common/videobuf2/videobuf2-dma-sg.c | 32 ++++++---------
>   .../common/videobuf2/videobuf2-vmalloc.c      | 12 ++----
>   3 files changed, 34 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index f4b4a7c135eb..ba01a8692d88 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -48,16 +48,15 @@ struct vb2_dc_buf {
>   
>   static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
>   {
> -	struct scatterlist *s;
>   	dma_addr_t expected = sg_dma_address(sgt->sgl);
> -	unsigned int i;
> +	struct sg_dma_page_iter dma_iter;
>   	unsigned long size = 0;
>   
> -	for_each_sg(sgt->sgl, s, sgt->nents, i) {
> -		if (sg_dma_address(s) != expected)
> +	for_each_sgtable_dma_page(sgt, &dma_iter, 0) {
> +		if (sg_page_iter_dma_address(&dma_iter) != expected)
>   			break;
> -		expected = sg_dma_address(s) + sg_dma_len(s);
> -		size += sg_dma_len(s);
> +		expected += PAGE_SIZE;
> +		size += PAGE_SIZE;

Same comment as for the DRM version. In fact, given that it's the same 
function with the same purpose, might it be worth hoisting out as a 
generic helper for the sg_table API itself?

>   	}
>   	return size;
>   }
[...]
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 92072a08af25..6ddf953efa11 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -142,9 +142,8 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {

As 0-day's explosions of nonsense imply, there's a rogue bracket here...

>   		goto fail_map;
>   
>   	buf->handler.refcount = &buf->refcount;
> @@ -180,8 +179,8 @@ static void vb2_dma_sg_put(void *buf_priv)
>   	if (refcount_dec_and_test(&buf->refcount)) {
>   		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
>   			buf->num_pages);
> -		dma_unmap_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				   buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> +		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
> +				  DMA_ATTR_SKIP_CPU_SYNC);
>   		if (buf->vaddr)
>   			vm_unmap_ram(buf->vaddr, buf->num_pages);
>   		sg_free_table(buf->dma_sgt);
> @@ -202,8 +201,7 @@ static void vb2_dma_sg_prepare(void *buf_priv)
>   	if (buf->db_attach)
>   		return;
>   
> -	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> -			       buf->dma_dir);
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void vb2_dma_sg_finish(void *buf_priv)
> @@ -215,7 +213,7 @@ static void vb2_dma_sg_finish(void *buf_priv)
>   	if (buf->db_attach)
>   		return;
>   
> -	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>   }
>   
>   static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
> @@ -258,9 +256,8 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
>   	 * No need to sync to the device, this will happen later when the
>   	 * prepare() memop is called.
>   	 */
> -	sgt->nents = dma_map_sg_attrs(buf->dev, sgt->sgl, sgt->orig_nents,
> -				      buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> -	if (!sgt->nents)
> +	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
> +			    DMA_ATTR_SKIP_CPU_SYNC)) {

... and here.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
