Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12C35B3B0
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 13:49:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDF8A40297;
	Sun, 11 Apr 2021 11:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XJjI4PcdrLa8; Sun, 11 Apr 2021 11:48:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id D128B400E0;
	Sun, 11 Apr 2021 11:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE8E9C000A;
	Sun, 11 Apr 2021 11:48:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF7FDC000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C20CB6058A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2dk_jKY8sj8 for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 11:48:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83A50600CC
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618141734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dzicp7nX2ISVj7BxbMHvZ5Qzj1NEvjdylykxuv6gTiE=;
 b=XfZztymnysiCvj/RoiXpahsHX15t7QnpauP3K+v8Z4uOaA68D/3sGkpWIZe/kOtBnApsMb
 i4qrIHw0waJEie/f+XY67kzoxryK/96JMzV91VnfW4zLPqi++pGE5snGTpXGGfCoN5+GSE
 aM73wr3X3U514+y+MTWljWpLgBp+K3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-4PN6aNWeO7GFXuncSFwNIw-1; Sun, 11 Apr 2021 07:48:52 -0400
X-MC-Unique: 4PN6aNWeO7GFXuncSFwNIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2C5E107ACCD;
 Sun, 11 Apr 2021 11:48:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61DB95C3E4;
 Sun, 11 Apr 2021 11:48:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 maz@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 alex.williamson@redhat.com, tn@semihalf.com, zhukeqian1@huawei.com
Subject: [PATCH v13 08/13] vfio/pci: Add framework for custom interrupt indices
Date: Sun, 11 Apr 2021 13:46:54 +0200
Message-Id: <20210411114659.15051-9-eric.auger@redhat.com>
In-Reply-To: <20210411114659.15051-1-eric.auger@redhat.com>
References: <20210411114659.15051-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jean-philippe@linaro.org, wangxingang5@huawei.com, lushenming@huawei.com,
 vivek.gautam@arm.com, vsethi@nvidia.com, zhangfei.gao@linaro.org,
 jiangkunkun@huawei.com
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

Implement IRQ capability chain infrastructure. All interrupt
indexes beyond VFIO_PCI_NUM_IRQS are handled as extended
interrupts. They are registered with a specific type/subtype
and supported flags.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- check !vdev->num_ext_irqs in vfio_pci_set_ext_irq_trigger()
  [Shameer, Qubingbing]
---
 drivers/vfio/pci/vfio_pci.c         | 99 +++++++++++++++++++++++------
 drivers/vfio/pci/vfio_pci_intrs.c   | 62 ++++++++++++++++++
 drivers/vfio/pci/vfio_pci_private.h | 14 ++++
 3 files changed, 157 insertions(+), 18 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index eef76560be55..b3fc6ed4ed7a 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -610,6 +610,14 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
 	ret = iommu_unregister_device_fault_handler(&vdev->pdev->dev);
 	WARN_ON(ret == -EBUSY);
 
+	for (i = 0; i < vdev->num_ext_irqs; i++)
+		vfio_pci_set_irqs_ioctl(vdev, VFIO_IRQ_SET_DATA_NONE |
+					VFIO_IRQ_SET_ACTION_TRIGGER,
+					VFIO_PCI_NUM_IRQS + i, 0, 0, NULL);
+	vdev->num_ext_irqs = 0;
+	kfree(vdev->ext_irqs);
+	vdev->ext_irqs = NULL;
+
 	/* Device closed, don't need mutex here */
 	list_for_each_entry_safe(ioeventfd, ioeventfd_tmp,
 				 &vdev->ioeventfds_list, next) {
@@ -825,6 +833,9 @@ static int vfio_pci_get_irq_count(struct vfio_pci_device *vdev, int irq_type)
 			return 1;
 	} else if (irq_type == VFIO_PCI_REQ_IRQ_INDEX) {
 		return 1;
+	} else if (irq_type >= VFIO_PCI_NUM_IRQS &&
+		   irq_type < VFIO_PCI_NUM_IRQS + vdev->num_ext_irqs) {
+		return 1;
 	}
 
 	return 0;
