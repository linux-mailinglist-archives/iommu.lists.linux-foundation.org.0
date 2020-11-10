Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D17322AD607
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 13:19:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 401AF87246;
	Tue, 10 Nov 2020 12:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpnKviLhUvJb; Tue, 10 Nov 2020 12:19:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCAAA87381;
	Tue, 10 Nov 2020 12:19:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B57D3C016F;
	Tue, 10 Nov 2020 12:19:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52B70C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 12:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F0A6872FD
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 12:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFU01TQcUytO for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 12:19:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D02B987246
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 12:19:02 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02DA820665;
 Tue, 10 Nov 2020 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605010742;
 bh=BWpWOxjo3ugo55ThRY5WPAalknlbV0RrMHib3OTIbeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DQCx3oM2JIIWIma00vDs477AjVO2VRJwU5Tqbi7R9+CdGhHxaNQCLbxqatPdqcVJQ
 OGSLx/l5gvJT9r8erNNMFfrH9ORo471Hfw9dE/Fsl5QoKNWbjNa1bWZTotE+4O5Vpt
 3bn1qmKyMCzzUhA3JfczF58H6uSR9hm2UBGkJ/IE=
Date: Tue, 10 Nov 2020 12:18:56 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv7 1/7] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20201110121855.GD16239@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, Oct 30, 2020 at 02:53:08PM +0530, Sai Prakash Ranjan wrote:
> Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
> attributes set in TCR for the page table walker when
> using system cache.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 7 ++++++-
>  include/linux/io-pgtable.h     | 4 ++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..a356caf1683a 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  
>  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
>  			    IO_PGTABLE_QUIRK_NON_STRICT |
> -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
> +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
> +			    IO_PGTABLE_QUIRK_SYS_CACHE))
>  		return NULL;
>  
>  	data = arm_lpae_alloc_pgtable(cfg);
> @@ -773,6 +774,10 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
>  		tcr->sh = ARM_LPAE_TCR_SH_IS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
>  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> +	} else if (cfg->quirks & IO_PGTABLE_QUIRK_SYS_CACHE) {
> +		tcr->sh = ARM_LPAE_TCR_SH_OS;
> +		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> +		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;

Given that this only applies in the case where then page-table walker is
non-coherent, I think we'd be better off renaming the quirk to something
like IO_PGTABLE_QUIRK_ARM_OUTER_WBWA and then rejecting it in the
non-coherent case.

>  	} else {
>  		tcr->sh = ARM_LPAE_TCR_SH_OS;
>  		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 4cde111e425b..86631f711e05 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>  	 *
>  	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>  	 *	for use in the upper half of a split address space.
> +	 *
> +	 * IO_PGTABLE_QUIRK_SYS_CACHE: Override the attributes set in TCR for
> +	 *	the page table walker when using system cache.

and then update this accordingly.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
