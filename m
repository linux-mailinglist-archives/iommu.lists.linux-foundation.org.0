Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E86410404C
	for <lists.iommu@lfdr.de>; Wed, 20 Nov 2019 17:07:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FCBB86D6F;
	Wed, 20 Nov 2019 16:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TI8ShYETzgeb; Wed, 20 Nov 2019 16:07:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16DF986D8B;
	Wed, 20 Nov 2019 16:07:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 040C9C1DDC;
	Wed, 20 Nov 2019 16:07:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C34B5C1DC9
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 16:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C017887ACE
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoofsolPI7w8 for <iommu@lists.linux-foundation.org>;
 Wed, 20 Nov 2019 16:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A40387A74
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 16:07:17 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8019B20674;
 Wed, 20 Nov 2019 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574266037;
 bh=JqtM3uieK4F0AT1KOQl+ms5JG2OW35LEmqi8mfgeS28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IdN+TGHv8cjFuVQV2V+NWGv5035/01gZw8/X/NiN/YfSKsHhl/sH+J896AiOfEmRv
 CwcngduCPLQ7Mr5M966I+uIwfPJPOIZKoZU/BcQHt+VVUeAMLIhuwIS+0L3sjbzid+
 WhOiVNmkpTRFefgOsN5CMmtmURo3D/cH/QDQXyFU=
Date: Wed, 20 Nov 2019 16:07:12 +0000
From: Will Deacon <will@kernel.org>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Populate VMID field for
 CMDQ_OP_TLBI_NH_VA
Message-ID: <20191120160711.GA31165@willie-the-truck>
References: <20191113161138.22336-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113161138.22336-1-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Nov 13, 2019 at 04:11:38PM +0000, Shameer Kolothum wrote:
> CMDQ_OP_TLBI_NH_VA requires VMID and this was missing since
> commit 1c27df1c0a82 ("iommu/arm-smmu: Use correct address mask
> for CMD_TLBI_S2_IPA"). Add it back.
> 
> Fixes: 1c27df1c0a82 ("iommu/arm-smmu: Use correct address mask for CMD_TLBI_S2_IPA")
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> This came to light while verifying the "SMMUv3 Nested Stage Setup"
> series by Eric. Please find the discusiion here,
> https://lore.kernel.org/patchwork/cover/1099617/
> ---
>  drivers/iommu/arm-smmu-v3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index 8da93e730d6f..9b5274346df0 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -856,6 +856,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>  		break;
>  	case CMDQ_OP_TLBI_NH_VA:
> +		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
>  		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;

Thanks. I don't think this matters with the way things currently work (we
only have VMID 0 for stage-1 domains), so I'll queue it for 5.6.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
