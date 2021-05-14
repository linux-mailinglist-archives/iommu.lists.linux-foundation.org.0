Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810E380249
	for <lists.iommu@lfdr.de>; Fri, 14 May 2021 05:10:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C04960613;
	Fri, 14 May 2021 03:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHv9kUYjfepY; Fri, 14 May 2021 03:09:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A4556060C;
	Fri, 14 May 2021 03:09:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EE18C001C;
	Fri, 14 May 2021 03:09:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E1B4C0001
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 03:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 305F260613
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 03:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnlH1u6kOoeg for <iommu@lists.linux-foundation.org>;
 Fri, 14 May 2021 03:09:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FE596060C
 for <iommu@lists.linux-foundation.org>; Fri, 14 May 2021 03:09:52 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhD2z1kWvz1BMP2;
 Fri, 14 May 2021 11:07:07 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 11:09:48 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 11:09:47 +0800
Subject: Re: [PATCH v15 07/12] iommu/smmuv3: Implement cache_invalidate
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <will@kernel.org>,
 <maz@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <alex.williamson@redhat.com>, <tn@semihalf.com>, <zhukeqian1@huawei.com>
References: <20210411111228.14386-1-eric.auger@redhat.com>
 <20210411111228.14386-8-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <e6483bc3-192b-9b68-b3e1-641b1bed4bf6@huawei.com>
Date: Fri, 14 May 2021 11:09:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411111228.14386-8-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, wangxingang5@huawei.com, lushenming@huawei.com,
 wanghaibin.wang@huawei.com, vivek.gautam@arm.com, vsethi@nvidia.com,
 zhangfei.gao@linaro.org
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



On 2021/4/11 19:12, Eric Auger wrote:
> Implement domain-selective, pasid selective and page-selective
> IOTLB invalidations.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v4 -> v15:
> - remove the redundant arm_smmu_cmdq_issue_sync(smmu)
>    in IOMMU_INV_GRANU_ADDR case (Zenghui)
> - if RIL is not supported by the host, make sure the granule_size
>    that is passed by the userspace is supported or fix it
>    (Chenxiang)
>
> v13 -> v14:
> - Add domain invalidation
> - do global inval when asid is not provided with addr
>    granularity
>
> v7 -> v8:
> - ASID based invalidation using iommu_inv_pasid_info
> - check ARCHID/PASID flags in addr based invalidation
> - use __arm_smmu_tlb_inv_context and __arm_smmu_tlb_inv_range_nosync
>
> v6 -> v7
> - check the uapi version
>
> v3 -> v4:
> - adapt to changes in the uapi
> - add support for leaf parameter
> - do not use arm_smmu_tlb_inv_range_nosync or arm_smmu_tlb_inv_context
>    anymore
>
> v2 -> v3:
> - replace __arm_smmu_tlb_sync by arm_smmu_cmdq_issue_sync
>
> v1 -> v2:
> - properly pass the asid
> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 89 +++++++++++++++++++++
>   1 file changed, 89 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 56a301fbe75a..bfc112cc0d38 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2961,6 +2961,94 @@ static void arm_smmu_detach_pasid_table(struct iommu_domain *domain)
>   	mutex_unlock(&smmu_domain->init_mutex);
>   }
>   
> +static int
> +arm_smmu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
> +			  struct iommu_cache_invalidate_info *inv_info)
> +{
> +	struct arm_smmu_cmdq_ent cmd = {.opcode = CMDQ_OP_TLBI_NSNH_ALL};
> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	if (smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
> +		return -EINVAL;
> +
> +	if (!smmu)
> +		return -EINVAL;
> +
> +	if (inv_info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> +		return -EINVAL;
> +
> +	if (inv_info->cache & IOMMU_CACHE_INV_TYPE_PASID ||
> +	    inv_info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB) {
> +		return -ENOENT;
> +	}
> +
> +	if (!(inv_info->cache & IOMMU_CACHE_INV_TYPE_IOTLB))
> +		return -EINVAL;
> +
> +	/* IOTLB invalidation */
> +
> +	switch (inv_info->granularity) {
> +	case IOMMU_INV_GRANU_PASID:
> +	{
> +		struct iommu_inv_pasid_info *info =
> +			&inv_info->granu.pasid_info;
> +
> +		if (info->flags & IOMMU_INV_ADDR_FLAGS_PASID)
> +			return -ENOENT;
> +		if (!(info->flags & IOMMU_INV_PASID_FLAGS_ARCHID))
> +			return -EINVAL;
> +
> +		__arm_smmu_tlb_inv_context(smmu_domain, info->archid);
> +		return 0;
> +	}
> +	case IOMMU_INV_GRANU_ADDR:
> +	{
> +		struct iommu_inv_addr_info *info = &inv_info->granu.addr_info;
> +		size_t granule_size  = info->granule_size;
> +		size_t size = info->nb_granules * info->granule_size;
> +		bool leaf = info->flags & IOMMU_INV_ADDR_FLAGS_LEAF;
> +		int tg;
> +
> +		if (info->flags & IOMMU_INV_ADDR_FLAGS_PASID)
> +			return -ENOENT;
> +
> +		if (!(info->flags & IOMMU_INV_ADDR_FLAGS_ARCHID))
> +			break;
> +
> +		tg = __ffs(granule_size);
> +		if (granule_size & ~(1 << tg))
> +			return -EINVAL;
This check looks like to confirm the granule_size is a power of 2.
Does the granule_size have to be a power of 2?
I think it should also be handled correctly, even if the granule_size is 
not a power of 2.
> +		/*
> +		 * When RIL is not supported, make sure the granule size that is
> +		 * passed is supported. In RIL mode, this is enforced in
> +		 * __arm_smmu_tlb_inv_range()
> +		 */
> +		if (!(smmu->features & ARM_SMMU_FEAT_RANGE_INV) &&
> +		    !(granule_size & smmu_domain->domain.pgsize_bitmap)) {
> +			tg = __ffs(smmu_domain->domain.pgsize_bitmap);
> +			granule_size = 1 << tg;
> +			size = size >> tg;
Why does size need to be shifted tg bits to the right?

Thanks,
Kunkun Jiang
> +		}
> +
> +		arm_smmu_tlb_inv_range_domain(info->addr, size,
> +					      granule_size, leaf,
> +					      info->archid, smmu_domain);
> +		return 0;
> +	}
> +	case IOMMU_INV_GRANU_DOMAIN:
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Global S1 invalidation */
> +	cmd.tlbi.vmid   = smmu_domain->s2_cfg.vmid;
> +	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +	arm_smmu_cmdq_issue_sync(smmu);
> +	return 0;
> +}
> +
>   static bool arm_smmu_dev_has_feature(struct device *dev,
>   				     enum iommu_dev_features feat)
>   {
> @@ -3060,6 +3148,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.put_resv_regions	= generic_iommu_put_resv_regions,
>   	.attach_pasid_table	= arm_smmu_attach_pasid_table,
>   	.detach_pasid_table	= arm_smmu_detach_pasid_table,
> +	.cache_invalidate	= arm_smmu_cache_invalidate,
>   	.dev_has_feat		= arm_smmu_dev_has_feature,
>   	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
>   	.dev_enable_feat	= arm_smmu_dev_enable_feature,


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
