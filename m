Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4E4B7DF4
	for <lists.iommu@lfdr.de>; Wed, 16 Feb 2022 03:54:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34201415EF;
	Wed, 16 Feb 2022 02:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IOj8-97jIQR; Wed, 16 Feb 2022 02:54:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C5936415E9;
	Wed, 16 Feb 2022 02:54:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0ED2C0039;
	Wed, 16 Feb 2022 02:54:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6DD2C000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96F6B4159A
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50P0WZsAs6kd for <iommu@lists.linux-foundation.org>;
 Wed, 16 Feb 2022 02:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 669974156D
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644980075; x=1676516075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OfiIKGECMmKWIZdyAKnC6AGYcHMY+gDCtpwstX1p17A=;
 b=Cdvta9FspQTHnCIxnwCPwK4ZzUAJCvIPrmxpcOQJIO1p2aGvoepIdVoD
 4/ApgkU5n9SmdT9dl+3eA1PRykinsDqHgYTEaiN6kVUBTfsjp/hUBRF8t
 K62jii3R9clVvKgKduQlaad2GIOYfvnfNqS14faI/jvE/w/31SOE0MbJA
 ItmjhlU6kDFjbmKStWgRZcMbPzU2GwVaWvJu+mptHiXKrELQrm2ttRnUW
 4K3bqM4aTlwMHZWkaWPUnSumIGZ9MIf/kLW68Pjb0VU7TKdToCCgDblr7
 3PVCf04lINXA9MdX/mpvO0VqHj4dqkabuwqh4OKDOLd7R/2/HGx9D10Xp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248106864"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="248106864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 18:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="681312411"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 18:54:30 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 2/9] iommu: Remove guest pasid related interfaces and
 definitions
Date: Wed, 16 Feb 2022 10:52:42 +0800
Message-Id: <20220216025249.3459465-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>
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

The guest pasid related uapi interfaces and definitions are not referenced
anywhere in the tree. We've also reached a consensus to replace them with
a new iommufd design. Remove them to avoid dead code.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h      |  44 --------
 include/uapi/linux/iommu.h | 181 --------------------------------
 drivers/iommu/iommu.c      | 210 -------------------------------------
 3 files changed, 435 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index de0c57a567c8..cde1d0aad60f 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -229,9 +229,6 @@ struct iommu_iotlb_gather {
  * @sva_unbind: Unbind process address space from device
  * @sva_get_pasid: Get PASID associated to a SVA handle
  * @page_response: handle page request response
- * @cache_invalidate: invalidate translation caches
- * @sva_bind_gpasid: bind guest pasid and mm
- * @sva_unbind_gpasid: unbind guest pasid and mm
  * @def_domain_type: device default domain type, return value:
  *		- IOMMU_DOMAIN_IDENTITY: must use an identity domain
  *		- IOMMU_DOMAIN_DMA: must use a dma domain
@@ -301,12 +298,6 @@ struct iommu_ops {
 	int (*page_response)(struct device *dev,
 			     struct iommu_fault_event *evt,
 			     struct iommu_page_response *msg);
-	int (*cache_invalidate)(struct iommu_domain *domain, struct device *dev,
-				struct iommu_cache_invalidate_info *inv_info);
-	int (*sva_bind_gpasid)(struct iommu_domain *domain,
-			struct device *dev, struct iommu_gpasid_bind_data *data);
-
-	int (*sva_unbind_gpasid)(struct device *dev, u32 pasid);
 
 	int (*def_domain_type)(struct device *dev);
 
@@ -421,14 +412,6 @@ extern int iommu_attach_device(struct iommu_domain *domain,
 			       struct device *dev);
 extern void iommu_detach_device(struct iommu_domain *domain,
 				struct device *dev);
-extern int iommu_uapi_cache_invalidate(struct iommu_domain *domain,
-				       struct device *dev,
-				       void __user *uinfo);
-
-extern int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
-				      struct device *dev, void __user *udata);
-extern int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
-					struct device *dev, void __user *udata);
 extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
 				   struct device *dev, ioasid_t pasid);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
