Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66725579D
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 11:28:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 14D47884DF;
	Fri, 28 Aug 2020 09:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSxnYWnh2pN0; Fri, 28 Aug 2020 09:28:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A72088531;
	Fri, 28 Aug 2020 09:28:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10481C0051;
	Fri, 28 Aug 2020 09:28:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F617C0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 09:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1D6688531
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 09:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWgTmjjtdSd4 for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 09:28:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C2AEE88499
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 09:28:37 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 33BACF005785721D2BAA;
 Fri, 28 Aug 2020 17:28:34 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 28 Aug 2020 17:28:23 +0800
Subject: Re: [PATCH v7 18/24] iommu/arm-smmu-v3: Add support for Hardware
 Translation Table Update
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 <iommu@lists.linux-foundation.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pci@vger.kernel.org>,
 <linux-mm@kvack.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-19-jean-philippe@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <472fdcf6-f306-60bc-5813-4ad421ee03f2@huawei.com>
Date: Fri, 28 Aug 2020 17:28:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200519175502.2504091-19-jean-philippe@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, will@kernel.org,
 catalin.marinas@arm.com, christian.koenig@amd.com, hch@infradead.org,
 jgg@ziepe.ca, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 felix.kuehling@amd.com
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

On 2020/5/20 1:54, Jean-Philippe Brucker wrote:
> @@ -4454,6 +4470,12 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   			smmu->features |= ARM_SMMU_FEAT_E2H;
>   	}
>   
> +	if (reg & (IDR0_HA | IDR0_HD)) {
> +		smmu->features |= ARM_SMMU_FEAT_HA;
> +		if (reg & IDR0_HD)
> +			smmu->features |= ARM_SMMU_FEAT_HD;
> +	}
> +

nitpick:

As per the IORT spec (DEN0049D, 3.1.1.2 SMMUv3 node, Table 10), the
"HTTU Override" flag of the SMMUv3 node can override the value in
SMMU_IDR0.HTTU. You may want to check this bit before selecting the
{HA,HD} features and shout if there is a mismatch between firmware and
the SMMU implementation. Just like how ARM_SMMU_FEAT_COHERENCY is
selected.


Thanks,
Zenghui
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
