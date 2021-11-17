Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D68EB454C65
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 18:46:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CE181004;
	Wed, 17 Nov 2021 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQFHhtF7oZYC; Wed, 17 Nov 2021 17:46:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7675180F7B;
	Wed, 17 Nov 2021 17:46:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55E00C0012;
	Wed, 17 Nov 2021 17:46:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7722C0012
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 17:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C91B940582
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RIJEw5asc5Y for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 17:46:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id B442D40512
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 17:46:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCE52D6E;
 Wed, 17 Nov 2021 09:46:39 -0800 (PST)
Received: from [10.57.82.45] (unknown [10.57.82.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85D453F5A1;
 Wed, 17 Nov 2021 09:46:38 -0800 (PST)
Message-ID: <a2b45243-7e0a-a2ac-4e14-5256a3e7abb4@arm.com>
Date: Wed, 17 Nov 2021 17:46:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] iommu/io-pgtable-arm: Fix table descriptor paddr
 formatting
Content-Language: en-GB
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Will Deacon <will@kernel.org>
References: <20211117171213.243584-1-marcan@marcan.st>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211117171213.243584-1-marcan@marcan.st>
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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

On 2021-11-17 17:12, Hector Martin wrote:
> Table descriptors were being installed without properly formatting the
> address using paddr_to_iopte, which does not match up with the
> iopte_deref in __arm_lpae_map. This is incorrect for the LPAE pte
> format, as it does not handle the high bits properly.

Oh, I guess whatever system it was tested on can't have exercised it all
that thoroughly. IIRC I couldn't test it myself since at the time none
of the Fast Model builds with SMMUs actually implemented any memory
above 48 bits.

> This was found on Apple T6000 DARTs, which require a new pte format
> (different shift); adding support for that to
> paddr_to_iopte/iopte_to_paddr caused it to break badly, as even <48-bit
> addresses would end up incorrect in that case.

...I look forward to not wanting to look at that patch :)

> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   drivers/iommu/io-pgtable-arm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dd9e47189d0d..b636e2737607 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -315,12 +315,12 @@ static int arm_lpae_init_pte(struct arm_lpae_io_pgtable *data,
>   static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
>   					     arm_lpae_iopte *ptep,
>   					     arm_lpae_iopte curr,
> -					     struct io_pgtable_cfg *cfg)
> +					     struct arm_lpae_io_pgtable *data)
>   {

Please just define a local "cfg" variable here like in most other
places, to avoid the rest of the churn in this function. Other than
that,

Acked-by: Robin Murphy <robin.murphy@arm.com>

Also,

Fixes: 6c89928ff7a0 ("iommu/io-pgtable-arm: Support 52-bit physical address")

Thanks,
Robin.
(currently elbow-deep in other parts of io-pgtable-arm...)

>   	arm_lpae_iopte old, new;
>   
> -	new = __pa(table) | ARM_LPAE_PTE_TYPE_TABLE;
> -	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_NS)
> +	new = paddr_to_iopte(__pa(table), data) | ARM_LPAE_PTE_TYPE_TABLE;
> +	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_NS)
>   		new |= ARM_LPAE_PTE_NSTABLE;
>   
>   	/*
> @@ -332,11 +332,11 @@ static arm_lpae_iopte arm_lpae_install_table(arm_lpae_iopte *table,
>   
>   	old = cmpxchg64_relaxed(ptep, curr, new);
>   
> -	if (cfg->coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
> +	if (data->iop.cfg.coherent_walk || (old & ARM_LPAE_PTE_SW_SYNC))
>   		return old;
>   
>   	/* Even if it's not ours, there's no point waiting; just kick it */
> -	__arm_lpae_sync_pte(ptep, 1, cfg);
> +	__arm_lpae_sync_pte(ptep, 1, &data->iop.cfg);
>   	if (old == curr)
>   		WRITE_ONCE(*ptep, new | ARM_LPAE_PTE_SW_SYNC);
>   
> @@ -380,7 +380,7 @@ static int __arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
>   		if (!cptep)
>   			return -ENOMEM;
>   
> -		pte = arm_lpae_install_table(cptep, ptep, 0, cfg);
> +		pte = arm_lpae_install_table(cptep, ptep, 0, data);
>   		if (pte)
>   			__arm_lpae_free_pages(cptep, tblsz, cfg);
>   	} else if (!cfg->coherent_walk && !(pte & ARM_LPAE_PTE_SW_SYNC)) {
> @@ -592,7 +592,7 @@ static size_t arm_lpae_split_blk_unmap(struct arm_lpae_io_pgtable *data,
>   		__arm_lpae_init_pte(data, blk_paddr, pte, lvl, 1, &tablep[i]);
>   	}
>   
> -	pte = arm_lpae_install_table(tablep, ptep, blk_pte, cfg);
> +	pte = arm_lpae_install_table(tablep, ptep, blk_pte, data);
>   	if (pte != blk_pte) {
>   		__arm_lpae_free_pages(tablep, tablesz, cfg);
>   		/*
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
