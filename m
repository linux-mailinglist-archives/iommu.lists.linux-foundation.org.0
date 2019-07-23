Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4D71C80
	for <lists.iommu@lfdr.de>; Tue, 23 Jul 2019 18:09:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E140D39;
	Tue, 23 Jul 2019 16:08:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E92A0CCB
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 16:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 34994891
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 16:08:43 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 43523B08A765E3E9D256;
	Wed, 24 Jul 2019 00:08:39 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 24 Jul 2019 00:08:31 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <alex.williamson@redhat.com>, <eric.auger@redhat.com>
Subject: [PATCH v8 5/6] vfio/type1: Add IOVA range capability support
Date: Tue, 23 Jul 2019 17:06:36 +0100
Message-ID: <20190723160637.8384-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190723160637.8384-1-shameerali.kolothum.thodi@huawei.com>
References: <20190723160637.8384-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	xuwei5@hisilicon.com, linuxarm@huawei.com, iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This allows the user-space to retrieve the supported IOVA
range(s), excluding any non-relaxable reserved regions. The
implementation is based on capability chains, added to
VFIO_IOMMU_GET_INFO ioctl.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/vfio/vfio_iommu_type1.c | 101 ++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       |  26 +++++++-
 2 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 56cf55776d6c..d0c5e768acb7 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2138,6 +2138,73 @@ static int vfio_domains_have_iommu_cache(struct vfio_iommu *iommu)
 	return ret;
 }
 
+static int vfio_iommu_iova_add_cap(struct vfio_info_cap *caps,
+		 struct vfio_iommu_type1_info_cap_iova_range *cap_iovas,
+		 size_t size)
+{
+	struct vfio_info_cap_header *header;
+	struct vfio_iommu_type1_info_cap_iova_range *iova_cap;
+
+	header = vfio_info_cap_add(caps, size,
+				   VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE, 1);
+	if (IS_ERR(header))
+		return PTR_ERR(header);
+
+	iova_cap = container_of(header,
+				struct vfio_iommu_type1_info_cap_iova_range,
+				header);
+	iova_cap->nr_iovas = cap_iovas->nr_iovas;
+	memcpy(iova_cap->iova_ranges, cap_iovas->iova_ranges,
+	       cap_iovas->nr_iovas * sizeof(*cap_iovas->iova_ranges));
+	return 0;
+}
+
+static int vfio_iommu_iova_build_caps(struct vfio_iommu *iommu,
+				      struct vfio_info_cap *caps)
+{
+	struct vfio_iommu_type1_info_cap_iova_range *cap_iovas;
+	struct vfio_iova *iova;
+	size_t size;
+	int iovas = 0, i = 0, ret;
+
+	mutex_lock(&iommu->lock);
+
+	list_for_each_entry(iova, &iommu->iova_list, list)
+		iovas++;
+
+	if (!iovas) {
+		/*
+		 * Return 0 as a container with a single mdev device
+		 * will have an empty list
+		 */
+		ret = 0;
+		goto out_unlock;
+	}
+
+	size = sizeof(*cap_iovas) + (iovas * sizeof(*cap_iovas->iova_ranges));
+
+	cap_iovas = kzalloc(size, GFP_KERNEL);
+	if (!cap_iovas) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	cap_iovas->nr_iovas = iovas;
+
+	list_for_each_entry(iova, &iommu->iova_list, list) {
+		cap_iovas->iova_ranges[i].start = iova->start;
+		cap_iovas->iova_ranges[i].end = iova->end;
+		i++;
+	}
+
+	ret = vfio_iommu_iova_add_cap(caps, cap_iovas, size);
+
+	kfree(cap_iovas);
+out_unlock:
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -2159,19 +2226,53 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 		}
 	} else if (cmd == VFIO_IOMMU_GET_INFO) {
 		struct vfio_iommu_type1_info info;
+		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+		unsigned long capsz;
+		int ret;
 
 		minsz = offsetofend(struct vfio_iommu_type1_info, iova_pgsizes);
 
+		/* For backward compatibility, cannot require this */
+		capsz = offsetofend(struct vfio_iommu_type1_info, cap_offset);
+
 		if (copy_from_user(&info, (void __user *)arg, minsz))
 			return -EFAULT;
 
 		if (info.argsz < minsz)
 			return -EINVAL;
 
+		if (info.argsz >= capsz) {
+			minsz = capsz;
+			info.cap_offset = 0; /* output, no-recopy necessary */
+		}
+
 		info.flags = VFIO_IOMMU_INFO_PGSIZES;
 
 		info.iova_pgsizes = vfio_pgsize_bitmap(iommu);
 
+		ret = vfio_iommu_iova_build_caps(iommu, &caps);
+		if (ret)
+			return ret;
+
+		if (caps.size) {
+			info.flags |= VFIO_IOMMU_INFO_CAPS;
+
+			if (info.argsz < sizeof(info) + caps.size) {
+				info.argsz = sizeof(info) + caps.size;
+			} else {
+				vfio_info_cap_shift(&caps, sizeof(info));
+				if (copy_to_user((void __user *)arg +
+						sizeof(info), caps.buf,
+						caps.size)) {
+					kfree(caps.buf);
+					return -EFAULT;
+				}
+				info.cap_offset = sizeof(info);
+			}
+
+			kfree(caps.buf);
+		}
+
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 8f10748dac79..1259dccd09d2 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -714,7 +714,31 @@ struct vfio_iommu_type1_info {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
-	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
+#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
+	__u64	iova_pgsizes;	/* Bitmap of supported page sizes */
+	__u32   cap_offset;	/* Offset within info struct of first cap */
+};
+
+/*
+ * The IOVA capability allows to report the valid IOVA range(s)
+ * excluding any non-relaxable reserved regions exposed by
+ * devices attached to the container. Any DMA map attempt
+ * outside the valid iova range will return error.
+ *
+ * The structures below define version 1 of this capability.
+ */
+#define VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE  1
+
+struct vfio_iova_range {
+	__u64	start;
+	__u64	end;
+};
+
+struct vfio_iommu_type1_info_cap_iova_range {
+	struct	vfio_info_cap_header header;
+	__u32	nr_iovas;
+	__u32	reserved;
+	struct	vfio_iova_range iova_ranges[];
 };
 
 #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
-- 
2.17.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
