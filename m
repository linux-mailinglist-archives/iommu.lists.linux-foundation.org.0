Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B220E2C32E6
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 22:31:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4601986D2D;
	Tue, 24 Nov 2020 21:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4T2rC3LIOBtt; Tue, 24 Nov 2020 21:31:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 747DD86C3A;
	Tue, 24 Nov 2020 21:31:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BE54C0052;
	Tue, 24 Nov 2020 21:31:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DAA2C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 21:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1FABD863F2
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 21:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwWxygQNGLTe for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 21:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C05A285E7C
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606253477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SUFkTpZGndRNTlU23p0AoNkwlyXdbRb6zkOHCX3TCNA=;
 b=PO5dp9SAspfq0RY7EiVwyyzbNnkISv+UPjRxycopHlqHQXKjbPx0TUjrn2WTF6ZsSbLkuk
 OxyfWK4tEGhKack1oJ9xrLlVWK9ZvspbNjNCE9RlvdADMD+J2i5NR1DMt0neKVgGpJ97ke
 6CQNYYx0FBxM4+WD5LeVAGiOlxQQdU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-ceXNeoYIOtaAUGOOi9YRkw-1; Tue, 24 Nov 2020 16:31:14 -0500
X-MC-Unique: ceXNeoYIOtaAUGOOi9YRkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D9EF107B46A;
 Tue, 24 Nov 2020 21:31:11 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E1825D9CA;
 Tue, 24 Nov 2020 21:31:00 +0000 (UTC)
Date: Tue, 24 Nov 2020 14:31:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v11 01/13] vfio: VFIO_IOMMU_SET_PASID_TABLE
Message-ID: <20201124143100.05380b0d@w520.home>
In-Reply-To: <20201116110030.32335-2-eric.auger@redhat.com>
References: <20201116110030.32335-1-eric.auger@redhat.com>
 <20201116110030.32335-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, maz@kernel.org,
 linux-kernel@vger.kernel.org, vivek.gautam@arm.com,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 robin.murphy@arm.com, will@kernel.org, kvmarm@lists.cs.columbia.edu,
 eric.auger.pro@gmail.com
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

