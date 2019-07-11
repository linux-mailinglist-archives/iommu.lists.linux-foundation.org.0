Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C18246587C
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 16:06:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A5E82506B;
	Thu, 11 Jul 2019 14:05:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F23F5065
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 13:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D25E3883
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 13:59:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B5A44BC4;
	Thu, 11 Jul 2019 13:59:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9440160928;
	Thu, 11 Jul 2019 13:59:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v9 10/11] vfio/pci: Register and allow DMA FAULT IRQ signaling
Date: Thu, 11 Jul 2019 15:56:24 +0200
Message-Id: <20190711135625.20684-11-eric.auger@redhat.com>
In-Reply-To: <20190711135625.20684-1-eric.auger@redhat.com>
References: <20190711135625.20684-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 11 Jul 2019 13:59:09 +0000 (UTC)
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

Register the VFIO_IRQ_TYPE_NESTED/VFIO_IRQ_SUBTYPE_DMA_FAULT
IRQ that allows to signal a nested mode DMA fault.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/vfio/pci/vfio_pci.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index dcc246202094..a9df964e40c6 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -344,7 +344,7 @@ int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
 	struct iommu_fault *new =
 		(struct iommu_fault *)(vdev->fault_pages + reg->offset +
 			reg->head * reg->entry_size);
-	int head, tail, size;
+	int head, tail, size, ext_irq_index;
 	int ret = 0;
 
 	if (fault->type != IOMMU_FAULT_DMA_UNRECOV)
@@ -365,7 +365,19 @@ int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
 	reg->head = (head + 1) % size;
 unlock:
 	mutex_unlock(&vdev->fault_queue_lock);
-	return ret;
+	if (ret)
+		return ret;
+
+	ext_irq_index = vfio_pci_get_ext_irq_index(vdev, VFIO_IRQ_TYPE_NESTED,
+						   VFIO_IRQ_SUBTYPE_DMA_FAULT);
+	if (ext_irq_index < 0)
+		return -EINVAL;
+
+	mutex_lock(&vdev->igate);
+	if (vdev->ext_irqs[ext_irq_index].trigger)
+		eventfd_signal(vdev->ext_irqs[ext_irq_index].trigger, 1);
+	mutex_unlock(&vdev->igate);
+	return 0;
 }
 
 #define DMA_FAULT_RING_LENGTH 512
@@ -518,6 +530,12 @@ static int vfio_pci_enable(struct vfio_pci_device *vdev)
 	if (ret)
 		goto disable_exit;
 
+	ret = vfio_pci_register_irq(vdev, VFIO_IRQ_TYPE_NESTED,
+				    VFIO_IRQ_SUBTYPE_DMA_FAULT,
+				    VFIO_IRQ_INFO_EVENTFD);
+	if (ret)
+		goto disable_exit;
+
 	vfio_pci_probe_mmaps(vdev);
 
 	return 0;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
