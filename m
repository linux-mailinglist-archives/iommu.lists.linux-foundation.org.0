Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 66473388024
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 20:59:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA8E406B8;
	Tue, 18 May 2021 18:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBKm4rTTFpAB; Tue, 18 May 2021 18:59:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A6D5406B1;
	Tue, 18 May 2021 18:59:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4114C000E;
	Tue, 18 May 2021 18:59:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 409FDC0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B1D40318
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szJIU6ywUz2S for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 18:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE08840271
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621364344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3I+sRgsUz3jPt3eJWkIzspXHxTfKP9apTdFMbo1EQ4=;
 b=icgoURgnSBWwiOXp6CwouVzvc6PRid4H2vTXY9hMBUhZkLQmh7bAI5vHLnzK7WOAmclQ3o
 Ny/Zzxbg1jTEYSMqyJ3bhFazz+KRSOsozVkO40Et3641RCp2RKF2tYfM0CSvCR9pfgBXAe
 DfdvxZ1ZBRK84MBOolh4IvklFPubTao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98--oKuxaE4Nhqt5xTqP29FOg-1; Tue, 18 May 2021 14:59:01 -0400
X-MC-Unique: -oKuxaE4Nhqt5xTqP29FOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09369192AB81;
 Tue, 18 May 2021 18:58:59 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D581037E81;
 Tue, 18 May 2021 18:58:58 +0000 (UTC)
Date: Tue, 18 May 2021 12:58:37 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v3 2/8] vfio/type1: Add a page fault handler
Message-ID: <20210518125837.6de73631.alex.williamson@redhat.com>
In-Reply-To: <20210409034420.1799-3-lushenming@huawei.com>
References: <20210409034420.1799-1-lushenming@huawei.com>
 <20210409034420.1799-3-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, linux-api@vger.kernel.org,
 wanghaibin.wang@huawei.com, Robin Murphy <robin.murphy@arm.com>,
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

