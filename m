Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED21DCF5A
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 16:17:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B41868862E;
	Thu, 21 May 2020 14:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OPDDAVhoIRWI; Thu, 21 May 2020 14:17:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19D8388631;
	Thu, 21 May 2020 14:17:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F15A6C0176;
	Thu, 21 May 2020 14:17:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 665A0C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C61F25CBB
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKtTMyF95gm4 for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 14:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A1AB325C66
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:17:11 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34BA420748;
 Thu, 21 May 2020 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590070631;
 bh=GjzwaRRDCT9qDw4gwlt5yphxvwdwXZXZJrf50Lvn5nM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zhp5hS0c2hiMcsTRAY10N5jHSgZcntp4kpwpJONYplXF38WzHAEZoGyGf7WtcOmeZ
 SKj5nEInq3SKL2VlD8LFdVsuhHY/aZUa7Jj8fkbSrkOJJPXvL3N6U8V1CkL+2owG/s
 gfSxtKHi1uniXMpcr8PtGe4iCXKURd11/Z63TNoU=
Date: Thu, 21 May 2020 15:17:05 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 14/24] iommu/arm-smmu-v3: Add SVA feature checking
Message-ID: <20200521141704.GH6608@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-15-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-15-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 fenghua.yu@intel.com, hch@infradead.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 catalin.marinas@arm.com, felix.kuehling@amd.com, robin.murphy@arm.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
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

On Tue, May 19, 2020 at 07:54:52PM +0200, Jean-Philippe Brucker wrote:
> Aggregate all sanity-checks for sharing CPU page tables with the SMMU
> under a single ARM_SMMU_FEAT_SVA bit. For PCIe SVA, users also need to
> check FEAT_ATS and FEAT_PRI. For platform SVA, they will most likely have
> to check FEAT_STALLS.
> 
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm-smmu-v3.c | 72 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 9332253e3608..a9f6f1d7014e 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -660,6 +660,7 @@ struct arm_smmu_device {
>  #define ARM_SMMU_FEAT_RANGE_INV		(1 << 15)
>  #define ARM_SMMU_FEAT_E2H		(1 << 16)
>  #define ARM_SMMU_FEAT_BTM		(1 << 17)
> +#define ARM_SMMU_FEAT_SVA		(1 << 18)
>  	u32				features;
>  
>  #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> @@ -3935,6 +3936,74 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  	return 0;
>  }
>  
> +static bool arm_smmu_supports_sva(struct arm_smmu_device *smmu)
> +{
> +	unsigned long reg, fld;
> +	unsigned long oas;
> +	unsigned long asid_bits;
> +
> +	u32 feat_mask = ARM_SMMU_FEAT_BTM | ARM_SMMU_FEAT_COHERENCY;

Aha -- here's the coherency check I missed!

> +
> +	if ((smmu->features & feat_mask) != feat_mask)
> +		return false;
> +
> +	if (!(smmu->pgsize_bitmap & PAGE_SIZE))
> +		return false;
> +
> +	/*
> +	 * Get the smallest PA size of all CPUs (sanitized by cpufeature). We're
> +	 * not even pretending to support AArch32 here.
> +	 */
> +	reg = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
> +	fld = cpuid_feature_extract_unsigned_field(reg, ID_AA64MMFR0_PARANGE_SHIFT);
> +	switch (fld) {
> +	case 0x0:
> +		oas = 32;
> +		break;
> +	case 0x1:
> +		oas = 36;
> +		break;
> +	case 0x2:
> +		oas = 40;
> +		break;
> +	case 0x3:
> +		oas = 42;
> +		break;
> +	case 0x4:
> +		oas = 44;
> +		break;
> +	case 0x5:
> +		oas = 48;
> +		break;
> +	case 0x6:

We can use ID_AA64MMFR0_PARANGE_xx constants instead of the hardcoded hex
numbers here.

With that:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