On Mon, 16 Nov 2020 12:00:18 +0100
Eric Auger <eric.auger@redhat.com> wrote:

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
> 
> ---
> v11 -> v12:
> - use iommu_uapi_set_pasid_table
> - check SET and UNSET are not set simultaneously (Zenghui)
> 
> v8 -> v9:
> - Merge VFIO_IOMMU_ATTACH/DETACH_PASID_TABLE into a single
>   VFIO_IOMMU_SET_PASID_TABLE ioctl.
> 
> v6 -> v7:
> - add a comment related to VFIO_IOMMU_DETACH_PASID_TABLE
> 
> v3 -> v4:
> - restore ATTACH/DETACH
> - add unwind on failure
> 
> v2 -> v3:
> - s/BIND_PASID_TABLE/SET_PASID_TABLE
> 
> v1 -> v2:
> - s/BIND_GUEST_STAGE/BIND_PASID_TABLE
> - remove the struct device arg
> ---
>  drivers/vfio/vfio_iommu_type1.c | 65 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/vfio.h       | 19 ++++++++++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 67e827638995..87ddd9e882dc 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2587,6 +2587,41 @@ static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
>  	return ret;
>  }
>  
> +static void
> +vfio_detach_pasid_table(struct vfio_iommu *iommu)
> +{
> +	struct vfio_domain *d;
> +
> +	mutex_lock(&iommu->lock);
> +	list_for_each_entry(d, &iommu->domain_list, next)
> +		iommu_detach_pasid_table(d->domain);
> +
> +	mutex_unlock(&iommu->lock);
> +}
> +
> +static int
> +vfio_attach_pasid_table(struct vfio_iommu *iommu, unsigned long arg)
> +{
> +	struct vfio_domain *d;
> +	int ret = 0;
> +
> +	mutex_lock(&iommu->lock);
> +
> +	list_for_each_entry(d, &iommu->domain_list, next) {
> +		ret = iommu_uapi_attach_pasid_table(d->domain, (void __user *)arg);
> +		if (ret)
> +			goto unwind;
> +	}
> +	goto unlock;
> +unwind:
> +	list_for_each_entry_continue_reverse(d, &iommu->domain_list, next) {
> +		iommu_detach_pasid_table(d->domain);
> +	}
> +unlock:

This goto leap frog could be avoided with just:

list_for_each_entry(d, &iommu->domain_list, next) {
	ret = iommu_uapi_attach_pasid_table(d->domain, (void __user *)arg);
	if (ret) {
		list_for_each_entry_continue_reverse(d, &iommu->domain_list, next) {
			iommu_detach_pasid_table(d->domain);
		}
		break;
	}
}

> +	mutex_unlock(&iommu->lock);
> +	return ret;
> +}
> +
>  static int vfio_iommu_migration_build_caps(struct vfio_iommu *iommu,
>  					   struct vfio_info_cap *caps)
>  {
> @@ -2747,6 +2782,34 @@ static int vfio_iommu_type1_unmap_dma(struct vfio_iommu *iommu,
>  			-EFAULT : 0;
>  }
>  
> +static int vfio_iommu_type1_set_pasid_table(struct vfio_iommu *iommu,
> +					    unsigned long arg)
> +{
> +	struct vfio_iommu_type1_set_pasid_table spt;
> +	unsigned long minsz;
> +	int ret = -EINVAL;
> +
> +	minsz = offsetofend(struct vfio_iommu_type1_set_pasid_table, flags);
> +
> +	if (copy_from_user(&spt, (void __user *)arg, minsz))
> +		return -EFAULT;
> +
> +	if (spt.argsz < minsz)
> +		return -EINVAL;
> +
> +	if (spt.flags & VFIO_PASID_TABLE_FLAG_SET &&
> +	    spt.flags & VFIO_PASID_TABLE_FLAG_UNSET)
> +		return -EINVAL;
> +
> +	if (spt.flags & VFIO_PASID_TABLE_FLAG_SET)
> +		ret = vfio_attach_pasid_table(iommu, arg + minsz);
> +	else if (spt.flags & VFIO_PASID_TABLE_FLAG_UNSET) {
> +		vfio_detach_pasid_table(iommu);
> +		ret = 0;
> +	}

This doesn't really validate that the other flag bits are zero, ex.
user could pass flags = (1 << 8) | VFIO_PASID_TABLE_FLAG_SET and we'd
just ignore the extra bit.  So this probably needs to be:

if (spt.flags == VFIO_PASID_TABLE_FLAG_SET)
	ret = vfio_attach_pasid_table(iommu, arg + minsz);
else if (spt.flags == VFIO_PASID_TABLE_FLAG_UNSET)
	vfio_detach_pasid_table(iommu);

Or otherwise validate that none of the other bits are set.  It also
seems cleaner to me to set the initial value of ret = 0 and end this
with:

else
	ret = -EINVAL;


> +	return ret;
> +}
> +
>  static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
>  					unsigned long arg)
>  {
> @@ -2867,6 +2930,8 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
>  		return vfio_iommu_type1_unmap_dma(iommu, arg);
>  	case VFIO_IOMMU_DIRTY_PAGES:
>  		return vfio_iommu_type1_dirty_pages(iommu, arg);
> +	case VFIO_IOMMU_SET_PASID_TABLE:
> +		return vfio_iommu_type1_set_pasid_table(iommu, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> index 2f313a238a8f..78ce3ce6c331 100644
> --- a/include/uapi/linux/vfio.h
> +++ b/include/uapi/linux/vfio.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/ioctl.h>
> +#include <linux/iommu.h>
>  
>  #define VFIO_API_VERSION	0
>  
> @@ -1180,6 +1181,24 @@ struct vfio_iommu_type1_dirty_bitmap_get {
>  
>  #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
>  
> +/*
> + * VFIO_IOMMU_SET_PASID_TABLE - _IOWR(VFIO_TYPE, VFIO_BASE + 22,

We already reuse ioctl indexes between type1 and spapr (ex. +17 is
either VFIO_IOMMU_DIRTY_PAGES or VFIO_IOMMU_SPAPR_REGISTER_MEMORY
depending on the iommu type).  I wonder if we should reuse +18 here
instead.

> + *			struct vfio_iommu_type1_set_pasid_table)
> + *
> + * The SET operation passes a PASID table to the host while the
> + * UNSET operation detaches the one currently programmed. Setting
> + * a table while another is already programmed replaces the old table.
> + */
> +struct vfio_iommu_type1_set_pasid_table {
> +	__u32	argsz;
> +	__u32	flags;
> +#define VFIO_PASID_TABLE_FLAG_SET	(1 << 0)
> +#define VFIO_PASID_TABLE_FLAG_UNSET	(1 << 1)
> +	struct iommu_pasid_table_config config; /* used on SET */
> +};
> +
> +#define VFIO_IOMMU_SET_PASID_TABLE	_IO(VFIO_TYPE, VFIO_BASE + 22)
> +
>  /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
>  
>  /*

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
