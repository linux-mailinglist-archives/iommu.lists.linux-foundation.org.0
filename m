Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C912DC006
	for <lists.iommu@lfdr.de>; Wed, 16 Dec 2020 13:10:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AAFB585EC6;
	Wed, 16 Dec 2020 12:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JnKT90Wtve6; Wed, 16 Dec 2020 12:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F41685742;
	Wed, 16 Dec 2020 12:10:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06610C013B;
	Wed, 16 Dec 2020 12:10:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D8B8C013B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 12:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1CCC085EC6
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 12:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MP_BfJKS7s9 for <iommu@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 12:10:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5015F85742
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 12:10:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86551FB;
 Wed, 16 Dec 2020 04:10:26 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09D3C3F66E;
 Wed, 16 Dec 2020 04:10:23 -0800 (PST)
Subject: Re: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-5-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <16a9565e-5b01-e1c2-0f4a-d06db7f3b093@arm.com>
Date: Wed, 16 Dec 2020 12:10:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216103607.23050-5-yong.wu@mediatek.com>
Content-Language: en-GB
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
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
> Currently gather->end is "unsigned long" which may be overflow in
> arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
> Although it doesn't affect the size(end - start), it affects the checking
> "gather->end < end"

This won't help the same situation at the top of a 64-bit address space, 
though, and now that we have TTBR1 support for AArch64 format that is 
definitely a thing. Better to just encode the end address as the actual 
end address, i.e. iova + size - 1. We don't lose anything other than the 
ability to encode zero-sized invalidations that don't make sense anyway.

Robin.

> Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   include/linux/iommu.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 794d4085edd3..6e907a95d981 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -178,7 +178,7 @@ enum iommu_dev_features {
>    */
>   struct iommu_iotlb_gather {
>   	unsigned long		start;
> -	unsigned long		end;
> +	unsigned long long	end;
>   	size_t			pgsize;
>   };
>   
> @@ -537,7 +537,8 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
>   					       struct iommu_iotlb_gather *gather,
>   					       unsigned long iova, size_t size)
>   {
> -	unsigned long start = iova, end = start + size;
> +	unsigned long start = iova;
> +	unsigned long long end = start + size;
>   
>   	/*
>   	 * If the new page is disjoint from the current range or is mapped at
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
