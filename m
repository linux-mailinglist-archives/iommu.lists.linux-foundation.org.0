Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C61333836
	for <lists.iommu@lfdr.de>; Wed, 10 Mar 2021 10:07:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB1F9431B1;
	Wed, 10 Mar 2021 09:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iH91v_RYS-zd; Wed, 10 Mar 2021 09:07:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5160431A9;
	Wed, 10 Mar 2021 09:07:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 901C8C0001;
	Wed, 10 Mar 2021 09:07:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07362C0001
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB03884367
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87P-9D7JIVrL for <iommu@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:07:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9AD48435F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Mar 2021 09:07:04 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DwR3z4hN3zrTKn;
 Wed, 10 Mar 2021 17:05:03 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 17:06:28 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Alex Williamson
 <alex.williamson@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Yi Sun
 <yi.y.sun@linux.intel.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v2 11/11] vfio/iommu_type1: Add support for manual dirty log
 clear
Date: Wed, 10 Mar 2021 17:06:14 +0800
Message-ID: <20210310090614.26668-12-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210310090614.26668-1-zhukeqian1@huawei.com>
References: <20210310090614.26668-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, lushenming@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com
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

From: jiangkunkun <jiangkunkun@huawei.com>

In the past, we clear dirty log immediately after sync dirty
log to userspace. This may cause redundant dirty handling if
userspace handles dirty log iteratively:

After vfio clears dirty log, new dirty log starts to generate.
These new dirty log will be reported to userspace even if they
are generated before userspace handles the same dirty page.

That's to say, we should minimize the time gap of dirty log
clearing and dirty log handling. We can give userspace the
interface to clear dirty log.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---

changelog:

v2:
 - Rebase to newest code, so change VFIO_DIRTY_LOG_MANUAL_CLEAR form 9 to 11.

---
 drivers/vfio/vfio_iommu_type1.c | 104 ++++++++++++++++++++++++++++++--
 include/uapi/linux/vfio.h       |  28 ++++++++-
 2 files changed, 127 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a7ab0279eda0..94306f567894 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -77,6 +77,7 @@ struct vfio_iommu {
 	bool			v2;
 	bool			nesting;
 	bool			dirty_page_tracking;
+	bool			dirty_log_manual_clear;
 	bool			pinned_page_dirty_scope;
 	bool			container_open;
 	uint64_t		num_non_hwdbm_groups;
@@ -1226,6 +1227,78 @@ static int vfio_iommu_dirty_log_clear(struct vfio_iommu *iommu,
 	return 0;
 }
 
+static int vfio_iova_dirty_log_clear(u64 __user *bitmap,
+				     struct vfio_iommu *iommu,
+				     dma_addr_t iova, size_t size,
+				     size_t pgsize)
+{
+	struct vfio_dma *dma;
+	struct rb_node *n;
+	dma_addr_t start_iova, end_iova, riova;
+	unsigned long pgshift = __ffs(pgsize);
+	unsigned long bitmap_size;
+	unsigned long *bitmap_buffer = NULL;
+	bool clear_valid;
+	int rs, re, start, end, dma_offset;
+	int ret = 0;
+
+	bitmap_size = DIRTY_BITMAP_BYTES(size >> pgshift);
+	bitmap_buffer = kvmalloc(bitmap_size, GFP_KERNEL);
+	if (!bitmap_buffer) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	if (copy_from_user(bitmap_buffer, bitmap, bitmap_size)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	for (n = rb_first(&iommu->dma_list); n; n = rb_next(n)) {
+		dma = rb_entry(n, struct vfio_dma, node);
+		if (!dma->iommu_mapped)
+			continue;
+		if ((dma->iova + dma->size - 1) < iova)
+			continue;
+		if (dma->iova > iova + size - 1)
+			break;
+
+		start_iova = max(iova, dma->iova);
+		end_iova = min(iova + size, dma->iova + dma->size);
+
+		/* Similar logic as the tail of vfio_iova_dirty_bitmap */
+
+		clear_valid = false;
+		start = (start_iova - iova) >> pgshift;
+		end = (end_iova - iova) >> pgshift;
+		bitmap_for_each_set_region(bitmap_buffer, rs, re, start, end) {
+			clear_valid = true;
+			riova = iova + (rs << pgshift);
+			dma_offset = (riova - dma->iova) >> pgshift;
+			bitmap_clear(dma->bitmap, dma_offset, re - rs);
+		}
+
+		if (clear_valid)
+			vfio_dma_populate_bitmap(dma, pgsize);
+
+		if (clear_valid && !iommu->pinned_page_dirty_scope &&
+		    dma->iommu_mapped && !iommu->num_non_hwdbm_groups) {
+			ret = vfio_iommu_dirty_log_clear(iommu, start_iova,
+					end_iova - start_iova,	bitmap_buffer,
+					iova, pgsize);
+			if (ret) {
+				pr_warn("dma dirty log clear failed!\n");
+				goto out;
+			}
+		}
+
+	}
+
+out:
+	kfree(bitmap_buffer);
+	return ret;
+}
+
 static int update_user_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
 			      struct vfio_dma *dma, dma_addr_t base_iova,
 			      size_t pgsize)
@@ -1275,6 +1348,11 @@ static int update_user_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
 			 DIRTY_BITMAP_BYTES(nbits + shift)))
 		return -EFAULT;
 
