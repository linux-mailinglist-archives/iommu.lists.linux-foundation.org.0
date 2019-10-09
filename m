Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71FD0C48
	for <lists.iommu@lfdr.de>; Wed,  9 Oct 2019 12:10:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 511FAF75;
	Wed,  9 Oct 2019 10:10:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EC37AF5A
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 10:10:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 432ED89D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 10:10:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F3F28;
	Wed,  9 Oct 2019 03:10:40 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA2923F68E;
	Wed,  9 Oct 2019 03:10:38 -0700 (PDT)
Subject: Re: [PATCH v2] iommu/arm-smmu: fix "hang" when games exit
To: Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
	<20191007204906.19571-1-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e3782ea8-7d6b-21ed-84dd-0751c4cf310a@arm.com>
Date: Wed, 9 Oct 2019 11:10:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191007204906.19571-1-robdclark@gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
	open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
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

On 2019-10-07 9:49 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When games, browser, or anything using a lot of GPU buffers exits, there
> can be many hundreds or thousands of buffers to unmap and free.  If the
> GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
> for each buffer, resulting 5-10 seconds worth of reprogramming the
> context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
> To the user it would appear that the system just locked up.
> 
> A simple solution is to use pm_runtime_put_autosuspend() instead, so we
> don't immediately suspend the SMMU device.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> v1: original
> v2: unconditionally use autosuspend, rather than deciding based on what
>      consumer does
> 
>   drivers/iommu/arm-smmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 3f1d55fb43c4..b7b41f5001bc 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -289,7 +289,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
>   static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>   {
>   	if (pm_runtime_enabled(smmu->dev))
> -		pm_runtime_put(smmu->dev);
> +		pm_runtime_put_autosuspend(smmu->dev);
>   }
>   
>   static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> @@ -1445,6 +1445,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   	/* Looks ok, so add the device to the domain */
>   	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
>   
> +	pm_runtime_set_autosuspend_delay(smmu->dev, 20);
> +	pm_runtime_use_autosuspend(smmu->dev);
> +
>   rpm_put:
>   	arm_smmu_rpm_put(smmu);
>   	return ret;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
