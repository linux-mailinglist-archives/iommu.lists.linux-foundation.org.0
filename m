Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5019DDAC
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 20:11:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2474786C22;
	Fri,  3 Apr 2020 18:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LyrhNxZHeMy; Fri,  3 Apr 2020 18:11:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47105870F7;
	Fri,  3 Apr 2020 18:11:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A540C1AE2;
	Fri,  3 Apr 2020 18:11:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC6DC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 840F92039A
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y05uvSKIRGBT for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 18:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A3782037A
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585937475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMrgKApG4lqSw6EF2f2sUD+oLvWJV8i8xepU3m9dg4Q=;
 b=EDv+jKRUrQ/CXXq5JMDZ0CgP085w31a0JhasMpuy0I5naxYVdGnvUeoqC2U0mp00w0iqmg
 yvvA6zFKl6qTeVvv49ffDOQ2T8kwnT2/b5lAJmWJtZYjnv0D93dT5D/b9zl2saAXsl4EZw
 qq/g4kmtxZCS/UoOEv/YFwPBPO7JqXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-rnpZ9zi_MRG1L4FBIY2mxg-1; Fri, 03 Apr 2020 14:11:11 -0400
X-MC-Unique: rnpZ9zi_MRG1L4FBIY2mxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B390513F8;
 Fri,  3 Apr 2020 18:11:09 +0000 (UTC)
