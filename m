Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDB931E882
	for <lists.iommu@lfdr.de>; Thu, 18 Feb 2021 11:37:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF81D8667B;
	Thu, 18 Feb 2021 10:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39UeabGAMJLq; Thu, 18 Feb 2021 10:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1E1686456;
	Thu, 18 Feb 2021 10:37:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA3E5C000D;
	Thu, 18 Feb 2021 10:37:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC37C000D
 for <iommu@lists.linux-foundation.org>; Thu, 18 Feb 2021 10:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9965086A07
 for <iommu@lists.linux-foundation.org>; Thu, 18 Feb 2021 10:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHSk7i-52IQd for <iommu@lists.linux-foundation.org>;
 Thu, 18 Feb 2021 10:36:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 75A118659B
 for <iommu@lists.linux-foundation.org>; Thu, 18 Feb 2021 10:36:57 +0000 (UTC)
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DhB0y0GwRz5Snm;
 Thu, 18 Feb 2021 18:34:58 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 18 Feb 2021 18:36:52 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 18 Feb 2021 18:36:52 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Thu, 18 Feb 2021 10:36:49 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "will@kernel.org" <will@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "maz@kernel.org" <maz@kernel.org>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v11 12/13] vfio/pci: Register a DMA fault response region
Thread-Topic: [PATCH v11 12/13] vfio/pci: Register a DMA fault response region
Thread-Index: AQHWvAgGhwjLBSYC0UyC6ARc2a6ugaoeJVMQgEAkCaA=
Date: Thu, 18 Feb 2021 10:36:49 +0000
Message-ID: <6c00965615844f03954faecb6fcb9294@huawei.com>
References: <20201116110030.32335-1-eric.auger@redhat.com>
 <20201116110030.32335-13-eric.auger@redhat.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.95.60]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
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

