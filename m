Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AB51CD26
	for <lists.iommu@lfdr.de>; Fri,  6 May 2022 01:58:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9DC283187;
	Thu,  5 May 2022 23:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zB7SCfyCPAea; Thu,  5 May 2022 23:58:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F93484086;
	Thu,  5 May 2022 23:58:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54EEDC0032;
	Thu,  5 May 2022 23:58:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08758C002D
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C656110E
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOxe3Ok6ax1W for <iommu@lists.linux-foundation.org>;
 Thu,  5 May 2022 23:57:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA315610A7
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795074; x=1683331074;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NyURYc8oxJjVJOB30x31veFmVCCJTY1vDrVWNQ4s5WQ=;
 b=bAsl5cTIx1ZgkaaFyRlk2CIalKNoApLcMgv+spbYlEf8cU7lBYTneIf4
 mfTafGV3Pn6jYA300c2hxF+NEpMm+VvhAwmxxZ76+CN94sP0f0jTmK/ro
 OE1nvOGTMjDuy0Kw4u1PwgnmjRI3zEFECtBfTXLjIVCPaE5E2iJl5nXbk
 oPQp62+Jm5zh1/PFfxzfLCexVDKwE9rx/UIoBjWCQa0vc++PwAuN5EG6z
 XKTeuPASKhq0pdjZgusEwacjOCgF47ndoGYMaupvyqGlxXlFUB/kZYUY1
 5W5qtGnLrLaA8p5NH/mSkuqSv6UoPAp4GWH/I0+lCjDXGT9/M10dHBHf7 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293496358"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293496358"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914428"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:53 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 22/29] x86/watchdog/hardlockup: Add an HPET-based
 hardlockup detector
Date: Thu,  5 May 2022 17:00:01 -0700
Message-Id: <20220506000008.30892-23-ricardo.neri-calderon@linux.intel.com>
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

Implement a hardlockup detector that uses an HPET channel as the source
of the non-maskable interrupt. Implement the basic functionality to
start, stop, and configure the timer.

Designate as the handling CPU one of the CPUs that the detector monitors.
Use it to service the NMI from the HPET channel. When servicing the HPET
NMI, issue an inter-processor interrupt to the rest of the monitored CPUs.
Only enable the detector if IPI shorthands are enabled in the system.

During operation, the HPET registers are only accessed to kick the timer.
This operation can be avoided if a periodic HPET channel is added to the
detector.

To configure the HPET channel interrupt, the detector relies on the
interrupt subsystem to configure the deliver mode as NMI (as requested
in hpet_hld_get_timer()) throughout the IRQ hierarchy. This covers
systems with and without interrupt remapping enabled.

The detector is not functional at this stage. A subsequent changeset will
invoke the interfaces implemented in this changeset go start, stop, and
reconfigure the detector. Another subsequent changeset implements logic
to determine if the HPET timer caused the NMI. For now, implement a
stub function.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * Squashed a previously separate patch to support interrupt remapping into
   this patch. There is no need to handle interrupt remapping separately.
   All the necessary plumbing is done in the interrupt subsytem. Now it
   uses request_irq().
 * Use IPI shorthands to send an NMI to the CPUs being monitored. (Thomas)
 * Added extra check to only use the HPET hardlockup detector if the IPI
   shorthands are enabled. (Thomas)
 * Relocated flushing of outstanding interrupts from enable_timer() to
   disable_timer(). On some systems, making any change in the
   configuration of the HPET channel causes it to issue an interrupt.
 * Added a new cpumask to function as a per-cpu test bit to determine if
   a CPU should check for hardlockups.
 * Dropped pointless X86_64 || X86_32 check in Kconfig. (Tony)
 * Dropped pointless dependency on CONFIG_HPET.
 * Added dependency on CONFIG_GENERIC_MSI_IRQ, needed to build the [|IR]-
   HPET-MSI irq_chip.
 * Added hardlockup_detector_hpet_start() to be used when tsc_khz is
   recalibrated.
 * Reworked the periodic setting the HPET channel. Rather than changing it
   every time the channel is disabled or enabled, do it only once. While
   at here, wrap the code in an initial setup function.
 * Implemented hardlockup_detector_hpet_start() to be called when tsc_khz
   is refined.
 * Enhanced inline comments for clarity.
 * Added missing #include files.
 * Relocated function declarations to not depend on CONFIG_HPET_TIMER.

