Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FEC230295
	for <lists.iommu@lfdr.de>; Tue, 28 Jul 2020 08:21:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A4908690E;
	Tue, 28 Jul 2020 06:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFWtufhnO9KK; Tue, 28 Jul 2020 06:21:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 343D8869E2;
	Tue, 28 Jul 2020 06:21:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 140CCC004D;
	Tue, 28 Jul 2020 06:21:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 409B7C004D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 247C32039A
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrGwXFaC3vKH for <iommu@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by silver.osuosl.org (Postfix) with ESMTPS id 473782041B
 for <iommu@lists.linux-foundation.org>; Tue, 28 Jul 2020 06:20:56 +0000 (UTC)
IronPort-SDR: 9hf2wYCbdaLgYv97MFj5GXi8oizYMLe8oV8F/K0Q+RAYqKnDjtloKgPc3R6TSRrF5N352rnsp7
 bOVQ6gC/UEug==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="130719777"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="130719777"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 23:20:55 -0700
IronPort-SDR: 4ESmEtAHDo+oAiqJBwmWisnUPbyQpTaa5NBvhStHj/O2hL60stvbP9JTrR4QkcLqUIouqoLUxI
 1D10wk8Kov6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="320274380"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga008.jf.intel.com with ESMTP; 27 Jul 2020 23:20:55 -0700
From: Liu Yi L <yi.l.liu@intel.com>
To: alex.williamson@redhat.com, eric.auger@redhat.com,
 baolu.lu@linux.intel.com, joro@8bytes.org
Subject: [PATCH v6 01/15] vfio/type1: Refactor vfio_iommu_type1_ioctl()
Date: Mon, 27 Jul 2020 23:27:30 -0700
Message-Id: <1595917664-33276-2-git-send-email-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
References: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, ashok.raj@intel.com,
 kvm@vger.kernel.org, stefanha@gmail.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com, hao.wu@intel.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patch refactors the vfio_iommu_type1_ioctl() to use switch instead of
if-else, and each command got a helper function.

Cc: Kevin Tian <kevin.tian@intel.com>
CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
---
v4 -> v5:
*) address comments from Eric Auger, add r-b from Eric.
---
 drivers/vfio/vfio_iommu_type1.c | 394 ++++++++++++++++++++++------------------
 1 file changed, 213 insertions(+), 181 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 5e556ac..3bd70ff 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2453,6 +2453,23 @@ static int vfio_domains_have_iommu_cache(struct vfio_iommu *iommu)
 	return ret;
 }
 
+static int vfio_iommu_type1_check_extension(struct vfio_iommu *iommu,
+					    unsigned long arg)
+{
+	switch (arg) {
+	case VFIO_TYPE1_IOMMU:
+	case VFIO_TYPE1v2_IOMMU:
+	case VFIO_TYPE1_NESTING_IOMMU:
+		return 1;
+	case VFIO_DMA_CC_IOMMU:
+		if (!iommu)
+			return 0;
+		return vfio_domains_have_iommu_cache(iommu);
+	default:
+		return 0;
+	}
+}
+
 static int vfio_iommu_iova_add_cap(struct vfio_info_cap *caps,
 		 struct vfio_iommu_type1_info_cap_iova_range *cap_iovas,
 		 size_t size)
@@ -2529,241 +2546,256 @@ static int vfio_iommu_migration_build_caps(struct vfio_iommu *iommu,
 	return vfio_info_add_capability(caps, &cap_mig.header, sizeof(cap_mig));
 }
 
