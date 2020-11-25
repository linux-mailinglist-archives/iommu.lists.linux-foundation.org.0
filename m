Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6762C4745
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 19:10:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 785828762D;
	Wed, 25 Nov 2020 18:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1KFf3UjHz+G; Wed, 25 Nov 2020 18:10:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F156887650;
	Wed, 25 Nov 2020 18:10:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC197C0052;
	Wed, 25 Nov 2020 18:10:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CBDDC0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0896986F1D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66Y0d5cTWTdn for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2DFB86F16
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 18:10:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2DEE31B;
 Wed, 25 Nov 2020 10:10:23 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABD533F23F;
 Wed, 25 Nov 2020 10:10:22 -0800 (PST)
Subject: Re: [PATCH] iommu: arm-smmu-impl: add NXP hook to preserve
 bootmappings
To: laurentiu.tudor@nxp.com, will@kernel.org, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <20201125155009.18453-1-laurentiu.tudor@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <30296756-9b8d-4851-87f0-8c4bd41110e9@arm.com>
Date: Wed, 25 Nov 2020 18:10:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125155009.18453-1-laurentiu.tudor@nxp.com>
Content-Language: en-GB
Cc: diana.craciun@nxp.com
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

On 2020-11-25 15:50, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Add a NXP specific hook to preserve SMMU mappings present at
> boot time (created by the boot loader). These are needed for
> MC firmware present on some NXP chips to continue working
> across kernel boot and SMMU initialization.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 33 ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 7fed89c9d18a..ca07d9d4be69 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -187,6 +187,36 @@ static const struct arm_smmu_impl mrvl_mmu500_impl = {
>   	.reset = arm_mmu500_reset,
>   };
>   
> +static int nxp_cfg_probe(struct arm_smmu_device *smmu)
> +{
> +	int i, cnt = 0;
> +	u32 smr;
> +
> +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> +
> +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {

I bet this is fun over kexec...

Note that the Qualcomm special case got a bit of a free pass since it 
involves working around a totally broken hypervisor, plus gets to play 
the "nobody sane will run an enterprise distro on their phone" card to 
an extent; I don't think the likes of Layerscape kit get it quite so easy ;)

> +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> +			smmu->smrs[i].valid = true;
> +
> +			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
> +			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
> +			smmu->s2crs[i].cbndx = 0xff;
> +
> +			cnt++;
> +		}
> +	}
> +
> +	dev_notice(smmu->dev, "\tpreserved %d boot mapping%s\n", cnt,
> +		   cnt == 1 ? "" : "s");

That gets you around the initial SMMU reset, but what happens for the 
arbitrarily long period of time between the MC device getting attached 
to a default domain and the MC driver actually probing and (presumably) 
being able to map and reinitialise its firmware?

> +
> +	return 0;
> +}
> +
> +static const struct arm_smmu_impl nxp_impl = {
> +	.cfg_probe = nxp_cfg_probe,
> +};

I believe you're mostly using MMU-500, so you probably don't want to 
simply throw out the relevant errata workarounds.

>   struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   {
> @@ -226,5 +256,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   	if (of_device_is_compatible(np, "marvell,ap806-smmu-500"))
>   		smmu->impl = &mrvl_mmu500_impl;
>   
> +	if (of_property_read_bool(np, "nxp,keep-boot-mappings"))
> +		smmu->impl = &nxp_impl;

Normally you'd get a "what about ACPI?" here, but given the number of 
calls and email threads we've had specifically about trying to make ACPI 
support for these platforms work, that gets upgraded to at least a "WHAT 
ABOUT ACPI!?" :P

But seriously, the case of device firmware in memory being active before 
handover to Linux is *literally* the original reason behind IORT RMRs. 
We already know we need a way to specify the equivalent thing for DT 
systems, such that both can be handled commonly. I really don't want to 
have to support a vendor-specific mechanism for not-even-fully-solving a 
completely generic issue, sorry.

Robin.

> +
>   	return smmu;
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