Changes since v4:
 * Dropped hpet_hld_data.enabled_cpus and instead use cpumask_weight().
 * Renamed hpet_hld_data.cpu_monitored_mask to
   hld_data_data.cpu_monitored_mask and converted it to cpumask_var_t.
 * Flushed out any outstanding interrupt before enabling the HPET channel.
 * Removed unnecessary MSI_DATA_LEVEL_ASSERT from the MSI message.
 * Added comments in hardlockup_detector_nmi_handler() to explain how
   CPUs are targeted for an IPI.
 * Updated code to only issue an IPI when needed (i.e., there are monitored
   CPUs to be inspected via an IPI).
 * Reworked hardlockup_detector_hpet_init() for readability.
 * Now reserve the cpumasks in the hardlockup detector code and not in the
   generic HPET code.
 * Handled the case of watchdog_thresh = 0 when disabling the detector.
 * Made this detector available to i386.
 * Reworked logic to kick the timer to remove a local variable. (Andi)
 * Added a comment on what type of timer channel will be assigned to the
   detector. (Andi)
 * Reworded prompt comment in Kconfig. (Andi)
 * Removed unneeded switch to level interrupt mode when disabling the
   timer. (Andi)
 * Disabled the HPET timer to avoid a race between an incoming interrupt
   and an update of the MSI destination ID. (Ashok)
 * Corrected a typo in an inline comment. (Tony)
 * Made the HPET hardlockup detector depend on HARDLOCKUP_DETECTOR instead
   of selecting it.

Changes since v3:
 * Fixed typo in Kconfig.debug. (Randy Dunlap)
 * Added missing slab.h to include the definition of kfree to fix a build
   break.

Changes since v2:
 * Removed use of struct cpumask in favor of a variable length array in
   conjunction with kzalloc. (Peter Zijlstra)
 * Removed redundant documentation of functions. (Thomas Gleixner)
 * Added CPU as argument hardlockup_detector_hpet_enable()/disable().
   (Thomas Gleixner).

Changes since v1:
 * Do not target CPUs in a round-robin manner. Instead, the HPET timer
   always targets the same CPU; other CPUs are monitored via an
   interprocessor interrupt.
 * Dropped support for IO APIC interrupts and instead use only MSI
   interrupts.
 * Removed use of generic irq code to set interrupt affinity and NMI
   delivery. Instead, configure the interrupt directly in HPET registers.
   (Thomas Gleixner)
 * Fixed unconditional return NMI_HANDLED when the HPET timer is
   programmed for FSB/MSI delivery. (Peter Zijlstra)
---
 arch/x86/Kconfig.debug              |  10 +
 arch/x86/include/asm/hpet.h         |  21 ++
 arch/x86/kernel/Makefile            |   1 +
 arch/x86/kernel/watchdog_hld_hpet.c | 386 ++++++++++++++++++++++++++++
 4 files changed, 418 insertions(+)
 create mode 100644 arch/x86/kernel/watchdog_hld_hpet.c

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index d872a7522e55..bc34239589db 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -114,6 +114,16 @@ config IOMMU_LEAK
 config HAVE_MMIOTRACE_SUPPORT
 	def_bool y
 