@@ -1051,33 +1034,6 @@ static inline u32 iommu_sva_get_pasid(struct iommu_sva *handle)
 	return IOMMU_PASID_INVALID;
 }
 
-static inline int
-iommu_uapi_cache_invalidate(struct iommu_domain *domain,
-			    struct device *dev,
-			    struct iommu_cache_invalidate_info *inv_info)
-{
-	return -ENODEV;
-}
-
-static inline int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain,
-					     struct device *dev, void __user *udata)
-{
-	return -ENODEV;
-}
-
-static inline int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain,
-					       struct device *dev, void __user *udata)
-{
-	return -ENODEV;
-}
-
-static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-					  struct device *dev,
-					  ioasid_t pasid)
-{
-	return -ENODEV;
-}
-
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
 	return NULL;
diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index 59178fc229ca..65d8b0234f69 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -158,185 +158,4 @@ struct iommu_page_response {
 	__u32	code;
 };
 
-/* defines the granularity of the invalidation */
-enum iommu_inv_granularity {
-	IOMMU_INV_GRANU_DOMAIN,	/* domain-selective invalidation */
-	IOMMU_INV_GRANU_PASID,	/* PASID-selective invalidation */
-	IOMMU_INV_GRANU_ADDR,	/* page-selective invalidation */
-	IOMMU_INV_GRANU_NR,	/* number of invalidation granularities */
-};
-
-/**
- * struct iommu_inv_addr_info - Address Selective Invalidation Structure
- *
- * @flags: indicates the granularity of the address-selective invalidation
- * - If the PASID bit is set, the @pasid field is populated and the invalidation
- *   relates to cache entries tagged with this PASID and matching the address
- *   range.
- * - If ARCHID bit is set, @archid is populated and the invalidation relates
- *   to cache entries tagged with this architecture specific ID and matching
- *   the address range.
- * - Both PASID and ARCHID can be set as they may tag different caches.
- * - If neither PASID or ARCHID is set, global addr invalidation applies.
- * - The LEAF flag indicates whether only the leaf PTE caching needs to be
- *   invalidated and other paging structure caches can be preserved.
- * @pasid: process address space ID
- * @archid: architecture-specific ID
- * @addr: first stage/level input address
- * @granule_size: page/block size of the mapping in bytes
- * @nb_granules: number of contiguous granules to be invalidated
- */
-struct iommu_inv_addr_info {
-#define IOMMU_INV_ADDR_FLAGS_PASID	(1 << 0)
-#define IOMMU_INV_ADDR_FLAGS_ARCHID	(1 << 1)
-#define IOMMU_INV_ADDR_FLAGS_LEAF	(1 << 2)
-	__u32	flags;
-	__u32	archid;
-	__u64	pasid;
-	__u64	addr;
-	__u64	granule_size;
-	__u64	nb_granules;
-};
-
-/**
- * struct iommu_inv_pasid_info - PASID Selective Invalidation Structure
- *
- * @flags: indicates the granularity of the PASID-selective invalidation
- * - If the PASID bit is set, the @pasid field is populated and the invalidation
- *   relates to cache entries tagged with this PASID and matching the address
- *   range.
- * - If the ARCHID bit is set, the @archid is populated and the invalidation
- *   relates to cache entries tagged with this architecture specific ID and
- *   matching the address range.
- * - Both PASID and ARCHID can be set as they may tag different caches.
- * - At least one of PASID or ARCHID must be set.
- * @pasid: process address space ID
- * @archid: architecture-specific ID
- */
-struct iommu_inv_pasid_info {
-#define IOMMU_INV_PASID_FLAGS_PASID	(1 << 0)
-#define IOMMU_INV_PASID_FLAGS_ARCHID	(1 << 1)
-	__u32	flags;
-	__u32	archid;
-	__u64	pasid;
-};
-
-/**
- * struct iommu_cache_invalidate_info - First level/stage invalidation
- *     information
- * @argsz: User filled size of this data
- * @version: API version of this structure
- * @cache: bitfield that allows to select which caches to invalidate
- * @granularity: defines the lowest granularity used for the invalidation:
- *     domain > PASID > addr
- * @padding: reserved for future use (should be zero)
- * @pasid_info: invalidation data when @granularity is %IOMMU_INV_GRANU_PASID
- * @addr_info: invalidation data when @granularity is %IOMMU_INV_GRANU_ADDR
- *
- * Not all the combinations of cache/granularity are valid:
- *
- * +--------------+---------------+---------------+---------------+
- * | type /       |   DEV_IOTLB   |     IOTLB     |      PASID    |
- * | granularity  |               |               |      cache    |
- * +==============+===============+===============+===============+
- * | DOMAIN       |       N/A     |       Y       |       Y       |
- * +--------------+---------------+---------------+---------------+
- * | PASID        |       Y       |       Y       |       Y       |
- * +--------------+---------------+---------------+---------------+
- * | ADDR         |       Y       |       Y       |       N/A     |
- * +--------------+---------------+---------------+---------------+
- *
- * Invalidations by %IOMMU_INV_GRANU_DOMAIN don't take any argument other than
- * @version and @cache.
- *
- * If multiple cache types are invalidated simultaneously, they all
- * must support the used granularity.
- */
-struct iommu_cache_invalidate_info {
-	__u32	argsz;
-#define IOMMU_CACHE_INVALIDATE_INFO_VERSION_1 1
-	__u32	version;
-/* IOMMU paging structure cache */
-#define IOMMU_CACHE_INV_TYPE_IOTLB	(1 << 0) /* IOMMU IOTLB */
-#define IOMMU_CACHE_INV_TYPE_DEV_IOTLB	(1 << 1) /* Device IOTLB */
-#define IOMMU_CACHE_INV_TYPE_PASID	(1 << 2) /* PASID cache */
-#define IOMMU_CACHE_INV_TYPE_NR		(3)
-	__u8	cache;
-	__u8	granularity;
-	__u8	padding[6];
-	union {
-		struct iommu_inv_pasid_info pasid_info;
-		struct iommu_inv_addr_info addr_info;
-	} granu;
-};
-
-/**
- * struct iommu_gpasid_bind_data_vtd - Intel VT-d specific data on device and guest
- * SVA binding.
- *
- * @flags:	VT-d PASID table entry attributes
- * @pat:	Page attribute table data to compute effective memory type
- * @emt:	Extended memory type
- *
- * Only guest vIOMMU selectable and effective options are passed down to
- * the host IOMMU.
- */
-struct iommu_gpasid_bind_data_vtd {
-#define IOMMU_SVA_VTD_GPASID_SRE	(1 << 0) /* supervisor request */
-#define IOMMU_SVA_VTD_GPASID_EAFE	(1 << 1) /* extended access enable */
-#define IOMMU_SVA_VTD_GPASID_PCD	(1 << 2) /* page-level cache disable */
-#define IOMMU_SVA_VTD_GPASID_PWT	(1 << 3) /* page-level write through */
-#define IOMMU_SVA_VTD_GPASID_EMTE	(1 << 4) /* extended mem type enable */
-#define IOMMU_SVA_VTD_GPASID_CD		(1 << 5) /* PASID-level cache disable */
-#define IOMMU_SVA_VTD_GPASID_WPE	(1 << 6) /* Write protect enable */
-#define IOMMU_SVA_VTD_GPASID_LAST	(1 << 7)
-	__u64 flags;
-	__u32 pat;
-	__u32 emt;
-};
-
-#define IOMMU_SVA_VTD_GPASID_MTS_MASK	(IOMMU_SVA_VTD_GPASID_CD | \
-					 IOMMU_SVA_VTD_GPASID_EMTE | \
-					 IOMMU_SVA_VTD_GPASID_PCD |  \
-					 IOMMU_SVA_VTD_GPASID_PWT)
-
-/**
- * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
- * @argsz:	User filled size of this data
- * @version:	Version of this data structure
- * @format:	PASID table entry format
- * @flags:	Additional information on guest bind request
- * @gpgd:	Guest page directory base of the guest mm to bind
- * @hpasid:	Process address space ID used for the guest mm in host IOMMU
- * @gpasid:	Process address space ID used for the guest mm in guest IOMMU
- * @addr_width:	Guest virtual address width
- * @padding:	Reserved for future use (should be zero)
- * @vtd:	Intel VT-d specific data
- *
- * Guest to host PASID mapping can be an identity or non-identity, where guest
- * has its own PASID space. For non-identify mapping, guest to host PASID lookup
- * is needed when VM programs guest PASID into an assigned device. VMM may
- * trap such PASID programming then request host IOMMU driver to convert guest
- * PASID to host PASID based on this bind data.
- */
-struct iommu_gpasid_bind_data {
-	__u32 argsz;
-#define IOMMU_GPASID_BIND_VERSION_1	1
-	__u32 version;
-#define IOMMU_PASID_FORMAT_INTEL_VTD	1
-#define IOMMU_PASID_FORMAT_LAST		2
-	__u32 format;
-	__u32 addr_width;
-#define IOMMU_SVA_GPASID_VAL	(1 << 0) /* guest PASID valid */
-	__u64 flags;
-	__u64 gpgd;
-	__u64 hpasid;
-	__u64 gpasid;
-	__u8  padding[8];
-	/* Vendor specific data */
-	union {
-		struct iommu_gpasid_bind_data_vtd vtd;
-	} vendor;
-};
-
 #endif /* _UAPI_IOMMU_H */
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 107dcf5938d6..3cbf4781e5bd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2031,216 +2031,6 @@ int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
 	return 0;
 }
 
