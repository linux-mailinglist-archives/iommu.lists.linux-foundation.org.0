Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6E27CB7
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 14:25:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32EACC00;
	Thu, 23 May 2019 12:25:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 852F8AF3
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 12:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7DB9829
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 12:25:35 +0000 (UTC)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4NC97k9107079
	for <iommu@lists.linux-foundation.org>; Thu, 23 May 2019 08:25:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sntw89tpc-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <iommu@lists.linux-foundation.org>; Thu, 23 May 2019 08:25:34 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <iommu@lists.linux-foundation.org> from <pmorel@linux.ibm.com>;
	Thu, 23 May 2019 13:25:32 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 23 May 2019 13:25:30 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4NCPTdO43515970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 23 May 2019 12:25:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FAC55204E;
	Thu, 23 May 2019 12:25:29 +0000 (GMT)
Received: from morel-ThinkPad-W530.boeblingen.de.ibm.com (unknown
	[9.152.222.40])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 928E952051;
	Thu, 23 May 2019 12:25:28 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: sebott@linux.vnet.ibm.com
Subject: [PATCH v3 3/3] vfio: pci: Using a device region to retrieve zPCI
	information
Date: Thu, 23 May 2019 14:25:26 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558614326-24711-1-git-send-email-pmorel@linux.ibm.com>
References: <1558614326-24711-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19052312-0008-0000-0000-000002E9A67D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052312-0009-0000-0000-000022566522
Message-Id: <1558614326-24711-4-git-send-email-pmorel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-23_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905230087
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, pasic@linux.vnet.ibm.com,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	heiko.carstens@de.ibm.com, walling@linux.ibm.com,
	linux-kernel@vger.kernel.org, borntraeger@de.ibm.com,
	iommu@lists.linux-foundation.org, schwidefsky@de.ibm.com,
	robin.murphy@arm.com, gerald.schaefer@de.ibm.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

We define a new configuration entry for VFIO/PCI, VFIO_PCI_ZDEV

When the VFIO_PCI_ZDEV feature is configured we initialize
a new device region, VFIO_REGION_SUBTYPE_ZDEV_CLP, to hold
the information from the ZPCI device the userland needs to
give to a guest driving the zPCI function.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 drivers/vfio/pci/Kconfig            |  7 ++++
 drivers/vfio/pci/Makefile           |  1 +
 drivers/vfio/pci/vfio_pci.c         |  9 ++++
 drivers/vfio/pci/vfio_pci_private.h | 10 +++++
 drivers/vfio/pci/vfio_pci_zdev.c    | 83 +++++++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+)
 create mode 100644 drivers/vfio/pci/vfio_pci_zdev.c

diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
index d0f8e4f..9c1181c 100644
--- a/drivers/vfio/pci/Kconfig
+++ b/drivers/vfio/pci/Kconfig
@@ -44,3 +44,10 @@ config VFIO_PCI_NVLINK2
 	depends on VFIO_PCI && PPC_POWERNV
 	help
 	  VFIO PCI support for P9 Witherspoon machine with NVIDIA V100 GPUs
+
+config VFIO_PCI_ZDEV
+	tristate "VFIO PCI Generic for ZPCI devices"
+	depends on VFIO_PCI && S390
+	default y
+	help
+	  VFIO PCI support for S390 Z-PCI devices
diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
index 9662c06..fd53819 100644
--- a/drivers/vfio/pci/Makefile
+++ b/drivers/vfio/pci/Makefile
@@ -2,5 +2,6 @@
 vfio-pci-y := vfio_pci.o vfio_pci_intrs.o vfio_pci_rdwr.o vfio_pci_config.o
 vfio-pci-$(CONFIG_VFIO_PCI_IGD) += vfio_pci_igd.o
 vfio-pci-$(CONFIG_VFIO_PCI_NVLINK2) += vfio_pci_nvlink2.o
+vfio-pci-$(CONFIG_VFIO_PCI_ZDEV) += vfio_pci_zdev.o
 
 obj-$(CONFIG_VFIO_PCI) += vfio-pci.o
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 3fa20e9..b6087d6 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -362,6 +362,15 @@ static int vfio_pci_enable(struct vfio_pci_device *vdev)
 		}
 	}
 
