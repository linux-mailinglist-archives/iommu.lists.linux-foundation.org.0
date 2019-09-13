Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461FB21FA
	for <lists.iommu@lfdr.de>; Fri, 13 Sep 2019 16:34:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 24E5A102A;
	Fri, 13 Sep 2019 14:34:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9D2EEFF5
	for <iommu@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 14:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1F60983A
	for <iommu@lists.linux-foundation.org>;
	Fri, 13 Sep 2019 14:34:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3C4D1000;
	Fri, 13 Sep 2019 07:34:18 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F25143F67D;
	Fri, 13 Sep 2019 07:34:17 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Report USF more clearly
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org, joro@8bytes.org
References: <2762ffd4c196dc91d62e10eb8b753f256ea9b629.1568375317.git.robin.murphy@arm.com>
Message-ID: <a33b166d-dbfa-7791-0a36-b7deda1fc03d@arm.com>
Date: Fri, 13 Sep 2019 15:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2762ffd4c196dc91d62e10eb8b753f256ea9b629.1568375317.git.robin.murphy@arm.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org
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

On 13/09/2019 12:48, Robin Murphy wrote:
> Although CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT is a welcome tool
> for smoking out inadequate firmware, the failure mode is non-obvious
> and can be confusing for end users. Add some special-case reporting of
> Unidentified Stream Faults to help clarify this particular symptom.
> 
> CC: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/iommu/arm-smmu.c | 5 +++++
>   drivers/iommu/arm-smmu.h | 2 ++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index b7cf24402a94..76ac8c180695 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -499,6 +499,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>   	dev_err_ratelimited(smmu->dev,
>   		"\tGFSR 0x%08x, GFSYNR0 0x%08x, GFSYNR1 0x%08x, GFSYNR2 0x%08x\n",
>   		gfsr, gfsynr0, gfsynr1, gfsynr2);
> +	if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
> +	    (gfsr & sGFSR_USF))
> +		dev_err_ratelimited(smmu->dev,
> +			"Stream ID %hu may not be described by firmware, try booting with \"arm-smmu.disable_bypass=0\"\n",
> +			(u16)gfsynr1);
>   
>   	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
>   	return IRQ_HANDLED;
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index c9c13b5785f2..46f7e161e83e 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -79,6 +79,8 @@
>   #define ID7_MINOR			GENMASK(3, 0)
>   
>   #define ARM_SMMU_GR0_sGFSR		0x48
> +#define sGFSR_USF			BIT(2)

Sigh... and of course what I actually meant here was that this is the 
2nd bit, which is bit 1, which is also 2. I blame Friday :(

Robin.

> +
>   #define ARM_SMMU_GR0_sGFSYNR0		0x50
>   #define ARM_SMMU_GR0_sGFSYNR1		0x54
>   #define ARM_SMMU_GR0_sGFSYNR2		0x58
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
