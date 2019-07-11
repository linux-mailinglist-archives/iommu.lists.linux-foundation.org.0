Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA365876
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 16:06:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8EED650A0;
	Thu, 11 Jul 2019 14:05:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B82475065
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 13:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4B668894
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 13:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A978930821E0;
	Thu, 11 Jul 2019 13:57:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDED360A97;
	Thu, 11 Jul 2019 13:57:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v9 05/11] vfio/pci: Register an iommu fault handler
Date: Thu, 11 Jul 2019 15:56:19 +0200
Message-Id: <20190711135625.20684-6-eric.auger@redhat.com>
In-Reply-To: <20190711135625.20684-1-eric.auger@redhat.com>
References: <20190711135625.20684-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 11 Jul 2019 13:57:38 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, vincent.stehle@arm.com,
	ashok.raj@intel.com, marc.zyngier@arm.com, tina.zhang@intel.com
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

Register an IOMMU fault handler which records faults in
the DMA FAULT region ring buffer. In a subsequent patch, we
will add the signaling of a specific eventfd to allow the
userspace to be notified whenever a new fault as shown up.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- handler now takes an iommu_fault handle
- eventfd signaling moved to a subsequent patch
- check the fault type and return an error if != UNRECOV
- still the fault handler registration can fail. We need to
  reach an agreement about how to deal with the situation

v3 -> v4:
- move iommu_unregister_device_fault_handler to vfio_pci_release
---
 drivers/vfio/pci/vfio_pci.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 3b091cfdaf46..c6fdbd64bfb2 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -27,6 +27,7 @@
 #include <linux/vfio.h>
 #include <linux/vgaarb.h>
 #include <linux/nospec.h>
+#include <linux/circ_buf.h>
 
 #include "vfio_pci_private.h"
 
@@ -281,6 +282,38 @@ static const struct vfio_pci_regops vfio_pci_dma_fault_regops = {
 	.add_capability = vfio_pci_dma_fault_add_capability,
 };
 
+int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
+{
+	struct vfio_pci_device *vdev = (struct vfio_pci_device *)data;
+	struct vfio_region_dma_fault *reg =
+		(struct vfio_region_dma_fault *)vdev->fault_pages;
+	struct iommu_fault *new =
+		(struct iommu_fault *)(vdev->fault_pages + reg->offset +
+			reg->head * reg->entry_size);
+	int head, tail, size;
+	int ret = 0;
+
+	if (fault->type != IOMMU_FAULT_DMA_UNRECOV)
+		return -ENOENT;
+
+	mutex_lock(&vdev->fault_queue_lock);
+
+	head = reg->head;
+	tail = reg->tail;
+	size = reg->nb_entries;
+
+	if (CIRC_SPACE(head, tail, size) < 1) {
+		ret = -ENOSPC;
+		goto unlock;
+	}
+
+	*new = *fault;
+	reg->head = (head + 1) % size;
+unlock:
+	mutex_unlock(&vdev->fault_queue_lock);
+	return ret;
+}
+
 #define DMA_FAULT_RING_LENGTH 512
 
 static int vfio_pci_init_dma_fault_region(struct vfio_pci_device *vdev)
@@ -315,6 +348,13 @@ static int vfio_pci_init_dma_fault_region(struct vfio_pci_device *vdev)
 	header->entry_size = sizeof(struct iommu_fault);
 	header->nb_entries = DMA_FAULT_RING_LENGTH;
 	header->offset = sizeof(struct vfio_region_dma_fault);
+
+	ret = iommu_register_device_fault_handler(&vdev->pdev->dev,
+					vfio_pci_iommu_dev_fault_handler,
+					vdev);
+	if (ret)
+		goto out;
+
 	return 0;
 out:
 	kfree(vdev->fault_pages);
@@ -530,6 +570,8 @@ static void vfio_pci_release(void *device_data)
 	if (!(--vdev->refcnt)) {
 		vfio_spapr_pci_eeh_release(vdev->pdev);
 		vfio_pci_disable(vdev);
+		/* TODO: Failure problematics */
+		iommu_unregister_device_fault_handler(&vdev->pdev->dev);
 	}
 
 	mutex_unlock(&vdev->reflck->lock);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
