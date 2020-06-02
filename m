Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EF1EB86F
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 11:26:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 190F920528;
	Tue,  2 Jun 2020 09:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJr4th6k6X0W; Tue,  2 Jun 2020 09:26:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 78F5D22613;
	Tue,  2 Jun 2020 09:26:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B41C0178;
	Tue,  2 Jun 2020 09:26:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7357C016E
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E168E85A84
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kb8LlCPeLgVW for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 09:26:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 58DBC859D9
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 09:26:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2078E2D5; Tue,  2 Jun 2020 11:26:22 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/amd: Move AMD IOMMU driver into subdirectory
Date: Tue,  2 Jun 2020 11:26:15 +0200
Message-Id: <20200602092616.24638-2-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200602092616.24638-1-joro@8bytes.org>
References: <20200602092616.24638-1-joro@8bytes.org>
Cc: Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Move all files related to the AMD IOMMU driver into its own
subdirectory.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/Makefile                               | 6 +++---
 drivers/iommu/{ => amd}/amd_iommu.h                  | 0
 drivers/iommu/{ => amd}/amd_iommu_types.h            | 0
 drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} | 0
 drivers/iommu/{amd_iommu_init.c => amd/init.c}       | 2 +-
 drivers/iommu/{amd_iommu.c => amd/iommu.c}           | 2 +-
 drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c}     | 0
 drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c}   | 0
 8 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/iommu/{ => amd}/amd_iommu.h (100%)
 rename drivers/iommu/{ => amd}/amd_iommu_types.h (100%)
 rename drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} (100%)
 rename drivers/iommu/{amd_iommu_init.c => amd/init.c} (99%)
 rename drivers/iommu/{amd_iommu.c => amd/iommu.c} (99%)
 rename drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c} (100%)
 rename drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c} (100%)

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 57cf4ba5e27c..3af7e374b0cb 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -11,9 +11,9 @@ obj-$(CONFIG_IOASID) += ioasid.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
 obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
-obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o amd_iommu_quirks.o
-obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
-obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
+obj-$(CONFIG_AMD_IOMMU) += amd/iommu.o amd/init.o amd/quirks.o
+obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd/debugfs.o
+obj-$(CONFIG_AMD_IOMMU_V2) += amd/iommu_v2.o
 obj-$(CONFIG_ARM_SMMU) += arm_smmu.o
 arm_smmu-objs += arm-smmu.o arm-smmu-impl.o arm-smmu-qcom.o
 obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
diff --git a/drivers/iommu/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
similarity index 100%
rename from drivers/iommu/amd_iommu.h
rename to drivers/iommu/amd/amd_iommu.h
diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd/amd_iommu_types.h
similarity index 100%
rename from drivers/iommu/amd_iommu_types.h
rename to drivers/iommu/amd/amd_iommu_types.h
diff --git a/drivers/iommu/amd_iommu_debugfs.c b/drivers/iommu/amd/debugfs.c
similarity index 100%
rename from drivers/iommu/amd_iommu_debugfs.c
rename to drivers/iommu/amd/debugfs.c
diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd/init.c
similarity index 99%
rename from drivers/iommu/amd_iommu_init.c
rename to drivers/iommu/amd/init.c
index 3faff7f80fd2..6ebd4825e320 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd/init.c
@@ -33,7 +33,7 @@
 #include <linux/crash_dump.h>
 
 #include "amd_iommu.h"
-#include "irq_remapping.h"
+#include "../irq_remapping.h"
 
 /*
  * definitions for the ACPI scanning code
diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd/iommu.c
similarity index 99%
rename from drivers/iommu/amd_iommu.c
rename to drivers/iommu/amd/iommu.c
index 311ef7105c6d..74cca1757172 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -43,7 +43,7 @@
 #include <asm/dma.h>
 
 #include "amd_iommu.h"
-#include "irq_remapping.h"
+#include "../irq_remapping.h"
 
 #define CMD_SET_TYPE(cmd, t) ((cmd)->data[1] |= ((t) << 28))
 
diff --git a/drivers/iommu/amd_iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
similarity index 100%
rename from drivers/iommu/amd_iommu_v2.c
rename to drivers/iommu/amd/iommu_v2.c
diff --git a/drivers/iommu/amd_iommu_quirks.c b/drivers/iommu/amd/quirks.c
similarity index 100%
rename from drivers/iommu/amd_iommu_quirks.c
rename to drivers/iommu/amd/quirks.c
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