+	/* Recover the bitmap under manual clear */
+	if (shift && iommu->dirty_log_manual_clear)
+		bitmap_shift_right(dma->bitmap, dma->bitmap, shift,
+				   nbits + shift);
+
 	return 0;
 }
 
@@ -1313,6 +1391,9 @@ static int vfio_iova_dirty_bitmap(u64 __user *bitmap, struct vfio_iommu *iommu,
 		if (ret)
 			return ret;
 
+		if (iommu->dirty_log_manual_clear)
+			continue;
+
 		/*
 		 * Re-populate bitmap to include all pinned pages which are
 		 * considered as dirty but exclude pages which are unpinned and
@@ -2850,6 +2931,11 @@ static int vfio_iommu_type1_check_extension(struct vfio_iommu *iommu,
 		if (!iommu)
 			return 0;
 		return vfio_domains_have_iommu_cache(iommu);
+	case VFIO_DIRTY_LOG_MANUAL_CLEAR:
+		if (!iommu)
+			return 0;
+		iommu->dirty_log_manual_clear = true;
+		return 1;
 	default:
 		return 0;
 	}
@@ -3153,7 +3239,8 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
 	struct vfio_iommu_type1_dirty_bitmap dirty;
 	uint32_t mask = VFIO_IOMMU_DIRTY_PAGES_FLAG_START |
 			VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP |
-			VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
+			VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP |
+			VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP;
 	unsigned long minsz;
 	int ret = 0;
 
@@ -3195,7 +3282,8 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
 		}
 		mutex_unlock(&iommu->lock);
 		return 0;
-	} else if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP) {
+	} else if (dirty.flags & (VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP |
+				VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP)) {
 		struct vfio_iommu_type1_dirty_bitmap_get range;
 		unsigned long pgshift;
 		size_t data_size = dirty.argsz - minsz;
@@ -3238,13 +3326,21 @@ static int vfio_iommu_type1_dirty_pages(struct vfio_iommu *iommu,
 			goto out_unlock;
 		}
 
-		if (iommu->dirty_page_tracking)
+		if (!iommu->dirty_page_tracking) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+
+		if (dirty.flags & VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP)
 			ret = vfio_iova_dirty_bitmap(range.bitmap.data,
 						     iommu, range.iova,
 						     range.size,
 						     range.bitmap.pgsize);
 		else
-			ret = -EINVAL;
+			ret = vfio_iova_dirty_log_clear(range.bitmap.data,
+							iommu, range.iova,
+							range.size,
+							range.bitmap.pgsize);
 out_unlock:
 		mutex_unlock(&iommu->lock);
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 8ce36c1d53ca..784dc3cf2a8f 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -52,6 +52,14 @@
 /* Supports the vaddr flag for DMA map and unmap */
 #define VFIO_UPDATE_VADDR		10
 
+/*
+ * The vfio_iommu driver may support user clears dirty log manually, which means
+ * dirty log is not cleared automatically after dirty log is copied to userspace,
+ * it's user's duty to clear dirty log. Note: when user queries this extension
+ * and vfio_iommu driver supports it, then it is enabled.
+ */
+#define VFIO_DIRTY_LOG_MANUAL_CLEAR	11
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1188,7 +1196,24 @@ struct vfio_iommu_type1_dma_unmap {
  * actual bitmap. If dirty pages logging is not enabled, an error will be
  * returned.
  *
- * Only one of the flags _START, _STOP and _GET may be specified at a time.
+ * Calling the IOCTL with VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP flag set,
+ * instructs the IOMMU driver to clear the dirty status of pages in a bitmap
+ * for IOMMU container for a given IOVA range. The user must specify the IOVA
+ * range, the bitmap and the pgsize through the structure
+ * vfio_iommu_type1_dirty_bitmap_get in the data[] portion. This interface
+ * supports clearing a bitmap of the smallest supported pgsize only and can be
+ * modified in future to clear a bitmap of any specified supported pgsize. The
+ * user must provide a memory area for the bitmap memory and specify its size
+ * in bitmap.size. One bit is used to represent one page consecutively starting
+ * from iova offset. The user should provide page size in bitmap.pgsize field.
+ * A bit set in the bitmap indicates that the page at that offset from iova is
+ * cleared the dirty status, and dirty tracking is re-enabled for that page. The
+ * caller must set argsz to a value including the size of structure
+ * vfio_iommu_dirty_bitmap_get, but excluing the size of the actual bitmap. If
+ * dirty pages logging is not enabled, an error will be returned.
+ *
+ * Only one of the flags _START, _STOP, _GET and _CLEAR may be specified at a
+ * time.
  *
  */
 struct vfio_iommu_type1_dirty_bitmap {
@@ -1197,6 +1222,7 @@ struct vfio_iommu_type1_dirty_bitmap {
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_START	(1 << 0)
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP	(1 << 1)
 #define VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP	(1 << 2)
+#define VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP (1 << 3)
 	__u8         data[];
 };
 
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
