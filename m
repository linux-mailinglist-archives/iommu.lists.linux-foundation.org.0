Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C472830BDB9
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 13:08:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73C4F86E1A;
	Tue,  2 Feb 2021 12:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clhfWT1orb-Q; Tue,  2 Feb 2021 12:08:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68B9A86DF0;
	Tue,  2 Feb 2021 12:08:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5093CC013A;
	Tue,  2 Feb 2021 12:08:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4EF1C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B36A8851AA
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY245aYNa3Rw for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 12:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1872C8506A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 12:08:50 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DVNq54Kjjz7YvC;
 Tue,  2 Feb 2021 20:07:29 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 20:08:46 +0800
Subject: Re: [PATCH v11 03/13] vfio: VFIO_IOMMU_SET_MSI_BINDING
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <will@kernel.org>,
 <joro@8bytes.org>, <maz@kernel.org>, <robin.murphy@arm.com>,
 <alex.williamson@redhat.com>
References: <20201116110030.32335-1-eric.auger@redhat.com>
 <20201116110030.32335-4-eric.auger@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <635db234-33ff-c079-40cb-2de00c089e7c@huawei.com>
Date: Tue, 2 Feb 2021 20:08:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201116110030.32335-4-eric.auger@redhat.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

Hi Eric,

On 2020/11/16 19:00, Eric Auger wrote:
> This patch adds the VFIO_IOMMU_SET_MSI_BINDING ioctl which aim
> to (un)register the guest MSI binding to the host. This latter
> then can use those stage 1 bindings to build a nested stage
> binding targeting the physical MSIs.
[...]

> +static int vfio_iommu_type1_set_msi_binding(struct vfio_iommu *iommu,
> +					    unsigned long arg)
> +{
> +	struct vfio_iommu_type1_set_msi_binding msi_binding;
> +	unsigned long minsz;
> +	int ret = -EINVAL;
> +
> +	minsz = offsetofend(struct vfio_iommu_type1_set_msi_binding,
> +			    size);
> +
> +	if (copy_from_user(&msi_binding, (void __user *)arg, minsz))
> +		return -EFAULT;
> +
> +	if (msi_binding.argsz < minsz)
> +		return -EINVAL;
We can check BIND and UNBIND are not set simultaneously, just like VFIO_IOMMU_SET_PASID_TABLE.

> +
> +	if (msi_binding.flags == VFIO_IOMMU_UNBIND_MSI) {
> +		vfio_unbind_msi(iommu, msi_binding.iova);
> +		ret = 0;
> +	} else if (msi_binding.flags == VFIO_IOMMU_BIND_MSI) {
> +		ret = vfio_bind_msi(iommu, msi_binding.iova,
> +				    msi_binding.gpa, msi_binding.size);
> +	}
> +	return ret;
> +}
> +

Thanks,
Keqian
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