-/*
- * Check flags and other user provided data for valid combinations. We also
- * make sure no reserved fields or unused flags are set. This is to ensure
- * not breaking userspace in the future when these fields or flags are used.
- */
-static int iommu_check_cache_invl_data(struct iommu_cache_invalidate_info *info)
-{
-	u32 mask;
-	int i;
-
-	if (info->version != IOMMU_CACHE_INVALIDATE_INFO_VERSION_1)
-		return -EINVAL;
-
-	mask = (1 << IOMMU_CACHE_INV_TYPE_NR) - 1;
-	if (info->cache & ~mask)
-		return -EINVAL;
-
-	if (info->granularity >= IOMMU_INV_GRANU_NR)
-		return -EINVAL;
-
-	switch (info->granularity) {
-	case IOMMU_INV_GRANU_ADDR:
-		if (info->cache & IOMMU_CACHE_INV_TYPE_PASID)
-			return -EINVAL;
-
-		mask = IOMMU_INV_ADDR_FLAGS_PASID |
-			IOMMU_INV_ADDR_FLAGS_ARCHID |
-			IOMMU_INV_ADDR_FLAGS_LEAF;
-
-		if (info->granu.addr_info.flags & ~mask)
-			return -EINVAL;
-		break;
-	case IOMMU_INV_GRANU_PASID:
-		mask = IOMMU_INV_PASID_FLAGS_PASID |
-			IOMMU_INV_PASID_FLAGS_ARCHID;
-		if (info->granu.pasid_info.flags & ~mask)
-			return -EINVAL;
-
-		break;
-	case IOMMU_INV_GRANU_DOMAIN:
-		if (info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB)
-			return -EINVAL;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* Check reserved padding fields */
-	for (i = 0; i < sizeof(info->padding); i++) {
-		if (info->padding[i])
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-int iommu_uapi_cache_invalidate(struct iommu_domain *domain, struct device *dev,
-				void __user *uinfo)
-{
-	struct iommu_cache_invalidate_info inv_info = { 0 };
-	u32 minsz;
-	int ret;
-
-	if (unlikely(!domain->ops->cache_invalidate))
-		return -ENODEV;
-
-	/*
-	 * No new spaces can be added before the variable sized union, the
-	 * minimum size is the offset to the union.
-	 */
-	minsz = offsetof(struct iommu_cache_invalidate_info, granu);
-
-	/* Copy minsz from user to get flags and argsz */
-	if (copy_from_user(&inv_info, uinfo, minsz))
-		return -EFAULT;
-
-	/* Fields before the variable size union are mandatory */
-	if (inv_info.argsz < minsz)
-		return -EINVAL;
-
-	/* PASID and address granu require additional info beyond minsz */
-	if (inv_info.granularity == IOMMU_INV_GRANU_PASID &&
-	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.pasid_info))
-		return -EINVAL;
-
-	if (inv_info.granularity == IOMMU_INV_GRANU_ADDR &&
-	    inv_info.argsz < offsetofend(struct iommu_cache_invalidate_info, granu.addr_info))
-		return -EINVAL;
-
-	/*
-	 * User might be using a newer UAPI header which has a larger data
-	 * size, we shall support the existing flags within the current
-	 * size. Copy the remaining user data _after_ minsz but not more
-	 * than the current kernel supported size.
-	 */
-	if (copy_from_user((void *)&inv_info + minsz, uinfo + minsz,
-			   min_t(u32, inv_info.argsz, sizeof(inv_info)) - minsz))
-		return -EFAULT;
-
-	/* Now the argsz is validated, check the content */
-	ret = iommu_check_cache_invl_data(&inv_info);
-	if (ret)
-		return ret;
-
-	return domain->ops->cache_invalidate(domain, dev, &inv_info);
-}
-EXPORT_SYMBOL_GPL(iommu_uapi_cache_invalidate);
-
-static int iommu_check_bind_data(struct iommu_gpasid_bind_data *data)
-{
-	u64 mask;
-	int i;
-
-	if (data->version != IOMMU_GPASID_BIND_VERSION_1)
-		return -EINVAL;
-
-	/* Check the range of supported formats */
-	if (data->format >= IOMMU_PASID_FORMAT_LAST)
-		return -EINVAL;
-
-	/* Check all flags */
-	mask = IOMMU_SVA_GPASID_VAL;
-	if (data->flags & ~mask)
-		return -EINVAL;
-
-	/* Check reserved padding fields */
-	for (i = 0; i < sizeof(data->padding); i++) {
-		if (data->padding[i])
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int iommu_sva_prepare_bind_data(void __user *udata,
-				       struct iommu_gpasid_bind_data *data)
-{
-	u32 minsz;
-
-	/*
-	 * No new spaces can be added before the variable sized union, the
-	 * minimum size is the offset to the union.
-	 */
-	minsz = offsetof(struct iommu_gpasid_bind_data, vendor);
-
-	/* Copy minsz from user to get flags and argsz */
-	if (copy_from_user(data, udata, minsz))
-		return -EFAULT;
-
-	/* Fields before the variable size union are mandatory */
-	if (data->argsz < minsz)
-		return -EINVAL;
-	/*
-	 * User might be using a newer UAPI header, we shall let IOMMU vendor
-	 * driver decide on what size it needs. Since the guest PASID bind data
-	 * can be vendor specific, larger argsz could be the result of extension
-	 * for one vendor but it should not affect another vendor.
-	 * Copy the remaining user data _after_ minsz
-	 */
-	if (copy_from_user((void *)data + minsz, udata + minsz,
-			   min_t(u32, data->argsz, sizeof(*data)) - minsz))
-		return -EFAULT;
-
-	return iommu_check_bind_data(data);
-}
-
-int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
-			       void __user *udata)
-{
-	struct iommu_gpasid_bind_data data = { 0 };
-	int ret;
-
-	if (unlikely(!domain->ops->sva_bind_gpasid))
-		return -ENODEV;
-
-	ret = iommu_sva_prepare_bind_data(udata, &data);
-	if (ret)
-		return ret;
-
-	return domain->ops->sva_bind_gpasid(domain, dev, &data);
-}
-EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
-
-int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
-			     ioasid_t pasid)
-{
-	if (unlikely(!domain->ops->sva_unbind_gpasid))
-		return -ENODEV;
-
-	return domain->ops->sva_unbind_gpasid(dev, pasid);
-}
-EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
-
-int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
-				 void __user *udata)
-{
-	struct iommu_gpasid_bind_data data = { 0 };
-	int ret;
-
-	if (unlikely(!domain->ops->sva_bind_gpasid))
-		return -ENODEV;
-
-	ret = iommu_sva_prepare_bind_data(udata, &data);
-	if (ret)
-		return ret;
-
-	return iommu_sva_unbind_gpasid(domain, dev, data.hpasid);
-}
-EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
-
 static void __iommu_detach_device(struct iommu_domain *domain,
 				  struct device *dev)
 {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
