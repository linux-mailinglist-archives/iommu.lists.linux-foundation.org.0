Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B643B5545EB
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 14:04:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0AFE41BBA;
	Wed, 22 Jun 2022 12:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0AFE41BBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USDgUxkKrWOE; Wed, 22 Jun 2022 12:04:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 430D641A49;
	Wed, 22 Jun 2022 12:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 430D641A49
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BD75C0081;
	Wed, 22 Jun 2022 12:04:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 620DFC002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E11940C99
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E11940C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id usIS7jDdE7Ef for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B77A40CA9
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B77A40CA9
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:04:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F4CD1477;
 Wed, 22 Jun 2022 05:04:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 666243F534;
 Wed, 22 Jun 2022 05:04:17 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com
Subject: [PATCH v2 2/2] vfio: Use device_iommu_capable()
Date: Wed, 22 Jun 2022 13:04:12 +0100
Message-Id: <910aef11138e3b6702b29a3e78415235aa4bf773.1655898523.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
In-Reply-To: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: jgg@nvidia.com, iommu@lists.linux.dev, iommu@lists.linux-foundation.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Use the new interface to check the capabilities for our device
specifically.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/vfio/vfio.c             | 2 +-
 drivers/vfio/vfio_iommu_type1.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 73bab04880d0..765d68192c88 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -621,7 +621,7 @@ int vfio_register_group_dev(struct vfio_device *device)
 	 * VFIO always sets IOMMU_CACHE because we offer no way for userspace to
 	 * restore cache coherency.
 	 */
-	if (!iommu_capable(device->dev->bus, IOMMU_CAP_CACHE_COHERENCY))
+	if (!device_iommu_capable(device->dev, IOMMU_CAP_CACHE_COHERENCY))
 		return -EINVAL;
 
 	return __vfio_register_dev(device,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index e38b8bfde677..2107e95eb743 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2247,7 +2247,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	list_add(&group->next, &domain->group_list);
 
 	msi_remap = irq_domain_check_msi_remap() ||
-		    iommu_capable(iommu_api_dev->dev->bus, IOMMU_CAP_INTR_REMAP);
+		    device_iommu_capable(iommu_api_dev->dev, IOMMU_CAP_INTR_REMAP);
 
 	if (!allow_unsafe_interrupts && !msi_remap) {
 		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
-- 
2.36.1.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
