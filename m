Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2919D752
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 15:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C52485E99;
	Fri,  3 Apr 2020 13:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pupyeTWZT7Fr; Fri,  3 Apr 2020 13:13:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE2E685D54;
	Fri,  3 Apr 2020 13:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2828C07FF;
	Fri,  3 Apr 2020 13:13:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B219C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 24DC78899E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 13:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hELkHjmMZmc8 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:12:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 869BD88942
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 13:12:57 +0000 (UTC)
IronPort-SDR: b+OxKsE1Ddi3ZJDjoT+xeR8kOqTwnndxXicRsQwrW/2auX45He6OL2MbmcfiVrM9Nt4M4+pHME
 OECjw6y81y2g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 06:12:56 -0700
IronPort-SDR: 2m3HcMUL+VGb/oWcZkQ+7hhCY+N/+R6PAJ+9Cb1yod1spmLOCA5gClNCS0aEeB3VS5a8zgl+5w
 +RXdCwdRLg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="250164955"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga003.jf.intel.com with ESMTP; 03 Apr 2020 06:12:56 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 06:12:55 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 06:12:55 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.89]) with mapi id 14.03.0439.000;
 Fri, 3 Apr 2020 21:12:51 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Thread-Topic: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Thread-Index: AQHWAEUbC4GB74LMekup8jIcF6WIFqhlp7CAgAGFhmA=
Date: Fri, 3 Apr 2020 13:12:50 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A220B62@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-2-git-send-email-yi.l.liu@intel.com>
 <20200402115017.0a0f55e2@w520.home>
In-Reply-To: <20200402115017.0a0f55e2@w520.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, 
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, Yi
 Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

