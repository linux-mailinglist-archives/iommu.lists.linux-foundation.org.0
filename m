Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 450054F3711
	for <lists.iommu@lfdr.de>; Tue,  5 Apr 2022 16:15:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F13EC60EA3;
	Tue,  5 Apr 2022 14:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jdxCLzGGlWm1; Tue,  5 Apr 2022 14:15:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1C2F960E15;
	Tue,  5 Apr 2022 14:15:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA9FAC0012;
	Tue,  5 Apr 2022 14:15:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB49DC0012
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB0E782969
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOYcVFK1Qzuy for <iommu@lists.linux-foundation.org>;
 Tue,  5 Apr 2022 14:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4522482925
 for <iommu@lists.linux-foundation.org>; Tue,  5 Apr 2022 14:15:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA55C1474;
 Tue,  5 Apr 2022 07:15:42 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E836F3F5A1;
 Tue,  5 Apr 2022 07:15:41 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH] drm/mediatek: Stop using iommu_present()
Date: Tue,  5 Apr 2022 15:15:38 +0100
Message-Id: <7d91fdb731829febcd141361d46c7c4fd3a465ba.1649168138.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
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

Remove the pointless check. If an IOMMU is providing transparent DMA API
ops for any device(s) we care about, the DT code will have enforced the
appropriate probe ordering already.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 247c6ff277ef..2de31746a308 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/component.h>
-#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -239,9 +238,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
 
-	if (!iommu_present(&platform_bus_type))
-		return -EPROBE_DEFER;
-
 	pdev = of_find_device_by_node(private->mutex_node);
 	if (!pdev) {
 		dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
-- 
2.28.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
