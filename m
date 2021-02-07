Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D698312356
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 11:02:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3BD31204B0;
	Sun,  7 Feb 2021 10:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkxNZ-kMWi8H; Sun,  7 Feb 2021 10:02:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E40C3204A3;
	Sun,  7 Feb 2021 10:02:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE79BC1DA9;
	Sun,  7 Feb 2021 10:02:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26B2FC013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 10:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 145B387031
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULZMe19dMhjW for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 10:02:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6222286F3A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 10:02:02 +0000 (UTC)
IronPort-SDR: wbLdHMQjXKrck/s8pixic3DXjNtEEnwLilRtXKkA+yb72KdNUd6rgBcqKL/WqSui+xaUVjGlHc
 0lrl0Y6Wt8FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9887"; a="243097227"
X-IronPort-AV: E=Sophos;i="5.81,159,1610438400"; d="scan'208";a="243097227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 02:02:01 -0800
IronPort-SDR: Mp8oKFuCuA6dAZ2YZ/k3bHQSVYlOl31EFoAhZtw2KltKpjEurl1bATYaVs9WFlQSWAC71xuHE6
 2n62yqCcbYLg==
X-IronPort-AV: E=Sophos;i="5.81,159,1610438400"; d="scan'208";a="394665971"
Received: from yisun1-ubuntu.bj.intel.com (HELO yi.y.sun) ([10.238.156.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 07 Feb 2021 02:01:56 -0800
Date: Sun, 7 Feb 2021 17:56:30 +0800
From: Yi Sun <yi.y.sun@linux.intel.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [RFC PATCH 10/11] vfio/iommu_type1: Optimize dirty bitmap
 population based on iommu HWDBM
Message-ID: <20210207095630.GA28580@yi.y.sun>
References: <20210128151742.18840-1-zhukeqian1@huawei.com>
 <20210128151742.18840-11-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128151742.18840-11-zhukeqian1@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
 jiangkunkun@huawei.com, wanghaibin.wang@huawei.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, lushenming@huawei.com,
 iommu@lists.linux-foundation.org, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi,

On 21-01-28 23:17:41, Keqian Zhu wrote:

[...]

> +static void vfio_dma_dirty_log_start(struct vfio_iommu *iommu,
> +				     struct vfio_dma *dma)
> +{
> +	struct vfio_domain *d;
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		/* Go through all domain anyway even if we fail */
> +		iommu_split_block(d->domain, dma->iova, dma->size);
> +	}
> +}

This should be a switch to prepare for dirty log start. Per Intel
Vtd spec, there is SLADE defined in Scalable-Mode PASID Table Entry.
It enables Accessed/Dirty Flags in second-level paging entries.
So, a generic iommu interface here is better. For Intel iommu, it
enables SLADE. For ARM, it splits block.

> +
> +static void vfio_dma_dirty_log_stop(struct vfio_iommu *iommu,
> +				    struct vfio_dma *dma)
> +{
> +	struct vfio_domain *d;
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		/* Go through all domain anyway even if we fail */
> +		iommu_merge_page(d->domain, dma->iova, dma->size,
> +				 d->prot | dma->prot);
> +	}
> +}

Same as above comment, a generic interface is required here.

> +
> +static void vfio_iommu_dirty_log_switch(struct vfio_iommu *iommu, bool start)
> +{
> +	struct rb_node *n;
> +
> +	/* Split and merge even if all iommu don't support HWDBM now */
> +	for (n = rb_first(&iommu->dma_list); n; n = rb_next(n)) {
> +		struct vfio_dma *dma = rb_entry(n, struct vfio_dma, node);
> +
> +		if (!dma->iommu_mapped)
> +			continue;
> +
> +		/* Go through all dma range anyway even if we fail */
> +		if (start)
> +			vfio_dma_dirty_log_start(iommu, dma);
> +		else
> +			vfio_dma_dirty_log_stop(iommu, dma);
> +	}
> +}
> +
>  static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  					unsigned long arg)
>  {
> @@ -2812,8 +2900,10 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  		pgsize = 1 << __ffs(iommu->pgsize_bitmap);
>  		if (!iommu->dirty_page_tracking) {
>  			ret = vfio_dma_bitmap_alloc_all(iommu, pgsize);
> -			if (!ret)
> +			if (!ret) {
>  				iommu->dirty_page_tracking = true;
> +				vfio_iommu_dirty_log_switch(iommu, true);
> +			}
>  		}
>  		mutex_unlock(&iommu->lock);
>  		return ret;
> @@ -2822,6 +2912,7 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  		if (iommu->dirty_page_tracking) {
>  			iommu->dirty_page_tracking = false;
>  			vfio_dma_bitmap_free_all(iommu);
> +			vfio_iommu_dirty_log_switch(iommu, false);
>  		}
>  		mutex_unlock(&iommu->lock);
>  		return 0;
> -- 
> 2.19.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
