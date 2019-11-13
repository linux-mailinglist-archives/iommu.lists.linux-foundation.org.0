Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A435FB5E6
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 18:05:52 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3AC73E27;
	Wed, 13 Nov 2019 17:05:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4E2B4DF2
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 17:05:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 98E02102
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 17:05:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4333C30E;
	Wed, 13 Nov 2019 09:05:46 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353E13F534;
	Wed, 13 Nov 2019 09:05:45 -0800 (PST)
Subject: Re: [PATCH] iommu/arm-smmu-v3: Populate VMID field for
	CMDQ_OP_TLBI_NH_VA
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, will@kernel.org
References: <20191113161138.22336-1-shameerali.kolothum.thodi@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e91b2c6e-ab0a-5908-bcd3-e62c5b7b536a@arm.com>
Date: Wed, 13 Nov 2019 17:05:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113161138.22336-1-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 13/11/2019 4:11 pm, Shameer Kolothum wrote:
> CMDQ_OP_TLBI_NH_VA requires VMID and this was missing since
> commit 1c27df1c0a82 ("iommu/arm-smmu: Use correct address mask
> for CMD_TLBI_S2_IPA"). Add it back.

Whoops indeed... although we do currently issue S1 invalidations with 
the VMID hardcoded to 0, so nothing's actually broken as things stand.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 1c27df1c0a82 ("iommu/arm-smmu: Use correct address mask for CMD_TLBI_S2_IPA")
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> This came to light while verifying the "SMMUv3 Nested Stage Setup"
> series by Eric. Please find the discusiion here,
> https://lore.kernel.org/patchwork/cover/1099617/
> ---
>   drivers/iommu/arm-smmu-v3.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 8da93e730d6f..9b5274346df0 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -856,6 +856,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>   		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>   		break;
>   	case CMDQ_OP_TLBI_NH_VA:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>   		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>   		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
>   		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
