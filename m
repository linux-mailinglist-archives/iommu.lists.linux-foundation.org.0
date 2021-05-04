Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B831373079
	for <lists.iommu@lfdr.de>; Tue,  4 May 2021 21:11:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1BD6079C;
	Tue,  4 May 2021 19:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jpH3V3nbJLsj; Tue,  4 May 2021 19:11:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5596088D;
	Tue,  4 May 2021 19:11:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31B74C0027;
	Tue,  4 May 2021 19:11:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DF62C0001
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E70414EB
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoZCbE0pHO_c for <iommu@lists.linux-foundation.org>;
 Tue,  4 May 2021 19:11:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B041B414F1
 for <iommu@lists.linux-foundation.org>; Tue,  4 May 2021 19:11:41 +0000 (UTC)
IronPort-SDR: T2bYb1Ej0gSezGV0diNm9m34iL/twpIMUhEqe7C2s+IiMP9zCKtcAX2buI6zbux4sibwvAsaPF
 p3x5i/8Y9dpg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="197675483"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="197675483"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 12:11:40 -0700
IronPort-SDR: 6p0FpG4JiRnHAfLETLhIKxYaKWvAVyMDeVKz4hGji4aYIx+Wuxg4wdIDMAHAR3BeEXff74BPna
 ld1YiEvKEaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="396245282"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga007.fm.intel.com with ESMTP; 04 May 2021 12:11:40 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [RFC PATCH v5 2/7] x86/hpet: Introduce function to identify HPET
 hardlockup detector irq
Date: Tue,  4 May 2021 12:10:44 -0700
Message-Id: <20210504191049.22661-3-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504191049.22661-1-ricardo.neri-calderon@linux.intel.com>
References: <20210504191049.22661-1-ricardo.neri-calderon@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org,
 woodhouse@osuosl.org, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 Andi Kleen <andi.kleen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@suse.de>, David Woodhouse <dwmw2@infradead.org>,
 Ingo Molnar <mingo@kernel.org>
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

The HPET hardlockup detector needs to deliver its interrupt as NMI.
In x86 there is not an IRQF_NMI flag that can be used in the irq plumbing
code to tell interrupt remapping drivers to set the interrupt delivery
mode accordingly. Hence, they must fixup the delivery mode internally.

Implement a method to determine if the interrupt being allocated belongs
to the HPET hardlockup detector.

Cc: Andi Kleen <andi.kleen@intel.com>
Cc: Borislav Petkov <bp@suse.de>
Cc: David Woodhouse <dwmw2@infradead.org> (supporter:INTEL IOMMU (VT-d))
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jacob Pan <jacob.jun.pan@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com> (supporter:INTEL IOMMU (VT-d))
Cc: Stephane Eranian <eranian@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: iommu@lists.linux-foundation.org (open list:INTEL IOMMU (VT-d))
Cc: x86@kernel.org
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v4:
 * Introduced this patch. Previous versions had special functions to
   allocate and set the affinity of a remapped NMI interrupt.

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 arch/x86/include/asm/hpet.h |  3 +++
 arch/x86/kernel/hpet.c      | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index df11c7d4af44..5bf675970d4b 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -149,6 +149,7 @@ extern void hardlockup_detector_hpet_stop(void);
 extern void hardlockup_detector_hpet_enable(unsigned int cpu);
 extern void hardlockup_detector_hpet_disable(unsigned int cpu);
 extern void hardlockup_detector_switch_to_perf(void);
+extern bool is_hpet_irq_hardlockup_detector(struct irq_alloc_info *info);
 #else
 static inline int hardlockup_detector_hpet_init(void)
 { return -ENODEV; }
@@ -156,6 +157,8 @@ static inline void hardlockup_detector_hpet_stop(void) {}
 static inline void hardlockup_detector_hpet_enable(unsigned int cpu) {}
 static inline void hardlockup_detector_hpet_disable(unsigned int cpu) {}
 static inline void hardlockup_detector_switch_to_perf(void) {}
+static inline bool is_hpet_irq_hardlockup_detector(struct irq_alloc_info *info)
+{ return false; }
 #endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
 
 #else /* CONFIG_HPET_TIMER */
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 5012590dc1b8..3e43e0f348b8 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -1479,6 +1479,39 @@ struct hpet_hld_data *hpet_hld_get_timer(void)
 	hld_data = NULL;
 	return NULL;
 }
+
+/**
+ * is_hpet_irq_hardlockup_detector() - Identify the HPET hld interrupt info
+ * @info:	Interrupt allocation info, with private HPET channel data
+ *
+ * The HPET hardlockup detector is special as it needs its interrupts delivered
+ * as NMI. However, for interrupt remapping we use the existing irq subsystem
+ * to configure and route the HPET interrupt. Unfortunately, there is not a
+ * IRQF_NMI flag for x86. Instead, identify whether the interrupt being
+ * allocated for the HPET channel belongs to the hardlockup detector.
+ *
+ * Returns: True if @info indicates that it belongs to the HPET hardlockup
+ * detector. False otherwise.
+ */
+bool is_hpet_irq_hardlockup_detector(struct irq_alloc_info *info)
+{
+	struct hpet_channel *hc;
+
+	if (!info)
+		return false;
+
+	if (info->type != X86_IRQ_ALLOC_TYPE_HPET)
+		return false;
+
+	hc = info->data;
+	if (!hc)
+		return false;
+
+	if (hc->mode == HPET_MODE_NMI_WATCHDOG)
+		return true;
+
+	return false;
+}
 #endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
 
 #endif
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
