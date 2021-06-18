Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4A3ACB4C
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 14:46:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFCE7415A9;
	Fri, 18 Jun 2021 12:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jvrpaWfsF27; Fri, 18 Jun 2021 12:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 73738415A7;
	Fri, 18 Jun 2021 12:46:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38011C0022;
	Fri, 18 Jun 2021 12:46:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40365C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 12:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 348CC400EA
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 12:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2WLJrkFajMa for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 12:46:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D540400DB
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 12:46:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1004F1424;
 Fri, 18 Jun 2021 05:45:59 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62B1B3F719;
 Fri, 18 Jun 2021 05:45:57 -0700 (PDT)
Subject: Re: [PATCH] iommu: rockchip: Fix physical address decoding
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, will@kernel.org,
 robh+dt@kernel.org, heiko@sntech.de, xxm@rock-chips.com, joro@8bytes.org,
 dan.carpenter@oracle.com
References: <20210618114615.443961-1-benjamin.gaignard@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <461d60d8-c81c-dab9-67b7-62216faef288@arm.com>
Date: Fri, 18 Jun 2021 13:45:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618114615.443961-1-benjamin.gaignard@collabora.com>
Content-Language: en-GB
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

On 2021-06-18 12:46, Benjamin Gaignard wrote:
> Restore bits 39 to 32 at correct position.
> It reverses the operation done in rk_dma_addr_dte_v2().
> 
> Fixes: c55356c534aa ("iommu: rockchip: Add support for iommu v2")
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>   drivers/iommu/rockchip-iommu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index 94b9d8e5b9a40..e55482a477080 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -544,12 +544,13 @@ static inline u32 rk_dma_addr_dte(dma_addr_t dt_dma)
>   }
>   
>   #define DT_HI_MASK GENMASK_ULL(39, 32)
> +#define DTE_BASE_HI_MASK GENMASK(11, 4)
>   #define DT_SHIFT   28
>   
>   static inline phys_addr_t rk_dte_addr_phys_v2(u32 addr)
>   {
>   	return (phys_addr_t)(addr & RK_DTE_PT_ADDRESS_MASK) |
> -	       ((addr & DT_HI_MASK) << DT_SHIFT);
> +	       ((addr & DTE_BASE_HI_MASK) << DT_SHIFT);

I think this still has the problem that you're shifting off the top of 
addr *before* the cast takes effect.

Robin.

>   }
>   
>   static inline u32 rk_dma_addr_dte_v2(dma_addr_t dt_dma)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
