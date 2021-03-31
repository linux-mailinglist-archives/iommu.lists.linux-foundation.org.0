Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4987934E429
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 11:18:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6BD640148;
	Tue, 30 Mar 2021 09:18:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEFWVyIUev5U; Tue, 30 Mar 2021 09:18:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3763401D5;
	Tue, 30 Mar 2021 09:18:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBAECC0011;
	Tue, 30 Mar 2021 09:18:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6E05C000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 09:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B595440407
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 09:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxLzCH5P8cgE for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 09:18:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 673EA403FE
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 09:18:11 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F8kMt0wnMzqSNJ;
 Tue, 30 Mar 2021 17:16:26 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 17:17:59 +0800
Subject: Re: [PATCH v14 06/13] iommu/smmuv3: Allow stage 1 invalidation with
 unmanaged ASIDs
To: Eric Auger <eric.auger@redhat.com>
References: <20210223205634.604221-1-eric.auger@redhat.com>
 <20210223205634.604221-7-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <7a270196-2a8d-1b23-ee5f-f977c53d2134@huawei.com>
Date: Tue, 30 Mar 2021 17:17:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210223205634.604221-7-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Cc: kvm@vger.kernel.org, vivek.gautam@arm.com, kvmarm@lists.cs.columbia.edu,
 eric.auger.pro@gmail.com, jean-philippe@linaro.org, wangxingang5@huawei.com,
 maz@kernel.org, jiangkunkun@huawei.com, vsethi@nvidia.com,
 zhangfei.gao@linaro.org, will@kernel.org, alex.williamson@redhat.com,
 wanghaibin.wang@huawei.com, linux-kernel@vger.kernel.org,
 lushenming@huawei.com, iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On 2021/2/24 4:56, Eric Auger wrote:
> @@ -1936,7 +1950,12 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
>   		},
>   	};
>   
> -	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> +	if (ext_asid >= 0) {  /* guest stage 1 invalidation */
> +		cmd.opcode	= smmu_domain->smmu->features & ARM_SMMU_FEAT_E2H ?
> +				  CMDQ_OP_TLBI_EL2_VA : CMDQ_OP_TLBI_NH_VA;

If I understand it correctly, the true nested mode effectively gives us
a *NS-EL1* StreamWorld. We should therefore use CMDQ_OP_TLBI_NH_VA to
invalidate the stage-1 NS-EL1 entries, no matter E2H is selected or not.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
