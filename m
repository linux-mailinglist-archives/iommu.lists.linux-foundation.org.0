Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CE22444F
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 21:37:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F122587EE0;
	Fri, 17 Jul 2020 19:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNh7CMvRhUMN; Fri, 17 Jul 2020 19:37:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1BCC87EAF;
	Fri, 17 Jul 2020 19:37:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3E5DC0733;
	Fri, 17 Jul 2020 19:37:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D03CC0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 19:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 08A5F87EE3
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiF6diIopzH6 for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 19:37:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7582787EE0
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595014655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wf7sBj7qpPp3/65SbuC0yGngnSQ5SAaarcN51oLFweo=;
 b=J4n9veP/iQaPfZU4TupmvDxby8foT4BI0IP/7Kzr7Y1lEWXl3tnCq/jg65ciuVO+Un57Cv
 5WdCmPk6M2aU0rvxIEvCENrGwecRdrYxd7WsOyAHUd4pf/m3kTbL0dhhWYFnuX/3taWJCS
 2Y8+50mNNrWtF7TQMWPHl1ligAaV4Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-FH4QtK-YPgOE3PPSR8k2mA-1; Fri, 17 Jul 2020 15:37:31 -0400
X-MC-Unique: FH4QtK-YPgOE3PPSR8k2mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990BE18A1DE4;
 Fri, 17 Jul 2020 19:37:29 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA0F719724;
 Fri, 17 Jul 2020 19:37:25 +0000 (UTC)
Date: Fri, 17 Jul 2020 13:37:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v5 1/5] docs: IOMMU user API
Message-ID: <20200717133725.02d0057b@x1.home>
In-Reply-To: <1594925117-64892-2-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1594925117-64892-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1594925117-64892-2-git-send-email-jacob.jun.pan@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Thu, 16 Jul 2020 11:45:13 -0700
Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:

