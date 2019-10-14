Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C29D6578
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 16:45:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 122071C62;
	Mon, 14 Oct 2019 14:32:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 283201514
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 14:22:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id F1C235D3
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 14:22:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A90337;
	Mon, 14 Oct 2019 07:22:52 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DAA23F68E;
	Mon, 14 Oct 2019 07:22:50 -0700 (PDT)
Subject: Re: [PATCH v3 4/7] iommu/mediatek: Delete the leaf in the tlb flush
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will.deacon@arm.com>
References: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
	<1571035101-4213-5-git-send-email-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20c74c20-864e-88af-3c58-ad3bb7600bcc@arm.com>
Date: Mon, 14 Oct 2019 15:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1571035101-4213-5-git-send-email-yong.wu@mediatek.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	edison.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
	Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 14/10/2019 07:38, Yong Wu wrote:
> In our tlb range flush, we don't care the "leaf". Remove it to simplify
> the code. no functional change.

Presumably you don't care about the granule either?

Robin.

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 8712afc..19f936c 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -174,8 +174,7 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>   }
>   
>   static void mtk_iommu_tlb_add_flush_nosync(unsigned long iova, size_t size,
> -					   size_t granule, bool leaf,
> -					   void *cookie)
> +					   size_t granule, void *cookie)
>   {
>   	struct mtk_iommu_data *data = cookie;
>   
> @@ -219,14 +218,7 @@ static void mtk_iommu_tlb_sync(void *cookie)
>   static void mtk_iommu_tlb_flush_walk(unsigned long iova, size_t size,
>   				     size_t granule, void *cookie)
>   {
> -	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, false, cookie);
> -	mtk_iommu_tlb_sync(cookie);
> -}
> -
> -static void mtk_iommu_tlb_flush_leaf(unsigned long iova, size_t size,
> -				     size_t granule, void *cookie)
> -{
> -	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, true, cookie);
> +	mtk_iommu_tlb_add_flush_nosync(iova, size, granule, cookie);
>   	mtk_iommu_tlb_sync(cookie);
>   }
>   
> @@ -245,7 +237,7 @@ static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
>   static const struct iommu_flush_ops mtk_iommu_flush_ops = {
>   	.tlb_flush_all = mtk_iommu_tlb_flush_all,
>   	.tlb_flush_walk = mtk_iommu_tlb_flush_walk,
> -	.tlb_flush_leaf = mtk_iommu_tlb_flush_leaf,
> +	.tlb_flush_leaf = mtk_iommu_tlb_flush_walk,
>   	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
>   };
>   
> @@ -475,7 +467,7 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>   		spin_lock_irqsave(&dom->pgtlock, flags);
>   
>   	mtk_iommu_tlb_add_flush_nosync(gather->start, length, gather->pgsize,
> -				       false, data);
> +				       data);
>   	mtk_iommu_tlb_sync(data);
>   
>   	if (!is_in_gather)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
