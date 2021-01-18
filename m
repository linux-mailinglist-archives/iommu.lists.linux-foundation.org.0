Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F732FA66F
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 17:39:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AEC985683;
	Mon, 18 Jan 2021 16:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEjDe6JNsU4H; Mon, 18 Jan 2021 16:39:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB09B836CE;
	Mon, 18 Jan 2021 16:39:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 901F4C013A;
	Mon, 18 Jan 2021 16:39:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33133C088B
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2EE3F836CE
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-gFJNgOkMb0 for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 16:39:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F258585660
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:39:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84EFA31B;
 Mon, 18 Jan 2021 08:39:39 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CA823F68F;
 Mon, 18 Jan 2021 08:39:36 -0800 (PST)
Subject: Re: [PATCH v3 7/7] iommu/mediatek: Remove the tlb-ops for v7s
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-8-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fb2d59a3-2187-5ae6-e88e-43c1c43e61b0@arm.com>
Date: Mon, 18 Jan 2021 16:39:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201216103607.23050-8-yong.wu@mediatek.com>
Content-Language: en-GB
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
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

On 2020-12-16 10:36, Yong Wu wrote:
> Until now, we have already used the tlb operations from iommu framework,
> then the tlb operations for v7s can be removed.
> 
> Correspondingly, Switch the paramenter "cookie" to internal structure.

FWIW,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 27 ++++-----------------------
>   1 file changed, 4 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 89cec51405cd..5656819cd4a1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -206,10 +206,8 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
>   	return container_of(dom, struct mtk_iommu_domain, domain);
>   }
>   
> -static void mtk_iommu_tlb_flush_all(void *cookie)
> +static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
>   {
> -	struct mtk_iommu_data *data = cookie;
> -
>   	for_each_m4u(data) {
>   		if (!pm_runtime_active(data->dev))
>   			continue;
> @@ -221,9 +219,9 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
>   }
>   
>   static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> -					   size_t granule, void *cookie)
> +					   size_t granule,
> +					   struct mtk_iommu_data *data)
>   {
> -	struct mtk_iommu_data *data = cookie;
>   	unsigned long flags;
>   	int ret;
>   	u32 tmp;
> @@ -250,7 +248,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   		if (ret) {
>   			dev_warn(data->dev,
>   				 "Partial TLB flush timed out, falling back to full flush\n");
> -			mtk_iommu_tlb_flush_all(cookie);
> +			mtk_iommu_tlb_flush_all(data);
>   		}
>   		/* Clear the CPE status */
>   		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
> @@ -258,22 +256,6 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
>   	}
>   }
>   
> -static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
> -					    unsigned long iova, size_t granule,
> -					    void *cookie)
> -{
> -	struct mtk_iommu_data *data = cookie;
> -	struct iommu_domain *domain = &data->m4u_dom->domain;
> -
> -	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
> -}
> -
> -static const struct iommu_flush_ops mtk_iommu_flush_ops = {
> -	.tlb_flush_all = mtk_iommu_tlb_flush_all,
> -	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
> -	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
> -};
> -
>   static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
>   {
>   	struct mtk_iommu_data *data = dev_id;
> @@ -380,7 +362,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
>   		.ias = MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN) ? 34 : 32,
>   		.oas = 35,
> -		.tlb = &mtk_iommu_flush_ops,
>   		.iommu_dev = data->dev,
>   	};
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
