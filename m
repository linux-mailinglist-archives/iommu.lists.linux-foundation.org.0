Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B03DA00A
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 11:05:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A2783A7A;
	Thu, 29 Jul 2021 09:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzU2vTh3HsPo; Thu, 29 Jul 2021 09:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9565083A77;
	Thu, 29 Jul 2021 09:05:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 577F0C0022;
	Thu, 29 Jul 2021 09:05:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28CB5C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 09:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209A26063F
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 09:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvQlIXpxi2iJ for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 09:05:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30DA960597
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 09:05:02 +0000 (UTC)
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gb4B517Xdz6FFxM;
 Thu, 29 Jul 2021 16:55:41 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Jul 2021 11:04:57 +0200
Received: from [10.47.27.169] (10.47.27.169) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 29 Jul
 2021 10:04:56 +0100
Subject: Re: [PATCH v2 24/24] iommu: Only log strictness for DMA domains
To: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, <will@kernel.org>
References: <cover.1627468308.git.robin.murphy@arm.com>
 <b2da9ba999b54acded9198cf92cf9b7d0fce1b45.1627468310.git.robin.murphy@arm.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <d679940d-6781-c850-7eb1-07b7b0864d2a@huawei.com>
Date: Thu, 29 Jul 2021 10:04:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <b2da9ba999b54acded9198cf92cf9b7d0fce1b45.1627468310.git.robin.murphy@arm.com>
Content-Language: en-US
X-Originating-IP: [10.47.27.169]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 28/07/2021 16:58, Robin Murphy wrote:
> When passthrough is enabled, the default strictness policy becomes
> irrelevant, since any subsequent runtime override to a DMA domain type
> now embodies an explicit choice of strictness as well. Save on noise by
> only logging the default policy when it is meaningfully in effect.
> 
> Signed-off-by: Robin Murphy<robin.murphy@arm.com>

FWIW, small comment below,

Reviewed-by: John Garry <john.garry@huawei.com>

> ---
>   drivers/iommu/iommu.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index be399d630953..87d7b299436e 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -144,10 +144,11 @@ static int __init iommu_subsys_init(void)
>   		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
>   			"(set via kernel command line)" : "");
>   
> -	pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
> -		iommu_dma_strict ? "strict" : "lazy",
> -		(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
> -			"(set via kernel command line)" : "");
> +	if (!iommu_default_passthrough())

I suppose that you could also do an early return to save indenting...


> +		pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
> +			iommu_dma_strict ? "strict" : "lazy",
> +			(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
> +				"(set via kernel command line)" : "");
>   
>   	return 0;
>   }

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