+	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV)) {
+		ret = vfio_pci_zdev_init(vdev);
+		if (ret) {
+			dev_warn(&vdev->pdev->dev,
+				 "Failed to setup ZDEV regions\n");
+			goto disable_exit;
+		}
+	}
+
 	vfio_pci_probe_mmaps(vdev);
 
 	return 0;
diff --git a/drivers/vfio/pci/vfio_pci_private.h b/drivers/vfio/pci/vfio_pci_private.h
index 1812cf2..db73cdf 100644
--- a/drivers/vfio/pci/vfio_pci_private.h
+++ b/drivers/vfio/pci/vfio_pci_private.h
@@ -189,4 +189,14 @@ static inline int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
 	return -ENODEV;
 }
 #endif
+
+#ifdef(IS_ENABLED_VFIO_PCI_ZDEV)
+extern int vfio_pci_zdev_init(struct vfio_pci_device *vdev);
+#else
+static inline int vfio_pci_zdev_init(struct vfio_pci_device *vdev)
+{
+	return -ENODEV;
+}
+#endif
+
 #endif /* VFIO_PCI_PRIVATE_H */
diff --git a/drivers/vfio/pci/vfio_pci_zdev.c b/drivers/vfio/pci/vfio_pci_zdev.c
new file mode 100644
index 0000000..230a4e4
--- /dev/null
+++ b/drivers/vfio/pci/vfio_pci_zdev.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * VFIO ZPCI devices support
+ *
+ * Copyright (C) IBM Corp. 2019.  All rights reserved.
+ *	Author: Pierre Morel <pmorel@linux.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+#include <linux/io.h>
+#include <linux/pci.h>
+#include <linux/uaccess.h>
+#include <linux/vfio.h>
+#include <linux/vfio_zdev.h>
+
+#include "vfio_pci_private.h"
+
+static size_t vfio_pci_zdev_rw(struct vfio_pci_device *vdev,
+			       char __user *buf, size_t count, loff_t *ppos,
+			       bool iswrite)
+{
+	struct vfio_region_zpci_info *region;
+	struct zpci_dev *zdev;
+	unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
+
+	if (!vdev->pdev->bus)
+		return -ENODEV;
+
+	zdev = vdev->pdev->bus->sysdata;
+	if (!zdev)
+		return -ENODEV;
+
+	if ((*ppos & VFIO_PCI_OFFSET_MASK) || (count != sizeof(*region)))
+		return -EINVAL;
+
+	region = vdev->region[index - VFIO_PCI_NUM_REGIONS].data;
+	region->dasm = zdev->dma_mask;
+	region->start_dma = zdev->start_dma;
+	region->end_dma = zdev->end_dma;
+	region->msi_addr = zdev->msi_addr;
+	region->flags = VFIO_PCI_ZDEV_FLAGS_REFRESH;
+	region->gid = zdev->pfgid;
+	region->mui = zdev->fmb_update;
+	region->noi = zdev->max_msi;
+	memcpy(region->util_str, zdev->util_str, CLP_UTIL_STR_LEN);
+
+	if (copy_to_user(buf, region, count))
+		return -EFAULT;
+
+	return count;
+}
+
+static void vfio_pci_zdev_release(struct vfio_pci_device *vdev,
+				  struct vfio_pci_region *region)
+{
+	kfree(region->data);
+}
+
+static const struct vfio_pci_regops vfio_pci_zdev_regops = {
+	.rw		= vfio_pci_zdev_rw,
+	.release	= vfio_pci_zdev_release,
+};
+
+int vfio_pci_zdev_init(struct vfio_pci_device *vdev)
+{
+	struct vfio_region_zpci_info *region;
+	int ret;
+
+	region = kmalloc(sizeof(*region), GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	ret = vfio_pci_register_dev_region(vdev,
+		PCI_VENDOR_ID_IBM | VFIO_REGION_TYPE_PCI_VENDOR_TYPE,
+		VFIO_REGION_SUBTYPE_ZDEV_CLP,
+		&vfio_pci_zdev_regops, sizeof(*region),
+		VFIO_REGION_INFO_FLAG_READ, region);
+
+	return ret;
+}
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
