Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272D38F565
	for <lists.iommu@lfdr.de>; Tue, 25 May 2021 00:11:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C5AE403DF;
	Mon, 24 May 2021 22:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPIN_lI2rBhn; Mon, 24 May 2021 22:11:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E159403DD;
	Mon, 24 May 2021 22:11:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FDF4C0024;
	Mon, 24 May 2021 22:11:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1198C0001
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 22:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1FF0403DD
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkYcfBk5YrXr for <iommu@lists.linux-foundation.org>;
 Mon, 24 May 2021 22:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 760A1400F3
 for <iommu@lists.linux-foundation.org>; Mon, 24 May 2021 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621894299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8N4a4sR/ZZ+d0ZXMR2fsZf/7WdgnIcboilxPxwn9wk=;
 b=HfU2Z4nAsS+VlnTDAK64FKwGJUPzJFRreT0e5Lh9uEGcw6HD0QHyaORCyHX4Y6DiB+GQn7
 11A2CzBbv0ynYokeqULVxssnmKNPmiwH/sr6V3fl2iWEIHEa5/WC/2FbZIiYeOlSUI7zL9
 rwJYILSstVoe/QbK9zfwh1IkJ1lkLAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-gqspFXgqMq2ZjzhsNVaoHQ-1; Mon, 24 May 2021 18:11:35 -0400
X-MC-Unique: gqspFXgqMq2ZjzhsNVaoHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E40B1005D50;
 Mon, 24 May 2021 22:11:33 +0000 (UTC)
