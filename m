Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CDA1958B1
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 15:12:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B44E8876F6;
	Fri, 27 Mar 2020 14:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZF-R3TqHo2g; Fri, 27 Mar 2020 14:12:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D9FA86BC2;
	Fri, 27 Mar 2020 14:12:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83F64C0177;
	Fri, 27 Mar 2020 14:12:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74724C0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 491F9263F2
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 14:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4tJA61VEDhj for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 14:12:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id F10CE26418
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 14:12:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD251FB;
 Fri, 27 Mar 2020 07:12:05 -0700 (PDT)
Received: from [10.57.60.204] (unknown [10.57.60.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42A153F71F;
 Fri, 27 Mar 2020 07:12:04 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Douglas Anderson <dianders@chromium.org>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
Date: Fri, 27 Mar 2020 14:12:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 2020-03-27 1:28 pm, Sai Prakash Ranjan wrote:
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown.
> 
> On SC7180:
> 
>    arm-smmu 15000000.iommu: removing device with active domains!
>    arm-smmu 5040000.iommu: removing device with active domains!
> 
> Demote the log level to debug since it does not offer much
> help in identifying/fixing any issue as the system is anyways
> going down and reduce spamming the kernel log.

I've gone back and forth on this pretty much ever since we added the 
shutdown hook - on the other hand, if any devices *are* still running in 
those domains at this point, then once we turn off the SMMU and let 
those IOVAs go out on the bus as physical addresses, all manner of 
weirdness may ensue. Thus there is an argument for *some* indication 
that this may happen, although IMO it could be downgraded to at least 
dev_warn().

Robin.

> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/iommu/arm-smmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87af42b..0a865e32054a 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2250,7 +2250,7 @@ static int arm_smmu_device_remove(struct platform_device *pdev)
>   		return -ENODEV;
>   
>   	if (!bitmap_empty(smmu->context_map, ARM_SMMU_MAX_CBS))
> -		dev_err(&pdev->dev, "removing device with active domains!\n");
> +		dev_dbg(&pdev->dev, "removing device with active domains!\n");
>   
>   	arm_smmu_bus_init(NULL);
>   	iommu_device_unregister(&smmu->iommu);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
