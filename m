Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D2225A9E
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 10:58:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C27C85EC4;
	Mon, 20 Jul 2020 08:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5565juV7EEY2; Mon, 20 Jul 2020 08:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1091D85EC0;
	Mon, 20 Jul 2020 08:58:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3EBBC016F;
	Mon, 20 Jul 2020 08:58:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3580C016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA98621080
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwpH2OcHIktO for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 08:58:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A22F5204B0
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 08:58:47 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 628882080D;
 Mon, 20 Jul 2020 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595235527;
 bh=5dRm17x/4YmOg9N68msaTYgFDv010nts5Csj4JsnuNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=xgL1HXG5V4cFym6tqGx4SK3Zg1MNmAKtWRpSGhMqIhBBohFlDkQoTq230Hvd6SuYw
 w5wKTAdMcYJFzMnBoDGNZQdpgG3RMqInDwJCnWZWRhOSHxtTbnxoZOfI6U+8vb+A16
 dZrt94iCFWjJhK+PR14gN9iFFGOQoq/bJjf98yfs=
Date: Mon, 20 Jul 2020 09:58:42 +0100
From: Will Deacon <will@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/5] iommu/arm-smmu: Emulate bypass by using context
 banks
Message-ID: <20200720085841.GA11189@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717001619.325317-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <john.stultz@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
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

On Thu, Jul 16, 2020 at 05:16:16PM -0700, Bjorn Andersson wrote:
> Some firmware found on various Qualcomm platforms traps writes to S2CR
> of type BYPASS and writes FAULT into the register. This prevents us from
> marking the streams for the display controller as BYPASS to allow
> continued scanout of the screen through the initialization of the ARM
> SMMU.
> 
> This adds a Qualcomm specific cfg_probe function, which probes the
> behavior of the S2CR registers and if found faulty enables the related
> quirk. Based on this quirk context banks are allocated for IDENTITY
> domains as well, but with ARM_SMMU_SCTLR_M omitted.
> 
> The result is valid stream mappings, without translation.
> 
> Tested-by: John Stultz <john.stultz@linaro.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Picked up tested-by
> 
>  drivers/iommu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
>  drivers/iommu/arm-smmu.c      | 14 ++++++++++++--
>  drivers/iommu/arm-smmu.h      |  3 +++
>  3 files changed, 36 insertions(+), 2 deletions(-)

[...]

> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index fb85e716ae9a..5d5fe6741ed4 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -654,7 +654,9 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  
>  	/* SCTLR */
>  	reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
> -	      ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
> +	      ARM_SMMU_SCTLR_TRE;
> +	if (cfg->m)
> +		reg |= ARM_SMMU_SCTLR_M;
>  	if (stage1)
>  		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
>  	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> @@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	if (smmu_domain->smmu)
>  		goto out_unlock;
>  
> -	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> +	/*
> +	 * Nothing to do for IDENTITY domains,unless disabled context banks are
> +	 * used to emulate bypass mappings on Qualcomm platforms.
> +	 */
> +	if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {

Given that the other thread [1] with Jordan (why haven't you cc'd him?! --
adding him now) has identified the need for a callback to allocate the
context bank, why don't we use the same sort of idea here? If the impl
provides a CB allocator function, call it irrespective of the domain type.
If it allocates a domain even for an identity domain, then we can install
if with SCTLR.M clear.

Will

[1] https://lore.kernel.org/r/20200716151625.GA14526@jcrouse1-lnx.qualcomm.com
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