Hi Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, April 3, 2020 1:50 AM
> Subject: Re: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
> 
> On Sun, 22 Mar 2020 05:31:58 -0700
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> 
> > From: Liu Yi L <yi.l.liu@intel.com>
> >
> > For a long time, devices have only one DMA address space from platform
> > IOMMU's point of view. This is true for both bare metal and directed-
> > access in virtualization environment. Reason is the source ID of DMA in
> > PCIe are BDF (bus/dev/fnc ID), which results in only device granularity
> > DMA isolation. However, this is changing with the latest advancement in
> > I/O technology area. More and more platform vendors are utilizing the PCIe
> > PASID TLP prefix in DMA requests, thus to give devices with multiple DMA
> > address spaces as identified by their individual PASIDs. For example,
> > Shared Virtual Addressing (SVA, a.k.a Shared Virtual Memory) is able to
> > let device access multiple process virtual address space by binding the
> > virtual address space with a PASID. Wherein the PASID is allocated in
> > software and programmed to device per device specific manner. Devices
> > which support PASID capability are called PASID-capable devices. If such
> > devices are passed through to VMs, guest software are also able to bind
> > guest process virtual address space on such devices. Therefore, the guest
> > software could reuse the bare metal software programming model, which
> > means guest software will also allocate PASID and program it to device
> > directly. This is a dangerous situation since it has potential PASID
> > conflicts and unauthorized address space access. It would be safer to
> > let host intercept in the guest software's PASID allocation. Thus PASID
> > are managed system-wide.
> 
> Providing an allocation interface only allows for collaborative usage
> of PASIDs though.  Do we have any ability to enforce PASID usage or can
> a user spoof other PASIDs on the same BDF?
> 
> > This patch adds VFIO_IOMMU_PASID_REQUEST ioctl which aims to passdown
> > PASID allocation/free request from the virtual IOMMU. Additionally, such
> > requests are intended to be invoked by QEMU or other applications which
> > are running in userspace, it is necessary to have a mechanism to prevent
> > single application from abusing available PASIDs in system. With such
> > consideration, this patch tracks the VFIO PASID allocation per-VM. There
> > was a discussion to make quota to be per assigned devices. e.g. if a VM
> > has many assigned devices, then it should have more quota. However, it
> > is not sure how many PASIDs an assigned devices will use. e.g. it is
> > possible that a VM with multiples assigned devices but requests less
> > PASIDs. Therefore per-VM quota would be better.
> >
> > This patch uses struct mm pointer as a per-VM token. We also considered
> > using task structure pointer and vfio_iommu structure pointer. However,
> > task structure is per-thread, which means it cannot achieve per-VM PASID
> > alloc tracking purpose. While for vfio_iommu structure, it is visible
> > only within vfio. Therefore, structure mm pointer is selected. This patch
> > adds a structure vfio_mm. A vfio_mm is created when the first vfio
> > container is opened by a VM. On the reverse order, vfio_mm is free when
> > the last vfio container is released. Each VM is assigned with a PASID
> > quota, so that it is not able to request PASID beyond its quota. This
> > patch adds a default quota of 1000. This quota could be tuned by
> > administrator. Making PASID quota tunable will be added in another patch
> > in this series.
> >
> > Previous discussions:
> > https://patchwork.kernel.org/patch/11209429/
> >
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  drivers/vfio/vfio.c             | 130 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/vfio/vfio_iommu_type1.c | 104 ++++++++++++++++++++++++++++++++
> >  include/linux/vfio.h            |  20 +++++++
> >  include/uapi/linux/vfio.h       |  41 +++++++++++++
> >  4 files changed, 295 insertions(+)
> >
> > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > index c848262..d13b483 100644
> > --- a/drivers/vfio/vfio.c
> > +++ b/drivers/vfio/vfio.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/vfio.h>
> >  #include <linux/wait.h>
> >  #include <linux/sched/signal.h>
> > +#include <linux/sched/mm.h>
> >
> >  #define DRIVER_VERSION	"0.3"
> >  #define DRIVER_AUTHOR	"Alex Williamson <alex.williamson@redhat.com>"
> > @@ -46,6 +47,8 @@ static struct vfio {
> >  	struct mutex			group_lock;
> >  	struct cdev			group_cdev;
> >  	dev_t				group_devt;
> > +	struct list_head		vfio_mm_list;
> > +	struct mutex			vfio_mm_lock;
> >  	wait_queue_head_t		release_q;
> >  } vfio;
> >
> > @@ -2129,6 +2132,131 @@ int vfio_unregister_notifier(struct device *dev, enum
> vfio_notify_type type,
> >  EXPORT_SYMBOL(vfio_unregister_notifier);
> >
> >  /**
> > + * VFIO_MM objects - create, release, get, put, search
> > + * Caller of the function should have held vfio.vfio_mm_lock.
> > + */
> > +static struct vfio_mm *vfio_create_mm(struct mm_struct *mm)
> > +{
> > +	struct vfio_mm *vmm;
> > +	struct vfio_mm_token *token;
> > +	int ret = 0;
> > +
> > +	vmm = kzalloc(sizeof(*vmm), GFP_KERNEL);
> > +	if (!vmm)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	/* Per mm IOASID set used for quota control and group operations */
> > +	ret = ioasid_alloc_set((struct ioasid_set *) mm,
> > +			       VFIO_DEFAULT_PASID_QUOTA, &vmm->ioasid_sid);
> > +	if (ret) {
> > +		kfree(vmm);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	kref_init(&vmm->kref);
> > +	token = &vmm->token;
> > +	token->val = mm;
> > +	vmm->pasid_quota = VFIO_DEFAULT_PASID_QUOTA;
> > +	mutex_init(&vmm->pasid_lock);
> > +
> > +	list_add(&vmm->vfio_next, &vfio.vfio_mm_list);
> > +
> > +	return vmm;
> > +}
> > +
> > +static void vfio_mm_unlock_and_free(struct vfio_mm *vmm)
> > +{
> > +	/* destroy the ioasid set */
> > +	ioasid_free_set(vmm->ioasid_sid, true);
> > +	mutex_unlock(&vfio.vfio_mm_lock);
> > +	kfree(vmm);
> > +}
> > +
> > +/* called with vfio.vfio_mm_lock held */
> > +static void vfio_mm_release(struct kref *kref)
> > +{
> > +	struct vfio_mm *vmm = container_of(kref, struct vfio_mm, kref);
> > +
> > +	list_del(&vmm->vfio_next);
> > +	vfio_mm_unlock_and_free(vmm);
> > +}
> > +
> > +void vfio_mm_put(struct vfio_mm *vmm)
> > +{
> > +	kref_put_mutex(&vmm->kref, vfio_mm_release, &vfio.vfio_mm_lock);
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_mm_put);
> > +
> > +/* Assume vfio_mm_lock or vfio_mm reference is held */
> > +static void vfio_mm_get(struct vfio_mm *vmm)
> > +{
> > +	kref_get(&vmm->kref);
> > +}
> > +
> > +struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task)
> > +{
> > +	struct mm_struct *mm = get_task_mm(task);
> > +	struct vfio_mm *vmm;
> > +	unsigned long long val = (unsigned long long) mm;
> > +
> > +	mutex_lock(&vfio.vfio_mm_lock);
> > +	list_for_each_entry(vmm, &vfio.vfio_mm_list, vfio_next) {
> > +		if (vmm->token.val == val) {
> > +			vfio_mm_get(vmm);
> > +			goto out;
> > +		}
> > +	}
> > +
> > +	vmm = vfio_create_mm(mm);
> > +	if (IS_ERR(vmm))
> > +		vmm = NULL;
> > +out:
> > +	mutex_unlock(&vfio.vfio_mm_lock);
> > +	mmput(mm);
> > +	return vmm;
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_mm_get_from_task);
> > +
> > +int vfio_mm_pasid_alloc(struct vfio_mm *vmm, int min, int max)
> > +{
> > +	ioasid_t pasid;
> > +	int ret = -ENOSPC;
> > +
> > +	mutex_lock(&vmm->pasid_lock);
> > +
> > +	pasid = ioasid_alloc(vmm->ioasid_sid, min, max, NULL);
> > +	if (pasid == INVALID_IOASID) {
> > +		ret = -ENOSPC;
> > +		goto out_unlock;
> > +	}
> > +
> > +	ret = pasid;
> > +out_unlock:
> > +	mutex_unlock(&vmm->pasid_lock);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_mm_pasid_alloc);
> > +
> > +int vfio_mm_pasid_free(struct vfio_mm *vmm, ioasid_t pasid)
> > +{
> > +	void *pdata;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&vmm->pasid_lock);
> > +	pdata = ioasid_find(vmm->ioasid_sid, pasid, NULL);
> > +	if (IS_ERR(pdata)) {
> > +		ret = PTR_ERR(pdata);
> > +		goto out_unlock;
> > +	}
> > +	ioasid_free(pasid);
> > +
> > +out_unlock:
> > +	mutex_unlock(&vmm->pasid_lock);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_mm_pasid_free);
> > +
> > +/**
> >   * Module/class support
> >   */
> >  static char *vfio_devnode(struct device *dev, umode_t *mode)
> > @@ -2151,8 +2279,10 @@ static int __init vfio_init(void)
> >  	idr_init(&vfio.group_idr);
> >  	mutex_init(&vfio.group_lock);
> >  	mutex_init(&vfio.iommu_drivers_lock);
> > +	mutex_init(&vfio.vfio_mm_lock);
> >  	INIT_LIST_HEAD(&vfio.group_list);
> >  	INIT_LIST_HEAD(&vfio.iommu_drivers_list);
> > +	INIT_LIST_HEAD(&vfio.vfio_mm_list);
> >  	init_waitqueue_head(&vfio.release_q);
> >
> >  	ret = misc_register(&vfio_dev);
> 
> Is vfio.c the right place for any of the above?  It seems like it could
> all be in a separate vfio_pasid module, similar to our virqfd module.

