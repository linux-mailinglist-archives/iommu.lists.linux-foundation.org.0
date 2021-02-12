Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55931A45D
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 19:14:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 978B586C0C;
	Fri, 12 Feb 2021 18:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs2NxXV6PCA4; Fri, 12 Feb 2021 18:14:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15FF586C7C;
	Fri, 12 Feb 2021 18:14:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03373C013A;
	Fri, 12 Feb 2021 18:14:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7AD5C013A
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 18:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D494A87069
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 18:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNcCNXzwt8Nc for <iommu@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 18:14:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C341B8705B
 for <iommu@lists.linux-foundation.org>; Fri, 12 Feb 2021 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613153642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=32Qew6ZRkFn3RJSdCrHnp0CkF1vkLaufQL3nfF97ujg=;
 b=LxR6DL8xGLqDqOq0Lrm0z9+jzVnLX9v8lGHo6DDf17KEVpOLBYn/r7QmhmHYMKSkHJVMGI
 f74SiM6q+ZosrGR5KzOwAL9ENfqMX8OXJcE3mTyntgcpvwdU6HWBts4UBsuL1xxVFepmpE
 5WUjH+sgro9IfkDPwPU3pk3yrYWUWE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-yMGge4DRPlaPVRnHfXJOJw-1; Fri, 12 Feb 2021 13:13:58 -0500
X-MC-Unique: yMGge4DRPlaPVRnHfXJOJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29E18835E20;
 Fri, 12 Feb 2021 18:13:56 +0000 (UTC)
Received: from [10.36.114.34] (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F259E6E419;
 Fri, 12 Feb 2021 18:13:44 +0000 (UTC)
Subject: Re: [PATCH 2/2] iommu: arm-smmu-v3: Report domain nesting info
 reuqired for stage1
To: Vivek Gautam <vivek.gautam@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org
References: <20210212105859.8445-1-vivek.gautam@arm.com>
 <20210212105859.8445-3-vivek.gautam@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0708b0b2-78f7-e55c-21a7-3c49eb5141df@redhat.com>
Date: Fri, 12 Feb 2021 19:13:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210212105859.8445-3-vivek.gautam@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 will.deacon@arm.com, alex.williamson@redhat.com, robin.murphy@arm.com
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

Hi Vivek,

On 2/12/21 11:58 AM, Vivek Gautam wrote:
> Update nested domain information required for stage1 page table.

s/reuqired/required in the commit title
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index c11dd3940583..728018921fae 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2555,6 +2555,7 @@ static int arm_smmu_domain_nesting_info(struct arm_smmu_domain *smmu_domain,
>  					void *data)
>  {
>  	struct iommu_nesting_info *info = (struct iommu_nesting_info *)data;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	unsigned int size;
>  
>  	if (!info || smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
> @@ -2571,9 +2572,20 @@ static int arm_smmu_domain_nesting_info(struct arm_smmu_domain *smmu_domain,
>  		return 0;
>  	}
>  
> -	/* report an empty iommu_nesting_info for now */
> -	memset(info, 0x0, size);
> +	/* Update the nesting info as required for stage1 page tables */
> +	info->addr_width = smmu->ias;
> +	info->format = IOMMU_PASID_FORMAT_ARM_SMMU_V3;
> +	info->features = IOMMU_NESTING_FEAT_BIND_PGTBL |
I understood IOMMU_NESTING_FEAT_BIND_PGTBL advertises the requirement to
bind tables per PASID, ie. passing iommu_gpasid_bind_data.
In ARM case I guess you plan to use attach/detach_pasid_table API with
iommu_pasid_table_config struct. So I understood we should add a new
feature here.
> +			 IOMMU_NESTING_FEAT_PAGE_RESP |
> +			 IOMMU_NESTING_FEAT_CACHE_INVLD;
> +	info->pasid_bits = smmu->ssid_bits;
> +	info->vendor.smmuv3.asid_bits = smmu->asid_bits;
> +	info->vendor.smmuv3.pgtbl_fmt = ARM_64_LPAE_S1;
> +	memset(&info->padding, 0x0, 12);
> +	memset(&info->vendor.smmuv3.padding, 0x0, 9);
> +
>  	info->argsz = size;
> +
spurious new line
>  	return 0;
>  }
>  
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