+config X86_HARDLOCKUP_DETECTOR_HPET
+	bool "HPET Timer for Hard Lockup Detection"
+	select HARDLOCKUP_DETECTOR_CORE
+	depends on HARDLOCKUP_DETECTOR && HPET_TIMER && GENERIC_MSI_IRQ
+	help
+	  The hardlockup detector is driven by one counter of the Performance
+	  Monitoring Unit (PMU) per CPU. Say y to instead drive the
+	  hardlockup detector using a High-Precision Event Timer and make the
+	  PMU counters available for other purposes.
+
 config X86_DECODER_SELFTEST
 	bool "x86 instruction decoder selftest"
 	depends on DEBUG_KERNEL && INSTRUCTION_DECODER
diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index 5762bd0169a1..c88901744848 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -105,6 +105,8 @@ static inline int is_hpet_enabled(void) { return 0; }
 #endif
 
 #ifdef CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
+#include <linux/cpumask.h>
+
 /**
  * struct hpet_hld_data - Data needed to operate the detector
  * @has_periodic:		The HPET channel supports periodic mode
@@ -112,6 +114,10 @@ static inline int is_hpet_enabled(void) { return 0; }
  * @channe_priv:		Private data of the assigned channel
  * @ticks_per_second:		Frequency of the HPET timer
  * @irq:			IRQ number assigned to the HPET channel
+ * @handling_cpu:		CPU handling the HPET interrupt
+ * @monitored_cpumask:		CPUs monitored by the hardlockup detector
+ * @inspect_cpumask:		CPUs that will be inspected at a given time.
+ *				Each CPU clears itself upon inspection.
  */
 struct hpet_hld_data {
 	bool			has_periodic;
@@ -119,10 +125,25 @@ struct hpet_hld_data {
 	struct hpet_channel	*channel_priv;
 	u64			ticks_per_second;
 	int			irq;
+	u32			handling_cpu;
+	cpumask_var_t		monitored_cpumask;
+	cpumask_var_t		inspect_cpumask;
 };
 
 extern struct hpet_hld_data *hpet_hld_get_timer(void);
 extern void hpet_hld_free_timer(struct hpet_hld_data *hdata);
+int hardlockup_detector_hpet_init(void);
+void hardlockup_detector_hpet_start(void);
+void hardlockup_detector_hpet_stop(void);
+void hardlockup_detector_hpet_enable(unsigned int cpu);
+void hardlockup_detector_hpet_disable(unsigned int cpu);
+#else
+static inline int hardlockup_detector_hpet_init(void)
+{ return -ENODEV; }
+static inline void hardlockup_detector_hpet_start(void) {}
+static inline void hardlockup_detector_hpet_stop(void) {}
+static inline void hardlockup_detector_hpet_enable(unsigned int cpu) {}
+static inline void hardlockup_detector_hpet_disable(unsigned int cpu) {}
 #endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
 
 #endif /* _ASM_X86_HPET_H */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 1a2dc328cb5e..c700b00a2d86 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -115,6 +115,7 @@ obj-$(CONFIG_VM86)		+= vm86_32.o
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
 obj-$(CONFIG_HPET_TIMER) 	+= hpet.o
+obj-$(CONFIG_X86_HARDLOCKUP_DETECTOR_HPET) += watchdog_hld_hpet.o
 
 obj-$(CONFIG_AMD_NB)		+= amd_nb.o
 obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
diff --git a/arch/x86/kernel/watchdog_hld_hpet.c b/arch/x86/kernel/watchdog_hld_hpet.c
new file mode 100644
index 000000000000..9fc7ac2c5059
--- /dev/null
+++ b/arch/x86/kernel/watchdog_hld_hpet.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A hardlockup detector driven by an HPET timer.
+ *
+ * Copyright (C) Intel Corporation 2022
+ *
+ * A hardlockup detector driven by an HPET timer. It implements the same
+ * interfaces as the PMU-based hardlockup detector.
+ *
+ * The HPET timer channel designated for the hardlockup detector sends an
+ * NMI to the one of the CPUs in the watchdog_allowed_mask. Such CPU then
+ * sends an NMI IPI to the rest of the CPUs in the system. Each individual
+ * CPU checks for hardlockups.
+ *
+ * This detector only is enabled when the system has IPI shorthands
+ * enabled. Therefore, all the CPUs in the system get the broadcast NMI.
+ * A cpumask is used to check if a specific CPU needs to check for hard-
+ * lockups. CPUs that are offline, have their local APIC soft-disabled.
+ * They will also get the NMI but "ignore" it in the NMI handler.
+ */
+
+#define pr_fmt(fmt) "NMI hpet watchdog: " fmt
+
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/jump_label.h>
+#include <linux/nmi.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+
+#include <asm/apic.h>
+#include <asm/hpet.h>
+#include <asm/tsc.h>
+
+static struct hpet_hld_data *hld_data;
+static bool hardlockup_use_hpet;
+
+extern struct static_key_false apic_use_ipi_shorthand;
+
+static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	if (hdata->has_periodic)
+		v |= HPET_TN_PERIODIC;
+	else
+		v &= ~HPET_TN_PERIODIC;
+
+	v |= HPET_TN_32BIT;
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+}
+
+/**
+ * kick_timer() - Reprogram timer to expire in the future
+ * @hdata:	A data structure with the timer instance to update
+ * @force:	Force reprogramming
+ *
+ * Reprogram the timer to expire within watchdog_thresh seconds in the future.
+ * If the timer supports periodic mode, it is not kicked unless @force is
+ * true.
+ */
+static void kick_timer(struct hpet_hld_data *hdata, bool force)
+{
+	u64 new_compare, count, period = 0;
+
+	/* Kick the timer only when needed. */
+	if (!force && hdata->has_periodic)
+		return;
+
+	/*
+	 * Update the comparator in increments of watch_thresh seconds relative
+	 * to the current count. Since watch_thresh is given in seconds, we
+	 * are able to update the comparator before the counter reaches such new
+	 * value.
+	 *
+	 * Let it wrap around if needed.
+	 */
+
+	count = hpet_readl(HPET_COUNTER);
+	new_compare = count + watchdog_thresh * hdata->ticks_per_second;
+
+	if (!hdata->has_periodic) {
+		hpet_writel(new_compare, HPET_Tn_CMP(hdata->channel));
+		return;
+	}
+
+	period = watchdog_thresh * hdata->ticks_per_second;
+	hpet_set_comparator_periodic(hdata->channel, (u32)new_compare,
+				     (u32)period);
+}
+
+static void disable_timer(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	v &= ~HPET_TN_ENABLE;
+	/*
+	 * Prepare to flush out any outstanding interrupt. This can only be
+	 * done in level-triggered mode.
+	 */
+	v |= HPET_TN_LEVEL;
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+
+	/*
+	 * Even though we use the HPET channel in edge-triggered mode, hardware
+	 * seems to keep an outstanding interrupt and posts an MSI message when
+	 * making any change to it (e.g., enabling or setting to FSB mode).
+	 * Flush out the interrupt status bit of our channel.
+	 */
+	hpet_writel(1 << hdata->channel, HPET_STATUS);
+}
+
+static void enable_timer(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	v &= ~HPET_TN_LEVEL;
+	v |= HPET_TN_ENABLE;
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+}
+
+/**
+ * is_hpet_hld_interrupt() - Check if an HPET timer caused the interrupt
+ * @hdata:	A data structure with the timer instance to enable
+ *
+ * Returns:
+ * True if the HPET watchdog timer caused the interrupt. False otherwise.
+ */
+static bool is_hpet_hld_interrupt(struct hpet_hld_data *hdata)
+{
+	return false;
+}
+
+/**
+ * hardlockup_detector_nmi_handler() - NMI Interrupt handler
+ * @type:	Type of NMI handler; not used.
+ * @regs:	Register values as seen when the NMI was asserted
+ *
+ * Check if it was caused by the expiration of the HPET timer. If yes, inspect
+ * for lockups by issuing an IPI to the rest of the CPUs. Also, kick the
+ * timer if it is non-periodic.
+ *
+ * Returns:
+ * NMI_DONE if the HPET timer did not cause the interrupt. NMI_HANDLED
+ * otherwise.
+ */
+static int hardlockup_detector_nmi_handler(unsigned int type,
+					   struct pt_regs *regs)
+{
+	struct hpet_hld_data *hdata = hld_data;
+	int cpu;
+
+	/*
+	 * The CPU handling the HPET NMI will land here and trigger the
+	 * inspection of hardlockups in the rest of the monitored
+	 * CPUs.
+	 */
+	if (is_hpet_hld_interrupt(hdata)) {
+		/*
+		 * Kick the timer first. If the HPET channel is periodic, it
+		 * helps to reduce the delta between the expected TSC value and
+		 * its actual value the next time the HPET channel fires.
+		 */
+		kick_timer(hdata, !(hdata->has_periodic));
+
+		if (cpumask_weight(hld_data->monitored_cpumask) > 1) {
+			/*
+			 * Since we cannot know the source of an NMI, the best
+			 * we can do is to use a flag to indicate to all online
+			 * CPUs that they will get an NMI and that the source of
+			 * that NMI is the hardlockup detector. Offline CPUs
+			 * also receive the NMI but they ignore it.
+			 *
+			 * Even though we are in NMI context, we have concluded
+			 * that the NMI came from the HPET channel assigned to
+			 * the detector, an event that is infrequent and only
+			 * occurs in the handling CPU. There should not be races
+			 * with other NMIs.
+			 */
+			cpumask_copy(hld_data->inspect_cpumask,
+				     cpu_online_mask);
+
+			/* If we are here, IPI shorthands are enabled. */
+			apic->send_IPI_allbutself(NMI_VECTOR);
+		}
+
+		inspect_for_hardlockups(regs);
+		return NMI_HANDLED;
+	}
+
+	/* The rest of the CPUs will land here after receiving the IPI. */
+	cpu = smp_processor_id();
+	if (cpumask_test_and_clear_cpu(cpu, hld_data->inspect_cpumask)) {
+		if (cpumask_test_cpu(cpu, hld_data->monitored_cpumask))
+			inspect_for_hardlockups(regs);
+
+		return NMI_HANDLED;
+	}
+
+	return NMI_DONE;
+}
+
+/**
+ * setup_hpet_irq() - Configure the interrupt delivery of an HPET timer
+ * @data:	Data associated with the instance of the HPET timer to configure
+ *
+ * Configure the interrupt parameters of an HPET timer. If supported, configure
+ * interrupts to be delivered via the Front-Side Bus. Also, install an interrupt
+ * handler.
+ *
+ * Returns:
+ * 0 success. An error code if setup was unsuccessful.
+ */
+static int setup_hpet_irq(struct hpet_hld_data *hdata)
+{
+	int ret;
+	u32 v;
+
+	/*
+	 * hld_data->irq was configured to deliver the interrupt as
+	 * NMI. Thus, there is no need for a regular interrupt handler.
+	 */
+	ret = request_irq(hld_data->irq, no_action,
+			  IRQF_TIMER | IRQF_NOBALANCING,
+			  "hpet_hld", hld_data);
+	if (ret)
+		return ret;
+
+	ret = register_nmi_handler(NMI_WATCHDOG,
+				   hardlockup_detector_nmi_handler, 0,
+				   "hpet_hld");
+
+	if (ret) {
+		free_irq(hld_data->irq, hld_data);
+		return ret;
+	}
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	v |= HPET_TN_FSB;
+
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+
+	return 0;
+}
+
+/**
+ * hardlockup_detector_hpet_enable() - Enable the hardlockup detector
+ * @cpu:	CPU Index in which the watchdog will be enabled.
+ *
+ * Enable the hardlockup detector in @cpu. Also, start the detector if not done
+ * before.
+ */
+void hardlockup_detector_hpet_enable(unsigned int cpu)
+{
+	cpumask_set_cpu(cpu, hld_data->monitored_cpumask);
+
+	/*
+	 * If this is the first CPU on which the detector is enabled,
+	 * start everything. The HPET channel is disabled at this point.
+	 */
+	if (cpumask_weight(hld_data->monitored_cpumask) == 1) {
+		hld_data->handling_cpu = cpu;
+		/*
+		 * Only update the affinity of the HPET channel interrupt when
+		 * disabled.
+		 */
+		if (irq_set_affinity(hld_data->irq,
+				     cpumask_of(hld_data->handling_cpu))) {
+			pr_warn_once("Failed to set affinity. Hardlockdup detector not started");
+			return;
+		}
+
+		kick_timer(hld_data, true);
+		enable_timer(hld_data);
+	}
+}
+
+/**
+ * hardlockup_detector_hpet_disable() - Disable the hardlockup detector
+ * @cpu:	CPU index in which the watchdog will be disabled
+ *
+ * Disable the hardlockup detector in @cpu. If @cpu is also handling the NMI
+ * from the HPET timer, update the affinity of the interrupt.
+ */
+void hardlockup_detector_hpet_disable(unsigned int cpu)
+{
+	cpumask_clear_cpu(cpu, hld_data->monitored_cpumask);
+
+	if (hld_data->handling_cpu != cpu)
+		return;
+
+	disable_timer(hld_data);
+	if (!cpumask_weight(hld_data->monitored_cpumask))
+		return;
+
+	/*
+	 * If watchdog_thresh is zero, then the hardlockup detector is being
+	 * disabled.
+	 */
+	if (!watchdog_thresh)
+		return;
+
+	hld_data->handling_cpu = cpumask_any_but(hld_data->monitored_cpumask,
+						 cpu);
+	/*
+	 * Only update the affinity of the HPET channel interrupt when
+	 * disabled.
+	 */
+	if (irq_set_affinity(hld_data->irq,
+			     cpumask_of(hld_data->handling_cpu))) {
+		pr_warn_once("Failed to set affinity. Hardlockdup detector stopped");
+		return;
+	}
+
+	enable_timer(hld_data);
+}
+
+void hardlockup_detector_hpet_stop(void)
+{
+	disable_timer(hld_data);
+}
+
+void hardlockup_detector_hpet_start(void)
+{
+	kick_timer(hld_data, true);
+	enable_timer(hld_data);
+}
+
+/**
+ * hardlockup_detector_hpet_init() - Initialize the hardlockup detector
+ *
+ * Only initialize and configure the detector if an HPET is available on the
+ * system, the TSC is stable, and IPI shorthands are enabled.
+ *
+ * Returns:
+ * 0 success. An error code if initialization was unsuccessful.
+ */
+int __init hardlockup_detector_hpet_init(void)
+{
+	int ret;
+
+	if (!hardlockup_use_hpet)
+		return -ENODEV;
+
+	if (!is_hpet_enabled())
+		return -ENODEV;
+
+	if (!static_branch_likely(&apic_use_ipi_shorthand))
+		return -ENODEV;
+
+	if (check_tsc_unstable())
+		return -ENODEV;
+
+	hld_data = hpet_hld_get_timer();
+	if (!hld_data)
+		return -ENODEV;
+
+	disable_timer(hld_data);
+
+	setup_hpet_channel(hld_data);
+
+	ret = setup_hpet_irq(hld_data);
+	if (ret)
+		goto err_no_irq;
+
+	if (!zalloc_cpumask_var(&hld_data->monitored_cpumask, GFP_KERNEL))
+		goto err_no_monitored_cpumask;
+
+	if (!zalloc_cpumask_var(&hld_data->inspect_cpumask, GFP_KERNEL))
+		goto err_no_inspect_cpumask;
+
+	return 0;
+
+err_no_inspect_cpumask:
+	free_cpumask_var(hld_data->monitored_cpumask);
+err_no_monitored_cpumask:
+	ret = -ENOMEM;
+err_no_irq:
+	hpet_hld_free_timer(hld_data);
+	hld_data = NULL;
+
+	return ret;
+}
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