I think it could be a separate vfio_pasid module. let me make it in next
version if it's your preference. :-)

> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index a177bf2..331ceee 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -70,6 +70,7 @@ struct vfio_iommu {
> >  	unsigned int		dma_avail;
> >  	bool			v2;
> >  	bool			nesting;
> > +	struct vfio_mm		*vmm;
> >  };
> >
> >  struct vfio_domain {
> > @@ -2018,6 +2019,7 @@ static void vfio_iommu_type1_detach_group(void
> *iommu_data,
> >  static void *vfio_iommu_type1_open(unsigned long arg)
> >  {
> >  	struct vfio_iommu *iommu;
> > +	struct vfio_mm *vmm = NULL;
> >
> >  	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
> >  	if (!iommu)
> > @@ -2043,6 +2045,10 @@ static void *vfio_iommu_type1_open(unsigned long
> arg)
> >  	iommu->dma_avail = dma_entry_limit;
> >  	mutex_init(&iommu->lock);
> >  	BLOCKING_INIT_NOTIFIER_HEAD(&iommu->notifier);
> > +	vmm = vfio_mm_get_from_task(current);
> > +	if (!vmm)
> > +		pr_err("Failed to get vfio_mm track\n");
> 
> Doesn't this presume everyone is instantly running PASID capable hosts?
> Looks like a noisy support regression to me.

right, it is. Kevin also questioned this part, I'll refine it and avoid
regression noisy.

> > +	iommu->vmm = vmm;
> >
> >  	return iommu;
> >  }
> > @@ -2084,6 +2090,8 @@ static void vfio_iommu_type1_release(void
> *iommu_data)
> >  	}
> >
> >  	vfio_iommu_iova_free(&iommu->iova_list);
> > +	if (iommu->vmm)
> > +		vfio_mm_put(iommu->vmm);
> >
> >  	kfree(iommu);
> >  }
> > @@ -2172,6 +2180,55 @@ static int vfio_iommu_iova_build_caps(struct
> vfio_iommu *iommu,
> >  	return ret;
> >  }
> >
> > +static bool vfio_iommu_type1_pasid_req_valid(u32 flags)
> > +{
> > +	return !((flags & ~VFIO_PASID_REQUEST_MASK) ||
> > +		 (flags & VFIO_IOMMU_PASID_ALLOC &&
> > +		  flags & VFIO_IOMMU_PASID_FREE));
> > +}
> > +
> > +static int vfio_iommu_type1_pasid_alloc(struct vfio_iommu *iommu,
> > +					 int min,
> > +					 int max)
> > +{
> > +	struct vfio_mm *vmm = iommu->vmm;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&iommu->lock);
> > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > +		ret = -EFAULT;
> > +		goto out_unlock;
> > +	}
> 
> Non-iommu backed mdevs are excluded from this?  Is this a matter of
> wiring the call out through the mdev parent device, or is this just
> possible?

