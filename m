Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C33F054C
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 15:52:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3907240123;
	Wed, 18 Aug 2021 13:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g86vr369kQke; Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 30FF84016B;
	Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09A77C000E;
	Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5291BC000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42508403FC
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZLzIj3sO2cy for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 13:51:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7760740395
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="214478862"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="214478862"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 06:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449729230"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2021 06:51:49 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/9] iommu/vt-d: Enable Intel IOMMU scalable mode by default
Date: Wed, 18 Aug 2021 21:48:47 +0800
Message-Id: <20210818134852.1847070-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
References: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The commit 8950dcd83ae7d ("iommu/vt-d: Leave scalable mode default off")
leaves the scalable mode default off and end users could turn it on with
"intel_iommu=sm_on". Using the Intel IOMMU scalable mode for kernel DMA,
user-level device access and Shared Virtual Address have been enabled.
This enables the scalable mode by default if the hardware advertises the
support and adds kernel options of "intel_iommu=sm_on/sm_off" for end
users to configure it through the kernel parameters.

Suggested-by: Ashok Raj <ashok.raj@intel.com>
Suggested-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Link: https://lore.kernel.org/r/20210720013856.4143880-1-baolu.lu@linux.intel.com
---
 Documentation/admin-guide/kernel-parameters.txt | 11 ++++++-----
 drivers/iommu/intel/iommu.c                     |  5 ++++-
 drivers/iommu/intel/Kconfig                     |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 19192b39952a..87d46cb76121 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1946,11 +1946,12 @@
 			By default, super page will be supported if Intel IOMMU
 			has the capability. With this option, super page will
 			not be supported.
-		sm_on [Default Off]
-			By default, scalable mode will be disabled even if the
-			hardware advertises that it has support for the scalable
-			mode translation. With this option set, scalable mode
-			will be used on hardware which claims to support it.
+		sm_on
+			Enable the Intel IOMMU scalable mode if the hardware
+			advertises that it has support for the scalable mode
+			translation.
+		sm_off
+			Disallow use of the Intel IOMMU scalable mode.
 		tboot_noforce [Default Off]
 			Do not force the Intel IOMMU enabled under tboot.
 			By default, tboot will force Intel IOMMU on, which
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index acb91ddf32d0..8c9a9ed7dc09 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -432,8 +432,11 @@ static int __init intel_iommu_setup(char *str)
 			pr_info("Disable supported super page\n");
 			intel_iommu_superpage = 0;
 		} else if (!strncmp(str, "sm_on", 5)) {
-			pr_info("Intel-IOMMU: scalable mode supported\n");
+			pr_info("Enable scalable mode if hardware supports\n");
 			intel_iommu_sm = 1;
+		} else if (!strncmp(str, "sm_off", 6)) {
+			pr_info("Scalable mode is disallowed\n");
+			intel_iommu_sm = 0;
 		} else if (!strncmp(str, "tboot_noforce", 13)) {
 			pr_info("Intel-IOMMU: not forcing on after tboot. This could expose security risk for tboot\n");
 			intel_iommu_tboot_noforce = 1;
diff --git a/drivers/iommu/intel/Kconfig b/drivers/iommu/intel/Kconfig
index c1a92c3049d0..0ddb77115be7 100644
--- a/drivers/iommu/intel/Kconfig
+++ b/drivers/iommu/intel/Kconfig
@@ -84,6 +84,7 @@ config INTEL_IOMMU_FLOPPY_WA
 
 config INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON
 	bool "Enable Intel IOMMU scalable mode by default"
+	default y
 	help
 	  Selecting this option will enable by default the scalable mode if
 	  hardware presents the capability. The scalable mode is defined in
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
