Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F7A24C6DE
	for <lists.iommu@lfdr.de>; Thu, 20 Aug 2020 22:51:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F313B22812;
	Thu, 20 Aug 2020 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TCfdhh-Z40N; Thu, 20 Aug 2020 20:51:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA9D5227E1;
	Thu, 20 Aug 2020 20:51:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA512C0889;
	Thu, 20 Aug 2020 20:51:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AAEAC0051
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 23F8B882FC
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1ir+yt4bDq2 for <iommu@lists.linux-foundation.org>;
 Thu, 20 Aug 2020 20:51:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8F74D881DA
 for <iommu@lists.linux-foundation.org>; Thu, 20 Aug 2020 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597956701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cudoH5aN9gB1ChMTfJSH2Rgq2ivtSe9l9dhKB2Tuc3Q=;
 b=KnuuGOu5DAwHGIQk4KW80+O4MdtxH5n88H0gAyE3pMI/ZEunqWtL3Hf2myj/JVij12qTwh
 38jtwlfrxIIKi1PBdWVylMiKiDcPogK+TStzuv0XnoLKtFxk1suQiZqXkhM7LO8pQa12Yh
 7vddqWlZr82UG/beGqQxbY/LuVBn/qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-fKB5z6bhMDiBvc07P6S1aA-1; Thu, 20 Aug 2020 16:51:37 -0400
X-MC-Unique: fKB5z6bhMDiBvc07P6S1aA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DAD31005E6D;
 Thu, 20 Aug 2020 20:51:35 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4896C71780;
 Thu, 20 Aug 2020 20:51:28 +0000 (UTC)
Date: Thu, 20 Aug 2020 14:51:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/15] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Message-ID: <20200820145127.61ed8727@x1.home>
In-Reply-To: <1595917664-33276-8-git-send-email-yi.l.liu@intel.com>
References: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
 <1595917664-33276-8-git-send-email-yi.l.liu@intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, yi.y.sun@intel.com, hao.wu@intel.com,
 jun.j.tian@intel.com
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

On Mon, 27 Jul 2020 23:27:36 -0700
Liu Yi L <yi.l.liu@intel.com> wrote:

