Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFD9135A6D
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 14:42:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AE04784B35;
	Thu,  9 Jan 2020 13:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edUWrfWIY8J1; Thu,  9 Jan 2020 13:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1394781DEA;
	Thu,  9 Jan 2020 13:42:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7089C0881;
	Thu,  9 Jan 2020 13:42:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF917C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B219C85F7B
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cqjzZBIl-jW for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:41:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D44E085F72
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:41:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2492031B;
 Thu,  9 Jan 2020 05:41:59 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 329D43F534;
 Thu,  9 Jan 2020 05:41:58 -0800 (PST)
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: simplify parse_driver_options()
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
References: <20191226095141.30352-1-yamada.masahiro@socionext.com>
 <20191226095141.30352-2-yamada.masahiro@socionext.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1383eeb0-4148-a798-5e24-81ce33013f1d@arm.com>
Date: Thu, 9 Jan 2020 13:41:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191226095141.30352-2-yamada.masahiro@socionext.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org
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

On 26/12/2019 9:51 am, Masahiro Yamada wrote:
> Using ARRAY_SIZE() instead of the sentinel is slightly simpler, IMHO.

Given that it's fairly well-decided that we don't want to add any more 
of these anyway, I'd be inclined to lose the array/loop machinery 
altogether. As it is we'd need a lot more options for it to actually 
offer any kind of code size saving.

Robin.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>   drivers/iommu/arm-smmu-v3.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index ed9933960370..b27489b7f9d8 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -676,7 +676,6 @@ struct arm_smmu_option_prop {
>   static const struct arm_smmu_option_prop arm_smmu_options[] = {
>   	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
>   	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
> -	{ 0, NULL},
>   };
>   
>   static inline void __iomem *arm_smmu_page1_fixup(unsigned long offset,
> @@ -696,16 +695,16 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>   
>   static void parse_driver_options(struct arm_smmu_device *smmu)
>   {
> -	int i = 0;
> +	int i;
>   
> -	do {
> +	for (i = 0; i < ARRAY_SIZE(arm_smmu_options); i++) {
>   		if (of_property_read_bool(smmu->dev->of_node,
>   						arm_smmu_options[i].prop)) {
>   			smmu->options |= arm_smmu_options[i].opt;
>   			dev_notice(smmu->dev, "option %s\n",
>   				arm_smmu_options[i].prop);
>   		}
> -	} while (arm_smmu_options[++i].opt);
> +	};
>   }
>   
>   /* Low-level queue manipulation functions */
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
