Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B3F2C0E92
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 16:19:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2AFF8588C;
	Mon, 23 Nov 2020 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2BfRb9E+7nF; Mon, 23 Nov 2020 15:19:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9745A8575A;
	Mon, 23 Nov 2020 15:19:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 837B6C0052;
	Mon, 23 Nov 2020 15:19:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF6CDC0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB01D8575A
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tH2CAjY8A0oT for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 15:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D595856ED
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 15:19:37 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1F1C20782;
 Mon, 23 Nov 2020 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606144777;
 bh=HkinMwp5K7ka06g0utiNxu3rxootZ1+V4T5exYOBO1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TGvdR7b3KxTd/HWyy+y0XK9/hi6aL9HGe3tNeV7FSJbrOAe//4MfArc0FZhcJ3x79
 AYH5VvqqGpyxDiKdwz0xS9id3+SwCuhW1kd4x4GLKDzv3Jx7e/LfgDxeI1T4JmUDRG
 bVUNty5vcumpqly04CNjjfJlC4/q2zUXA6or6+LA=
Date: Mon, 23 Nov 2020 15:19:31 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 3/8] iommu/arm-smmu: Move non-strict mode to use
 domain_attr_io_pgtbl_cfg
Message-ID: <20201123151930.GD11033@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <672a1cf7bbfc43ab401a2c157dafa0e9099e67a2.1605621785.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <672a1cf7bbfc43ab401a2c157dafa0e9099e67a2.1605621785.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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

On Tue, Nov 17, 2020 at 08:00:42PM +0530, Sai Prakash Ranjan wrote:
> Now that we have a struct domain_attr_io_pgtbl_cfg with quirks,
> use that for non_strict mode as well thereby removing the need
> for more members of arm_smmu_domain in the future.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 7 ++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 1 -
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 7b05782738e2..5f066a1b7221 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -786,9 +786,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  			goto out_clear_smmu;
>  	}
>  
> -	if (smmu_domain->non_strict)
> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> -
>  	if (smmu_domain->pgtbl_cfg.quirks)
>  		pgtbl_cfg.quirks |= smmu_domain->pgtbl_cfg.quirks;
>  
> @@ -1527,7 +1524,7 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>  	case IOMMU_DOMAIN_DMA:
>  		switch (attr) {
>  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			*(int *)data = smmu_domain->non_strict;
> +			*(int *)data = smmu_domain->pgtbl_cfg.quirks;

Probably better to compare with IO_PGTABLE_QUIRK_NON_STRICT here even though
we only support this one quirk for DMA domains atm.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
