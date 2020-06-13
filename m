Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A51F8003
	for <lists.iommu@lfdr.de>; Sat, 13 Jun 2020 02:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A6E188C30;
	Sat, 13 Jun 2020 00:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJ+m-Y2LnOLN; Sat, 13 Jun 2020 00:42:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E83C5895C1;
	Sat, 13 Jun 2020 00:42:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8324C0881;
	Sat, 13 Jun 2020 00:42:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACD04C016F
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 00:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 97D4D2049D
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 00:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFiknvBCYyiQ for <iommu@lists.linux-foundation.org>;
 Sat, 13 Jun 2020 00:41:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id B7A1225D4A
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 00:41:53 +0000 (UTC)
IronPort-SDR: eTtdQJpF+2Whnj3zN2UzhknenQPPIT5FBfc8KJJHZFNDMiwWaolkPteZJYRM/OZ/qMK1tIexj8
 xId9+5/DkkTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 17:41:53 -0700
IronPort-SDR: fmiiY19X0mVPhAZTCXrrWpeLLJUOyorevwMoQve0wMIiAHWDFz2n3Eu+8jteSAJwCs62ov0p2h
 I9/9SJi9hUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,505,1583222400"; d="scan'208";a="261011233"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 17:41:53 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H Peter Anvin" <hpa@zytor.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Frederic Barrat" <fbarrat@linux.ibm.com>,
 "Andrew Donnellan" <ajd@linux.ibm.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Joerg Roedel" <joro@8bytes.org>, "Dave Hansen" <dave.hansen@intel.com>,
 "Tony Luck" <tony.luck@intel.com>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Yu-cheng Yu" <yu-cheng.yu@intel.com>,
 "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v2 10/12] x86/process: Clear PASID state for a newly
 forked/cloned thread
Date: Fri, 12 Jun 2020 17:41:31 -0700
Message-Id: <1592008893-9388-11-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

The PASID state has to be cleared on forks, since the child has a
different address space. The PASID is also cleared for thread clone. While
it would be correct to inherit the PASID in this case, it is unknown
whether the new task will use ENQCMD. Giving it the PASID "just in case"
would have the downside of increased context switch overhead to setting
the PASID MSR.

Since #GP faults have to be handled on any threads that were created before
the PASID was assigned to the mm of the process, newly created threads
might as well be treated in a consistent way.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v2:
- Modify init_task_pasid().

 arch/x86/kernel/process.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index f362ce0d5ac0..1b1492e337a6 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -121,6 +121,21 @@ static int set_new_tls(struct task_struct *p, unsigned long tls)
 		return do_set_thread_area_64(p, ARCH_SET_FS, tls);
 }
 
+/* Initialize the PASID state for the forked/cloned thread. */
+static void init_task_pasid(struct task_struct *task)
+{
+	struct ia32_pasid_state *ppasid;
+
+	/*
+	 * Initialize the PASID state so that the PASID MSR will be
+	 * initialized to its initial state (0) by XRSTORS when the task is
+	 * scheduled for the first time.
+	 */
+	ppasid = get_xsave_addr(&task->thread.fpu.state.xsave, XFEATURE_PASID);
+	if (ppasid)
+		ppasid->pasid = INIT_PASID;
+}
+
 int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
@@ -174,6 +189,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
 	task_user_gs(p) = get_user_gs(current_pt_regs());
 #endif
 
+	if (static_cpu_has(X86_FEATURE_ENQCMD))
+		init_task_pasid(p);
+
 	/* Set a new TLS for the child thread? */
 	if (clone_flags & CLONE_SETTLS)
 		ret = set_new_tls(p, tls);
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