At the beginning, non-iommu backed mdevs are excluded. However,
Combined with your succeeded comment. I think this check should be
removed as the PASID alloc/free capability should be available as
long as the container is backed by a pasid-capable iommu backend.
So should remove it, and it is the same with the free path.

> 
> > +	if (vmm)
> > +		ret = vfio_mm_pasid_alloc(vmm, min, max);
> > +	else
> > +		ret = -EINVAL;
> > +out_unlock:
> > +	mutex_unlock(&iommu->lock);
> > +	return ret;
> > +}
> > +
> > +static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
> > +				       unsigned int pasid)
> > +{
> > +	struct vfio_mm *vmm = iommu->vmm;
> > +	int ret = 0;
> > +
> > +	mutex_lock(&iommu->lock);
> > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > +		ret = -EFAULT;
> > +		goto out_unlock;
> > +	}
> 
> So if a container had an iommu backed device when the pasid was
> allocated, but it was removed, now they can't free it?  Why do we need
> the check above?

should be removed. thanks for spotting it.

> > +
> > +	if (vmm)
> > +		ret = vfio_mm_pasid_free(vmm, pasid);
> > +	else
> > +		ret = -EINVAL;
> > +out_unlock:
> > +	mutex_unlock(&iommu->lock);
> > +	return ret;
> > +}
> > +
> >  static long vfio_iommu_type1_ioctl(void *iommu_data,
> >  				   unsigned int cmd, unsigned long arg)
> >  {
> > @@ -2276,6 +2333,53 @@ static long vfio_iommu_type1_ioctl(void
> *iommu_data,
> >
> >  		return copy_to_user((void __user *)arg, &unmap, minsz) ?
> >  			-EFAULT : 0;
> > +
> > +	} else if (cmd == VFIO_IOMMU_PASID_REQUEST) {
> > +		struct vfio_iommu_type1_pasid_request req;
> > +		unsigned long offset;
> > +
> > +		minsz = offsetofend(struct vfio_iommu_type1_pasid_request,
> > +				    flags);
> > +
> > +		if (copy_from_user(&req, (void __user *)arg, minsz))
> > +			return -EFAULT;
> > +
> > +		if (req.argsz < minsz ||
> > +		    !vfio_iommu_type1_pasid_req_valid(req.flags))
> > +			return -EINVAL;
> > +
> > +		if (copy_from_user((void *)&req + minsz,
> > +				   (void __user *)arg + minsz,
> > +				   sizeof(req) - minsz))
> > +			return -EFAULT;
> 
> Huh?  Why do we have argsz if we're going to assume this is here?

do you mean replacing sizeof(req) with argsz? if yes, I can do that.

> > +
> > +		switch (req.flags & VFIO_PASID_REQUEST_MASK) {
> > +		case VFIO_IOMMU_PASID_ALLOC:
> > +		{
> > +			int ret = 0, result;
> > +
> > +			result = vfio_iommu_type1_pasid_alloc(iommu,
> > +							req.alloc_pasid.min,
> > +							req.alloc_pasid.max);
> > +			if (result > 0) {
> > +				offset = offsetof(
> > +					struct vfio_iommu_type1_pasid_request,
> > +					alloc_pasid.result);
> > +				ret = copy_to_user(
> > +					      (void __user *) (arg + offset),
> > +					      &result, sizeof(result));
> 
> Again assuming argsz supports this.

same as above.

> 
> > +			} else {
> > +				pr_debug("%s: PASID alloc failed\n", __func__);
> 
> rate limit?

not quite get. could you give more hints?

> > +				ret = -EFAULT;
> > +			}
> > +			return ret;
> > +		}
> > +		case VFIO_IOMMU_PASID_FREE:
> > +			return vfio_iommu_type1_pasid_free(iommu,
> > +							   req.free_pasid);
> > +		default:
> > +			return -EINVAL;
> > +		}
> >  	}
> >
> >  	return -ENOTTY;
> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index e42a711..75f9f7f1 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -89,6 +89,26 @@ extern int vfio_register_iommu_driver(const struct
> vfio_iommu_driver_ops *ops);
> >  extern void vfio_unregister_iommu_driver(
> >  				const struct vfio_iommu_driver_ops *ops);
> >
> > +#define VFIO_DEFAULT_PASID_QUOTA	1000
> > +struct vfio_mm_token {
> > +	unsigned long long val;
> > +};
> > +
> > +struct vfio_mm {
> > +	struct kref			kref;
> > +	struct vfio_mm_token		token;
> > +	int				ioasid_sid;
> > +	/* protect @pasid_quota field and pasid allocation/free */
> > +	struct mutex			pasid_lock;
> > +	int				pasid_quota;
> > +	struct list_head		vfio_next;
> > +};
> > +
> > +extern struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task);
> > +extern void vfio_mm_put(struct vfio_mm *vmm);
> > +extern int vfio_mm_pasid_alloc(struct vfio_mm *vmm, int min, int max);
> > +extern int vfio_mm_pasid_free(struct vfio_mm *vmm, ioasid_t pasid);
> > +
> >  /*
> >   * External user API
> >   */
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index 9e843a1..298ac80 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -794,6 +794,47 @@ struct vfio_iommu_type1_dma_unmap {
> >  #define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
> >  #define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
> >
> > +/*
> > + * PASID (Process Address Space ID) is a PCIe concept which
> > + * has been extended to support DMA isolation in fine-grain.
> > + * With device assigned to user space (e.g. VMs), PASID alloc
> > + * and free need to be system wide. This structure defines
> > + * the info for pasid alloc/free between user space and kernel
> > + * space.
> > + *
> > + * @flag=VFIO_IOMMU_PASID_ALLOC, refer to the @alloc_pasid
> > + * @flag=VFIO_IOMMU_PASID_FREE, refer to @free_pasid
> > + */
> > +struct vfio_iommu_type1_pasid_request {
> > +	__u32	argsz;
> > +#define VFIO_IOMMU_PASID_ALLOC	(1 << 0)
> > +#define VFIO_IOMMU_PASID_FREE	(1 << 1)
> > +	__u32	flags;
> > +	union {
> > +		struct {
> > +			__u32 min;
> > +			__u32 max;
> > +			__u32 result;
> > +		} alloc_pasid;
> > +		__u32 free_pasid;
> > +	};
> 
> We seem to be using __u8 data[] lately where the struct at data is
> defined by the flags.  should we do that here?

yeah, I can do that. BTW. Do you want to let the structure in the
lately patch share the same structure with this one? As I can foresee,
the two structures would look like similar as both of them include
argsz, flags and data[] fields. The difference is the definition of
flags. what about your opinion?

struct vfio_iommu_type1_pasid_request {
	__u32	argsz;
#define VFIO_IOMMU_PASID_ALLOC	(1 << 0)
#define VFIO_IOMMU_PASID_FREE	(1 << 1)
	__u32	flags;
	__u8	data[];
};

struct vfio_iommu_type1_bind {
        __u32           argsz;
        __u32           flags;
#define VFIO_IOMMU_BIND_GUEST_PGTBL     (1 << 0)
#define VFIO_IOMMU_UNBIND_GUEST_PGTBL   (1 << 1)
        __u8            data[];
};

> 
> > +};
> > +
> > +#define VFIO_PASID_REQUEST_MASK	(VFIO_IOMMU_PASID_ALLOC | \
> > +					 VFIO_IOMMU_PASID_FREE)
> > +
> > +/**
> > + * VFIO_IOMMU_PASID_REQUEST - _IOWR(VFIO_TYPE, VFIO_BASE + 22,
> > + *				struct vfio_iommu_type1_pasid_request)
> > + *
> > + * Availability of this feature depends on PASID support in the device,
> > + * its bus, the underlying IOMMU and the CPU architecture. In VFIO, it
> > + * is available after VFIO_SET_IOMMU.
> > + *
> > + * returns: 0 on success, -errno on failure.
> > + */
> > +#define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 22)
> 
> So a user needs to try to allocate a PASID in order to test for the
> support?  Should we have a PROBE flag?

answered in in later patch. :-)

Regards,
Yi Liu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
