Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1052DB08B
	for <lists.iommu@lfdr.de>; Tue, 15 Dec 2020 16:54:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 756B3204F6;
	Tue, 15 Dec 2020 15:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCflZOVUc-vk; Tue, 15 Dec 2020 15:54:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A1E4C204DC;
	Tue, 15 Dec 2020 15:54:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 846B2C013B;
	Tue, 15 Dec 2020 15:54:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4128CC013B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 38F8084995
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 15:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wt0rsTc96jg for <iommu@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 15:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 41DF1848ED
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 15:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608047651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPEqUf9K/9QpL3MMNAVvudGcFr4JwyB646HzAagpF+Q=;
 b=aS95BRmN62TySJIblZRYPGlFEMwqIDRr1LfzD8/6l1Rng4f4kAE3grU7ee2W2dRN/o8WNm
 qz+De8UqC6WIMZMeTm49+I31qRnWZ00MSaBGxhV9BGmX7gZKyuQjij+DfKBfe40dc336pj
 vUsWQ+whTwKsmC6z5t6q5ff45OcH2WA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-XRpPflBjPsmL5JDWg5sD-Q-1; Tue, 15 Dec 2020 10:54:06 -0500
X-MC-Unique: XRpPflBjPsmL5JDWg5sD-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C2A7192CC41;
 Tue, 15 Dec 2020 15:54:03 +0000 (UTC)
Received: from x1.home (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 917E81962E;
 Tue, 15 Dec 2020 15:54:00 +0000 (UTC)
Date: Tue, 15 Dec 2020 08:53:59 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH 4/7] vfio: iommu_type1: Fix missing dirty page when
 promote pinned_scope
Message-ID: <20201215085359.053e73ed@x1.home>
In-Reply-To: <d2073c05-b6c9-04b4-782c-b89680834633@huawei.com>
References: <20201210073425.25960-1-zhukeqian1@huawei.com>
 <20201210073425.25960-5-zhukeqian1@huawei.com>
 <20201214170459.50cb8729@omen.home>
 <d2073c05-b6c9-04b4-782c-b89680834633@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: jiangkunkun@huawei.com, Andrew Morton <akpm@linux-foundation.org>,
 kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc
 Zyngier <maz@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, iommu@lists.linux-foundation.org,
 Mark Brown <broonie@kernel.org>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com, Thomas
 Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
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

On Tue, 15 Dec 2020 17:37:11 +0800
zhukeqian <zhukeqian1@huawei.com> wrote:

> Hi Alex,
> 
> On 2020/12/15 8:04, Alex Williamson wrote:
> > On Thu, 10 Dec 2020 15:34:22 +0800
> > Keqian Zhu <zhukeqian1@huawei.com> wrote:
> >   
> >> When we pin or detach a group which is not dirty tracking capable,
> >> we will try to promote pinned_scope of vfio_iommu.
> >>
> >> If we succeed to do so, vfio only report pinned_scope as dirty to
> >> userspace next time, but these memory written before pin or detach
> >> is missed.
> >>
> >> The solution is that we must populate all dma range as dirty before
> >> promoting pinned_scope of vfio_iommu.  
> > 
> > Please don't bury fixes patches into a series with other optimizations
> > and semantic changes.  Send it separately.
> >   
> OK, I will.
> 
> >>
> >> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> ---
> >>  drivers/vfio/vfio_iommu_type1.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >> index bd9a94590ebc..00684597b098 100644
> >> --- a/drivers/vfio/vfio_iommu_type1.c
> >> +++ b/drivers/vfio/vfio_iommu_type1.c
> >> @@ -1633,6 +1633,20 @@ static struct vfio_group *vfio_iommu_find_iommu_group(struct vfio_iommu *iommu,
> >>  	return group;
> >>  }
> >>  
> >> +static void vfio_populate_bitmap_all(struct vfio_iommu *iommu)
> >> +{
> >> +	struct rb_node *n;
> >> +	unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
> >> +
> >> +	for (n = rb_first(&iommu->dma_list); n; n = rb_next(n)) {
> >> +		struct vfio_dma *dma = rb_entry(n, struct vfio_dma, node);
> >> +		unsigned long nbits = dma->size >> pgshift;
> >> +
> >> +		if (dma->iommu_mapped)
> >> +			bitmap_set(dma->bitmap, 0, nbits);
> >> +	}
> >> +}  
> > 
> > 
> > If we detach a group which results in only non-IOMMU backed mdevs,
> > don't we also clear dma->iommu_mapped as part of vfio_unmap_unpin()
> > such that this test is invalid?  Thanks,  
> 
> Good spot :-). The code will skip bitmap_set under this situation.
> 
> We should set the bitmap unconditionally when vfio_iommu is promoted,
> as we must have IOMMU backed domain before promoting the vfio_iommu.
> 
> Besides, I think we should also mark dirty in vfio_remove_dma if dirty
> tracking is active. Right?

There's no remaining bitmap to mark dirty if the vfio_dma is removed.
In this case it's the user's responsibility to collect remaining dirty
pages using the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP support in the
VFIO_IOMMU_UNMAP_DMA ioctl.  Thanks,

Alex

> >> +
> >>  static void promote_pinned_page_dirty_scope(struct vfio_iommu *iommu)
> >>  {
> >>  	struct vfio_domain *domain;
> >> @@ -1657,6 +1671,10 @@ static void promote_pinned_page_dirty_scope(struct vfio_iommu *iommu)
> >>  	}
> >>  
> >>  	iommu->pinned_page_dirty_scope = true;
> >> +
> >> +	/* Set all bitmap to avoid missing dirty page */
> >> +	if (iommu->dirty_page_tracking)
> >> +		vfio_populate_bitmap_all(iommu);
> >>  }
> >>  
> >>  static bool vfio_iommu_has_sw_msi(struct list_head *group_resv_regions,  
> > 
> > .
> >   
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