> IOMMU UAPI is newly introduced to support communications between guest
> virtual IOMMU and host IOMMU. There has been lots of discussions on how
> it should work with VFIO UAPI and userspace in general.
> 
> This document is indended to clarify the UAPI design and usage. The
> mechanics of how future extensions should be achieved are also covered
> in this documentation.
> 
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  Documentation/userspace-api/iommu.rst | 339 ++++++++++++++++++++++++++++++++++
>  1 file changed, 339 insertions(+)
>  create mode 100644 Documentation/userspace-api/iommu.rst
> 
> diff --git a/Documentation/userspace-api/iommu.rst b/Documentation/userspace-api/iommu.rst
> new file mode 100644
> index 000000000000..efc3e1838235
> --- /dev/null
> +++ b/Documentation/userspace-api/iommu.rst
> @@ -0,0 +1,339 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. iommu:
> +
> +=====================================
> +IOMMU Userspace API
> +=====================================
> +
> +IOMMU UAPI is used for virtualization cases where communications are
> +needed between physical and virtual IOMMU drivers. For native
> +usage, IOMMU is a system device which does not need to communicate
> +with user space directly.
> +
> +The primary use cases are guest Shared Virtual Address (SVA) and
> +guest IO virtual address (IOVA), wherein a virtual IOMMU (vIOMMU) is
> +required to communicate with the physical IOMMU in the host.
> +
> +.. contents:: :local:
> +
> +Functionalities
> +===============
> +Communications of user and kernel involve both directions. The
> +supported user-kernel APIs are as follows:
> +
> +1. Alloc/Free PASID
> +2. Bind/unbind guest PASID (e.g. Intel VT-d)
> +3. Bind/unbind guest PASID table (e.g. ARM sMMU)
> +4. Invalidate IOMMU caches
> +5. Service IO page faults (page request and response)
> +
> +Requirements
> +============
> +The IOMMU UAPIs are generic and extensible to meet the following
> +requirements:
> +
> +1. Emulated and para-virtualised vIOMMUs
> +2. Multiple vendors (Intel VT-d, ARM sMMU, etc.)
> +3. Extensions to the UAPI shall not break existing user space
> +
> +Interfaces
> +==========
> +Although the data structures defined in IOMMU UAPI are self-contained,
> +there is no user API functions introduced. Instead, IOMMU UAPI is
> +designed to work with existing user driver frameworks such as VFIO.
> +
> +Extension Rules & Precautions
> +-----------------------------
> +When IOMMU UAPI gets extended, the data structures can *only* be
> +modified in two ways:
> +
> +1. Adding new fields by re-purposing the padding[] field. No size change.
> +2. Adding new union members at the end. May increase in size.
> +
> +No new fields can be added *after* the variable sized union in that it
> +will break backward compatibility when offset moves. In both cases, a
> +new flag must be accompanied with a new field such that the IOMMU
> +driver can process the data based on the new flag. Version field is
> +only reserved for the unlikely event of UAPI upgrade at its entirety.
> +
> +It's *always* the caller's responsibility to indicate the size of the
> +structure passed by setting argsz appropriately.
> +Though at the same time, argsz is user provided data which is not
> +trusted. The argsz field allows the user to indicate how much data
> +they're providing, it's still the kernel's responsibility to validate
> +whether it's correct and sufficient for the requested operation.
> +
> +Compatibility Checking
> +----------------------
> +When IOMMU UAPI extension results in size increase, IOMMU UAPI core
> +and vendor driver shall handle the following cases:
> +
> +1. User and kernel has exact size match
> +2. An older user with older kernel header (smaller UAPI size) running on a
> +   newer kernel (larger UAPI size)
> +3. A newer user with newer kernel header (larger UAPI size) running
> +   on an older kernel.
> +4. A malicious/misbehaving user pass illegal/invalid size but within
> +   range. The data may contain garbage.
> +
> +Feature Checking
> +----------------
> +While launching a guest with vIOMMU, it is important to ensure that host
> +can support the UAPI data structures to be used for vIOMMU-pIOMMU
> +communications. Without upfront compatibility checking, future faults
> +are difficult to report even in normal conditions. For example, TLB
> +invalidations should always succeed. There is no architectural way to
> +report back to the vIOMMU if the UAPI data is incompatible. If that
> +happens, in order to protect IOMMU iosolation guarantee, we have to
> +resort to not giving completion status in vIOMMU. This may result in
> +VM hang.
> +
> +For this reason the following IOMMU UAPIs cannot fail:
> +
> +1. Free PASID
> +2. Unbind guest PASID
> +3. Unbind guest PASID table (SMMU)
> +4. Cache invalidate
> +
> +User applications such as QEMU are expected to import kernel UAPI
> +headers. Backward compatibility is supported per feature flags.
> +For example, an older QEMU (with older kernel header) can run on newer
> +kernel. Newer QEMU (with new kernel header) may refuse to initialize
> +on an older kernel if new feature flags are not supported by older
> +kernel. Simply recompiling existing code with newer kernel header should
> +not be an issue in that only existing flags are used.
> +
> +IOMMU vendor driver should report the below features to IOMMU UAPI
> +consumers (e.g. via VFIO).
> +
> +1. IOMMU_NESTING_FEAT_SYSWIDE_PASID
> +2. IOMMU_NESTING_FEAT_BIND_PGTBL
> +3. IOMMU_NESTING_FEAT_BIND_PASID_TABLE
> +4. IOMMU_NESTING_FEAT_CACHE_INVLD
> +5. IOMMU_NESTING_FEAT_PAGE_REQUEST
> +
> +Take VFIO as example, upon request from VFIO user space (e.g. QEMU),
> +VFIO kernel code shall query IOMMU vendor driver for the support of
> +the above features. Query result can then be reported back to the
> +user-space caller. Details can be found in
> +Documentation/driver-api/vfio.rst.
> +
> +
> +Data Passing Example with VFIO
> +------------------------------
> +As the ubiquitous userspace driver framework, VFIO is already IOMMU
> +aware and shares many key concepts such as device model, group, and
> +protection domain. Other user driver frameworks can also be extended
> +to support IOMMU UAPI but it is outside the scope of this document.
> +
> +In this tight-knit VFIO-IOMMU interface, the ultimate consumer of the
> +IOMMU UAPI data is the host IOMMU driver. VFIO facilitates user-kernel
> +transport, capability checking, security, and life cycle management of
> +process address space ID (PASID).
> +
> +Unlike normal user data passed via VFIO UAPI IOTCL, IOMMU driver is the
> +ultimate consumer of its UAPI data. At VFIO layer, the IOMMU UAPI data
> +is wrapped in a VFIO UAPI data. It follows the
> +pattern below::
> +
> +   struct {
> +	__u32 argsz;
> +	__u32 flags;
> +	__u8  data[];
> +   };
> +
> +Here data[] contains the IOMMU UAPI data structures. VFIO has the
> +freedom to bundle the data as well as parse data size based on its own flags.
> +
> +In order to determine the size and feature set of the user data, argsz
> +and flags are also embedded in the IOMMU UAPI data structures.
> +A "__u32 argsz" field is *always* at the beginning of each structure.
> +
> +For example:
> +::
> +
> +   struct iommu_cache_invalidate_info {
> +	__u32	argsz;
> +	#define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
> +	__u32	version;
> +	/* IOMMU paging structure cache */
> +	#define IOMMU_CACHE_INV_TYPE_IOTLB	(1 << 0) /* IOMMU IOTLB */
> +	#define IOMMU_CACHE_INV_TYPE_DEV_IOTLB	(1 << 1) /* Device IOTLB */
> +	#define IOMMU_CACHE_INV_TYPE_PASID	(1 << 2) /* PASID cache */
> +	#define IOMMU_CACHE_INV_TYPE_NR		(3)
> +	__u8	cache;
> +	__u8	granularity;
> +	__u8	padding[6];
> +	union {
> +		struct iommu_inv_pasid_info pasid_info;
> +		struct iommu_inv_addr_info addr_info;
> +	} granu;
> +   };
> +
> +VFIO is responsible for checking its own argsz and flags then invokes
> +appropriate IOMMU UAPI functions. User pointer is passed to IOMMU
> +layer for further processing. The responsibilities are divided as
> +follows:
> +
> +- Generic IOMMU layer checks argsz range based on UAPI data in the
> +  current kernel version
> +
> +- Generic IOMMU layer checks content of the UAPI data for non-zero
> +  reserved bits in flags, padding fields, and unsupported version.
> +  This is to ensure not breaking userspace in the future when these
> +  fields or flags are used.
> +
> +- Vendor IOMMU driver checks argsz based on vendor flags, UAPI data
> +  is consumed based on flags. Vendor driver has access to
> +  unadulterated argsz value in case of vendor specific future
> +  extensions.
> +
> +To illustrate the two cases with and without vendor data, cache
> +invalidation and bind guest PASID are given as examples respectively.
> +
> +Example 1: Guest issues IOTLB invalidation, all guest provided data
> +are generic. Vendor driver does not need to check argsz.
> +
> +::
> +
> + static int iommu_check_cache_invl_data(struct iommu_cache_invalidate_info *info)
> + {
> +	u32 mask;
> +
> +	if (info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
> +		return -EINVAL;
> +
> +	mask = (1 << IOMMU_CACHE_INV_TYPE_NR) - 1;
> +	if (info->cache & ~mask)
> +		return -EINVAL;
> +
> +	if (info->granularity >= IOMMU_INV_GRANU_NR)
> +		return -EINVAL;
> +


The table defining valid cache/granularity combinations specifically
indicates the following are not available:

 IOMMU_INV_GRANU_DOMAIN + IOMMU_CACHE_INV_TYPE_DEV_IOTLB
 IOMMU_INV_GRANU_ADDR + IOMMU_CACHE_INV_TYPE_PASID

So shouldn't we also have the following rejected?

> +	switch (info->granularity) {
> +	case IOMMU_INV_GRANU_ADDR:

		if (info->cache & IOMMU_CACHE_INV_TYPE_PASID)
			return -EINVAL;

> +		mask = IOMMU_INV_ADDR_FLAGS_PASID |
> +			IOMMU_INV_ADDR_FLAGS_ARCHID |
> +			IOMMU_INV_ADDR_FLAGS_LEAF;
> +
> +		if (info->granu.addr_info.flags & ~mask)
> +			return -EINVAL;
> +		break;
> +	case IOMMU_INV_GRANU_PASID:
> +		mask = IOMMU_INV_PASID_FLAGS_PASID |
> +			IOMMU_INV_PASID_FLAGS_ARCHID;
> +		if (info->granu.pasid_info.flags & ~mask)
> +			return -EINVAL;
> +
> +		break;
> +	case IOMMU_INV_GRANU_DOMAIN:
> +		/* No flags to check */

		if (info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB)
			return -EINVAL;

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (info->padding[0] || info->padding[1])

More padding bytes to test now.

> +		return -EINVAL;
> +
> +	return 0;
> + }
> +
> + int iommu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
> +			   void __user *uinfo)
> + {
> +	struct iommu_cache_invalidate_info inv_info = { 0 };
> +	u32 minsz, maxsz;
> +	int ret = 0;
> +
> +	if (unlikely(!domain->ops->cache_invalidate))
> +		return -ENODEV;
> +
> +	/* Current kernel data size is the max to be copied from user */
> +	maxsz = sizeof(struct iommu_cache_invalidate_info);
> +
> +	/*
> +	 * No new spaces can be added before the variable sized union, the
> +	 * minimum size is the offset to the union.
> +	 */
> +	minsz = offsetof(struct iommu_cache_invalidate_info, granu);
> +
> +	/* Copy minsz from user to get flags and argsz */
> +	if (copy_from_user(&inv_info, uinfo, minsz))
> +		return -EFAULT;
> +
> +	/* Fields before variable size union is mandatory */
> +	if (inv_info.argsz < minsz)
> +		return -EINVAL;
> +
> +	/* PASID and address granu requires additional info beyond minsz */
> +	if (inv_info.argsz == minsz &&
> +		((inv_info.granularity == IOMMU_INV_GRANU_PASID) ||
> +			(inv_info.granularity == IOMMU_INV_GRANU_ADDR)))
> +		return -EINVAL;

We only validated that argsz is at least (minsz + 1).

> +	/*
> +	 * User might be using a newer UAPI header which has a larger data
> +	 * size, we shall support the existing flags within the current
> +	 * size. Copy the remaining user data _after_ minsz but not more
> +	 * than the current kernel supported size.
> +	 */
> +	if (copy_from_user((void *)&inv_info + minsz, uinfo + minsz,
> +				min(inv_info.argsz, maxsz) - minsz))
> +		return -EFAULT;
> +
> +	/* Now the argsz is validated, check the content */

If we want to assert that IOMMU_INV_GRANU_PASID requires a struct
iommu_inv_pasid_info and IOMMU_INV_GRANU_ADDR requires a struct
iommu_inv_addr_info, then we've done a pretty poor job of validating
argsz against that.  Do you want the switch in
iommu_check_cache_invl_data() to also check info->argsz in the pasid
and addr cases?  If so, we could always copy min(argsz, sizeof) and
remove the previous check.

> +	ret = iommu_check_cache_invl_data(&inv_info);
> +	if (ret)
> +		return ret;
> +
> +	return domain->ops->cache_invalidate(domain, dev, &inv_info);
> + }
> + EXPORT_SYMBOL_GPL(iommu_cache_invalidate);
> +
> +
> +Example 2: Bind guest PASID which includes vendor specific data.
> +The IOMMU core processing of UAPI data follows the same flow as
> +Example 1. Vendor driver handles the additional vendor specific flags
> +as in VT-d driver below:
> +
> +::
> +
> + int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
> +			  struct iommu_gpasid_bind_data *data)
> + {
> +	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
> +	struct dmar_domain *dmar_domain;
> +	struct intel_svm_dev *sdev;
> +	struct intel_svm *svm;
> +	int ret = 0;
> +
> +	if (WARN_ON(!iommu) || !data)
> +		return -EINVAL;
> +
> +	if (data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
> +		return -EINVAL;
> +
> +	/* IOMMU core ensures argsz is more than the start of the union */
> +	if (data->argsz < offsetofend(struct iommu_gpasid_bind_data,
> +            vendor.vtd))
> +		return -EINVAL;

So at this point the vendor driver assumes the core has copied
min(argsz, sizeof(uapi struct)) and it only needs to validate, not
perform the copy itself (until we get to some future scenario where
there's vendor data outside of the structure definition and we'll need
to provide a __user pointer for the vendor driver to fetch it).

> +   ...
> + }
> +
> +
> +Sharing UAPI with in-kernel users
> +---------------------------------
> +For UAPIs that are shared with in-kernel users, a wrapper function is
> +provided to distinguish the callers. For example,
> +
> +Userspace caller ::
> +
> +  int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
> +                                   struct device *dev,
> +                                   void __user *udata)
> +
> +In-kernel caller ::
> +
> +  int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
> +                                   struct device *dev,
> +                                   struct iommu_gpasid_bind_data *data)

Shouldn't we start that precedent with the iommu_cache_invalidate()
example above?  The "that are shared with in-kernel users" qualifier
doesn't really make sense to me, then we'll have uapi functions named
as if they're in-kernel just because there isn't an in-kernel user yet.
That's inconsistency that'll get us into trouble.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
