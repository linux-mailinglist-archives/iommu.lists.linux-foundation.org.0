Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A35134D7
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 15:19:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14CC883466;
	Thu, 28 Apr 2022 13:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf5ZtlQCOsLE; Thu, 28 Apr 2022 13:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B59F683437;
	Thu, 28 Apr 2022 13:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E78DC002D;
	Thu, 28 Apr 2022 13:19:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97371C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7476541B6D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FaOOMsED-E9i for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 13:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D796419B2
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 13:18:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C34691477;
 Thu, 28 Apr 2022 06:18:56 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF08D3F73B;
 Thu, 28 Apr 2022 06:18:54 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 13/14] iommu/virtio: Clean up bus_set_iommu()
Date: Thu, 28 Apr 2022 14:18:14 +0100
Message-Id: <096fa605b5f01df4c5627a6c8abb95f1b940f82f.1650890638.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.35.3.dirty
In-Reply-To: <cover.1650890638.git.robin.murphy@arm.com>
References: <cover.1650890638.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 gerald.schaefer@linux.ibm.com
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

Stop calling bus_set_iommu() since it's now unnecessary, and simplify
the probe failure path accordingly.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/virtio-iommu.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 25be4b822aa0..bcbd10ec4ccb 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -7,7 +7,6 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/amba/bus.h>
 #include <linux/delay.h>
 #include <linux/dma-iommu.h>
 #include <linux/dma-map-ops.h>
@@ -17,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
-#include <linux/platform_device.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
@@ -1146,26 +1144,6 @@ static int viommu_probe(struct virtio_device *vdev)
 
 	iommu_device_register(&viommu->iommu, &viommu_ops, parent_dev);
 
-#ifdef CONFIG_PCI
-	if (pci_bus_type.iommu_ops != &viommu_ops) {
-		ret = bus_set_iommu(&pci_bus_type, &viommu_ops);
-		if (ret)
-			goto err_unregister;
-	}
-#endif
-#ifdef CONFIG_ARM_AMBA
-	if (amba_bustype.iommu_ops != &viommu_ops) {
-		ret = bus_set_iommu(&amba_bustype, &viommu_ops);
-		if (ret)
-			goto err_unregister;
-	}
-#endif
-	if (platform_bus_type.iommu_ops != &viommu_ops) {
-		ret = bus_set_iommu(&platform_bus_type, &viommu_ops);
-		if (ret)
-			goto err_unregister;
-	}
-
 	vdev->priv = viommu;
 
 	dev_info(dev, "input address: %u bits\n",
@@ -1174,9 +1152,6 @@ static int viommu_probe(struct virtio_device *vdev)
 
 	return 0;
 
-err_unregister:
-	iommu_device_sysfs_remove(&viommu->iommu);
-	iommu_device_unregister(&viommu->iommu);
 err_free_vqs:
 	vdev->config->del_vqs(vdev);
 
-- 
2.35.3.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
