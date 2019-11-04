Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC088EE740
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 19:20:40 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 822B5E7F;
	Mon,  4 Nov 2019 18:20:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7CFB8B3E
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 18:20:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 23A2BA9
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 18:20:34 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 23D7020578;
	Mon,  4 Nov 2019 18:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572891634;
	bh=1wytFv5Iw8uWVzJ3s5vXpqXK/zV2wyAIZTSZnZaZKpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=io6APnwaPmm8zsNTcIXkmu0b62EI7JARNIW9QcJsF7VvFlAaMsn1nGvHxVNDXk4sA
	C9vytYZUPGlril/b8Th+ErOwOc9OC36jK4hOlRZnZGkL/ZXnCeAMIE4FBrVHevLL9g
	UXe6eAPQF7a7e57S6TnLgrty+B/Twl82z6DQJ8F0=
Date: Mon, 4 Nov 2019 18:20:30 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 07/10] iommu/io-pgtable-arm: Rationalise MAIR handling
Message-ID: <20191104182029.GG24909@willie-the-truck>
References: <cover.1572024119.git.robin.murphy@arm.com>
	<c6bee9e6de5e7f4aa2293ee5385ffa2dd95600d3.1572024120.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6bee9e6de5e7f4aa2293ee5385ffa2dd95600d3.1572024120.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, Oct 25, 2019 at 07:08:36PM +0100, Robin Murphy wrote:
> Between VMSAv8-64 and the various 32-bit formats, there is either one
> 64-bit MAIR or a pair of 32-bit MAIR0/MAIR1 or NMRR/PMRR registers.
> As such, keeping two 64-bit values in io_pgtable_cfg has always been
> overkill.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm-smmu-v3.c    | 2 +-
>  drivers/iommu/arm-smmu.c       | 4 ++--
>  drivers/iommu/io-pgtable-arm.c | 3 +--
>  drivers/iommu/ipmmu-vmsa.c     | 2 +-
>  drivers/iommu/qcom_iommu.c     | 4 ++--
>  include/linux/io-pgtable.h     | 2 +-
>  6 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 8da93e730d6f..3f20e548f1ec 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2172,7 +2172,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
>  	cfg->cd.asid	= (u16)asid;
>  	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
>  	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
> -	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair[0];
> +	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
>  	return 0;
>  
>  out_free_asid:
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 080af0326816..2bc3e93b11e6 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -552,8 +552,8 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>  			cb->mair[0] = pgtbl_cfg->arm_v7s_cfg.prrr;
>  			cb->mair[1] = pgtbl_cfg->arm_v7s_cfg.nmrr;
>  		} else {
> -			cb->mair[0] = pgtbl_cfg->arm_lpae_s1_cfg.mair[0];
> -			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair[1];
> +			cb->mair[0] = pgtbl_cfg->arm_lpae_s1_cfg.mair;
> +			cb->mair[1] = pgtbl_cfg->arm_lpae_s1_cfg.mair >> 32;

Does this work correctly for big-endian?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
