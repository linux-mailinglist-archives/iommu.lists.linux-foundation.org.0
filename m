Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47330218AF2
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 17:15:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 02BE4877E1;
	Wed,  8 Jul 2020 15:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95drLCq2nmSn; Wed,  8 Jul 2020 15:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8658F86B04;
	Wed,  8 Jul 2020 15:15:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F0E1C016F;
	Wed,  8 Jul 2020 15:15:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A152C077B
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 01FAD86B04
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rhySL+H2S01 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 15:15:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BF85988E89
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 15:15:06 +0000 (UTC)
IronPort-SDR: +dfK3Bx888+VuqbYob70GIvG6UNEwkuMrmz/9mamjPfVoQKVzpVBiNFl5JbLxHeDA/ArBVvf1D
 4vwvj2bM7X9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="147825145"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="147825145"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 08:15:06 -0700
IronPort-SDR: Sn8uiaMZ/RhlF97mg7zR3+EnFHRYzkT/OMKZnH6wpEWYeIen14LVgd8m6/QDC7tLeDYLIFspS3
 JLFLqXmVlDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="457536094"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 08 Jul 2020 08:15:06 -0700
Date: Wed, 8 Jul 2020 08:21:45 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 1/5] docs: IOMMU user API
Message-ID: <20200708082145.016d1f04@jacob-builder>
In-Reply-To: <20200707154054.0893c30d@x1.home>
References: <1592931837-58223-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1592931837-58223-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200626161923.339e17a6@w520.home>
 <20200629160518.471159cf@jacob-builder>
 <20200707154054.0893c30d@x1.home>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Christoph
 Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

All points below are taken. I have sent out v4 that addresses these
feedbacks. Thanks for the review.

Jacob

