Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3C303A64
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 11:34:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8082203FE;
	Tue, 26 Jan 2021 10:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvDOgdxqhweS; Tue, 26 Jan 2021 10:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D1465203E1;
	Tue, 26 Jan 2021 10:34:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCE5DC013A;
	Tue, 26 Jan 2021 10:34:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 360BEC013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 23862850AD
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vqLyJcpCOta for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 10:34:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35D748506E
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 10:34:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 862E2D6E;
 Tue, 26 Jan 2021 02:34:34 -0800 (PST)
Received: from [10.57.43.46] (unknown [10.57.43.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FCA73F66B;
 Tue, 26 Jan 2021 02:34:33 -0800 (PST)
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix mask extraction for bootloader
 programmed SMRs
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
 joro@8bytes.org, bjorn.andersson@linaro.org
References: <1611611545-19055-1-git-send-email-isaacm@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <21495c0d-d029-48c8-bbe7-fc45ff7d9326@arm.com>
Date: Tue, 26 Jan 2021 10:34:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611611545-19055-1-git-send-email-isaacm@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On 2021-01-25 21:52, Isaac J. Manjarres wrote:
> When extracting the mask for a SMR that was programmed by the
> bootloader, the SMR's valid bit is also extracted and is treated
> as part of the mask, which is not correct. Consider the scenario
> where an SMMU master whose context is determined by a bootloader
> programmed SMR is removed (omitting parts of device/driver core):
> 
> ->iommu_release_device()
>   -> arm_smmu_release_device()
>    -> arm_smmu_master_free_smes()
>     -> arm_smmu_free_sme() /* Assume that the SME is now free */
>     -> arm_smmu_write_sme()
>      -> arm_smmu_write_smr() /* Construct SMR value using mask and SID */
> 
> Since the valid bit was considered as part of the mask, the SMR will
> be programmed as valid.

Ah, right, because ARM_SMMU_SMR_{ID,MASK} are 16-bit fields to 
accommodate EXIDS, which doesn't matter normally when the IDs are 
strictly validated in arm_smmu_probe_device()...

> Fix the SMR mask extraction step for bootloader programmed SMRs
> by masking out the valid bit when we know that we're already
> working with a valid SMR.

This seems like the neatest approach to me.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 07a7f2caaa5a ("iommu/arm-smmu-qcom: Read back stream mappings")
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Cc: stable@vger.kernel.org
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index bcda170..abb1d2f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -206,6 +206,8 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
>   		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
>   
>   		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> +			/* Ignore valid bit for SMR mask extraction. */
> +			smr &= ~ARM_SMMU_SMR_VALID;
>   			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
>   			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
>   			smmu->smrs[i].valid = true;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
