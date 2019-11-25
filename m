Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38830108DB4
	for <lists.iommu@lfdr.de>; Mon, 25 Nov 2019 13:17:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBB278731A;
	Mon, 25 Nov 2019 12:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsAe2QVIk1iO; Mon, 25 Nov 2019 12:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 812B6870AD;
	Mon, 25 Nov 2019 12:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65D40C1DDB;
	Mon, 25 Nov 2019 12:17:02 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77D32C0878
 for <iommu@lists.linuxfoundation.org>; Mon, 25 Nov 2019 12:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 65E0A8631D
 for <iommu@lists.linuxfoundation.org>; Mon, 25 Nov 2019 12:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3syUXQ7etNm for <iommu@lists.linuxfoundation.org>;
 Mon, 25 Nov 2019 12:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 59267862E8
 for <iommu@lists.linuxfoundation.org>; Mon, 25 Nov 2019 12:16:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D0BF31B;
 Mon, 25 Nov 2019 04:16:57 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F28363F52E;
 Mon, 25 Nov 2019 04:16:55 -0800 (PST)
Subject: Re: [PATCH] iommu/arm-smmu: support SMMU module probing from the IORT
To: Ard Biesheuvel <ardb@kernel.org>, will@kernel.org
References: <20191121114918.2293-1-will@kernel.org>
 <20191122174125.21030-1-ardb@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <37aa4c74-b29a-637c-e434-287089f1e170@arm.com>
Date: Mon, 25 Nov 2019 12:16:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122174125.21030-1-ardb@kernel.org>
Content-Language: en-GB
Cc: iommu@lists.linuxfoundation.org, isaacm@codeaurora.org,
 saravanak@google.com, jean-philippe@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, bhelgaas@google.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 22/11/2019 5:41 pm, Ard Biesheuvel wrote:
> Add support for SMMU drivers built as modules to the ACPI/IORT device
> probing path, by deferring the probe of the master if the SMMU driver is
> known to exist but has not been loaded yet. Given that the IORT code
> registers a platform device for each SMMU that it discovers, we can
> easily trigger the udev based autoloading of the SMMU drivers by making
> the platform device identifier part of the module alias.

Thanks Ard, I was just gearing up to check the ACPI fallout myself :)

AFAICS this looks sufficient to avoid any unexpected behaviour if users 
start playing with the rest of the series on ACPI systems, so we can 
investigate 'proper' device links for IORT at some point in future.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>   drivers/acpi/arm64/iort.c   | 4 ++--
>   drivers/iommu/arm-smmu-v3.c | 1 +
>   drivers/iommu/arm-smmu.c    | 1 +
>   3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 5a7551d060f2..a696457a9b11 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -850,9 +850,9 @@ static inline bool iort_iommu_driver_enabled(u8 type)
>   {
>   	switch (type) {
>   	case ACPI_IORT_NODE_SMMU_V3:
> -		return IS_BUILTIN(CONFIG_ARM_SMMU_V3);
> +		return IS_ENABLED(CONFIG_ARM_SMMU_V3);
>   	case ACPI_IORT_NODE_SMMU:
> -		return IS_BUILTIN(CONFIG_ARM_SMMU);
> +		return IS_ENABLED(CONFIG_ARM_SMMU);
>   	default:
>   		pr_warn("IORT node type %u does not describe an SMMU\n", type);
>   		return false;
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 7669beafc493..bf6a1e8eb9b0 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -3733,4 +3733,5 @@ module_platform_driver(arm_smmu_driver);
>   
>   MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
> +MODULE_ALIAS("platform:arm-smmu-v3");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index d55acc48aee3..db5106b0955b 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2292,4 +2292,5 @@ module_platform_driver(arm_smmu_driver);
>   
>   MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations");
>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
> +MODULE_ALIAS("platform:arm-smmu");
>   MODULE_LICENSE("GPL v2");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
