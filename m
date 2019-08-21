Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB8E97EC4
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 17:36:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 843D8EF0;
	Wed, 21 Aug 2019 15:36:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3CA8CEE6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:36:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id DA72B822
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:36:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FCBC337;
	Wed, 21 Aug 2019 08:36:35 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 502633F718;
	Wed, 21 Aug 2019 08:36:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] iommu/arm-smmu-v3: Disable detection of ATS and PRI
To: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
References: <20190821151749.23743-1-will@kernel.org>
	<20190821151749.23743-3-will@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <af491ac1-f08b-f253-2133-2e45b7b99800@arm.com>
Date: Wed, 21 Aug 2019 16:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190821151749.23743-3-will@kernel.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, stable@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 21/08/2019 16:17, Will Deacon wrote:
> Detecting the ATS capability of the SMMU at probe time introduces a
> spinlock into the ->unmap() fast path, even when ATS is not actually
> in use. Furthermore, the ATC invalidation that exists is broken, as it
> occurs before invalidation of the main SMMU TLB which leaves a window
> where the ATC can be repopulated with stale entries.
> 
> Given that ATS is both a new feature and a specialist sport, disable it
> for now whilst we fix it properly in subsequent patches. Since PRI
> requires ATS, disable that too.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 9ce27afc0830 ("iommu/arm-smmu-v3: Add support for PCI ATS")

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   drivers/iommu/arm-smmu-v3.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 3402b1bc8e94..7a368059cd7d 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -3295,11 +3295,13 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	}
>   
>   	/* Boolean feature flags */
> +#if 0	/* ATS invalidation is slow and broken */
>   	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
>   		smmu->features |= ARM_SMMU_FEAT_PRI;
>   
>   	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
>   		smmu->features |= ARM_SMMU_FEAT_ATS;
> +#endif
>   
>   	if (reg & IDR0_SEV)
>   		smmu->features |= ARM_SMMU_FEAT_SEV;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