> This patch allows userspace to request PASID allocation/free, e.g. when
> serving the request from the guest.
> 
> PASIDs that are not freed by userspace are automatically freed when the
> IOASID set is destroyed when process exits.
> 
> Cc: Kevin Tian <kevin.tian@intel.com>
> CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
> v5 -> v6:
> *) address comments from Eric against v5. remove the alloc/free helper.
> 
> v4 -> v5:
> *) address comments from Eric Auger.
> *) the comments for the PASID_FREE request is addressed in patch 5/15 of
>    this series.
> 
> v3 -> v4:
> *) address comments from v3, except the below comment against the range
>    of PASID_FREE request. needs more help on it.
>     "> +if (req.range.min > req.range.max)  
> 
>      Is it exploitable that a user can spin the kernel for a long time in
>      the case of a free by calling this with [0, MAX_UINT] regardless of
>      their actual allocations?"
>     https://lore.kernel.org/linux-iommu/20200702151832.048b44d1@x1.home/
> 
> v1 -> v2:
> *) move the vfio_mm related code to be a seprate module
> *) use a single structure for alloc/free, could support a range of PASIDs
> *) fetch vfio_mm at group_attach time instead of at iommu driver open time
> ---
>  drivers/vfio/Kconfig            |  1 +
>  drivers/vfio/vfio_iommu_type1.c | 69 +++++++++++++++++++++++++++++++++++++++++
>  drivers/vfio/vfio_pasid.c       | 10 ++++++
>  include/linux/vfio.h            |  6 ++++
>  include/uapi/linux/vfio.h       | 37 ++++++++++++++++++++++
>  5 files changed, 123 insertions(+)
> 
> diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
> index 3d8a108..95d90c6 100644
> --- a/drivers/vfio/Kconfig
> +++ b/drivers/vfio/Kconfig
> @@ -2,6 +2,7 @@
>  config VFIO_IOMMU_TYPE1
>  	tristate
>  	depends on VFIO
> +	select VFIO_PASID if (X86)
>  	default n
>  
>  config VFIO_IOMMU_SPAPR_TCE
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 18ff0c3..ea89c7c 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -76,6 +76,7 @@ struct vfio_iommu {
>  	bool				dirty_page_tracking;
>  	bool				pinned_page_dirty_scope;
>  	struct iommu_nesting_info	*nesting_info;
> +	struct vfio_mm			*vmm;
>  };
>  
>  struct vfio_domain {
> @@ -1937,6 +1938,11 @@ static void vfio_iommu_iova_insert_copy(struct vfio_iommu *iommu,
>  
>  static void vfio_iommu_release_nesting_info(struct vfio_iommu *iommu)
>  {
> +	if (iommu->vmm) {
> +		vfio_mm_put(iommu->vmm);
> +		iommu->vmm = NULL;
> +	}
> +
>  	kfree(iommu->nesting_info);
>  	iommu->nesting_info = NULL;
>  }
> @@ -2071,6 +2077,26 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  					    iommu->nesting_info);
>  		if (ret)
>  			goto out_detach;
> +
> +		if (iommu->nesting_info->features &
> +					IOMMU_NESTING_FEAT_SYSWIDE_PASID) {
> +			struct vfio_mm *vmm;
> +			int sid;
> +
> +			vmm = vfio_mm_get_from_task(current);
> +			if (IS_ERR(vmm)) {
> +				ret = PTR_ERR(vmm);
> +				goto out_detach;
> +			}
> +			iommu->vmm = vmm;
> +
> +			sid = vfio_mm_ioasid_sid(vmm);
> +			ret = iommu_domain_set_attr(domain->domain,
> +						    DOMAIN_ATTR_IOASID_SID,
> +						    &sid);
> +			if (ret)
> +				goto out_detach;
> +		}
>  	}
>  
>  	/* Get aperture info */
> @@ -2859,6 +2885,47 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  	return -EINVAL;
>  }
>  
> +static int vfio_iommu_type1_pasid_request(struct vfio_iommu *iommu,
> +					  unsigned long arg)
> +{
> +	struct vfio_iommu_type1_pasid_request req;
> +	unsigned long minsz;
> +	int ret;
> +
> +	minsz = offsetofend(struct vfio_iommu_type1_pasid_request, range);
> +
> +	if (copy_from_user(&req, (void __user *)arg, minsz))
> +		return -EFAULT;
> +
> +	if (req.argsz < minsz || (req.flags & ~VFIO_PASID_REQUEST_MASK))
> +		return -EINVAL;
> +
> +	if (req.range.min > req.range.max)
> +		return -EINVAL;
> +
> +	mutex_lock(&iommu->lock);
> +	if (!iommu->vmm) {
> +		mutex_unlock(&iommu->lock);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	switch (req.flags & VFIO_PASID_REQUEST_MASK) {
> +	case VFIO_IOMMU_FLAG_ALLOC_PASID:
> +		ret = vfio_pasid_alloc(iommu->vmm, req.range.min,
> +				       req.range.max);
> +		break;
> +	case VFIO_IOMMU_FLAG_FREE_PASID:
> +		vfio_pasid_free_range(iommu->vmm, req.range.min,
> +				      req.range.max);
> +		ret = 0;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +	mutex_unlock(&iommu->lock);
> +	return ret;
> +}
> +
>  static long vfio_iommu_type1_ioctl(void *iommu_data,
>  				   unsigned int cmd, unsigned long arg)
>  {
> @@ -2875,6 +2942,8 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>  		return vfio_iommu_type1_unmap_dma(iommu, arg);
>  	case VFIO_IOMMU_DIRTY_PAGES:
>  		return vfio_iommu_type1_dirty_pages(iommu, arg);
> +	case VFIO_IOMMU_PASID_REQUEST:
> +		return vfio_iommu_type1_pasid_request(iommu, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/drivers/vfio/vfio_pasid.c b/drivers/vfio/vfio_pasid.c
> index befcf29..8d0317f 100644
> --- a/drivers/vfio/vfio_pasid.c
> +++ b/drivers/vfio/vfio_pasid.c
> @@ -61,6 +61,7 @@ void vfio_mm_put(struct vfio_mm *vmm)
>  {
>  	kref_put_mutex(&vmm->kref, vfio_mm_release, &vfio_mm_lock);
>  }
> +EXPORT_SYMBOL_GPL(vfio_mm_put);
>  
>  static void vfio_mm_get(struct vfio_mm *vmm)
>  {
> @@ -114,6 +115,13 @@ struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task)
>  	mmput(mm);
>  	return vmm;
>  }
> +EXPORT_SYMBOL_GPL(vfio_mm_get_from_task);
> +
> +int vfio_mm_ioasid_sid(struct vfio_mm *vmm)
> +{
> +	return vmm->ioasid_sid;
> +}
> +EXPORT_SYMBOL_GPL(vfio_mm_ioasid_sid);
>  
>  /*
>   * Find PASID within @min and @max
> @@ -202,6 +210,7 @@ int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)
>  
>  	return pasid;
>  }
> +EXPORT_SYMBOL_GPL(vfio_pasid_alloc);
>  
>  void vfio_pasid_free_range(struct vfio_mm *vmm,
>  			   ioasid_t min, ioasid_t max)
> @@ -218,6 +227,7 @@ void vfio_pasid_free_range(struct vfio_mm *vmm,
>  		vfio_remove_pasid(vmm, vid);
>  	mutex_unlock(&vmm->pasid_lock);
>  }
> +EXPORT_SYMBOL_GPL(vfio_pasid_free_range);
>  
>  static int __init vfio_pasid_init(void)
>  {
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 31472a9..a355d01 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -101,6 +101,7 @@ struct vfio_mm;
>  #if IS_ENABLED(CONFIG_VFIO_PASID)
>  extern struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task);
>  extern void vfio_mm_put(struct vfio_mm *vmm);
> +extern int vfio_mm_ioasid_sid(struct vfio_mm *vmm);
>  extern int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max);
>  extern void vfio_pasid_free_range(struct vfio_mm *vmm,
>  				  ioasid_t min, ioasid_t max);
> @@ -114,6 +115,11 @@ static inline void vfio_mm_put(struct vfio_mm *vmm)
>  {
>  }
>  
> +static inline int vfio_mm_ioasid_sid(struct vfio_mm *vmm)
> +{
> +	return -ENOTTY;
> +}
> +
>  static inline int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)
>  {
>  	return -ENOTTY;
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 0cf3d6d..6d79557 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -1172,6 +1172,43 @@ struct vfio_iommu_type1_dirty_bitmap_get {
>  
>  #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
>  
> +/**
> + * VFIO_IOMMU_PASID_REQUEST - _IOWR(VFIO_TYPE, VFIO_BASE + 18,
> + *				struct vfio_iommu_type1_pasid_request)
> + *
> + * PASID (Processor Address Space ID) is a PCIe concept for tagging
> + * address spaces in DMA requests. When system-wide PASID allocation
> + * is required by the underlying iommu driver (e.g. Intel VT-d), this
> + * provides an interface for userspace to request pasid alloc/free
> + * for its assigned devices. Userspace should check the availability
> + * of this API by checking VFIO_IOMMU_TYPE1_INFO_CAP_NESTING through
> + * VFIO_IOMMU_GET_INFO.
> + *
> + * @flags=VFIO_IOMMU_FLAG_ALLOC_PASID, allocate a single PASID within @range.
> + * @flags=VFIO_IOMMU_FLAG_FREE_PASID, free the PASIDs within @range.
> + * @range is [min, max], which means both @min and @max are inclusive.
> + * ALLOC_PASID and FREE_PASID are mutually exclusive.
> + *
> + * returns: allocated PASID value on success, -errno on failure for
> + *	     ALLOC_PASID;
> + *	     0 for FREE_PASID operation;
> + */
> +struct vfio_iommu_type1_pasid_request {
> +	__u32	argsz;
> +#define VFIO_IOMMU_FLAG_ALLOC_PASID	(1 << 0)
> +#define VFIO_IOMMU_FLAG_FREE_PASID	(1 << 1)
> +	__u32	flags;
> +	struct {
> +		__u32	min;
> +		__u32	max;
> +	} range;
> +};


IOCTL(2)                   Linux Programmer's Manual                  IOCTL(2)

NAME
       ioctl - control device

SYNOPSIS
       #include <sys/ioctl.h>

       int ioctl(int fd, unsigned long request, ...);


ioctl(2) returns a signed int, how can it support returning a __u32
pasid and -errno?  Thanks,

Alex

> +
> +#define VFIO_PASID_REQUEST_MASK	(VFIO_IOMMU_FLAG_ALLOC_PASID | \
> +					 VFIO_IOMMU_FLAG_FREE_PASID)
> +
> +#define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 18)
> +
>  /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
>  
>  /*

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
