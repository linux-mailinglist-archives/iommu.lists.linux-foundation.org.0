Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A342F17648C
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 21:03:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 45B7B86174;
	Mon,  2 Mar 2020 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWjGvHDRRY8q; Mon,  2 Mar 2020 20:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 699E685EF5;
	Mon,  2 Mar 2020 20:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C108C013E;
	Mon,  2 Mar 2020 20:03:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95FACC013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 20:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 84B1484553
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVl5eksGuB6f for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 20:03:30 +0000 (UTC)
X-Greylist: delayed 00:05:51 by SQLgrey-1.7.6
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.216])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A3EE83608
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583179408;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=jW1b+aV7X/tdSJT5uvSfVzTq5rxfiSvkhTy2solsqU8=;
 b=iFXbJcpBkl+X+lVu2/80DcPR41HnAy+GzuRmQXJJ6fsHCxIuX+XzXJO46LUDgV6C1U
 GpR1eDnSCgoakw81KHNdkuCqOyGsNH1omztOA4GqbNzQsnxfDHxEf8x+j6H0elX1hXxa
 g3LDVk8YmbR4b+qdOilzx700rQ7RLt9tM5lXmq0fLk1OCank/RtEv3xM8F/GZqmx0EHY
 WPQlTWlyix0ypJVkOqwFWJtnIntAVp1MWzi4MLSWS+xH30uBaQ3F6u0nanAjrN9ZfrOy
 Mse4sxzTxAO7S6KyJkcdo2YeUlh2jl56UNs4nRp01Mo6mU9wWOEZumSW895xMTtNLp4f
 9B0A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8f+IcrABg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id c04535w22JvSEbI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 2 Mar 2020 20:57:28 +0100 (CET)
Date: Mon, 2 Mar 2020 20:57:23 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Fix IOVA validation for 32-bit
Message-ID: <20200302195723.GA73742@gerhold.net>
References: <dd330453ed31099b5b3b76db02fe79d55aa9bce3.1582899080.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd330453ed31099b5b3b76db02fe79d55aa9bce3.1582899080.git.robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux-foundation.org,
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

Hi Robin,

On Fri, Feb 28, 2020 at 02:18:55PM +0000, Robin Murphy wrote:
> Since we ony support the TTB1 quirk for AArch64 contexts, and
> consequently only for 64-bit builds, the sign-extension aspect of the
> "are all bits above IAS consistent?" check should implicitly only apply
> to 64-bit IOVAs. Change the type of the cast to ensure that 32-bit longs
> don't inadvertently get sign-extended, and thus considered invalid, if
> they happen to be above 2GB in the TTB0 region.
> 
> Reported-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 

Thanks for the patch!

Just wanted to report that this patch does indeed fix the problem
I had with qcom-venus on ARM32.

It's probably too late now, but FWIW:
Tested-by: Stephan Gerhold <stephan@gerhold.net>

> ---
> 
> Logically there may also have been a UBSAN "shift greater than size of
> type" warning too, but arch/arm doesn't support UBSAN_SANITIZE_ALL,
> and that's now my only easy "spin up a 32-bit VM" option to hand :)
> 
>  drivers/iommu/io-pgtable-arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 983b08477e64..04fbd4bf0ff9 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -468,7 +468,7 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
>  	arm_lpae_iopte *ptep = data->pgd;
>  	int ret, lvl = data->start_level;
>  	arm_lpae_iopte prot;
> -	long iaext = (long)iova >> cfg->ias;
> +	long iaext = (s64)iova >> cfg->ias;
>  
>  	/* If no access, then nothing to do */
>  	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
> @@ -645,7 +645,7 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	arm_lpae_iopte *ptep = data->pgd;
> -	long iaext = (long)iova >> cfg->ias;
> +	long iaext = (s64)iova >> cfg->ias;
>  
>  	if (WARN_ON(!size || (size & cfg->pgsize_bitmap) != size))
>  		return 0;
> -- 
> 2.23.0.dirty
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