-static long vfio_iommu_type1_ioctl(void *iommu_data,
-				   unsigned int cmd, unsigned long arg)
+static int vfio_iommu_type1_get_info(struct vfio_iommu *iommu,
+				     unsigned long arg)
 {
-	struct vfio_iommu *iommu = iommu_data;
+	struct vfio_iommu_type1_info info;
 	unsigned long minsz;
+	struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+	unsigned long capsz;
+	int ret;
 
-	if (cmd == VFIO_CHECK_EXTENSION) {
-		switch (arg) {
-		case VFIO_TYPE1_IOMMU:
-		case VFIO_TYPE1v2_IOMMU:
-		case VFIO_TYPE1_NESTING_IOMMU:
-			return 1;
-		case VFIO_DMA_CC_IOMMU:
-			if (!iommu)
-				return 0;
-			return vfio_domains_have_iommu_cache(iommu);
-		default:
-			return 0;
-		}
-	} else if (cmd == VFIO_IOMMU_GET_INFO) {
-		struct vfio_iommu_type1_info info;
-		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
-		unsigned long capsz;
-		int ret;
-
-		minsz = offsetofend(struct vfio_iommu_type1_info, iova_pgsizes);
+	minsz = offsetofend(struct vfio_iommu_type1_info, iova_pgsizes);
 
-		/* For backward compatibility, cannot require this */
-		capsz = offsetofend(struct vfio_iommu_type1_info, cap_offset);
+	/* For backward compatibility, cannot require this */
+	capsz = offsetofend(struct vfio_iommu_type1_info, cap_offset);
 
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
+	if (copy_from_user(&info, (void __user *)arg, minsz))
+		return -EFAULT;
 
-		if (info.argsz < minsz)
-			return -EINVAL;
+	if (info.argsz < minsz)
+		return -EINVAL;
 
-		if (info.argsz >= capsz) {
-			minsz = capsz;
-			info.cap_offset = 0; /* output, no-recopy necessary */
-		}
+	if (info.argsz >= capsz) {
+		minsz = capsz;
+		info.cap_offset = 0; /* output, no-recopy necessary */
+	}
 
-		mutex_lock(&iommu->lock);
-		info.flags = VFIO_IOMMU_INFO_PGSIZES;
+	mutex_lock(&iommu->lock);
+	info.flags = VFIO_IOMMU_INFO_PGSIZES;
 
-		info.iova_pgsizes = iommu->pgsize_bitmap;
+	info.iova_pgsizes = iommu->pgsize_bitmap;
 
-		ret = vfio_iommu_migration_build_caps(iommu, &caps);
+	ret = vfio_iommu_migration_build_caps(iommu, &caps);
 
-		if (!ret)
-			ret = vfio_iommu_iova_build_caps(iommu, &caps);
+	if (!ret)
+		ret = vfio_iommu_iova_build_caps(iommu, &caps);
 
-		mutex_unlock(&iommu->lock);
+	mutex_unlock(&iommu->lock);
 
-		if (ret)
-			return ret;
+	if (ret)
+		return ret;
 
-		if (caps.size) {
-			info.flags |= VFIO_IOMMU_INFO_CAPS;
+	if (caps.size) {
+		info.flags |= VFIO_IOMMU_INFO_CAPS;
 
-			if (info.argsz < sizeof(info) + caps.size) {
-				info.argsz = sizeof(info) + caps.size;
-			} else {
-				vfio_info_cap_shift(&caps, sizeof(info));
-				if (copy_to_user((void __user *)arg +
-						sizeof(info), caps.buf,
-						caps.size)) {
-					kfree(caps.buf);
-					return -EFAULT;
-				}
-				info.cap_offset = sizeof(info);
+		if (info.argsz < sizeof(info) + caps.size) {
+			info.argsz = sizeof(info) + caps.size;
+		} else {
+			vfio_info_cap_shift(&caps, sizeof(info));
+			if (copy_to_user((void __user *)arg +
+					sizeof(info), caps.buf,
+					caps.size)) {
+				kfree(caps.buf);
+				return -EFAULT;
 			}
-
-			kfree(caps.buf);
+			info.cap_offset = sizeof(info);
 		}
 
-		return copy_to_user((void __user *)arg, &info, minsz) ?
-			-EFAULT : 0;
+		kfree(caps.buf);
+	}
 
-	} else if (cmd == VFIO_IOMMU_MAP_DMA) {
-		struct vfio_iommu_type1_dma_map map;
-		uint32_t mask = VFIO_DMA_MAP_FLAG_READ |
-				VFIO_DMA_MAP_FLAG_WRITE;
+	return copy_to_user((void __user *)arg, &info, minsz) ?
+			-EFAULT : 0;
+}
 
-		minsz = offsetofend(struct vfio_iommu_type1_dma_map, size);
+static int vfio_iommu_type1_map_dma(struct vfio_iommu *iommu,
+				    unsigned long arg)
+{
+	struct vfio_iommu_type1_dma_map map;
+	unsigned long minsz;
+	uint32_t mask = VFIO_DMA_MAP_FLAG_READ | VFIO_DMA_MAP_FLAG_WRITE;
 
-		if (copy_from_user(&map, (void __user *)arg, minsz))
-			return -EFAULT;
+	minsz = offsetofend(struct vfio_iommu_type1_dma_map, size);
 
-		if (map.argsz < minsz || map.flags & ~mask)
-			return -EINVAL;
+	if (copy_from_user(&map, (void __user *)arg, minsz))
+		return -EFAULT;
 
-		return vfio_dma_do_map(iommu, &map);
+	if (map.argsz < minsz || map.flags & ~mask)
+		return -EINVAL;
 
-	} else if (cmd == VFIO_IOMMU_UNMAP_DMA) {
-		struct vfio_iommu_type1_dma_unmap unmap;
-		struct vfio_bitmap bitmap = { 0 };
-		int ret;
+	return vfio_dma_do_map(iommu, &map);
+}
 
-		minsz = offsetofend(struct vfio_iommu_type1_dma_unmap, size);
+static int vfio_iommu_type1_unmap_dma(struct vfio_iommu *iommu,
+				      unsigned long arg)
+{
+	struct vfio_iommu_type1_dma_unmap unmap;
+	struct vfio_bitmap bitmap = { 0 };
+	unsigned long minsz;
+	int ret;
 
-		if (copy_from_user(&unmap, (void __user *)arg, minsz))
-			return -EFAULT;
+	minsz = offsetofend(struct vfio_iommu_type1_dma_unmap, size);
 
-		if (unmap.argsz < minsz ||
-		    unmap.flags & ~VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)
-			return -EINVAL;
+	if (copy_from_user(&unmap, (void __user *)arg, minsz))
+		return -EFAULT;
 
-		if (unmap.flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) {
-			unsigned long pgshift;
+	if (unmap.argsz < minsz ||
+	    unmap.flags & ~VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)
+		return -EINVAL;
 
-			if (unmap.argsz < (minsz + sizeof(bitmap)))
-				return -EINVAL;
+	if (unmap.flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) {
+		unsigned long pgshift;
 
-			if (copy_from_user(&bitmap,
-					   (void __user *)(arg + minsz),
-					   sizeof(bitmap)))
-				return -EFAULT;
+		if (unmap.argsz < (minsz + sizeof(bitmap)))
+			return -EINVAL;
 
-			if (!access_ok((void __user *)bitmap.data, bitmap.size))
-				return -EINVAL;
+		if (copy_from_user(&bitmap,
+				   (void __user *)(arg + minsz),
+				   sizeof(bitmap)))
+			return -EFAULT;
 
-			pgshift = __ffs(bitmap.pgsize);
-			ret = verify_bitmap_size(unmap.size >> pgshift,
-						 bitmap.size);
-			if (ret)
-				return ret;
-		}
+		if (!access_ok((void __user *)bitmap.data, bitmap.size))
+			return -EINVAL;
 
-		ret = vfio_dma_do_unmap(iommu, &unmap, &bitmap);
+		pgshift = __ffs(bitmap.pgsize);
+		ret = verify_bitmap_size(unmap.size >> pgshift,
+					 bitmap.size);
 		if (ret)
 			return ret;
+	}
+
+	ret = vfio_dma_do_unmap(iommu, &unmap, &bitmap);
+	if (ret)
+		return ret;
 
-		return copy_to_user((void __user *)arg, &unmap, minsz) ?
+	return copy_to_user((void __user *)arg, &unmap, minsz) ?
 			-EFAULT : 0;
-	} else if (cmd == VFIO_IOMMU_DIRTY_PAGES) {
-		struct vfio_iommu_type1_dirty_bitmap dirty;
-		uint32_t mask = VFIO_IOMMU_DIRTY_PAGES_FLAG_START |
-				VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP |
-				VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
-		int ret = 0;
+}
 
-		if (!iommu->v2)
-			return -EACCES;
+static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
+					unsigned long arg)
+{
+	struct vfio_iommu_type1_dirty_bitmap dirty;
+	uint32_t mask = VFIO_IOMMU_DIRTY_PAGES_FLAG_START |
+			VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP |
+			VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
+	unsigned long minsz;
+	int ret = 0;
 
-		minsz = offsetofend(struct vfio_iommu_type1_dirty_bitmap,
-				    flags);
+	if (!iommu->v2)
+		return -EACCES;
 
-		if (copy_from_user(&dirty, (void __user *)arg, minsz))
-			return -EFAULT;
+	minsz = offsetofend(struct vfio_iommu_type1_dirty_bitmap, flags);
 
-		if (dirty.argsz < minsz || dirty.flags & ~mask)
-			return -EINVAL;
+	if (copy_from_user(&dirty, (void __user *)arg, minsz))
+		return -EFAULT;
 
-		/* only one flag should be set at a time */
-		if (__ffs(dirty.flags) != __fls(dirty.flags))
-			return -EINVAL;
+	if (dirty.argsz < minsz || dirty.flags & ~mask)
+		return -EINVAL;
 
-		if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_START) {
-			size_t pgsize;
+	/* only one flag should be set at a time */
+	if (__ffs(dirty.flags) != __fls(dirty.flags))
+		return -EINVAL;
 
-			mutex_lock(&iommu->lock);
-			pgsize = 1 << __ffs(iommu->pgsize_bitmap);
-			if (!iommu->dirty_page_tracking) {
-				ret = vfio_dma_bitmap_alloc_all(iommu, pgsize);
-				if (!ret)
-					iommu->dirty_page_tracking = true;
-			}
-			mutex_unlock(&iommu->lock);
-			return ret;
-		} else if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP) {
-			mutex_lock(&iommu->lock);
-			if (iommu->dirty_page_tracking) {
-				iommu->dirty_page_tracking = false;
-				vfio_dma_bitmap_free_all(iommu);
-			}
-			mutex_unlock(&iommu->lock);
-			return 0;
-		} else if (dirty.flags &
-				 VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP) {
-			struct vfio_iommu_type1_dirty_bitmap_get range;
-			unsigned long pgshift;
-			size_t data_size = dirty.argsz - minsz;
-			size_t iommu_pgsize;
-
-			if (!data_size || data_size < sizeof(range))
-				return -EINVAL;
-
-			if (copy_from_user(&range, (void __user *)(arg + minsz),
-					   sizeof(range)))
-				return -EFAULT;
+	if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_START) {
+		size_t pgsize;
 
-			if (range.iova + range.size < range.iova)
-				return -EINVAL;
-			if (!access_ok((void __user *)range.bitmap.data,
-				       range.bitmap.size))
-				return -EINVAL;
+		mutex_lock(&iommu->lock);
+		pgsize = 1 << __ffs(iommu->pgsize_bitmap);
+		if (!iommu->dirty_page_tracking) {
+			ret = vfio_dma_bitmap_alloc_all(iommu, pgsize);
+			if (!ret)
+				iommu->dirty_page_tracking = true;
+		}
+		mutex_unlock(&iommu->lock);
+		return ret;
+	} else if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP) {
+		mutex_lock(&iommu->lock);
+		if (iommu->dirty_page_tracking) {
+			iommu->dirty_page_tracking = false;
+			vfio_dma_bitmap_free_all(iommu);
+		}
+		mutex_unlock(&iommu->lock);
+		return 0;
+	} else if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP) {
+		struct vfio_iommu_type1_dirty_bitmap_get range;
+		unsigned long pgshift;
+		size_t data_size = dirty.argsz - minsz;
+		size_t iommu_pgsize;
 
-			pgshift = __ffs(range.bitmap.pgsize);
-			ret = verify_bitmap_size(range.size >> pgshift,
-						 range.bitmap.size);
-			if (ret)
-				return ret;
+		if (!data_size || data_size < sizeof(range))
+			return -EINVAL;
 
-			mutex_lock(&iommu->lock);
+		if (copy_from_user(&range, (void __user *)(arg + minsz),
+				   sizeof(range)))
+			return -EFAULT;
 
-			iommu_pgsize = (size_t)1 << __ffs(iommu->pgsize_bitmap);
+		if (range.iova + range.size < range.iova)
+			return -EINVAL;
+		if (!access_ok((void __user *)range.bitmap.data,
+			       range.bitmap.size))
+			return -EINVAL;
 
-			/* allow only smallest supported pgsize */
-			if (range.bitmap.pgsize != iommu_pgsize) {
-				ret = -EINVAL;
-				goto out_unlock;
-			}
-			if (range.iova & (iommu_pgsize - 1)) {
-				ret = -EINVAL;
-				goto out_unlock;
-			}
-			if (!range.size || range.size & (iommu_pgsize - 1)) {
-				ret = -EINVAL;
-				goto out_unlock;
-			}
+		pgshift = __ffs(range.bitmap.pgsize);
+		ret = verify_bitmap_size(range.size >> pgshift,
+					 range.bitmap.size);
+		if (ret)
+			return ret;
 
-			if (iommu->dirty_page_tracking)
-				ret = vfio_iova_dirty_bitmap(range.bitmap.data,
-						iommu, range.iova, range.size,
-						range.bitmap.pgsize);
-			else
-				ret = -EINVAL;
-out_unlock:
-			mutex_unlock(&iommu->lock);
+		mutex_lock(&iommu->lock);
 
-			return ret;
+		iommu_pgsize = (size_t)1 << __ffs(iommu->pgsize_bitmap);
+
+		/* allow only smallest supported pgsize */
+		if (range.bitmap.pgsize != iommu_pgsize) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		if (range.iova & (iommu_pgsize - 1)) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		if (!range.size || range.size & (iommu_pgsize - 1)) {
+			ret = -EINVAL;
+			goto out_unlock;
 		}
+
+		if (iommu->dirty_page_tracking)
+			ret = vfio_iova_dirty_bitmap(range.bitmap.data,
+						     iommu, range.iova,
+						     range.size,
+						     range.bitmap.pgsize);
+		else
+			ret = -EINVAL;
+out_unlock:
+		mutex_unlock(&iommu->lock);
+
+		return ret;
 	}
 
-	return -ENOTTY;
+	return -EINVAL;
+}
+
+static long vfio_iommu_type1_ioctl(void *iommu_data,
+				   unsigned int cmd, unsigned long arg)
+{
+	struct vfio_iommu *iommu = iommu_data;
+
+	switch (cmd) {
+	case VFIO_CHECK_EXTENSION:
+		return vfio_iommu_type1_check_extension(iommu, arg);
+	case VFIO_IOMMU_GET_INFO:
+		return vfio_iommu_type1_get_info(iommu, arg);
+	case VFIO_IOMMU_MAP_DMA:
+		return vfio_iommu_type1_map_dma(iommu, arg);
+	case VFIO_IOMMU_UNMAP_DMA:
+		return vfio_iommu_type1_unmap_dma(iommu, arg);
+	case VFIO_IOMMU_DIRTY_PAGES:
+		return vfio_iommu_type1_dirty_pages(iommu, arg);
+	default:
+		return -ENOTTY;
+	}
 }
 
 static int vfio_iommu_type1_register_notifier(void *iommu_data,
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
