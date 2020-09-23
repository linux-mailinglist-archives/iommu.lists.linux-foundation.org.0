Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D027571C
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 13:28:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED49B8614E;
	Wed, 23 Sep 2020 11:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id El-jhyeONKPD; Wed, 23 Sep 2020 11:28:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BE7886151;
	Wed, 23 Sep 2020 11:28:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 478C2C0051;
	Wed, 23 Sep 2020 11:28:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0F4C0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 11:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 38A0F868C3
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 11:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5t0gWnx5IcG6 for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 11:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BB6AD868C2
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 11:27:59 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E9297626864E5F774AE4;
 Wed, 23 Sep 2020 19:27:55 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 19:27:47 +0800
Subject: Re: [PATCH v10 01/11] vfio: VFIO_IOMMU_SET_PASID_TABLE
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <joro@8bytes.org>,
 <alex.williamson@redhat.com>, <jacob.jun.pan@linux.intel.com>,
 <yi.l.liu@intel.com>, <robin.murphy@arm.com>
References: <20200320161911.27494-1-eric.auger@redhat.com>
 <20200320161911.27494-2-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <2fba23af-9cd7-147d-6202-01c13fff92e5@huawei.com>
Date: Wed, 23 Sep 2020 19:27:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200320161911.27494-2-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
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

Hi Eric,

On 2020/3/21 0:19, Eric Auger wrote:
> From: "Liu, Yi L" <yi.l.liu@linux.intel.com>
> 
> This patch adds an VFIO_IOMMU_SET_PASID_TABLE ioctl
> which aims to pass the virtual iommu guest configuration
> to the host. This latter takes the form of the so-called
> PASID table.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index a177bf2c6683..bfacbd876ee1 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2172,6 +2172,43 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
>   	return ret;
>   }
>   
> +static void
> +vfio_detach_pasid_table(struct vfio_iommu *iommu)
> +{
> +	struct vfio_domain *d;
> +
> +	mutex_lock(&iommu->lock);
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		iommu_detach_pasid_table(d->domain);
> +	}
> +	mutex_unlock(&iommu->lock);
> +}
> +
> +static int
> +vfio_attach_pasid_table(struct vfio_iommu *iommu,
> +			struct vfio_iommu_type1_set_pasid_table *ustruct)
> +{
> +	struct vfio_domain *d;
> +	int ret = 0;
> +
> +	mutex_lock(&iommu->lock);
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		ret = iommu_attach_pasid_table(d->domain, &ustruct->config);
> +		if (ret)
> +			goto unwind;
> +	}
> +	goto unlock;
> +unwind:
> +	list_for_each_entry_continue_reverse(d, &iommu->domain_list, next) {
> +		iommu_detach_pasid_table(d->domain);
> +	}
> +unlock:
> +	mutex_unlock(&iommu->lock);
> +	return ret;
> +}
> +
>   static long vfio_iommu_type1_ioctl(void *iommu_data,
>   				   unsigned int cmd, unsigned long arg)
>   {
> @@ -2276,6 +2313,25 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>   
>   		return copy_to_user((void __user *)arg, &unmap, minsz) ?
>   			-EFAULT : 0;
> +	} else if (cmd == VFIO_IOMMU_SET_PASID_TABLE) {
> +		struct vfio_iommu_type1_set_pasid_table ustruct;
> +
> +		minsz = offsetofend(struct vfio_iommu_type1_set_pasid_table,
> +				    config);
> +
> +		if (copy_from_user(&ustruct, (void __user *)arg, minsz))
> +			return -EFAULT;
> +
> +		if (ustruct.argsz < minsz)
> +			return -EINVAL;
> +
> +		if (ustruct.flags & VFIO_PASID_TABLE_FLAG_SET)
> +			return vfio_attach_pasid_table(iommu, &ustruct);
> +		else if (ustruct.flags & VFIO_PASID_TABLE_FLAG_UNSET) {
> +			vfio_detach_pasid_table(iommu);
> +			return 0;
> +		} else
> +			return -EINVAL;

Nit:

What if user-space blindly set both flags? Should we check that only one
flag is allowed to be set at this stage, and return error otherwise?

Besides, before going through the whole series [1][2], I'd like to know
if this is the latest version of your Nested-Stage-Setup work in case I
had missed something.

[1] https://lore.kernel.org/r/20200320161911.27494-1-eric.auger@redhat.com
[2] https://lore.kernel.org/r/20200414150607.28488-1-eric.auger@redhat.com


Thanks,
Zenghui
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