Received: from w520.home (ovpn-112-162.phx2.redhat.com [10.3.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC6D960BF3;
 Fri,  3 Apr 2020 18:11:02 +0000 (UTC)
Date: Fri, 3 Apr 2020 12:11:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 6/8] vfio/type1: Bind guest page tables to host
Message-ID: <20200403121102.255f069c@w520.home>
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A220BA4@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-7-git-send-email-yi.l.liu@intel.com>
 <20200402135700.0da30021@w520.home>
 <A2975661238FB949B60364EF0F2C25743A220BA4@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, 
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, 
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Fri, 3 Apr 2020 13:30:49 +0000
"Liu, Yi L" <yi.l.liu@intel.com> wrote:

> Hi Alex,
> 
> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Friday, April 3, 2020 3:57 AM
> > To: Liu, Yi L <yi.l.liu@intel.com>
> > 
> > On Sun, 22 Mar 2020 05:32:03 -0700
> > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> >   
> > > From: Liu Yi L <yi.l.liu@intel.com>
> > >
> > > VFIO_TYPE1_NESTING_IOMMU is an IOMMU type which is backed by hardware
> > > IOMMUs that have nesting DMA translation (a.k.a dual stage address
> > > translation). For such hardware IOMMUs, there are two stages/levels of
> > > address translation, and software may let userspace/VM to own the first-
> > > level/stage-1 translation structures. Example of such usage is vSVA (
> > > virtual Shared Virtual Addressing). VM owns the first-level/stage-1
> > > translation structures and bind the structures to host, then hardware
> > > IOMMU would utilize nesting translation when doing DMA translation fo
> > > the devices behind such hardware IOMMU.
> > >
> > > This patch adds vfio support for binding guest translation (a.k.a stage 1)
> > > structure to host iommu. And for VFIO_TYPE1_NESTING_IOMMU, not only bind
> > > guest page table is needed, it also requires to expose interface to guest
> > > for iommu cache invalidation when guest modified the first-level/stage-1
> > > translation structures since hardware needs to be notified to flush stale
> > > iotlbs. This would be introduced in next patch.
> > >
> > > In this patch, guest page table bind and unbind are done by using flags
> > > VFIO_IOMMU_BIND_GUEST_PGTBL and VFIO_IOMMU_UNBIND_GUEST_PGTBL  
> > under IOCTL  
> > > VFIO_IOMMU_BIND, the bind/unbind data are conveyed by
> > > struct iommu_gpasid_bind_data. Before binding guest page table to host,
> > > VM should have got a PASID allocated by host via VFIO_IOMMU_PASID_REQUEST.
> > >
> > > Bind guest translation structures (here is guest page table) to host
> > > are the first step to setup vSVA (Virtual Shared Virtual Addressing).
> > >
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: Eric Auger <eric.auger@redhat.com>
> > > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.com>
> > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > ---
> > >  drivers/vfio/vfio_iommu_type1.c | 158  
> > ++++++++++++++++++++++++++++++++++++++++  
> > >  include/uapi/linux/vfio.h       |  46 ++++++++++++
> > >  2 files changed, 204 insertions(+)
> > >
> > > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > > index 82a9e0b..a877747 100644
> > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > @@ -130,6 +130,33 @@ struct vfio_regions {
> > >  #define IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)	\
> > >  					(!list_empty(&iommu->domain_list))
> > >
> > > +struct domain_capsule {
> > > +	struct iommu_domain *domain;
> > > +	void *data;
> > > +};
> > > +
> > > +/* iommu->lock must be held */
> > > +static int vfio_iommu_for_each_dev(struct vfio_iommu *iommu,
> > > +		      int (*fn)(struct device *dev, void *data),
> > > +		      void *data)
> > > +{
> > > +	struct domain_capsule dc = {.data = data};
> > > +	struct vfio_domain *d;
> > > +	struct vfio_group *g;
> > > +	int ret = 0;
> > > +
> > > +	list_for_each_entry(d, &iommu->domain_list, next) {
> > > +		dc.domain = d->domain;
> > > +		list_for_each_entry(g, &d->group_list, next) {
> > > +			ret = iommu_group_for_each_dev(g->iommu_group,
> > > +						       &dc, fn);
> > > +			if (ret)
> > > +				break;
> > > +		}
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > >  static int put_pfn(unsigned long pfn, int prot);
> > >
> > >  /*
> > > @@ -2314,6 +2341,88 @@ static int vfio_iommu_info_add_nesting_cap(struct  
> > vfio_iommu *iommu,  
> > >  	return 0;
> > >  }
> > >
> > > +static int vfio_bind_gpasid_fn(struct device *dev, void *data)
> > > +{
> > > +	struct domain_capsule *dc = (struct domain_capsule *)data;
> > > +	struct iommu_gpasid_bind_data *gbind_data =
> > > +		(struct iommu_gpasid_bind_data *) dc->data;
> > > +
> > > +	return iommu_sva_bind_gpasid(dc->domain, dev, gbind_data);
> > > +}
> > > +
> > > +static int vfio_unbind_gpasid_fn(struct device *dev, void *data)
> > > +{
> > > +	struct domain_capsule *dc = (struct domain_capsule *)data;
> > > +	struct iommu_gpasid_bind_data *gbind_data =
> > > +		(struct iommu_gpasid_bind_data *) dc->data;
> > > +
> > > +	return iommu_sva_unbind_gpasid(dc->domain, dev,
> > > +					gbind_data->hpasid);
> > > +}
> > > +
> > > +/**
> > > + * Unbind specific gpasid, caller of this function requires hold
> > > + * vfio_iommu->lock
> > > + */
> > > +static long vfio_iommu_type1_do_guest_unbind(struct vfio_iommu *iommu,
> > > +				struct iommu_gpasid_bind_data *gbind_data)
> > > +{
> > > +	return vfio_iommu_for_each_dev(iommu,
> > > +				vfio_unbind_gpasid_fn, gbind_data);
> > > +}
> > > +
> > > +static long vfio_iommu_type1_bind_gpasid(struct vfio_iommu *iommu,
> > > +				struct iommu_gpasid_bind_data *gbind_data)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&iommu->lock);
> > > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > > +		ret = -EINVAL;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	ret = vfio_iommu_for_each_dev(iommu,
> > > +			vfio_bind_gpasid_fn, gbind_data);
> > > +	/*
> > > +	 * If bind failed, it may not be a total failure. Some devices
> > > +	 * within the iommu group may have bind successfully. Although
> > > +	 * we don't enable pasid capability for non-singletion iommu
> > > +	 * groups, a unbind operation would be helpful to ensure no
> > > +	 * partial binding for an iommu group.  
> > 
> > Where was the non-singleton group restriction done, I missed that.  
> 
> Hmm, it's missed. thanks for spotting it. How about adding this
> check in the vfio_iommu_for_each_dev()? If looped a non-singleton
> group, just skip it. It applies to the cache_inv path all the
> same.

I don't really understand the singleton issue, which is why I was
surprised to see this since I didn't see a discussion previously.
Skipping a singleton group seems like unpredictable behavior to the
user though.

> > > +	 */
> > > +	if (ret)
> > > +		/*
> > > +		 * Undo all binds that already succeeded, no need to
> > > +		 * check the return value here since some device within
> > > +		 * the group has no successful bind when coming to this
> > > +		 * place switch.
> > > +		 */
> > > +		vfio_iommu_type1_do_guest_unbind(iommu, gbind_data);  
> > 
> > However, the for_each_dev function stops when the callback function
> > returns error, are we just assuming we stop at the same device as we
> > faulted on the first time and that we traverse the same set of devices
> > the second time?  It seems strange to me that unbind should be able to
> > fail.  
> 
> unbind can fail if a user attempts to unbind a pasid which is not belonged
> to it or a pasid which hasn't ever been bound. Otherwise, I didn't see a
> reason to fail.

Even if so, this doesn't address the first part of the question.  If
our for_each_dev() callback returns error then the loop stops and we
can't be sure we've triggered it everywhere that it needs to be
triggered.  There are also aspects of whether it's an error to unbind
something that is not bound because the result is still that the pasid
is unbound, right?

> > > +
> > > +out_unlock:
> > > +	mutex_unlock(&iommu->lock);
> > > +	return ret;
> > > +}
> > > +
> > > +static long vfio_iommu_type1_unbind_gpasid(struct vfio_iommu *iommu,
> > > +				struct iommu_gpasid_bind_data *gbind_data)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&iommu->lock);
> > > +	if (!IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu)) {
> > > +		ret = -EINVAL;
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	ret = vfio_iommu_type1_do_guest_unbind(iommu, gbind_data);  
> > 
> > How is a user supposed to respond to their unbind failing?  
> 
> If it's a malicious unbind (e.g. unbind a not yet bound pasid or unbind
> a pasid which doesn't belong to current user).

And if it's not a malicious unbind?  To me this is similar semantics to
free() failing.  Is there any remedy other than to abort?  Thanks,

Alex

> > > +
> > > +out_unlock:
> > > +	mutex_unlock(&iommu->lock);
> > > +	return ret;
> > > +}
> > > +
> > >  static long vfio_iommu_type1_ioctl(void *iommu_data,
> > >  				   unsigned int cmd, unsigned long arg)
> > >  {
> > > @@ -2471,6 +2580,55 @@ static long vfio_iommu_type1_ioctl(void  
> > *iommu_data,  
> > >  		default:
> > >  			return -EINVAL;
> > >  		}
> > > +
> > > +	} else if (cmd == VFIO_IOMMU_BIND) {
> > > +		struct vfio_iommu_type1_bind bind;
> > > +		u32 version;
> > > +		int data_size;
> > > +		void *gbind_data;
> > > +		int ret;
> > > +
> > > +		minsz = offsetofend(struct vfio_iommu_type1_bind, flags);
> > > +
> > > +		if (copy_from_user(&bind, (void __user *)arg, minsz))
> > > +			return -EFAULT;
> > > +
> > > +		if (bind.argsz < minsz)
> > > +			return -EINVAL;
> > > +
> > > +		/* Get the version of struct iommu_gpasid_bind_data */
> > > +		if (copy_from_user(&version,
> > > +			(void __user *) (arg + minsz),
> > > +					sizeof(version)))
> > > +			return -EFAULT;  
> > 
> > Why are we coping things from beyond the size we've validated that the
> > user has provided again?  
> 
> let me wait for the result in Jacob's thread below. looks like need
> to have a decision from you and Joreg. If using argsze is good, then
> I guess we don't need the version-to-size mapping. right? Actually,
> the version-to-size mapping is added to ensure vfio copy data correctly.
> https://lkml.org/lkml/2020/4/2/876
> 
> > > +
> > > +		data_size = iommu_uapi_get_data_size(
> > > +				IOMMU_UAPI_BIND_GPASID, version);
> > > +		gbind_data = kzalloc(data_size, GFP_KERNEL);
> > > +		if (!gbind_data)
> > > +			return -ENOMEM;
> > > +
> > > +		if (copy_from_user(gbind_data,
> > > +			 (void __user *) (arg + minsz), data_size)) {
> > > +			kfree(gbind_data);
> > > +			return -EFAULT;
> > > +		}  
> > 
> > And again.  argsz isn't just for minsz.
> >  
> > > +
> > > +		switch (bind.flags & VFIO_IOMMU_BIND_MASK) {
> > > +		case VFIO_IOMMU_BIND_GUEST_PGTBL:
> > > +			ret = vfio_iommu_type1_bind_gpasid(iommu,
> > > +							   gbind_data);
> > > +			break;
> > > +		case VFIO_IOMMU_UNBIND_GUEST_PGTBL:
> > > +			ret = vfio_iommu_type1_unbind_gpasid(iommu,
> > > +							     gbind_data);
> > > +			break;
> > > +		default:
> > > +			ret = -EINVAL;
> > > +			break;
> > > +		}
> > > +		kfree(gbind_data);
> > > +		return ret;
> > >  	}
> > >
> > >  	return -ENOTTY;
> > > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > > index ebeaf3e..2235bc6 100644
> > > --- a/include/uapi/linux/vfio.h
> > > +++ b/include/uapi/linux/vfio.h
> > > @@ -14,6 +14,7 @@
> > >
> > >  #include <linux/types.h>
> > >  #include <linux/ioctl.h>
> > > +#include <linux/iommu.h>
> > >
> > >  #define VFIO_API_VERSION	0
> > >
> > > @@ -853,6 +854,51 @@ struct vfio_iommu_type1_pasid_request {
> > >   */
> > >  #define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 22)
> > >
> > > +/**
> > > + * Supported flags:
> > > + *	- VFIO_IOMMU_BIND_GUEST_PGTBL: bind guest page tables to host for
> > > + *			nesting type IOMMUs. In @data field It takes struct
> > > + *			iommu_gpasid_bind_data.
> > > + *	- VFIO_IOMMU_UNBIND_GUEST_PGTBL: undo a bind guest page table  
> > operation  
> > > + *			invoked by VFIO_IOMMU_BIND_GUEST_PGTBL.  
> > 
> > This must require iommu_gpasid_bind_data in the data field as well,
> > right?  
> 
> yes.
> 
> Regards,
> Yi Liu
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
