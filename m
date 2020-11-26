Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1D2C58F6
	for <lists.iommu@lfdr.de>; Thu, 26 Nov 2020 17:04:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6933874AD;
	Thu, 26 Nov 2020 16:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7A9OtfgxDGk; Thu, 26 Nov 2020 16:03:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D1D9874AB;
	Thu, 26 Nov 2020 16:03:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE009C0052;
	Thu, 26 Nov 2020 16:03:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7582EC0052
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 45EB6878CF
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqeulvzgILOL for <iommu@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 16:03:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id D379A878CB
 for <iommu@lists.linux-foundation.org>; Thu, 26 Nov 2020 16:03:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DFA631B;
 Thu, 26 Nov 2020 08:03:55 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D063F23F;
 Thu, 26 Nov 2020 08:03:50 -0800 (PST)
Subject: Re: [PATCH v4 09/24] iommu/io-pgtable-arm-v7s: Clear LVL_SHIFT/BITS
 macro instead of the formula
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-10-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
Date: Thu, 26 Nov 2020 16:03:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-10-yong.wu@mediatek.com>
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
> The current _ARM_V7S_LVL_BITS/ARM_V7S_LVL_SHIFT use a formula to calculate
> the corresponding value for level1 and level2 to pretend the code sane.
> Actually their level1 and level2 values are different from each other.
> This patch only clear the two macro. No functional change.

Grammar nit: to "clear" the macro sounds like you're making it empty or 
removing it entirely; I think you mean to say "clarify" here. English is 
the worst language sometimes... :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 4d0aa079470f..58cc201c10a3 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -44,13 +44,11 @@
>   
>   /*
>    * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
> - * and 12 bits in a page. With some carefully-chosen coefficients we can
> - * hide the ugly inconsistencies behind these macros and at least let the
> - * rest of the code pretend to be somewhat sane.
> + * and 12 bits in a page.
>    */
>   #define ARM_V7S_ADDR_BITS		32
> -#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> -#define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
> +#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
> +#define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
>   #define ARM_V7S_TABLE_SHIFT		10
>   
>   #define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