> > -----Original Message-----
> > From: Eric Auger [mailto:eric.auger@redhat.com]
> > Sent: 16 November 2020 11:00
> > To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> > iommu@lists.linux-foundation.org; linux-kernel@vger.kernel.org;
> > kvm@vger.kernel.org; kvmarm@lists.cs.columbia.edu; will@kernel.org;
> > joro@8bytes.org; maz@kernel.org; robin.murphy@arm.com;
> > alex.williamson@redhat.com
> > Cc: jean-philippe@linaro.org; zhangfei.gao@linaro.org;
> > zhangfei.gao@gmail.com; vivek.gautam@arm.com; Shameerali Kolothum
> > Thodi <shameerali.kolothum.thodi@huawei.com>;
> > jacob.jun.pan@linux.intel.com; yi.l.liu@intel.com; tn@semihalf.com;
> > nicoleotsuka@gmail.com; yuzenghui <yuzenghui@huawei.com>
> > Subject: [PATCH v11 12/13] vfio/pci: Register a DMA fault response
> > region
> >
> > In preparation for vSVA, let's register a DMA fault response region,
> > where the userspace will push the page responses and increment the
> > head of the buffer. The kernel will pop those responses and inject
> > them on iommu side.
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > ---
> >  drivers/vfio/pci/vfio_pci.c         | 114 +++++++++++++++++++++++++---
> >  drivers/vfio/pci/vfio_pci_private.h |   5 ++
> >  drivers/vfio/pci/vfio_pci_rdwr.c    |  39 ++++++++++
> >  include/uapi/linux/vfio.h           |  32 ++++++++
> >  4 files changed, 181 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> > index 65a83fd0e8c0..e9a904ce3f0d 100644
> > --- a/drivers/vfio/pci/vfio_pci.c
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -318,9 +318,20 @@ static void vfio_pci_dma_fault_release(struct
> > vfio_pci_device *vdev,
> >  	kfree(vdev->fault_pages);
> >  }
> >
> > -static int vfio_pci_dma_fault_mmap(struct vfio_pci_device *vdev,
> > -				   struct vfio_pci_region *region,
> > -				   struct vm_area_struct *vma)
> > +static void
> > +vfio_pci_dma_fault_response_release(struct vfio_pci_device *vdev,
> > +				    struct vfio_pci_region *region) {
> > +	if (vdev->dma_fault_response_wq)
> > +		destroy_workqueue(vdev->dma_fault_response_wq);
> > +	kfree(vdev->fault_response_pages);
> > +	vdev->fault_response_pages = NULL;
> > +}
> > +
> > +static int __vfio_pci_dma_fault_mmap(struct vfio_pci_device *vdev,
> > +				     struct vfio_pci_region *region,
> > +				     struct vm_area_struct *vma,
> > +				     u8 *pages)
> >  {
> >  	u64 phys_len, req_len, pgoff, req_start;
> >  	unsigned long long addr;
> > @@ -333,14 +344,14 @@ static int vfio_pci_dma_fault_mmap(struct
> > vfio_pci_device *vdev,
> >  		((1U << (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT)) - 1);
> >  	req_start = pgoff << PAGE_SHIFT;
> >
> > -	/* only the second page of the producer fault region is mmappable */
> > +	/* only the second page of the fault region is mmappable */
> >  	if (req_start < PAGE_SIZE)
> >  		return -EINVAL;
> >
> >  	if (req_start + req_len > phys_len)
> >  		return -EINVAL;
> >
> > -	addr = virt_to_phys(vdev->fault_pages);
> > +	addr = virt_to_phys(pages);
> >  	vma->vm_private_data = vdev;
> >  	vma->vm_pgoff = (addr >> PAGE_SHIFT) + pgoff;
> >
> > @@ -349,13 +360,29 @@ static int vfio_pci_dma_fault_mmap(struct
> > vfio_pci_device *vdev,
> >  	return ret;
> >  }
> >
> > -static int vfio_pci_dma_fault_add_capability(struct vfio_pci_device *vdev,
> > -					     struct vfio_pci_region *region,
> > -					     struct vfio_info_cap *caps)
> > +static int vfio_pci_dma_fault_mmap(struct vfio_pci_device *vdev,
> > +				   struct vfio_pci_region *region,
> > +				   struct vm_area_struct *vma)
> > +{
> > +	return __vfio_pci_dma_fault_mmap(vdev, region, vma,
> > vdev->fault_pages);
> > +}
> > +
> > +static int
> > +vfio_pci_dma_fault_response_mmap(struct vfio_pci_device *vdev,
> > +				struct vfio_pci_region *region,
> > +				struct vm_area_struct *vma)
> > +{
> > +	return __vfio_pci_dma_fault_mmap(vdev, region, vma,
> > vdev->fault_response_pages);
> > +}
> > +
> > +static int __vfio_pci_dma_fault_add_capability(struct vfio_pci_device *vdev,
> > +					       struct vfio_pci_region *region,
> > +					       struct vfio_info_cap *caps,
> > +					       u32 cap_id)
> >  {
> >  	struct vfio_region_info_cap_sparse_mmap *sparse = NULL;
> >  	struct vfio_region_info_cap_fault cap = {
> > -		.header.id = VFIO_REGION_INFO_CAP_DMA_FAULT,
> > +		.header.id = cap_id,
> >  		.header.version = 1,
> >  		.version = 1,
> >  	};
> > @@ -383,6 +410,14 @@ static int
> > vfio_pci_dma_fault_add_capability(struct
> > vfio_pci_device *vdev,
> >  	return ret;
> >  }
> >
> > +static int vfio_pci_dma_fault_add_capability(struct vfio_pci_device *vdev,
> > +					     struct vfio_pci_region *region,
> > +					     struct vfio_info_cap *caps) {
> > +	return __vfio_pci_dma_fault_add_capability(vdev, region, caps,
> > +						   VFIO_REGION_INFO_CAP_DMA_FAULT); }
> > +
> >  static const struct vfio_pci_regops vfio_pci_dma_fault_regops = {
> >  	.rw		= vfio_pci_dma_fault_rw,
> >  	.release	= vfio_pci_dma_fault_release,
> > @@ -390,6 +425,13 @@ static const struct vfio_pci_regops
> > vfio_pci_dma_fault_regops = {
> >  	.add_capability = vfio_pci_dma_fault_add_capability,
> >  };
> >
> > +static const struct vfio_pci_regops vfio_pci_dma_fault_response_regops = {
> > +	.rw		= vfio_pci_dma_fault_response_rw,
> > +	.release	= vfio_pci_dma_fault_response_release,
> > +	.mmap		= vfio_pci_dma_fault_response_mmap,
> > +	.add_capability = vfio_pci_dma_fault_add_capability,

As I mentioned in the Qemu patch ([RFC v7 26/26] vfio/pci: Implement 
return_page_response page response callback), it looks like we are using the
VFIO_REGION_INFO_CAP_DMA_FAULT cap id for the dma_fault_response here
as well. Is that intentional?
(Was wondering how it worked in the first place and noted this).

Please check.

Thanks,
Shameer

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