Received: from x1.home.shazbot.org (ovpn-113-225.phx2.redhat.com
 [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0548F5D71D;
 Mon, 24 May 2021 22:11:29 +0000 (UTC)
Date: Mon, 24 May 2021 16:11:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v3 8/8] vfio: Add nested IOPF support
Message-ID: <20210524161129.085503ad@x1.home.shazbot.org>
In-Reply-To: <83747758-ceb6-b498-8d95-609fdd0d763b@huawei.com>
References: <20210409034420.1799-1-lushenming@huawei.com>
 <20210409034420.1799-9-lushenming@huawei.com>
 <20210518125808.345b812c.alex.williamson@redhat.com>
 <ea8c92a8-6e51-8be6-de19-d5e6f1d5527f@huawei.com>
 <83747758-ceb6-b498-8d95-609fdd0d763b@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, linux-api@vger.kernel.org,
 wanghaibin.wang@huawei.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 24 May 2021 21:11:11 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On 2021/5/21 15:59, Shenming Lu wrote:
> > On 2021/5/19 2:58, Alex Williamson wrote:  
> >> On Fri, 9 Apr 2021 11:44:20 +0800
> >> Shenming Lu <lushenming@huawei.com> wrote:
> >>  
> >>> To set up nested mode, drivers such as vfio_pci need to register a
> >>> handler to receive stage/level 1 faults from the IOMMU, but since
> >>> currently each device can only have one iommu dev fault handler,
> >>> and if stage 2 IOPF is already enabled (VFIO_IOMMU_ENABLE_IOPF),
> >>> we choose to update the registered handler (a consolidated one) via
> >>> flags (set FAULT_REPORT_NESTED_L1), and further deliver the received
> >>> stage 1 faults in the handler to the guest through a newly added
> >>> vfio_device_ops callback.  
> >>
> >> Are there proposed in-kernel drivers that would use any of these
> >> symbols?  
> > 
> > I hope that such as Eric's SMMUv3 Nested Stage Setup series [1] can
> > use these symbols to consolidate the two page fault handlers into one.
> > 
> > [1] https://patchwork.kernel.org/project/kvm/cover/20210411114659.15051-1-eric.auger@redhat.com/
> >   
> >>  
> >>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> >>> ---
> >>>  drivers/vfio/vfio.c             | 81 +++++++++++++++++++++++++++++++++
> >>>  drivers/vfio/vfio_iommu_type1.c | 49 +++++++++++++++++++-
> >>>  include/linux/vfio.h            | 12 +++++
> >>>  3 files changed, 141 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> >>> index 44c8dfabf7de..4245f15914bf 100644
> >>> --- a/drivers/vfio/vfio.c
> >>> +++ b/drivers/vfio/vfio.c
> >>> @@ -2356,6 +2356,87 @@ struct iommu_domain *vfio_group_iommu_domain(struct vfio_group *group)
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(vfio_group_iommu_domain);
> >>>  
> >>> +/*
> >>> + * Register/Update the VFIO IOPF handler to receive
> >>> + * nested stage/level 1 faults.
> >>> + */
> >>> +int vfio_iommu_dev_fault_handler_register_nested(struct device *dev)
> >>> +{
> >>> +	struct vfio_container *container;
> >>> +	struct vfio_group *group;
> >>> +	struct vfio_iommu_driver *driver;
> >>> +	int ret;
> >>> +
> >>> +	if (!dev)
> >>> +		return -EINVAL;
> >>> +
> >>> +	group = vfio_group_get_from_dev(dev);
> >>> +	if (!group)
> >>> +		return -ENODEV;
> >>> +
> >>> +	ret = vfio_group_add_container_user(group);
> >>> +	if (ret)
> >>> +		goto out;
> >>> +
> >>> +	container = group->container;
> >>> +	driver = container->iommu_driver;
> >>> +	if (likely(driver && driver->ops->register_handler))
> >>> +		ret = driver->ops->register_handler(container->iommu_data, dev);
> >>> +	else
> >>> +		ret = -ENOTTY;
> >>> +
> >>> +	vfio_group_try_dissolve_container(group);
> >>> +
> >>> +out:
> >>> +	vfio_group_put(group);
> >>> +	return ret;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(vfio_iommu_dev_fault_handler_register_nested);
> >>> +
> >>> +int vfio_iommu_dev_fault_handler_unregister_nested(struct device *dev)
> >>> +{
> >>> +	struct vfio_container *container;
> >>> +	struct vfio_group *group;
> >>> +	struct vfio_iommu_driver *driver;
> >>> +	int ret;
> >>> +
> >>> +	if (!dev)
> >>> +		return -EINVAL;
> >>> +
> >>> +	group = vfio_group_get_from_dev(dev);
> >>> +	if (!group)
> >>> +		return -ENODEV;
> >>> +
> >>> +	ret = vfio_group_add_container_user(group);
> >>> +	if (ret)
> >>> +		goto out;
> >>> +
> >>> +	container = group->container;
> >>> +	driver = container->iommu_driver;
> >>> +	if (likely(driver && driver->ops->unregister_handler))
> >>> +		ret = driver->ops->unregister_handler(container->iommu_data, dev);
> >>> +	else
> >>> +		ret = -ENOTTY;
> >>> +
> >>> +	vfio_group_try_dissolve_container(group);
> >>> +
> >>> +out:
> >>> +	vfio_group_put(group);
> >>> +	return ret;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(vfio_iommu_dev_fault_handler_unregister_nested);
> >>> +
> >>> +int vfio_transfer_iommu_fault(struct device *dev, struct iommu_fault *fault)
> >>> +{
> >>> +	struct vfio_device *device = dev_get_drvdata(dev);
> >>> +
> >>> +	if (unlikely(!device->ops->transfer))
> >>> +		return -EOPNOTSUPP;
> >>> +
> >>> +	return device->ops->transfer(device->device_data, fault);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(vfio_transfer_iommu_fault);
> >>> +
> >>>  /**
> >>>   * Module/class support
> >>>   */
> >>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >>> index ba2b5a1cf6e9..9d1adeddb303 100644
> >>> --- a/drivers/vfio/vfio_iommu_type1.c
> >>> +++ b/drivers/vfio/vfio_iommu_type1.c
> >>> @@ -3821,13 +3821,32 @@ static int vfio_iommu_type1_dma_map_iopf(struct iommu_fault *fault, void *data)
> >>>  	struct vfio_batch batch;
> >>>  	struct vfio_range *range;
> >>>  	dma_addr_t iova = ALIGN_DOWN(fault->prm.addr, PAGE_SIZE);
> >>> -	int access_flags = 0;
> >>> +	int access_flags = 0, nested;
> >>>  	size_t premap_len, map_len, mapped_len = 0;
> >>>  	unsigned long bit_offset, vaddr, pfn, i, npages;
> >>>  	int ret;
> >>>  	enum iommu_page_response_code status = IOMMU_PAGE_RESP_INVALID;
> >>>  	struct iommu_page_response resp = {0};
> >>>  
> >>> +	if (vfio_dev_domian_nested(dev, &nested))
> >>> +		return -ENODEV;
> >>> +
> >>> +	/*
> >>> +	 * When configured in nested mode, further deliver the
> >>> +	 * stage/level 1 faults to the guest.
> >>> +	 */
> >>> +	if (nested) {
> >>> +		bool l2;
> >>> +
> >>> +		if (fault->type == IOMMU_FAULT_PAGE_REQ)
> >>> +			l2 = fault->prm.flags & IOMMU_FAULT_PAGE_REQUEST_L2;
> >>> +		if (fault->type == IOMMU_FAULT_DMA_UNRECOV)
> >>> +			l2 = fault->event.flags & IOMMU_FAULT_UNRECOV_L2;
> >>> +
> >>> +		if (!l2)
> >>> +			return vfio_transfer_iommu_fault(dev, fault);
> >>> +	}
> >>> +
> >>>  	if (fault->type != IOMMU_FAULT_PAGE_REQ)
> >>>  		return -EOPNOTSUPP;
> >>>  
> >>> @@ -4201,6 +4220,32 @@ static void vfio_iommu_type1_notify(void *iommu_data,
> >>>  	wake_up_all(&iommu->vaddr_wait);
> >>>  }
> >>>  
> >>> +static int vfio_iommu_type1_register_handler(void *iommu_data,
> >>> +					     struct device *dev)
> >>> +{
> >>> +	struct vfio_iommu *iommu = iommu_data;
> >>> +
> >>> +	if (iommu->iopf_enabled)
> >>> +		return iommu_update_device_fault_handler(dev, ~0,
> >>> +						FAULT_REPORT_NESTED_L1);
> >>> +	else
> >>> +		return iommu_register_device_fault_handler(dev,
> >>> +						vfio_iommu_type1_dma_map_iopf,
> >>> +						FAULT_REPORT_NESTED_L1, dev);
> >>> +}
> >>> +
> >>> +static int vfio_iommu_type1_unregister_handler(void *iommu_data,
> >>> +					       struct device *dev)
> >>> +{
> >>> +	struct vfio_iommu *iommu = iommu_data;
> >>> +
> >>> +	if (iommu->iopf_enabled)
> >>> +		return iommu_update_device_fault_handler(dev,
> >>> +						~FAULT_REPORT_NESTED_L1, 0);
> >>> +	else
> >>> +		return iommu_unregister_device_fault_handler(dev);
> >>> +}  
> >>
> >>
> >> The path through vfio to register this is pretty ugly, but I don't see
> >> any reason for the the update interfaces here, the previously
> >> registered handler just changes its behavior.  
> > 
> > Yeah, this seems not an elegant way...
> > 
> > If IOPF(L2) enabled, the fault handler has already been registered, so for
> > nested mode setup, we only need to change the flags of the handler in the
> > IOMMU driver to receive L1 faults.
> > (assume that L1 IOPF is configured after L2 IOPF)
> > 
> > Currently each device can only have one iommu dev fault handler, and L1
> > and L2 IOPF are configured separately in nested mode, I am also wondering
> > that is there a better solution for this.  

I haven't fully read all the references, but who imposes the fact that
there's only one fault handler per device?  If type1 could register one
handler and the vfio-pci bus driver another for the other level, would
we need this path through vfio-core?

> Let me simply add, maybe there is another way for this:
> Would it be better to set host IOPF enabled (L2 faults) in the VFIO_IOMMU_MAP_DMA
> ioctl (no need to add a new ioctl, and we can specify whether this mapping is IOPF
> available or statically pinned), and set guest IOPF enabled (L1 faults) in the
> VFIO_IOMMU_SET_PASID_TABLE (from Eric's series) ioctl?
> And we have no requirement for the sequence of these two ioctls. The first called
> one will register the handler, and the later one will just update the handler...

This is looking more and more like it belongs with the IOASID work.  I
think Eric has shifted his focus there too.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
