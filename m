Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E03089C4
	for <lists.iommu@lfdr.de>; Fri, 29 Jan 2021 16:12:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2870886511;
	Fri, 29 Jan 2021 15:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_SugqhdRhh4; Fri, 29 Jan 2021 15:12:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 12D9B864F4;
	Fri, 29 Jan 2021 15:12:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09DD5C013A;
	Fri, 29 Jan 2021 15:12:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD5EEC013A
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 15:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BE77987484
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 15:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crciF5hFMlEe for <iommu@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 15:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 08E3587476
 for <iommu@lists.linux-foundation.org>; Fri, 29 Jan 2021 15:12:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333D213D5;
 Fri, 29 Jan 2021 07:12:25 -0800 (PST)
Received: from [10.57.35.163] (unknown [10.57.35.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B382F3F71B;
 Fri, 29 Jan 2021 07:12:23 -0800 (PST)
Subject: Re: [PATCH v3 2/3] perf/smmuv3: Add a MODULE_SOFTDEP() to indicate
 dependency on SMMU
To: Zhen Lei <thunder.leizhen@huawei.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210127113258.1421-1-thunder.leizhen@huawei.com>
 <20210127113258.1421-3-thunder.leizhen@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <67e0859b-2633-3516-527f-57557e210fa1@arm.com>
Date: Fri, 29 Jan 2021 15:12:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210127113258.1421-3-thunder.leizhen@huawei.com>
Content-Language: en-GB
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
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

On 2021-01-27 11:32, Zhen Lei wrote:
> The MODULE_SOFTDEP() gives user space a hint of the loading sequence. And
> when command "modprobe arm_smmuv3_pmu" is executed, the arm_smmu_v3.ko is
> automatically loaded in advance.

Why do we need this? If probe order doesn't matter when both drivers are 
built-in, why should module load order?

TBH I'm not sure why we even have a Kconfig dependency on ARM_SMMU_V3, 
given that the drivers operate completely independently :/

Robin.

> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>   drivers/perf/arm_smmuv3_pmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
> index e5e505a0804fe53..9a305ac51208cd2 100644
> --- a/drivers/perf/arm_smmuv3_pmu.c
> +++ b/drivers/perf/arm_smmuv3_pmu.c
> @@ -950,6 +950,7 @@ static void __exit arm_smmu_pmu_exit(void)
>   module_exit(arm_smmu_pmu_exit);
>   
>   MODULE_DESCRIPTION("PMU driver for ARM SMMUv3 Performance Monitors Extension");
> +MODULE_SOFTDEP("pre: arm_smmu_v3");
>   MODULE_AUTHOR("Neil Leeder <nleeder@codeaurora.org>");
>   MODULE_AUTHOR("Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>");
>   MODULE_LICENSE("GPL v2");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
