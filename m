Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C041EEF24
	for <lists.iommu@lfdr.de>; Fri,  5 Jun 2020 03:35:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 905BF204BC;
	Fri,  5 Jun 2020 01:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqA5-vBe8zA7; Fri,  5 Jun 2020 01:35:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 55C67203F6;
	Fri,  5 Jun 2020 01:35:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3922DC016E;
	Fri,  5 Jun 2020 01:35:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBAB1C016E
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 01:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D5EF920410
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 01:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVg6aBcV2YOV for <iommu@lists.linux-foundation.org>;
 Fri,  5 Jun 2020 01:35:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 784D5203F6
 for <iommu@lists.linux-foundation.org>; Fri,  5 Jun 2020 01:35:29 +0000 (UTC)
IronPort-SDR: fqPIES3+dlTG1224LhgnVsPzs5JEMlHsS0cfOziaG2wk40vZIDndwNs+EfnrAVWseZ2oKRoHsk
 BFOa3Ztfnj4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 18:35:21 -0700
IronPort-SDR: +F59LkpZqkxQZwNjckRijeLkPnr+BpGvxzXQu92fnOxj9PisDcNRi17YTB0GZDrcYRKW9Nj331
 Ta650kqKWlkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,474,1583222400"; d="scan'208";a="259050537"
Received: from sai-dev-mach.sc.intel.com ([143.183.140.153])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2020 18:35:22 -0700
From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V4 3/3] iommu: Document usage of
 "/sys/kernel/iommu_groups/<grp_id>/type" file
Date: Thu,  4 Jun 2020 18:32:08 -0700
Message-Id: <24102f22824b26cf4fa6ec1c84d176110b21c574.1591290586.git.sai.praneeth.prakhya@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1591290586.git.sai.praneeth.prakhya@intel.com>
References: <cover.1591290586.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

The default domain type of an iommu group can be changed by writing to
"/sys/kernel/iommu_groups/<grp_id>/type" file. Hence, document it's usage
and more importantly spell out its limitations.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
---
 .../ABI/testing/sysfs-kernel-iommu_groups     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-iommu_groups b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
index 017f5bc3920c..a498daffeb0c 100644
--- a/Documentation/ABI/testing/sysfs-kernel-iommu_groups
+++ b/Documentation/ABI/testing/sysfs-kernel-iommu_groups
@@ -33,3 +33,33 @@ Description:    In case an RMRR is used only by graphics or USB devices
 		it is now exposed as "direct-relaxable" instead of "direct".
 		In device assignment use case, for instance, those RMRR
 		are considered to be relaxable and safe.
+
+What:		/sys/kernel/iommu_groups/<grp_id>/type
+Date:		June 2020
+KernelVersion:	v5.8
+Contact:	Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
+Description:	Let the user know the type of default domain in use by iommu
+		for this group. A privileged user could request kernel to change
+		the group type by writing to this file. Presently, only three
+		types are supported
+		1. DMA: All the DMA transactions from the device in this group
+			are translated by the iommu.
+		2. identity: All the DMA transactions from the device in this
+			     group are *not* translated by the iommu.
+		3. auto: Change to the type the device was booted with. When the
+			 user reads the file he would never see "auto". This is
+			 just a write only value.
+		Note:
+		-----
+		A group type could be modified only when
+		1. The group has *only* one device
+		2. The device in the group is not bound to any device driver.
+		   So, the user must first unbind the appropriate driver and
+		   then change the default domain type.
+		Caution:
+		--------
+		Unbinding a device driver will take away the driver's control
+		over the device and if done on devices that host root file
+		system could lead to catastrophic effects (the user might
+		need to reboot the machine to get it to normal state). So, it's
+		expected that the user understands what he is doing.
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
