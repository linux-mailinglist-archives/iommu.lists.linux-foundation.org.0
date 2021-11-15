Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38F450562
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 14:27:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038B680DEA;
	Mon, 15 Nov 2021 13:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IVmAfdFyTKC; Mon, 15 Nov 2021 13:27:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 09DA080DE2;
	Mon, 15 Nov 2021 13:27:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0D96C0012;
	Mon, 15 Nov 2021 13:27:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44780C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EC7F403A3
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NujjlA14BGv9 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 13:27:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 611AD400E8
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gFbWnaEtnneFXpm4hKQq3b4yTcblOu4hKmE8Ex8W9zI=; b=2m/s8W8TC+G0NpSZq+mSN4ls+u
 jV9qfuS8az9wfjy2pVWkwDVeiceuojC/T8scEElAX0J7CUDqKb7OfLTCVc13YjjP+ZZnu2isOfMw6
 mwbQbgDvrRCaLOpWBxfmuVGQKPyLp2n8pYtWQReF5cpBHOrUYMqWXH8LSNoVkm9XSjRc2jykB8qms
 viVHUX3JSwg3hvKlBpec892YIh04mRxh9JJpIEgjHyfVGOwgPrweK5Ssq/N4T/hql4goL//Vv82uV
 0xGZgDANBRCCT+IU7KIJYYhZess7GRMfJtJdYSXftYlNOGtc+Mx9gKw3Mn9vttbsipmdHTwkQpWeu
 RxXTtqZQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mmc0y-00FeyR-00; Mon, 15 Nov 2021 13:27:16 +0000
Date: Mon, 15 Nov 2021 05:27:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 06/11] iommu: Expose group variants of dma ownership
 interfaces
Message-ID: <YZJgMzYzuxjJpWIC@infradead.org>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
 <20211115020552.2378167-7-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-7-baolu.lu@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>
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

On Mon, Nov 15, 2021 at 10:05:47AM +0800, Lu Baolu wrote:
> The vfio needs to set DMA_OWNER_USER for the entire group when attaching

The vfio subsystem?  driver?

> it to a vfio container. So expose group variants of setting/releasing dma
> ownership for this purpose.
> 
> This also exposes the helper iommu_group_dma_owner_unclaimed() for vfio
> report to userspace if the group is viable to user assignment, for

.. for vfio to report .. ?

>  void iommu_device_release_dma_owner(struct device *dev, enum iommu_dma_owner owner);
> +int iommu_group_set_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner,
> +			      struct file *user_file);
> +void iommu_group_release_dma_owner(struct iommu_group *group, enum iommu_dma_owner owner);

Pleae avoid all these overly long lines.

> +static inline int iommu_group_set_dma_owner(struct iommu_group *group,
> +					    enum iommu_dma_owner owner,
> +					    struct file *user_file)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline void iommu_group_release_dma_owner(struct iommu_group *group,
> +						 enum iommu_dma_owner owner)
> +{
> +}
> +
> +static inline bool iommu_group_dma_owner_unclaimed(struct iommu_group *group)
> +{
> +	return false;
> +}

Why do we need these stubs?  All potential callers should already
require CONFIG_IOMMU_API?  Same for the helpers added in patch 1, btw.

> +	mutex_lock(&group->mutex);
> +	ret = __iommu_group_set_dma_owner(group, owner, user_file);
> +	mutex_unlock(&group->mutex);

> +	mutex_lock(&group->mutex);
> +	__iommu_group_release_dma_owner(group, owner);
> +	mutex_unlock(&group->mutex);

Unless I'm missing something (just skipping over the patches),
the existing callers also take the lock just around these calls,
so we don't really need the __-prefixed lowlevel helpers.

> +	mutex_lock(&group->mutex);
> +	owner = group->dma_owner;
> +	mutex_unlock(&group->mutex);

No need for a lock to read a single scalar.

> +
> +	return owner == DMA_OWNER_NONE;
> +}
> +EXPORT_SYMBOL_GPL(iommu_group_dma_owner_unclaimed);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
