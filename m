Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 380743DD666
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 15:04:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6607402C1;
	Mon,  2 Aug 2021 13:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMXIzFBlKwtO; Mon,  2 Aug 2021 13:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 873C3401CE;
	Mon,  2 Aug 2021 13:04:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A0D7C0022;
	Mon,  2 Aug 2021 13:04:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 857E8C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6862883A57
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpU_RvDKtL5T for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 13:04:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5112838F7
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 13:04:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 009E960FC1;
 Mon,  2 Aug 2021 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627909484;
 bh=ZgQ7QJgecBwwh1ArbvcKHFHcRL7o3t2ryIirvGXNdvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G4TMOdi7yTY1vtU//csNd7tLpkHXDpBr2WeQf5Sz1YbBTbSwc0T+ghVCoNWzvDZN6
 no7Nsgwhy69t1Qu3BSB3o47J0eFDa10psaLhc2coaEy6ZMantZ6wxvA31lRNc5SQDK
 0TW9oarNKxI+eciwapRPEgTF86NLI8z2Xy2ZAAyHFfUvOI890HlHt1wGwZ8dnfi9gv
 B6mz1p65fqDi4LbdkyXQzwL965aWMNANepCe6ASOtHFFMZ5e5DBDLqrfGG9sxj3djb
 4JoNmbQTNzXDJOfX3EYDKmgQKuDHKVNXSTBMRi1oylaoo0Gm1zt+3x81KpbWep/m0R
 gnb6BTB8Qzgqg==
Date: Mon, 2 Aug 2021 14:04:39 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 23/24] iommu/arm-smmu: Allow non-strict in
 pgtable_quirks interface
Message-ID: <20210802130438.GA28547@willie-the-truck>
References: <cover.1627468308.git.robin.murphy@arm.com>
 <0fcd1f5225a6b435cbc697551a6247cd435c04db.1627468310.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fcd1f5225a6b435cbc697551a6247cd435c04db.1627468310.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Jul 28, 2021 at 04:58:44PM +0100, Robin Murphy wrote:
> To make io-pgtable aware of a flush queue being dynamically enabled,
> allow IO_PGTABLE_QUIRK_NON_STRICT to be set even after a domain has been
> attached to, and hook up the final piece of the puzzle in iommu-dma.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 +++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 11 +++++++++++
>  drivers/iommu/dma-iommu.c                   |  3 +++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 19400826eba7..40fa9cb382c3 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2711,6 +2711,20 @@ static int arm_smmu_enable_nesting(struct iommu_domain *domain)
>  	return ret;
>  }
>  
> +static int arm_smmu_set_pgtable_quirks(struct iommu_domain *domain,
> +		unsigned long quirks)
> +{
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +
> +	if (quirks == IO_PGTABLE_QUIRK_NON_STRICT && smmu_domain->pgtbl_ops) {
> +		struct io_pgtable *iop = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
> +
> +		iop->cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> +		return 0;
> +	}
> +	return -EINVAL;
> +}

I don't see anything serialising this against a concurrent iommu_unmap(), so
the ordering and atomicity looks quite suspicious to me here. I don't think
it's just the page-table quirks either, but also setting cookie->fq_domain.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
