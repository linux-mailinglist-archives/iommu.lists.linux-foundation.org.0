Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF60107A55
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 23:03:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA60A89286;
	Fri, 22 Nov 2019 22:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU2RW73e-pmL; Fri, 22 Nov 2019 22:03:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0D9D889285;
	Fri, 22 Nov 2019 22:03:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEF93C1DD8;
	Fri, 22 Nov 2019 22:03:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 075A6C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0009420420
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIEQVcHpgNc3 for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 22:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 by silver.osuosl.org (Postfix) with ESMTPS id 6FD71203A0
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 22:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574460191;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=qC7xMp4BM4MB08ZmDKowhrKl8rje0tvkPqC4FVJlDfw=;
 b=WVLEwQnoIZGFWR1Pjq4mWPXm8FKryFNdG+hGFaNhX9LZJ8Hq//Kxut9Dm3hfUDP6
 RWXHkys7gPbFJJwy/MGIsidyxNy+3dy2a/S1E12fX9vHDYZzUhvf+xho55+xNHnrU8B
 6r65feKH9YzeNXALHcvShLVy5QXoqIwa8cbpd3P4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574460191;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=qC7xMp4BM4MB08ZmDKowhrKl8rje0tvkPqC4FVJlDfw=;
 b=HlQ2S/133s59FEyoYysQdxyPtyufrI1UaiKDX6ahlGvCJhkFiHhqrMbPXrifVtJ4
 NoS2YGSzz4Etr7WfMf2sidb9qmagoa/ULpxNcDl2DBewk+Cv0wsowntLWefJ4QPUw0q
 emCYNgAIXhig197gzbwS9tpZxJ9jkIfLUo5AcsuE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CD5EEC4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 22 Nov 2019 22:03:11 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 10/10] iommu/io-pgtable-arm: Prepare for TTBR1 usage
Message-ID: <0101016e9523f24b-59eb52d1-e5de-4742-9072-3d6ef23b0645-000000@us-west-2.amazonses.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1572024119.git.robin.murphy@arm.com>
 <9ec05935de3f1c1da5d1780201147ed40e129295.1572024120.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ec05935de3f1c1da5d1780201147ed40e129295.1572024120.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.11.22-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Oct 25, 2019 at 07:08:39PM +0100, Robin Murphy wrote:
> Now that we can correctly extract top-level indices without relying on
> the remaining upper bits being zero, the only remaining impediments to
> using a given table for TTBR1 are the address validation on map/unmap
> and the awkward TCR translation granule format. Add a quirk so that we
> can do the right thing at those points.

Tested-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++------
>  include/linux/io-pgtable.h     |  4 ++++
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 9b1912ede000..e53edff56e54 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -107,6 +107,10 @@
>  #define ARM_LPAE_TCR_TG0_64K		1
>  #define ARM_LPAE_TCR_TG0_16K		2
>  
> +#define ARM_LPAE_TCR_TG1_16K		1
> +#define ARM_LPAE_TCR_TG1_4K		2
> +#define ARM_LPAE_TCR_TG1_64K		3
> +
>  #define ARM_LPAE_TCR_SH0_SHIFT		12
>  #define ARM_LPAE_TCR_SH_NS		0
>  #define ARM_LPAE_TCR_SH_OS		2
> @@ -466,6 +470,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	arm_lpae_iopte *ptep = data->pgd;
>  	int ret, lvl = data->start_level;
>  	arm_lpae_iopte prot;
> +	long iaext = (long)iova >> cfg->ias;
>  
>  	/* If no access, then nothing to do */
>  	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
> @@ -474,7 +479,9 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>  		return -EINVAL;
>  
> -	if (WARN_ON(iova >> data->iop.cfg.ias || paddr >> data->iop.cfg.oas))
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +		iaext = ~iaext;
> +	if (WARN_ON(iaext || paddr >> cfg->oas))
>  		return -ERANGE;
>  
>  	prot = arm_lpae_prot_to_pte(data, iommu_prot);
> @@ -640,11 +647,14 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	arm_lpae_iopte *ptep = data->pgd;
> +	long iaext = (long)iova >> cfg->ias;
>  
>  	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>  		return 0;
>  
> -	if (WARN_ON(iova >> data->iop.cfg.ias))
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +		iaext = ~iaext;
> +	if (WARN_ON(iaext))
>  		return 0;
>  
>  	return __arm_lpae_unmap(data, gather, iova, size, data->start_level, ptep);
> @@ -780,9 +790,11 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  	u64 reg;
>  	struct arm_lpae_io_pgtable *data;
>  	typeof(&cfg->arm_lpae_s1_cfg.tcr) tcr = &cfg->arm_lpae_s1_cfg.tcr;
> +	bool tg1;
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> -			    IO_PGTABLE_QUIRK_NON_STRICT))
> +			    IO_PGTABLE_QUIRK_NON_STRICT |
> +			    IO_PGTABLE_QUIRK_ARM_TTBR1))
>  		return NULL;
>  
>  	data = arm_lpae_alloc_pgtable(cfg);
> @@ -800,15 +812,16 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  		tcr->orgn = ARM_LPAE_TCR_RGN_NC;
>  	}
>  
> +	tg1 = cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1;
>  	switch (ARM_LPAE_GRANULE(data)) {
>  	case SZ_4K:
> -		tcr->tg = ARM_LPAE_TCR_TG0_4K;
> +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_4K : ARM_LPAE_TCR_TG0_4K;
>  		break;
>  	case SZ_16K:
> -		tcr->tg = ARM_LPAE_TCR_TG0_16K;
> +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_16K : ARM_LPAE_TCR_TG0_16K;
>  		break;
>  	case SZ_64K:
> -		tcr->tg = ARM_LPAE_TCR_TG0_64K;
> +		tcr->tg = tg1 ? ARM_LPAE_TCR_TG1_64K : ARM_LPAE_TCR_TG0_64K;
>  		break;
>  	}
>  
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 6ae104cedfd7..d7c5cb685e50 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -83,12 +83,16 @@ struct io_pgtable_cfg {
>  	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
>  	 *	on unmap, for DMA domains using the flush queue mechanism for
>  	 *	delayed invalidation.
> +	 *
> +	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
> +	 *	for use in the upper half of a split address space.
>  	 */
>  	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
>  	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
>  	#define IO_PGTABLE_QUIRK_TLBI_ON_MAP	BIT(2)
>  	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
>  	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
> +	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
>  	unsigned long			quirks;
>  	unsigned long			pgsize_bitmap;
>  	unsigned int			ias;
> -- 
> 2.21.0.dirty
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
