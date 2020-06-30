Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878B20FD68
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 22:06:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D49E86AD1;
	Tue, 30 Jun 2020 20:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C7M4Advn7tk; Tue, 30 Jun 2020 20:06:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EBCB86AB3;
	Tue, 30 Jun 2020 20:06:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C1A8C088F;
	Tue, 30 Jun 2020 20:06:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C3B5C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5B88486AB3
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HNJXbW6wXZ6Q for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 20:06:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 275AD869E1
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593547612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9jfmIqGlvg6L8cUMcSx5GNUe0sJOHSYjN99uBm+lyzk=;
 b=fq8Ht27uuRDBOOiOvAz/8VtNwzo4bHmggHBDCIsoubGZxCtD2rTEfk7/lTqCGW/gSLC/SN
 I2bzErJEAZi/bsbraPKsyBEH2F8f5MNnURTohqBXW7R+vciC4munqoWc9YyngXtoSgnTlH
 A1sQ6IQ1QR8xd/Gbrh5ypzwnLrYaFFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-XTtdO96KOjq2od_fCRPCmg-1; Tue, 30 Jun 2020 16:06:47 -0400
X-MC-Unique: XTtdO96KOjq2od_fCRPCmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347831005512;
 Tue, 30 Jun 2020 20:06:46 +0000 (UTC)
Received: from cantor.redhat.com (ovpn-115-86.phx2.redhat.com [10.3.115.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6FB7BEA0;
 Tue, 30 Jun 2020 20:06:45 +0000 (UTC)
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/2] iommu/amd: Move Kconfig and Makefile bits down into
 amd directory
Date: Tue, 30 Jun 2020 13:06:36 -0700
Message-Id: <20200630200636.48600-3-jsnitsel@redhat.com>
In-Reply-To: <20200630200636.48600-1-jsnitsel@redhat.com>
References: <20200630200636.48600-1-jsnitsel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Move AMD Kconfig and Makefile bits down into the amd directory
with the rest of the AMD specific files.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
---
 drivers/iommu/Kconfig      | 45 +-------------------------------------
 drivers/iommu/Makefile     |  5 +----
 drivers/iommu/amd/Kconfig  | 44 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/amd/Makefile |  4 ++++
 4 files changed, 50 insertions(+), 48 deletions(-)
 create mode 100644 drivers/iommu/amd/Kconfig
 create mode 100644 drivers/iommu/amd/Makefile

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 281cd6bd0fe0..24000e7ed0fa 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -132,50 +132,7 @@ config IOMMU_PGTABLES_L2
 	def_bool y
 	depends on MSM_IOMMU && MMU && SMP && CPU_DCACHE_DISABLE=n
 
-# AMD IOMMU support
-config AMD_IOMMU
-	bool "AMD IOMMU support"
-	select SWIOTLB
-	select PCI_MSI
-	select PCI_ATS
-	select PCI_PRI
-	select PCI_PASID
-	select IOMMU_API
-	select IOMMU_IOVA
-	select IOMMU_DMA
-	depends on X86_64 && PCI && ACPI
-	help
-	  With this option you can enable support for AMD IOMMU hardware in
-	  your system. An IOMMU is a hardware component which provides
-	  remapping of DMA memory accesses from devices. With an AMD IOMMU you
-	  can isolate the DMA memory of different devices and protect the
-	  system from misbehaving device drivers or hardware.
-
-	  You can find out if your system has an AMD IOMMU if you look into
-	  your BIOS for an option to enable it or if you have an IVRS ACPI
-	  table.
-
-config AMD_IOMMU_V2
-	tristate "AMD IOMMU Version 2 driver"
-	depends on AMD_IOMMU
-	select MMU_NOTIFIER
-	help
-	  This option enables support for the AMD IOMMUv2 features of the IOMMU
-	  hardware. Select this option if you want to use devices that support
-	  the PCI PRI and PASID interface.
-
-config AMD_IOMMU_DEBUGFS
-	bool "Enable AMD IOMMU internals in DebugFS"
-	depends on AMD_IOMMU && IOMMU_DEBUGFS
-	help
-	  !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!
-
-	  DO NOT ENABLE THIS OPTION UNLESS YOU REALLY, -REALLY- KNOW WHAT YOU ARE DOING!!!
-	  Exposes AMD IOMMU device internals in DebugFS.
-
-	  This option is -NOT- intended for production environments, and should
-	  not generally be enabled.
-
+source "drivers/iommu/amd/Kconfig"
 source "drivers/iommu/intel/Kconfig"
 
 config IRQ_REMAP
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 71dd2f382e78..f356bc12b1c7 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += intel/
+obj-y += amd/ intel/
 obj-$(CONFIG_IOMMU_API) += iommu.o
 obj-$(CONFIG_IOMMU_API) += iommu-traces.o
 obj-$(CONFIG_IOMMU_API) += iommu-sysfs.o
@@ -12,9 +12,6 @@ obj-$(CONFIG_IOASID) += ioasid.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
 obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
-obj-$(CONFIG_AMD_IOMMU) += amd/iommu.o amd/init.o amd/quirks.o
-obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd/debugfs.o
-obj-$(CONFIG_AMD_IOMMU_V2) += amd/iommu_v2.o
 obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
 arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
 obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
diff --git a/drivers/iommu/amd/Kconfig b/drivers/iommu/amd/Kconfig
new file mode 100644
index 000000000000..1f061d91e0b8
--- /dev/null
+++ b/drivers/iommu/amd/Kconfig
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# AMD IOMMU support
+config AMD_IOMMU
+	bool "AMD IOMMU support"
+	select SWIOTLB
+	select PCI_MSI
+	select PCI_ATS
+	select PCI_PRI
+	select PCI_PASID
+	select IOMMU_API
+	select IOMMU_IOVA
+	select IOMMU_DMA
+	depends on X86_64 && PCI && ACPI
+	help
+	  With this option you can enable support for AMD IOMMU hardware in
+	  your system. An IOMMU is a hardware component which provides
+	  remapping of DMA memory accesses from devices. With an AMD IOMMU you
+	  can isolate the DMA memory of different devices and protect the
+	  system from misbehaving device drivers or hardware.
+
+	  You can find out if your system has an AMD IOMMU if you look into
+	  your BIOS for an option to enable it or if you have an IVRS ACPI
+	  table.
+
+config AMD_IOMMU_V2
+	tristate "AMD IOMMU Version 2 driver"
+	depends on AMD_IOMMU
+	select MMU_NOTIFIER
+	help
+	  This option enables support for the AMD IOMMUv2 features of the IOMMU
+	  hardware. Select this option if you want to use devices that support
+	  the PCI PRI and PASID interface.
+
+config AMD_IOMMU_DEBUGFS
+	bool "Enable AMD IOMMU internals in DebugFS"
+	depends on AMD_IOMMU && IOMMU_DEBUGFS
+	help
+	  !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!
+
+	  DO NOT ENABLE THIS OPTION UNLESS YOU REALLY, -REALLY- KNOW WHAT YOU ARE DOING!!!
+	  Exposes AMD IOMMU device internals in DebugFS.
+
+	  This option is -NOT- intended for production environments, and should
+	  not generally be enabled.
diff --git a/drivers/iommu/amd/Makefile b/drivers/iommu/amd/Makefile
new file mode 100644
index 000000000000..dc5a2fa4fd37
--- /dev/null
+++ b/drivers/iommu/amd/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_AMD_IOMMU) += iommu.o init.o quirks.o
+obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += debugfs.o
+obj-$(CONFIG_AMD_IOMMU_V2) += iommu_v2.o
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
