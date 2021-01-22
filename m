Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D0300481
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 14:49:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AF048738E;
	Fri, 22 Jan 2021 13:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o5G7f5xXJLCZ; Fri, 22 Jan 2021 13:49:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B978B87394;
	Fri, 22 Jan 2021 13:49:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CB22C013A;
	Fri, 22 Jan 2021 13:49:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBA93C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B543E87390
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjCtr0Q06RK9 for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 13:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 217E48738E
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 435A4239EF;
 Fri, 22 Jan 2021 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611323370;
 bh=aonPtlKc+imf2p76OJ+y0raR83KCnlf4NVTK4RxYrF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvvIfrovzPQMpaSucRRasxDXLEh7ES7qe42TxwsiyUVDkZ6hSrngr8FbKlt/MYYGx
 SN99scnnaGtO3DzcngDk6Kf1mQgBeT5+V2ge0Ddc1E/Lv3nWu65cKi6XNiYjq2ezBA
 uCueh72QTOHmTmxhVYcX4RewxNox8ffLUoxSyZ+nkxvaFWBamIQTKVz4+DUBjEAvqf
 DFpBhnrqDYxqcuAJgMknxCN6fXHHZejiGhwn9fdUbuKNdYgDvp+8ArgYr5zDCijabr
 +cwBexE6v6BSslxSgZ+Aw3LnGCnI+QoVa+EqzA21cDo94KjhuXApPkx8sGbAY6kn8x
 3ElbZcz/tZoFw==
Date: Fri, 22 Jan 2021 13:49:26 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 1/3] iommu/arm-smmu-v3: Split arm_smmu_tlb_inv_range()
Message-ID: <20210122134925.GA24678@willie-the-truck>
References: <20210122115257.2502526-1-jean-philippe@linaro.org>
 <20210122115257.2502526-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122115257.2502526-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vivek.gautam@arm.com, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, robin.murphy@arm.com,
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

On Fri, Jan 22, 2021 at 12:52:56PM +0100, Jean-Philippe Brucker wrote:
> Extract some of the cmd initialization and the ATC invalidation from
> arm_smmu_tlb_inv_range(), to allow an MMU notifier to invalidate a VA
> range by ASID.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 62 ++++++++++++---------
>  1 file changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 740a3d487591..a27b074d5c0c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1934,40 +1934,27 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>  }
>  
> -static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
> -				   size_t granule, bool leaf,
> +static void arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
> +				   unsigned long iova, size_t size,
> +				   size_t granule,
>  				   struct arm_smmu_domain *smmu_domain)

nit: please can you prefix this function with a couple of underscores and/or
change its name? It's now a low-level helper and trusts the caller to pass
in a TLBI command, so we really don't want people to call it directly!

Anyway, the series looks good to me. In fact, I tried to apply it but I get
a conflict with the last patch. Please can you rebase onto my
for-joerg/arm-smmu/updates branch? If you do that (plus the nit above) then
I can queue these right away.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