On Tue, 7 Jul 2020 15:40:54 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Mon, 29 Jun 2020 16:05:18 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
> > On Fri, 26 Jun 2020 16:19:23 -0600
> > Alex Williamson <alex.williamson@redhat.com> wrote:
> >   
> > > On Tue, 23 Jun 2020 10:03:53 -0700
> > > Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> > >     
> > > > IOMMU UAPI is newly introduced to support communications between
> > > > guest virtual IOMMU and host IOMMU. There has been lots of
> > > > discussions on how it should work with VFIO UAPI and userspace
> > > > in general.
> > > > 
> > > > This document is indended to clarify the UAPI design and usage.
> > > > The mechenics of how future extensions should be achieved are
> > > > also covered in this documentation.
> > > > 
> > > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > > > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > > ---
> > > >  Documentation/userspace-api/iommu.rst | 244
> > > > ++++++++++++++++++++++++++++++++++ 1 file changed, 244
> > > > insertions(+) create mode 100644
> > > > Documentation/userspace-api/iommu.rst
> > > > 
> > > > diff --git a/Documentation/userspace-api/iommu.rst
> > > > b/Documentation/userspace-api/iommu.rst new file mode 100644
> > > > index 000000000000..f9e4ed90a413
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/iommu.rst
> > > > @@ -0,0 +1,244 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +.. iommu:
> > > > +
> > > > +=====================================
> > > > +IOMMU Userspace API
> > > > +=====================================
> > > > +
> > > > +IOMMU UAPI is used for virtualization cases where
> > > > communications are +needed between physical and virtual IOMMU
> > > > drivers. For native +usage, IOMMU is a system device which does
> > > > not need to communicate +with user space directly.
> > > > +
> > > > +The primary use cases are guest Shared Virtual Address (SVA)
> > > > and +guest IO virtual address (IOVA), wherein a virtual IOMMU
> > > > (vIOMMU) is +required to communicate with the physical IOMMU in
> > > > the host. +
> > > > +.. contents:: :local:
> > > > +
> > > > +Functionalities
> > > > +===============
> > > > +Communications of user and kernel involve both directions. The
> > > > +supported user-kernel APIs are as follows:
> > > > +
> > > > +1. Alloc/Free PASID
> > > > +2. Bind/unbind guest PASID (e.g. Intel VT-d)
> > > > +3. Bind/unbind guest PASID table (e.g. ARM sMMU)
> > > > +4. Invalidate IOMMU caches
> > > > +5. Service page requests
> > > > +
> > > > +Requirements
> > > > +============
> > > > +The IOMMU UAPIs are generic and extensible to meet the
> > > > following +requirements:
> > > > +
> > > > +1. Emulated and para-virtualised vIOMMUs
> > > > +2. Multiple vendors (Intel VT-d, ARM sMMU, etc.)
> > > > +3. Extensions to the UAPI shall not break existing user space
> > > > +
> > > > +Interfaces
> > > > +==========
> > > > +Although the data structures defined in IOMMU UAPI are
> > > > self-contained, +there is no user API functions introduced.
> > > > Instead, IOMMU UAPI is +designed to work with existing user
> > > > driver frameworks such as VFIO. +
> > > > +Extension Rules & Precautions
> > > > +-----------------------------
> > > > +When IOMMU UAPI gets extended, the data structures can *only*
> > > > be +modified in two ways:
> > > > +
> > > > +1. Adding new fields by re-purposing the padding[] field. No
> > > > size change. +2. Adding new union members at the end. May
> > > > increase in size. +
> > > > +No new fields can be added *after* the variable sized union in
> > > > that it +will break backward compatibility when offset moves. In
> > > > both cases, a +new flag must be accompanied with a new field
> > > > such that the IOMMU +driver can process the data based on the
> > > > new flag. Version field is +only reserved for the unlikely
> > > > event of UAPI upgrade at its entirety. +
> > > > +It's *always* the caller's responsibility to indicate the size
> > > > of the +structure passed by setting argsz appropriately.
> > > > +Though at the same time, argsz is user provided data which is
> > > > not +trusted. The argsz field allows the user to indicate how
> > > > much data +they're providing, it's still the kernel's
> > > > responsibility to validate +whether it's correct and sufficient
> > > > for the requested operation. +
> > > > +Compatibility Checking
> > > > +----------------------
> > > > +When IOMMU UAPI extension results in size increase, user such
> > > > as VFIO +has to handle the following cases:
> > > > +
> > > > +1. User and kernel has exact size match
> > > > +2. An older user with older kernel header (smaller UAPI size)
> > > > running on a
> > > > +   newer kernel (larger UAPI size)
> > > > +3. A newer user with newer kernel header (larger UAPI size)
> > > > running
> > > > +   on an older kernel.
> > > > +4. A malicious/misbehaving user pass illegal/invalid size but
> > > > within
> > > > +   range. The data may contain garbage.      
> > > 
> > > What exactly does vfio need to do to handle these?
> > >     
> > VFIO does nothing other than returning the status from IOMMU driver.
> > Based on the return status, users such as QEMU can cause fault
> > conditions within the vIOMMU.
> >   
> > > > +
> > > > +Feature Checking
> > > > +----------------
> > > > +While launching a guest with vIOMMU, it is important to ensure
> > > > that host +can support the UAPI data structures to be used for
> > > > vIOMMU-pIOMMU +communications. Without upfront compatibility
> > > > checking, future faults +are difficult to report even in normal
> > > > conditions. For example, TLB +invalidations should always
> > > > succeed. There is no architectural way to +report back to the
> > > > vIOMMU if the UAPI data is incompatible. If that +happens, in
> > > > order to protect IOMMU iosolation guarantee, we have to +resort
> > > > to not giving completion status in vIOMMU. This may result in
> > > > +VM hang. +
> > > > +For this reason the following IOMMU UAPIs cannot fail:
> > > > +
> > > > +1. Free PASID
> > > > +2. Unbind guest PASID
> > > > +3. Unbind guest PASID table (SMMU)
> > > > +4. Cache invalidate
> > > > +
> > > > +User applications such as QEMU is expected to import kernel
> > > > UAPI +headers. Backward compatibility is supported per feature
> > > > flags. +For example, an older QEMU (with older kernel header)
> > > > can run on newer +kernel. Newer QEMU (with new kernel header)
> > > > may refuse to initialize +on an older kernel if new feature
> > > > flags are not supported by older +kernel. Simply recompile
> > > > existing code with newer kernel header should +not be an issue
> > > > in that only existing flags are used. +
> > > > +IOMMU vendor driver should report the below features to IOMMU
> > > > UAPI +consumers (e.g. via VFIO).
> > > > +
> > > > +1. IOMMU_NESTING_FEAT_SYSWIDE_PASID
> > > > +2. IOMMU_NESTING_FEAT_BIND_PGTBL
> > > > +3. IOMMU_NESTING_FEAT_BIND_PASID_TABLE
> > > > +4. IOMMU_NESTING_FEAT_CACHE_INVLD
> > > > +5. IOMMU_NESTING_FEAT_PAGE_REQUEST
> > > > +
> > > > +Take VFIO as example, upon request from VFIO user space (e.g.
> > > > QEMU), +VFIO kernel code shall query IOMMU vendor driver for the
> > > > support of +the above features. Query result can then be
> > > > reported back to the +user-space caller. Details can be found in
> > > > +Documentation/driver-api/vfio.rst.
> > > > +
> > > > +
> > > > +Data Passing Example with VFIO
> > > > +------------------------------
> > > > +As the ubiquitous userspace driver framework, VFIO is already
> > > > IOMMU +aware and share many key concepts such as device model,
> > > > group, and +protection domain. Other user driver frameworks can
> > > > also be extended +to support IOMMU UAPI but it is outside the
> > > > scope of this document. +
> > > > +In this tight-knit VFIO-IOMMU interface, the ultimate consumer
> > > > of the +IOMMU UAPI data is the host IOMMU driver. VFIO
> > > > facilitates user-kernel +transport, capability checking,
> > > > security, and life cycle management of +process address space
> > > > ID (PASID). +
> > > > +Unlike normal user data passed via VFIO UAPI IOTCL, IOMMU
> > > > driver is the +ultimate consumer of its UAPI data. At VFIO
> > > > layer, the IOMMU UAPI data +is wrapped in a VFIO UAPI data. It
> > > > follows the +pattern below::
> > > > +
> > > > +   struct {
> > > > +	__u32 argsz;
> > > > +	__u32 flags;
> > > > +	__u8  data[];
> > > > +   };
> > > > +
> > > > +Here data[] contains the IOMMU UAPI data structures. VFIO has
> > > > the +freedom to bundle the data as well as parse data size
> > > > based on its own flags. +
> > > > +In order to determine the size and feature set of the user
> > > > data, argsz +and flags are also embedded in the IOMMU UAPI data
> > > > structures. +A "__u32 argsz" field is *always* at the beginning
> > > > of each structure. +
> > > > +For example:
> > > > +::
> > > > +
> > > > +   struct iommu_cache_invalidate_info {
> > > > +	__u32	argsz;
> > > > +	#define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
> > > > +	__u32	version;
> > > > +	/* IOMMU paging structure cache */
> > > > +	#define IOMMU_CACHE_INV_TYPE_IOTLB	(1 << 0) /*
> > > > IOMMU IOTLB */
> > > > +	#define IOMMU_CACHE_INV_TYPE_DEV_IOTLB	(1 <<
> > > > 1) /* Device IOTLB */
> > > > +	#define IOMMU_CACHE_INV_TYPE_PASID	(1 << 2) /*
> > > > PASID cache */
> > > > +	#define IOMMU_CACHE_INV_TYPE_NR		(3)
> > > > +	__u8	cache;
> > > > +	__u8	granularity;
> > > > +	__u8	padding[2];
> > > > +	union {
> > > > +		struct iommu_inv_pasid_info pasid_info;
> > > > +		struct iommu_inv_addr_info addr_info;
> > > > +	} granu;
> > > > +   };
> > > > +
> > > > +VFIO is responsible for checking its own argsz and flags then
> > > > invokes +appropriate IOMMU UAPI functions. User pointer is
> > > > passed to IOMMU +layer for further processing. The
> > > > responsibilities are divided as +follows:
> > > > +
> > > > +- Generic IOMMU layer checks argsz range and override
> > > > out-of-range
> > > > +  value. If the exact argsz is based on generic flags, they are
> > > > checked
> > > > +  here as well.
> > > > +
> > > > +- Vendor IOMMU driver checks argsz based on vendor flags, UAPI
> > > > data
> > > > +  is consumed based on flags
> > > > +
> > > > +Once again, use guest TLB invalidation as an example, argsz is
> > > > based +on generic flags in the invalidation information. IOMMU
> > > > generic code +shall process the UAPI data as the following:
> > > > +
> > > > +::
> > > > +
> > > > + int iommu_cache_invalidate(struct iommu_domain *domain, struct
> > > > device *dev,
> > > > +			void __user *uinfo)
> > > > + {
> > > > +	/* Current kernel data size is the max to be copied
> > > > from user */
> > > > +	maxsz = sizeof(struct iommu_cache_invalidate_info);
> > > > +	memset((void *)&inv_info, 0, maxsz);
> > > > +
> > > > +	/*
> > > > +	 * No new spaces can be added before the variable sized
> > > > union, the
> > > > +	 * minimum size is the offset to the union.
> > > > +	 */
> > > > +	minsz = offsetof(struct iommu_cache_invalidate_info,
> > > > granu); +
> > > > +	/* Copy minsz from user to get flags and argsz */
> > > > +	if (copy_from_user(&inv_info, uinfo, minsz))
> > > > +		return -EFAULT;
> > > > +
> > > > +	/* Fields before variable size union is mandatory */
> > > > +	if (inv_info.argsz < minsz)
> > > > +		return -EINVAL;
> > > > +	/*
> > > > +	 * User might be using a newer UAPI header which has a
> > > > larger data
> > > > +	 * size, we shall support the existing flags within the
> > > > current
> > > > +	 * size.
> > > > +	 */
> > > > +	if (inv_info.argsz > maxsz)
> > > > +		inv_info.argsz = maxsz;
> > > > +
> > > > +	/* Checking the exact argsz based on generic flags */
> > > > +	if (inv_info.granularity == IOMMU_INV_GRANU_ADDR &&
> > > > +		inv_info.argsz != offsetofend(struct
> > > > iommu_cache_invalidate_info,
> > > > +					granu.addr_info))      
> > > 
> > > Is it really reasonable to expect the user to specify argsz to the
> > > exact union element for the callback?  I'd certainly expect users
> > > to simply use sizeof(struct iommu_cache_invalidate_info) and it
> > > should therefore be sufficient to test >= here rather than jump
> > > through hoops with an exact size.  We're already changing
> > > inv_info.argsz above to fit our known structure, it's
> > > inconsistent to then expect it to be some exact value.
> > >      
> > I was thinking argsz doesn't have to be the exact struct size. It
> > should be whatever the sufficient & correct size used by the user
> > for a given call.
> > 
> > For example, current struct iommu_gpasid_bind_data {} only has VT-d
> > data. If it gets extended with SMMU data in the union, VT-d vIOMMU
> > emulation should only fill the union size of vt-d.  
> 
> But the user is simply going to have a struct iommu_gpasid_bind_data
> and set argsz to sizeof that struct.  The user is providing that
> entire struct as the arg, so it doesn't really make sense to pinpoint
> the last field of the union they chose to use.  The fields of the
> structure define which union is applicable.  If you're following the
> vfio interface as an example, sufficiently sized is all we require,
> we don't ask for union member level granularity, which I think is
> confusing and error prone for users.
> 
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (inv_info.granularity == IOMMU_INV_GRANU_PASID &&
> > > > +		inv_info.argsz != offsetofend(struct
> > > > iommu_cache_invalidate_info,
> > > > +					granu.pasid_info))
> > > > +		return -EINVAL;
> > > > +
> > > > +	/* Copy the remaining user data _after_ minsz */
> > > > +	if (copy_from_user((void *)&inv_info + minsz, uinfo +
> > > > minsz,
> > > > +				inv_info.argsz - minsz))
> > > > +		return -EFAULT;
> > > > +
> > > > +	return domain->ops->cache_invalidate(domain, dev,
> > > > &inv_info);
> > > > + }
> > > > + Add a wrapper
> > > > +   __iommu_unbind_( kernel data, same user data, kernel copy)
> > > > +    
> > This should be removed. Sorry about the confusion. The patch does
> > not have two data pointers, just separate APIs for kernel and user.
> >   
> > > > +Notice that in this example, since union size is determined by
> > > > generic +flags, all checking to argsz is validated in the
> > > > generic IOMMU layer, +vendor driver does not need to check
> > > > argsz. However, if union size is +based on vendor data, such as
> > > > iommu_sva_bind_gpasid(), it will be +vendor driver's
> > > > responsibility to validate the exact argsz.      
> > > 
> > > struct iommu_cache_invalidate_info is a good example because it
> > > explicitly states a table of type vs granularity validity.  When
> > > the cache_invalidate() callback is used by an internal user we can
> > > consider it a bug in the caller if its usage falls outside of
> > > these prescribed valid combinations, ie. iommu_ops callbacks may
> > > assume a trusted caller that isn't trying to exploit any
> > > loophole.    
> > Separate APIs are proposed in the patchset to address UAPIs
> > with both kernel and user callers. Sorry about the last line in the
> > example above. Currently, only unbind_gpasid() and page_response()
> > have both kernel and userspace callers. e.g.
> > 
> >    /* userspace caller */
> >    int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct
> > device *dev, void __user *udata)
> > 
> >    /* in-kernel caller */
> >    int __iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> > struct device *dev, struct iommu_gpasid_bind_data *data)
> > 
> > We don;t expect in-kernel caller for cache invalidate in that it is
> > implied in unmap, unbind operations.  
> 
> That specific function was only an example of an interface which has
> invalid combinations where in-kernel it's the caller's responsibility
> to abide by the rules, but a user interface needs further validation.
> 
> > >  But here
> > > we've done nothing more than validated the supplied size to pass
> > > it through to a non-user hardened callback.  We didn't check the
> > > version,    
> > Yes, I should move up the version check from vendor driver.
> >   
> > > we didn't check that any of the undefined bits in cache or
> > > granularity or padding were set, we don't know what flags might be
> > > set in the union elements.    
> > You are right, we should sanitize reserved bits.
> >   
> > > For example, if a user is able to set a
> > > flag that gets ignored now, that means we can never use that flag
> > > without potentially breaking that user in the future.    
> > Good point, all reserved/unused bits should be tested.
> >   
> > >  If a user can
> > > pass in version 3141592654 now, then we can never use version for
> > > validation.  I see that intel_iommu_sva_invalidate() does test the
> > > version, but has no obvious other hardening.  I'm afraid we're
> > > being far to lax about accepting a data structure provided by a
> > > user, we should not assume good faith. Thanks,
> > >     
> > Agreed. will add checks in the IOMMU generic layer for reserved
> > bits.
> > For VT-d vendor driver, we do check all bits in cache types, i.e. in
> > intel/iommu.c
> > 	for_each_set_bit(cache_type,
> > 			 (unsigned long *)&inv_info->cache,
> > 			 IOMMU_CACHE_INV_TYPE_NR) {
> > 
> > 
> > one other hardening is to check vendor argsz. This is in the
> > bind_gpasid call.
> > 
> > 	if (data->argsz != offsetofend(struct
> > iommu_gpasid_bind_data, vendor.vtd)) return -EINVAL;  
> 
> This is the same issue I raise above whether this is actually too
> strict.  The user is providing a full structure as the arg, the
> structure defines the valid fields via its content, it shouldn't be
> necessary to have field level granularity for argsz.  Thanks,
> 
> Alex
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