On Fri, 9 Apr 2021 11:44:14 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> VFIO manages the DMA mapping itself. To support IOPF (on-demand paging)
> for VFIO (IOMMU capable) devices, we add a VFIO page fault handler to
> serve the reported page faults from the IOMMU driver.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 114 ++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 45cbfd4879a5..ab0ff60ee207 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -101,6 +101,7 @@ struct vfio_dma {
>  	struct task_struct	*task;
>  	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
>  	unsigned long		*bitmap;
> +	unsigned long		*iopf_mapped_bitmap;
>  };
>  
>  struct vfio_batch {
> @@ -141,6 +142,16 @@ struct vfio_regions {
>  	size_t len;
>  };
>  
> +/* A global IOPF enabled group list */
> +static struct rb_root iopf_group_list = RB_ROOT;
> +static DEFINE_MUTEX(iopf_group_list_lock);
> +
> +struct vfio_iopf_group {
> +	struct rb_node		node;
> +	struct iommu_group	*iommu_group;
> +	struct vfio_iommu	*iommu;
> +};
> +
>  #define IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)	\
>  					(!list_empty(&iommu->domain_list))
>  
> @@ -157,6 +168,10 @@ struct vfio_regions {
>  #define DIRTY_BITMAP_PAGES_MAX	 ((u64)INT_MAX)
>  #define DIRTY_BITMAP_SIZE_MAX	 DIRTY_BITMAP_BYTES(DIRTY_BITMAP_PAGES_MAX)
>  
> +#define IOPF_MAPPED_BITMAP_GET(dma, i)	\
> +			      ((dma->iopf_mapped_bitmap[(i) / BITS_PER_LONG]	\
> +			       >> ((i) % BITS_PER_LONG)) & 0x1)


Can't we just use test_bit()?


> +
>  #define WAITED 1
>  
>  static int put_pfn(unsigned long pfn, int prot);
> @@ -416,6 +431,34 @@ static int vfio_iova_put_vfio_pfn(struct vfio_dma *dma, struct vfio_pfn *vpfn)
>  	return ret;
>  }
>  
> +/*
> + * Helper functions for iopf_group_list
> + */
> +static struct vfio_iopf_group *
> +vfio_find_iopf_group(struct iommu_group *iommu_group)
> +{
> +	struct vfio_iopf_group *iopf_group;
> +	struct rb_node *node;
> +
> +	mutex_lock(&iopf_group_list_lock);
> +
> +	node = iopf_group_list.rb_node;
> +
> +	while (node) {
> +		iopf_group = rb_entry(node, struct vfio_iopf_group, node);
> +
> +		if (iommu_group < iopf_group->iommu_group)
> +			node = node->rb_left;
> +		else if (iommu_group > iopf_group->iommu_group)
> +			node = node->rb_right;
> +		else
> +			break;
> +	}
> +
> +	mutex_unlock(&iopf_group_list_lock);
> +	return node ? iopf_group : NULL;
> +}

This looks like a pretty heavy weight operation per DMA fault.

I'm also suspicious of this validity of this iopf_group after we've
dropped the locking, the ordering of patches makes this very confusing.

> +
>  static int vfio_lock_acct(struct vfio_dma *dma, long npage, bool async)
>  {
>  	struct mm_struct *mm;
> @@ -3106,6 +3149,77 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  	return -EINVAL;
>  }
>  
> +/* VFIO I/O Page Fault handler */
> +static int vfio_iommu_type1_dma_map_iopf(struct iommu_fault *fault, void *data)

From the comment, this seems like the IOMMU fault handler (the
construction of this series makes this difficult to follow) and
eventually it handles more than DMA mapping, for example transferring
faults to the device driver.  "dma_map_iopf" seems like a poorly scoped
name.

> +{
> +	struct device *dev = (struct device *)data;
> +	struct iommu_group *iommu_group;
> +	struct vfio_iopf_group *iopf_group;
> +	struct vfio_iommu *iommu;
> +	struct vfio_dma *dma;
> +	dma_addr_t iova = ALIGN_DOWN(fault->prm.addr, PAGE_SIZE);
> +	int access_flags = 0;
> +	unsigned long bit_offset, vaddr, pfn;
> +	int ret;
> +	enum iommu_page_response_code status = IOMMU_PAGE_RESP_INVALID;
> +	struct iommu_page_response resp = {0};
> +
> +	if (fault->type != IOMMU_FAULT_PAGE_REQ)
> +		return -EOPNOTSUPP;
> +
> +	iommu_group = iommu_group_get(dev);
> +	if (!iommu_group)
> +		return -ENODEV;
> +
> +	iopf_group = vfio_find_iopf_group(iommu_group);
> +	iommu_group_put(iommu_group);
> +	if (!iopf_group)
> +		return -ENODEV;
> +
> +	iommu = iopf_group->iommu;
> +
> +	mutex_lock(&iommu->lock);

Again, I'm dubious of our ability to grab this lock from an object with
an unknown lifecycle and races we might have with that group being
detached or DMA unmapped.  Also, how effective is enabling IOMMU page
faulting if we're serializing all faults within a container context?

> +
> +	ret = vfio_find_dma_valid(iommu, iova, PAGE_SIZE, &dma);
> +	if (ret < 0)
> +		goto out_invalid;
> +
> +	if (fault->prm.perm & IOMMU_FAULT_PERM_READ)
> +		access_flags |= IOMMU_READ;
> +	if (fault->prm.perm & IOMMU_FAULT_PERM_WRITE)
> +		access_flags |= IOMMU_WRITE;
> +	if ((dma->prot & access_flags) != access_flags)
> +		goto out_invalid;
> +
> +	bit_offset = (iova - dma->iova) >> PAGE_SHIFT;
> +	if (IOPF_MAPPED_BITMAP_GET(dma, bit_offset))
> +		goto out_success;

If the page is mapped, why did we get a fault?  Should we be returning
success for a fault we shouldn't have received and did nothing to
resolve?  We're also referencing a bitmap that has only been declared
and never allocated at this point in the patch series.

> +
> +	vaddr = iova - dma->iova + dma->vaddr;
> +
> +	if (vfio_pin_page_external(dma, vaddr, &pfn, true))
> +		goto out_invalid;
> +
> +	if (vfio_iommu_map(iommu, iova, pfn, 1, dma->prot)) {
> +		if (put_pfn(pfn, dma->prot))
> +			vfio_lock_acct(dma, -1, true);
> +		goto out_invalid;
> +	}
> +
> +	bitmap_set(dma->iopf_mapped_bitmap, bit_offset, 1);
> +
> +out_success:
> +	status = IOMMU_PAGE_RESP_SUCCESS;
> +
> +out_invalid:
> +	mutex_unlock(&iommu->lock);
> +	resp.version		= IOMMU_PAGE_RESP_VERSION_1;
> +	resp.grpid		= fault->prm.grpid;
> +	resp.code		= status;
> +	iommu_page_response(dev, &resp);
> +	return 0;
> +}
> +
>  static long vfio_iommu_type1_ioctl(void *iommu_data,
>  				   unsigned int cmd, unsigned long arg)
>  {

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
