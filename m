Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C26231FF9C6
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 18:56:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 734338891A;
	Thu, 18 Jun 2020 16:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Nl7W-qOVnvB; Thu, 18 Jun 2020 16:56:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 608248841A;
	Thu, 18 Jun 2020 16:56:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F9CCC016E;
	Thu, 18 Jun 2020 16:56:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E149BC016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 16:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CFD8B87C9A
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7m7RN2ECzRsU for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 16:56:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EDD1A87C95
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 16:56:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A46731B;
 Thu, 18 Jun 2020 09:56:54 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25A0B3F6CF;
 Thu, 18 Jun 2020 09:56:53 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] iommu: arm-smmu-impl: Use qcom impl for sm8150 and
 sm8250 compatibles
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200609194030.17756-3-jonathan@marek.ca>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8f63f12e-c0fc-04a9-0762-5dbc63b19206@arm.com>
Date: Thu, 18 Jun 2020 17:56:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609194030.17756-3-jonathan@marek.ca>
Content-Language: en-GB
Cc: Will Deacon <will@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
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

On 2020-06-09 20:40, Jonathan Marek wrote:
> Use the qcom implementation for IOMMU hardware on sm8150 and sm8250 SoCs.

Given a promise that anyone who wants to add more of these in future 
converts it into an of_device_id table exported from arm-smmu-qcom,

Reviewed-by Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/iommu/arm-smmu-impl.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index c75b9d957b70..f5f6cab626be 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -172,7 +172,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>   		smmu->impl = &calxeda_impl;
>   
>   	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
> -	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
> +	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
> +	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
>   		return qcom_smmu_impl_init(smmu);
>   
>   	return smmu;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