@@ -1011,7 +1022,7 @@ static long vfio_pci_ioctl(void *device_data,
 			info.flags |= VFIO_DEVICE_FLAGS_RESET;
 
 		info.num_regions = VFIO_PCI_NUM_REGIONS + vdev->num_regions;
-		info.num_irqs = VFIO_PCI_NUM_IRQS;
+		info.num_irqs = VFIO_PCI_NUM_IRQS + vdev->num_ext_irqs;
 
 		ret = vfio_pci_info_zdev_add_caps(vdev, &caps);
 		if (ret && ret != -ENODEV) {
@@ -1187,36 +1198,87 @@ static long vfio_pci_ioctl(void *device_data,
 
 	} else if (cmd == VFIO_DEVICE_GET_IRQ_INFO) {
 		struct vfio_irq_info info;
+		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
+		unsigned long capsz;
 
 		minsz = offsetofend(struct vfio_irq_info, count);
 
+		/* For backward compatibility, cannot require this */
+		capsz = offsetofend(struct vfio_irq_info, cap_offset);
+
 		if (copy_from_user(&info, (void __user *)arg, minsz))
 			return -EFAULT;
 
-		if (info.argsz < minsz || info.index >= VFIO_PCI_NUM_IRQS)
+		if (info.argsz < minsz ||
+			info.index >= VFIO_PCI_NUM_IRQS + vdev->num_ext_irqs)
 			return -EINVAL;
 
-		switch (info.index) {
-		case VFIO_PCI_INTX_IRQ_INDEX ... VFIO_PCI_MSIX_IRQ_INDEX:
-		case VFIO_PCI_REQ_IRQ_INDEX:
-			break;
-		case VFIO_PCI_ERR_IRQ_INDEX:
-			if (pci_is_pcie(vdev->pdev))
-				break;
-			fallthrough;
-		default:
-			return -EINVAL;
-		}
+		if (info.argsz >= capsz)
+			minsz = capsz;
 
 		info.flags = VFIO_IRQ_INFO_EVENTFD;
 
-		info.count = vfio_pci_get_irq_count(vdev, info.index);
-
-		if (info.index == VFIO_PCI_INTX_IRQ_INDEX)
+		switch (info.index) {
+		case VFIO_PCI_INTX_IRQ_INDEX:
 			info.flags |= (VFIO_IRQ_INFO_MASKABLE |
 				       VFIO_IRQ_INFO_AUTOMASKED);
-		else
+			break;
+		case VFIO_PCI_MSI_IRQ_INDEX ... VFIO_PCI_MSIX_IRQ_INDEX:
+		case VFIO_PCI_REQ_IRQ_INDEX:
 			info.flags |= VFIO_IRQ_INFO_NORESIZE;
+			break;
+		case VFIO_PCI_ERR_IRQ_INDEX:
+			info.flags |= VFIO_IRQ_INFO_NORESIZE;
+			if (!pci_is_pcie(vdev->pdev))
+				return -EINVAL;
+			break;
+		default:
+		{
+			struct vfio_irq_info_cap_type cap_type = {
+				.header.id = VFIO_IRQ_INFO_CAP_TYPE,
+				.header.version = 1 };
+			int ret, i;
+
+			if (info.index >= VFIO_PCI_NUM_IRQS +
+						vdev->num_ext_irqs)
+				return -EINVAL;
+			info.index = array_index_nospec(info.index,
+							VFIO_PCI_NUM_IRQS +
+							vdev->num_ext_irqs);
+			i = info.index - VFIO_PCI_NUM_IRQS;
+
+			info.flags = vdev->ext_irqs[i].flags;
+			cap_type.type = vdev->ext_irqs[i].type;
+			cap_type.subtype = vdev->ext_irqs[i].subtype;
+
+			ret = vfio_info_add_capability(&caps,
+					&cap_type.header,
+					sizeof(cap_type));
+			if (ret)
+				return ret;
+		}
+		}
+
+		info.count = vfio_pci_get_irq_count(vdev, info.index);
+
+		if (caps.size) {
+			info.flags |= VFIO_IRQ_INFO_FLAG_CAPS;
+			if (info.argsz < sizeof(info) + caps.size) {
+				info.argsz = sizeof(info) + caps.size;
+				info.cap_offset = 0;
+			} else {
+				vfio_info_cap_shift(&caps, sizeof(info));
+				if (copy_to_user((void __user *)arg +
+						  sizeof(info), caps.buf,
+						  caps.size)) {
+					kfree(caps.buf);
+					return -EFAULT;
+				}
+				info.cap_offset = sizeof(info);
+			}
+
+			kfree(caps.buf);
+		}
 
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
@@ -1235,7 +1297,8 @@ static long vfio_pci_ioctl(void *device_data,
 		max = vfio_pci_get_irq_count(vdev, hdr.index);
 
 		ret = vfio_set_irqs_validate_and_prepare(&hdr, max,
-						 VFIO_PCI_NUM_IRQS, &data_size);
+				VFIO_PCI_NUM_IRQS + vdev->num_ext_irqs,
+				&data_size);
 		if (ret)
 			return ret;
 
diff --git a/drivers/vfio/pci/vfio_pci_intrs.c b/drivers/vfio/pci/vfio_pci_intrs.c
index 869dce5f134d..d67995fe872f 100644
--- a/drivers/vfio/pci/vfio_pci_intrs.c
+++ b/drivers/vfio/pci/vfio_pci_intrs.c
@@ -19,6 +19,7 @@
 #include <linux/vfio.h>
 #include <linux/wait.h>
 #include <linux/slab.h>
+#include <linux/nospec.h>
 
 #include "vfio_pci_private.h"
 
@@ -635,6 +636,24 @@ static int vfio_pci_set_req_trigger(struct vfio_pci_device *vdev,
 					       count, flags, data);
 }
 
+static int vfio_pci_set_ext_irq_trigger(struct vfio_pci_device *vdev,
+					unsigned int index, unsigned int start,
+					unsigned int count, uint32_t flags,
+					void *data)
+{
+	int i;
+
+	if (start != 0 || count > 1 || !vdev->num_ext_irqs)
+		return -EINVAL;
+
+	index = array_index_nospec(index,
+				   VFIO_PCI_NUM_IRQS + vdev->num_ext_irqs);
+	i = index - VFIO_PCI_NUM_IRQS;
+
+	return vfio_pci_set_ctx_trigger_single(&vdev->ext_irqs[i].trigger,
+					       count, flags, data);
+}
+
 int vfio_pci_set_irqs_ioctl(struct vfio_pci_device *vdev, uint32_t flags,
 			    unsigned index, unsigned start, unsigned count,
 			    void *data)
@@ -684,6 +703,13 @@ int vfio_pci_set_irqs_ioctl(struct vfio_pci_device *vdev, uint32_t flags,
 			break;
 		}
 		break;
+	default:
+		switch (flags & VFIO_IRQ_SET_ACTION_TYPE_MASK) {
+		case VFIO_IRQ_SET_ACTION_TRIGGER:
+			func = vfio_pci_set_ext_irq_trigger;
+			break;
+		}
+		break;
 	}
 
 	if (!func)
@@ -691,3 +717,39 @@ int vfio_pci_set_irqs_ioctl(struct vfio_pci_device *vdev, uint32_t flags,
 
 	return func(vdev, index, start, count, flags, data);
 }
+
+int vfio_pci_get_ext_irq_index(struct vfio_pci_device *vdev,
+			       unsigned int type, unsigned int subtype)
+{
+	int i;
+
+	for (i = 0; i <  vdev->num_ext_irqs; i++) {
+		if (vdev->ext_irqs[i].type == type &&
+		    vdev->ext_irqs[i].subtype == subtype) {
+			return i;
+		}
+	}
+	return -EINVAL;
+}
+
+int vfio_pci_register_irq(struct vfio_pci_device *vdev,
+			  unsigned int type, unsigned int subtype,
+			  u32 flags)
+{
+	struct vfio_ext_irq *ext_irqs;
+
+	ext_irqs = krealloc(vdev->ext_irqs,
+			    (vdev->num_ext_irqs + 1) * sizeof(*ext_irqs),
+			    GFP_KERNEL);
+	if (!ext_irqs)
+		return -ENOMEM;
+
+	vdev->ext_irqs = ext_irqs;
+
+	vdev->ext_irqs[vdev->num_ext_irqs].type = type;
+	vdev->ext_irqs[vdev->num_ext_irqs].subtype = subtype;
+	vdev->ext_irqs[vdev->num_ext_irqs].flags = flags;
+	vdev->ext_irqs[vdev->num_ext_irqs].trigger = NULL;
+	vdev->num_ext_irqs++;
+	return 0;
+}
diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
index 76cb3bd11375..e2a999107bcb 100644
--- a/drivers/vfio/pci/vfio_pci_private.h
+++ b/drivers/vfio/pci/vfio_pci_private.h
@@ -77,6 +77,13 @@ struct vfio_pci_region {
 	u32				flags;
 };
 
+struct vfio_ext_irq {
+	u32				type;
+	u32				subtype;
+	u32				flags;
+	struct eventfd_ctx		*trigger;
+};
+
 struct vfio_pci_dummy_resource {
 	struct resource		resource;
 	int			index;
@@ -111,6 +118,8 @@ struct vfio_pci_device {
 	struct vfio_pci_irq_ctx	*ctx;
 	int			num_ctx;
 	int			irq_type;
+	struct vfio_ext_irq	*ext_irqs;
+	int			num_ext_irqs;
 	int			num_regions;
 	struct vfio_pci_region	*region;
 	u8			msi_qmax;
@@ -154,6 +163,11 @@ struct vfio_pci_device {
 
 extern void vfio_pci_intx_mask(struct vfio_pci_device *vdev);
 extern void vfio_pci_intx_unmask(struct vfio_pci_device *vdev);
+extern int vfio_pci_register_irq(struct vfio_pci_device *vdev,
+				 unsigned int type, unsigned int subtype,
+				 u32 flags);
+extern int vfio_pci_get_ext_irq_index(struct vfio_pci_device *vdev,
+				      unsigned int type, unsigned int subtype);
 
 extern int vfio_pci_set_irqs_ioctl(struct vfio_pci_device *vdev,
 				   uint32_t flags, unsigned index,
-- 
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
