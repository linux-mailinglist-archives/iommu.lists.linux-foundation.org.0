Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D12FA658
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 17:35:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAC8E864D8;
	Mon, 18 Jan 2021 16:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mO+aFQpXnoqq; Mon, 18 Jan 2021 16:35:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F006586483;
	Mon, 18 Jan 2021 16:35:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDDEAC013A;
	Mon, 18 Jan 2021 16:35:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34063C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2A35386FF2
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnSKeR452d6p for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 16:35:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4F5786FF1
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 16:35:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100BF31B;
 Mon, 18 Jan 2021 08:35:25 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E86E3F68F;
 Mon, 18 Jan 2021 08:35:22 -0800 (PST)
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e1e17782-a9f3-6b64-1630-bf29af5241cf@arm.com>
Date: Mon, 18 Jan 2021 16:35:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201216103607.23050-7-yong.wu@mediatek.com>
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
> In current iommu_unmap, this code is:
> 
> 	iommu_iotlb_gather_init(&iotlb_gather);
> 	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
> 	iommu_iotlb_sync(domain, &iotlb_gather);
> 
> We could gather the whole iova range in __iommu_unmap, and then do tlb
> synchronization in the iommu_iotlb_sync.
> 
> This patch implement this, Gather the range in mtk_iommu_unmap.
> then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
> we don't call iommu_iotlb_gather_add_page since our tlb synchronization
> could be regardless of granule size.
> 
> In this way, gather->start is impossible ULONG_MAX, remove the checking.
> 
> This patch aims to do tlb synchronization *once* in the iommu_unmap.

Assuming the update to patch #4 simply results in "unsigned long end = 
iova + size - 1;" here,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index db7d43adb06b..89cec51405cd 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -506,7 +506,12 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>   			      struct iommu_iotlb_gather *gather)
>   {
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> +	unsigned long long end = iova + size;
>   
> +	if (gather->start > iova)
> +		gather->start = iova;
> +	if (gather->end < end)
> +		gather->end = end;
>   	return dom->iop->unmap(dom->iop, iova, size, gather);
>   }
>   
> @@ -523,9 +528,6 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>   	size_t length = gather->end - gather->start;
>   
> -	if (gather->start == ULONG_MAX)
> -		return;
> -
>   	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
>   				       dom->data);
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
