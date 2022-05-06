Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03851CD2C
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 01:58:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22D383E6D;
	Thu,  5 May 2022 23:58:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNpjVOdwGNRx; Thu,  5 May 2022 23:58:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A96A283E0B;
	Thu,  5 May 2022 23:58:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75491C002D;
	Thu,  5 May 2022 23:58:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FDEFC0081
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9998C61105
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKfrMPheePtB for <iommu@lists.linux-foundation.org>;
 Thu,  5 May 2022 23:57:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00EF5610BF
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795077; x=1683331077;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=CEzigczvRyU1oQzEnVej8ViYVBfDe59Bvau/LRgGfAw=;
 b=DbYmmy6dSWBnS3ycuVz4ZuIWP3fDzOh+9ICWrDs0tMDFhXhB8SFbcCqk
 DbufffseQXNQ2kLs7LnTrbnFcaPK2n6X1+FyLufjrC6EGuZ9ZVHTQl2if
 CugRS+xSjRgh7eZZTSAsNG5o6Hr55DICUhjKhD0dNJNnUKNIZ5lKWTPsS
 esezoMNvOqOWk2YxZcYLAhi34qPX/L+EQyBJM3zdFNk+Rbvf02SVxtCO1
 dTBlAfHZEKD04aBry7rPYEHTteMcMq08sye0ehd5YuZ4c2OzD1Z5+uzy1
 zKPvqen6KHWoe2WM3zTA95gShunEU18sMKEo15kW3o0P0wcTnTawBA0RL w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293496377"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293496377"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914451"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:56 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 27/29] watchdog: Expose lockup_detector_reconfigure()
Date: Thu,  5 May 2022 17:00:06 -0700
Message-Id: <20220506000008.30892-28-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Tony Luck <tony.luck@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
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

When there are multiple implementations of the NMI watchdog, there may be
situations in which switching from one to another is needed. If the time-
stamp counter becomes unstable, the HPET-based NMI watchdog can no longer
be used. Similarly, the HPET-based NMI watchdog relies on tsc_khz and
needs to be informed when it is refined.

Reloading the NMI watchdog or switching to another hardlockup detector can
be done cleanly by updating the arch-specific stub and then reconfiguring
the whole lockup detector.

Expose lockup_detector_reconfigure() to achieve this goal.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * None

Changes since v4:
 * Switching to the perf-based lockup detector under the hood is hacky.
   Instead, reconfigure the whole lockup detector.

Changes since v3:
 * None

Changes since v2:
 * Introduced this patch.

Changes since v1:
 * N/A
---
 include/linux/nmi.h | 2 ++
 kernel/watchdog.c   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index cf12380e51b3..73827a477288 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -16,6 +16,7 @@ void lockup_detector_init(void);
 void lockup_detector_soft_poweroff(void);
 void lockup_detector_cleanup(void);
 bool is_hardlockup(void);
+void lockup_detector_reconfigure(void);
 
 extern int watchdog_user_enabled;
 extern int nmi_watchdog_user_enabled;
@@ -37,6 +38,7 @@ extern int sysctl_hardlockup_all_cpu_backtrace;
 static inline void lockup_detector_init(void) { }
 static inline void lockup_detector_soft_poweroff(void) { }
 static inline void lockup_detector_cleanup(void) { }
+static inline void lockup_detector_reconfigure(void) { }
 #endif /* !CONFIG_LOCKUP_DETECTOR */
 
 #ifdef CONFIG_SOFTLOCKUP_DETECTOR
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 6443841a755f..e5b67544f8c8 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -537,7 +537,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
@@ -579,7 +579,7 @@ static __init void lockup_detector_setup(void)
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void lockup_detector_reconfigure(void)
+void lockup_detector_reconfigure(void)
 {
 	cpus_read_lock();
 	watchdog_nmi_stop();
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
