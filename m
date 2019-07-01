Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF56B1C9D8
	for <lists.iommu@lfdr.de>; Tue, 14 May 2019 16:03:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 024DBE7A;
	Tue, 14 May 2019 14:03:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2DAECDCF
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 14:03:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C583287A
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 14:02:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2019 07:02:58 -0700
X-ExtLoop1: 1
Received: from unknown (HELO luv-build.sc.intel.com) ([172.25.110.25])
	by fmsmga005.fm.intel.com with ESMTP; 14 May 2019 07:02:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@suse.de>
Subject: [RFC PATCH v3 09/21] x86/nmi: Add a NMI_WATCHDOG NMI handler category
Date: Tue, 14 May 2019 07:02:02 -0700
Message-Id: <1557842534-4266-10-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557842534-4266-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
References: <1557842534-4266-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
	Ashok Raj <ashok.raj@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Ricardo Neri <ricardo.neri@intel.com>, iommu@lists.linux-foundation.org,
	Andi Kleen <andi.kleen@intel.com>
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

Add a NMI_WATCHDOG as a new category of NMI handler. This new category
is to be used with the HPET-based hardlockup detector. This detector
does not have a direct way of checking if the HPET timer is the source of
the NMI. Instead it indirectly estimate it using the time-stamp counter.

Therefore, we may have false-positives in case another NMI occurs within
the estimated time window. For this reason, we want the handler of the
detector to be called after all the NMI_LOCAL handlers. A simple way
of achieving this with a new NMI handler category.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 arch/x86/include/asm/nmi.h |  1 +
 arch/x86/kernel/nmi.c      | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/nmi.h b/arch/x86/include/asm/nmi.h
index 75ded1d13d98..75aa98313cde 100644
--- a/arch/x86/include/asm/nmi.h
+++ b/arch/x86/include/asm/nmi.h
@@ -29,6 +29,7 @@ enum {
 	NMI_UNKNOWN,
 	NMI_SERR,
 	NMI_IO_CHECK,
+	NMI_WATCHDOG,
 	NMI_MAX
 };
 
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 3755d0310026..a43213f0ab26 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -62,6 +62,10 @@ static struct nmi_desc nmi_desc[NMI_MAX] =
 		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[3].lock),
 		.head = LIST_HEAD_INIT(nmi_desc[3].head),
 	},
+	{
+		.lock = __RAW_SPIN_LOCK_UNLOCKED(&nmi_desc[4].lock),
+		.head = LIST_HEAD_INIT(nmi_desc[4].head),
+	},
 
 };
 
@@ -172,6 +176,8 @@ int __register_nmi_handler(unsigned int type, struct nmiaction *action)
 	 */
 	WARN_ON_ONCE(type == NMI_SERR && !list_empty(&desc->head));
 	WARN_ON_ONCE(type == NMI_IO_CHECK && !list_empty(&desc->head));
+	WARN_ON_ONCE(type == NMI_WATCHDOG && !list_empty(&desc->head));
+
 
 	/*
 	 * some handlers need to be executed first otherwise a fake
@@ -382,6 +388,10 @@ static void default_do_nmi(struct pt_regs *regs)
 	}
 	raw_spin_unlock(&nmi_reason_lock);
 
+	handled = nmi_handle(NMI_WATCHDOG, regs);
+	if (handled == NMI_HANDLED)
+		return;
+
 	/*
 	 * Only one NMI can be latched at a time.  To handle
 	 * this we may process multiple nmi handlers at once to
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
