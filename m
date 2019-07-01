Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8F2A1B1
	for <lists.iommu@lfdr.de>; Sat, 25 May 2019 01:43:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EA463FCB;
	Fri, 24 May 2019 23:43:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E81F4265
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 23:43:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E4BD6C5
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 23:43:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2019 16:43:04 -0700
X-ExtLoop1: 1
Received: from sai-dev-mach.sc.intel.com ([143.183.140.153])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2019 16:43:04 -0700
From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V3 1/3] iommu/vt-d: Modify the format of intel DMAR tables dump
Date: Fri, 24 May 2019 16:40:15 -0700
Message-Id: <64cd2521c8dfefc3524f02c4b47b80e86640a0bb.1558735674.git.sai.praneeth.prakhya@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1558735674.git.sai.praneeth.prakhya@intel.com>
References: <cover.1558735674.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Presently, "/sys/kernel/debug/iommu/intel/dmar_translation_struct" file
dumps DMAR tables in the below format

IOMMU dmar2: Root Table Address:4362cc000
Root Table Entries:
 Bus: 0 H: 0 L: 4362f0001
 Context Table Entries for Bus: 0
  Entry	B:D.F	High	Low
  160   00:14.0	102     4362ef001
  184   00:17.0	302     435ec4001
  248   00:1f.0	202     436300001

This format has few short comings like
1. When extended for dumping scalable mode DMAR table it will quickly be
   very clumsy, making it unreadable.
2. It has information like the Bus number and Entry which are basically
   part of B:D.F, hence are a repetition and are not so useful.

So, change it to a new format which could be easily extended to dump
scalable mode DMAR table. The new format looks as below:

IOMMU dmar2: Root Table Address: 0x436f7d000
B.D.F	Root_entry				Context_entry
00:14.0	0x0000000000000000:0x0000000436fbd001	0x0000000000000102:0x0000000436fbc001
00:17.0	0x0000000000000000:0x0000000436fbd001	0x0000000000000302:0x0000000436af4001
00:1f.0	0x0000000000000000:0x0000000436fbd001	0x0000000000000202:0x0000000436fcd001

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
---
 drivers/iommu/intel-iommu-debugfs.c | 65 +++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
index 7fabf9b1c2dc..3f5399b5e6c0 100644
--- a/drivers/iommu/intel-iommu-debugfs.c
+++ b/drivers/iommu/intel-iommu-debugfs.c
@@ -14,6 +14,13 @@
 
 #include <asm/irq_remapping.h>
 
+struct tbl_walk {
+	u16 bus;
+	u16 devfn;
+	struct root_entry *rt_entry;
+	struct context_entry *ctx_entry;
+};
+
 struct iommu_regset {
 	int offset;
 	const char *regs;
@@ -131,16 +138,25 @@ static int iommu_regset_show(struct seq_file *m, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(iommu_regset);
 
-static void ctx_tbl_entry_show(struct seq_file *m, struct intel_iommu *iommu,
-			       int bus)
+static inline void print_tbl_walk(struct seq_file *m)
 {
-	struct context_entry *context;
-	int devfn;
+	struct tbl_walk *tbl_wlk = m->private;
 
-	seq_printf(m, " Context Table Entries for Bus: %d\n", bus);
-	seq_puts(m, "  Entry\tB:D.F\tHigh\tLow\n");
+	seq_printf(m, "%02x:%02x.%x\t0x%016llx:0x%016llx\t0x%016llx:0x%016llx\n",
+		   tbl_wlk->bus, PCI_SLOT(tbl_wlk->devfn),
+		   PCI_FUNC(tbl_wlk->devfn), tbl_wlk->rt_entry->hi,
+		   tbl_wlk->rt_entry->lo, tbl_wlk->ctx_entry->hi,
+		   tbl_wlk->ctx_entry->lo);
+}
+
+static void ctx_tbl_walk(struct seq_file *m, struct intel_iommu *iommu, u16 bus)
+{
+	struct context_entry *context;
+	u16 devfn;
 
 	for (devfn = 0; devfn < 256; devfn++) {
+		struct tbl_walk tbl_wlk = {0};
+
 		context = iommu_context_addr(iommu, bus, devfn, 0);
 		if (!context)
 			return;
@@ -148,33 +164,34 @@ static void ctx_tbl_entry_show(struct seq_file *m, struct intel_iommu *iommu,
 		if (!context_present(context))
 			continue;
 
-		seq_printf(m, "  %-5d\t%02x:%02x.%x\t%-6llx\t%llx\n", devfn,
-			   bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-			   context[0].hi, context[0].lo);
+		tbl_wlk.bus = bus;
+		tbl_wlk.devfn = devfn;
+		tbl_wlk.rt_entry = &iommu->root_entry[bus];
+		tbl_wlk.ctx_entry = context;
+		m->private = &tbl_wlk;
+
+		print_tbl_walk(m);
 	}
 }
 
-static void root_tbl_entry_show(struct seq_file *m, struct intel_iommu *iommu)
+static void root_tbl_walk(struct seq_file *m, struct intel_iommu *iommu)
 {
 	unsigned long flags;
-	int bus;
+	u16 bus;
 
 	spin_lock_irqsave(&iommu->lock, flags);
-	seq_printf(m, "IOMMU %s: Root Table Address:%llx\n", iommu->name,
+	seq_printf(m, "IOMMU %s: Root Table Address: 0x%llx\n", iommu->name,
 		   (u64)virt_to_phys(iommu->root_entry));
-	seq_puts(m, "Root Table Entries:\n");
-
-	for (bus = 0; bus < 256; bus++) {
-		if (!(iommu->root_entry[bus].lo & 1))
-			continue;
+	seq_puts(m, "B.D.F\tRoot_entry\t\t\t\tContext_entry\n");
 
-		seq_printf(m, " Bus: %d H: %llx L: %llx\n", bus,
-			   iommu->root_entry[bus].hi,
-			   iommu->root_entry[bus].lo);
+	/*
+	 * No need to check if the root entry is present or not because
+	 * iommu_context_addr() performs the same check before returning
+	 * context entry.
+	 */
+	for (bus = 0; bus < 256; bus++)
+		ctx_tbl_walk(m, iommu, bus);
 
-		ctx_tbl_entry_show(m, iommu, bus);
-		seq_putc(m, '\n');
-	}
 	spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
@@ -185,7 +202,7 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
 
 	rcu_read_lock();
 	for_each_active_iommu(iommu, drhd) {
-		root_tbl_entry_show(m, iommu);
+		root_tbl_walk(m, iommu);
 		seq_putc(m, '\n');
 	}
 	rcu_read_unlock();
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
