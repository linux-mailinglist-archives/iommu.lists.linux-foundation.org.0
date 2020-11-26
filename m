Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B72C590A
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 17:16:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A3C52E208;
	Thu, 26 Nov 2020 16:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCtleGp46-6a; Thu, 26 Nov 2020 16:16:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F1EA82E212;
	Thu, 26 Nov 2020 16:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2D33C0052;
	Thu, 26 Nov 2020 16:16:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8AFEC0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE0CC8780E
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I+fdM0t-SVJh for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 16:16:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A51F8780D
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:16:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB5CE31B;
 Thu, 26 Nov 2020 08:16:03 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F9A03F23F;
 Thu, 26 Nov 2020 08:15:59 -0800 (PST)
Subject: Re: [PATCH v4 11/24] iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for
 MediaTek
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-12-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <54eee2dd-21d5-e796-d5a1-eaf7097a9745@arm.com>
Date: Thu, 26 Nov 2020 16:15:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-12-yong.wu@mediatek.com>
Content-Language: en-GB
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, kernel-team@android.com,
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

On 2020-11-11 12:38, Yong Wu wrote:
> The standard input iova bits is 32. MediaTek quad the lvl1 pagetable
> (4 * lvl1). No change for lvl2 pagetable. Then the iova bits can reach
> 34bit.

Yay, I love how simple the actual change becomes now!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 7 ++++---
>   drivers/iommu/mtk_iommu.c          | 2 +-
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 0b3c5b904ddc..5601dc8bf810 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -45,9 +45,10 @@
>   /*
>    * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
>    * and 12 bits in a page.
> + * MediaTek extend 2 bits to reach 34bits, 14 bits at lvl1 and 8 bits at lvl2.
>    */
>   #define ARM_V7S_ADDR_BITS		32
> -#define _ARM_V7S_LVL_BITS(lvl, cfg)	((lvl) == 1 ? 12 : 8)
> +#define _ARM_V7S_LVL_BITS(lvl, cfg)	((lvl) == 1 ? ((cfg)->ias - 20) : 8)
>   #define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
>   #define ARM_V7S_TABLE_SHIFT		10
>   
> @@ -61,7 +62,7 @@
>   #define _ARM_V7S_IDX_MASK(lvl, cfg)	(ARM_V7S_PTES_PER_LVL(lvl, cfg) - 1)
>   #define ARM_V7S_LVL_IDX(addr, lvl, cfg)	({				\
>   	int _l = lvl;							\
> -	((u32)(addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
> +	((addr) >> ARM_V7S_LVL_SHIFT(_l)) & _ARM_V7S_IDX_MASK(_l, cfg); \
>   })
>   
>   /*
> @@ -754,7 +755,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
>   {
>   	struct arm_v7s_io_pgtable *data;
>   
> -	if (cfg->ias > ARM_V7S_ADDR_BITS)
> +	if (cfg->ias > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
>   		return NULL;
>   
>   	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index ec3c87d4b172..55f9b329e637 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -319,7 +319,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
>   			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
>   			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
>   		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
> -		.ias = 32,
> +		.ias = 34,
>   		.oas = 35,
>   		.tlb = &mtk_iommu_flush_ops,
>   		.iommu_dev = data->dev,
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
