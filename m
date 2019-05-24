Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC428E8F
	for <lists.iommu@lfdr.de>; Fri, 24 May 2019 03:17:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6B5661045;
	Fri, 24 May 2019 01:16:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B375F3B
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 01:16:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 846306C5
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 01:16:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 May 2019 18:16:35 -0700
X-ExtLoop1: 1
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by fmsmga008.fm.intel.com with ESMTP; 23 May 2019 18:16:34 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@suse.de>
Subject: [RFC PATCH v4 03/21] x86/hpet: Calculate ticks-per-second in a
	separate function
Date: Thu, 23 May 2019 18:16:05 -0700
Message-Id: <1558660583-28561-4-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1558660583-28561-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
	"Ravi V. Shankar" <ravi.v.shankar@intel.com>, x86@kernel.org,
	Ashok Raj <ashok.raj@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>, Clemens Ladisch <clemens@ladisch.de>,
	linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
	Ricardo Neri <ricardo.neri@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <andi.kleen@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

It is easier to compute the expiration times of an HPET timer by using
its frequency (i.e., the number of times it ticks in a second) than its
period, as given in the capabilities register.

In addition to the HPET char driver, the HPET-based hardlockup detector
will also need to know the timer's frequency. Thus, create a common
function that both can use.

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Andi Kleen <andi.kleen@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Clemens Ladisch <clemens@ladisch.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: x86@kernel.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 drivers/char/hpet.c  | 31 ++++++++++++++++++++++++-------
 include/linux/hpet.h |  1 +
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 3a1e6b3ccd10..747255f552a9 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -836,6 +836,29 @@ static unsigned long hpet_calibrate(struct hpets *hpetp)
 	return ret;
 }
 
+u64 hpet_get_ticks_per_sec(u64 hpet_caps)
+{
+	u64 ticks_per_sec, period;
+
+	period = (hpet_caps & HPET_COUNTER_CLK_PERIOD_MASK) >>
+		 HPET_COUNTER_CLK_PERIOD_SHIFT; /* fs, 10^-15 */
+
+	/*
+	 * The frequency is the reciprocal of the period. The period is given
+	 * in femtoseconds per second. Thus, prepare a dividend to obtain the
+	 * frequency in ticks per second.
+	 */
+
+	/* 10^15 femtoseconds per second */
+	ticks_per_sec = 1000000000000000ULL;
+	ticks_per_sec += period >> 1; /* round */
+
+	/* The quotient is put in the dividend. We drop the remainder. */
+	do_div(ticks_per_sec, period);
+
+	return ticks_per_sec;
+}
+
 int hpet_alloc(struct hpet_data *hdp)
 {
 	u64 cap, mcfg;
@@ -844,7 +867,6 @@ int hpet_alloc(struct hpet_data *hdp)
 	struct hpets *hpetp;
 	struct hpet __iomem *hpet;
 	static struct hpets *last;
-	unsigned long period;
 	unsigned long long temp;
 	u32 remainder;
 
@@ -894,12 +916,7 @@ int hpet_alloc(struct hpet_data *hdp)
 
 	last = hpetp;
 
-	period = (cap & HPET_COUNTER_CLK_PERIOD_MASK) >>
-		HPET_COUNTER_CLK_PERIOD_SHIFT; /* fs, 10^-15 */
-	temp = 1000000000000000uLL; /* 10^15 femtoseconds per second */
-	temp += period >> 1; /* round */
-	do_div(temp, period);
-	hpetp->hp_tick_freq = temp; /* ticks per second */
+	hpetp->hp_tick_freq = hpet_get_ticks_per_sec(cap);
 
 	printk(KERN_INFO "hpet%d: at MMIO 0x%lx, IRQ%s",
 		hpetp->hp_which, hdp->hd_phys_address,
diff --git a/include/linux/hpet.h b/include/linux/hpet.h
index 8604564b985d..e7b36bcf4699 100644
--- a/include/linux/hpet.h
+++ b/include/linux/hpet.h
@@ -107,5 +107,6 @@ static inline void hpet_reserve_timer(struct hpet_data *hd, int timer)
 }
 
 int hpet_alloc(struct hpet_data *);
+u64 hpet_get_ticks_per_sec(u64 hpet_caps);
 
 #endif				/* !__HPET__ */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
