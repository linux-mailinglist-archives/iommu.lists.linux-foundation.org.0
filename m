Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D14942AAF8
	for <lists.iommu@lfdr.de>; Sun, 26 May 2019 18:12:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5A6F13E6;
	Sun, 26 May 2019 16:12:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 773AB13E6
	for <iommu@lists.linux-foundation.org>;
	Sun, 26 May 2019 16:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01C046C5
	for <iommu@lists.linux-foundation.org>;
	Sun, 26 May 2019 16:12:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81201330259;
	Sun, 26 May 2019 16:12:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A5995DD81;
	Sun, 26 May 2019 16:12:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v8 22/29] vfio: VFIO_IOMMU_ATTACH/DETACH_PASID_TABLE
Date: Sun, 26 May 2019 18:09:57 +0200
Message-Id: <20190526161004.25232-23-eric.auger@redhat.com>
In-Reply-To: <20190526161004.25232-1-eric.auger@redhat.com>
References: <20190526161004.25232-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 26 May 2019 16:12:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org, kevin.tian@intel.com,
	vincent.stehle@arm.com, ashok.raj@intel.com
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

From: "Liu, Yi L" <yi.l.liu@linux.intel.com>

This patch adds VFIO_IOMMU_ATTACH/DETACH_PASID_TABLE ioctl
which aims to pass/withdraw the virtual iommu guest configuration
to/from the VFIO driver downto to the iommu subsystem.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- add a comment related to VFIO_IOMMU_DETACH_PASID_TABLE

v3 -> v4:
- restore ATTACH/DETACH
- add unwind on failure

v2 -> v3:
- s/BIND_PASID_TABLE/SET_PASID_TABLE

v1 -> v2:
- s/BIND_GUEST_STAGE/BIND_PASID_TABLE
- remove the struct device arg
---
 drivers/vfio/vfio_iommu_type1.c | 53 +++++++++++++++++++++++++++++++++
 include/uapi/linux/vfio.h       | 22 ++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 3ddc375e7063..b2d609d6fe83 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -1758,6 +1758,43 @@ static int vfio_domains_have_iommu_cache(struct vfio_iommu *iommu)
 	return ret;
 }
 
+static void
+vfio_detach_pasid_table(struct vfio_iommu *iommu)
+{
+	struct vfio_domain *d;
+
+	mutex_lock(&iommu->lock);
+
+	list_for_each_entry(d, &iommu->domain_list, next) {
+		iommu_detach_pasid_table(d->domain);
+	}
+	mutex_unlock(&iommu->lock);
+}
+
+static int
+vfio_attach_pasid_table(struct vfio_iommu *iommu,
+			struct vfio_iommu_type1_attach_pasid_table *ustruct)
+{
+	struct vfio_domain *d;
+	int ret = 0;
+
+	mutex_lock(&iommu->lock);
+
+	list_for_each_entry(d, &iommu->domain_list, next) {
+		ret = iommu_attach_pasid_table(d->domain, &ustruct->config);
+		if (ret)
+			goto unwind;
+	}
+	goto unlock;
+unwind:
+	list_for_each_entry_continue_reverse(d, &iommu->domain_list, next) {
+		iommu_detach_pasid_table(d->domain);
+	}
+unlock:
+	mutex_unlock(&iommu->lock);
+	return ret;
+}
+
 static long vfio_iommu_type1_ioctl(void *iommu_data,
 				   unsigned int cmd, unsigned long arg)
 {
@@ -1828,6 +1865,22 @@ static long vfio_iommu_type1_ioctl(void *iommu_data,
 
 		return copy_to_user((void __user *)arg, &unmap, minsz) ?
 			-EFAULT : 0;
+	} else if (cmd == VFIO_IOMMU_ATTACH_PASID_TABLE) {
+		struct vfio_iommu_type1_attach_pasid_table ustruct;
+
+		minsz = offsetofend(struct vfio_iommu_type1_attach_pasid_table,
+				    config);
+
+		if (copy_from_user(&ustruct, (void __user *)arg, minsz))
+			return -EFAULT;
+
+		if (ustruct.argsz < minsz || ustruct.flags)
+			return -EINVAL;
+
+		return vfio_attach_pasid_table(iommu, &ustruct);
+	} else if (cmd == VFIO_IOMMU_DETACH_PASID_TABLE) {
+		vfio_detach_pasid_table(iommu);
+		return 0;
 	}
 
 	return -ENOTTY;
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 8f10748dac79..4316dd8cb5b5 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -14,6 +14,7 @@
 
 #include <linux/types.h>
 #include <linux/ioctl.h>
+#include <linux/iommu.h>
 
 #define VFIO_API_VERSION	0
 
@@ -763,6 +764,27 @@ struct vfio_iommu_type1_dma_unmap {
 #define VFIO_IOMMU_ENABLE	_IO(VFIO_TYPE, VFIO_BASE + 15)
 #define VFIO_IOMMU_DISABLE	_IO(VFIO_TYPE, VFIO_BASE + 16)
 
+/**
+ * VFIO_IOMMU_ATTACH_PASID_TABLE - _IOWR(VFIO_TYPE, VFIO_BASE + 22,
+ *			struct vfio_iommu_type1_attach_pasid_table)
+ *
+ * Passes the PASID table to the host. Calling ATTACH_PASID_TABLE
+ * while a table is already installed is allowed: it replaces the old
+ * table. DETACH does a comprehensive tear down of the nested mode.
+ */
+struct vfio_iommu_type1_attach_pasid_table {
+	__u32	argsz;
+	__u32	flags;
+	struct iommu_pasid_table_config config;
+};
+#define VFIO_IOMMU_ATTACH_PASID_TABLE	_IO(VFIO_TYPE, VFIO_BASE + 22)
+
+/**
+ * VFIO_IOMMU_DETACH_PASID_TABLE - - _IOWR(VFIO_TYPE, VFIO_BASE + 23)
+ * Detaches the PASID table
+ */
+#define VFIO_IOMMU_DETACH_PASID_TABLE	_IO(VFIO_TYPE, VFIO_BASE + 23)
+
 /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU -------- */
 
 /*
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
