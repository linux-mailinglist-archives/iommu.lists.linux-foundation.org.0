Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7C13A16B7
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 16:12:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AD1183CDD;
	Wed,  9 Jun 2021 14:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-ovc33lfjCW; Wed,  9 Jun 2021 14:12:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8937583CDB;
	Wed,  9 Jun 2021 14:12:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 597B3C000B;
	Wed,  9 Jun 2021 14:12:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9BFCBC000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 14:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 758084013C
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 14:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQV_ANF_9Jqq for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 14:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A9540137
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 14:12:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1121D6E;
 Wed,  9 Jun 2021 07:12:18 -0700 (PDT)
Received: from [10.57.6.115] (unknown [10.57.6.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D19A03F73D;
 Wed,  9 Jun 2021 07:12:16 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu: Fix arm_smmu_device refcount leak when
 arm_smmu_rpm_get fails
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
References: <1623245709-11123-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e5b8d7f6-862e-bca4-a1e9-35e0de47440e@arm.com>
Date: Wed, 9 Jun 2021 15:12:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623245709-11123-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Language: en-GB
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn
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

On 2021-06-09 14:35, Xiyu Yang wrote:
> arm_smmu_rpm_get() invokes pm_runtime_get_sync(), which increases the
> refcount of the "smmu" even though the return value is less than 0.
> 
> The reference counting issue happens in some error handling paths of
> arm_smmu_rpm_get() in its caller functions. When arm_smmu_rpm_get()
> fails, the caller functions forget to decrease the refcount of "smmu"
> increased by arm_smmu_rpm_get(), causing a refcount leak.
> 
> Fix this issue by calling arm_smmu_rpm_put() or jumping to the "rpm_put"
> label when arm_smmu_rpm_get() fails.

If only there was some kind of helper function which could encapsulate 
the correct expected behaviour in a single place...

In fact with the new pm_runtime_resume_and_get() API I think these two 
patches boil down to a one-line change.

Thanks,
Robin.

> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..177ee54c5534 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -840,7 +840,7 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
>   
>   	ret = arm_smmu_rpm_get(smmu);
>   	if (ret < 0)
> -		return;
> +		goto rpm_put;
>   
>   	/*
>   	 * Disable the context bank and free the page tables before freeing
> @@ -857,6 +857,7 @@ static void arm_smmu_destroy_domain_context(struct iommu_domain *domain)
>   	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
>   	__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
>   
> +rpm_put:
>   	arm_smmu_rpm_put(smmu);
>   }
>   
> @@ -1153,7 +1154,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   
>   	ret = arm_smmu_rpm_get(smmu);
>   	if (ret < 0)
> -		return ret;
> +		goto rpm_put;
>   
>   	/* Ensure that the domain is finalised */
>   	ret = arm_smmu_init_domain_context(domain, smmu, dev);
> @@ -1404,7 +1405,7 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>   
>   	ret = arm_smmu_rpm_get(smmu);
>   	if (ret < 0)
> -		goto out_cfg_free;
> +		goto rpm_put;
>   
>   	ret = arm_smmu_master_alloc_smes(dev);
>   	arm_smmu_rpm_put(smmu);
> @@ -1417,6 +1418,8 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>   
>   	return &smmu->iommu;
>   
> +rpm_put:
> +	arm_smmu_rpm_put(smmu);
>   out_cfg_free:
>   	kfree(cfg);
>   out_free:
> @@ -1438,8 +1441,10 @@ static void arm_smmu_release_device(struct device *dev)
>   	smmu = cfg->smmu;
>   
>   	ret = arm_smmu_rpm_get(smmu);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		arm_smmu_rpm_put(smmu);
>   		return;
> +	}
>   
>   	arm_smmu_master_free_smes(cfg, fwspec);
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
