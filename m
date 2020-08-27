Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB07254289
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 11:36:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C041120C92;
	Thu, 27 Aug 2020 09:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIQ2ymq4dtTp; Thu, 27 Aug 2020 09:36:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6046120367;
	Thu, 27 Aug 2020 09:36:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4D2C9C0051;
	Thu, 27 Aug 2020 09:36:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34CE1C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B36D7855B1
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cb1sVfVDmdNP for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 09:36:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 62FEC85579
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 09:36:49 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E97BBE7CB5867A12A7BA;
 Thu, 27 Aug 2020 17:36:45 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.71) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 27 Aug 2020 17:36:36 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] iommu/arm-smmu-v3: add tracepoints for cmdq_issue_cmdlist
Date: Thu, 27 Aug 2020 21:33:51 +1200
Message-ID: <20200827093351.15244-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.200.71]
X-CFilter-Loop: Reflected
Cc: robin.murphy@arm.com, will@kernel.org, linuxarm@huawei.com
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

cmdq_issue_cmdlist() is the hotspot that uses a lot of time. This patch
adds tracepoints for it to help debug.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 * can furthermore develop an eBPF program to benchmark using this trace

  cmdlistlat.c:
#include <uapi/linux/ptrace.h>

BPF_HASH(start, u32);
BPF_HISTOGRAM(dist);

TRACEPOINT_PROBE(arm_smmu_v3, issue_cmdlist_entry)
{
        u32 pid;
        u64 ts, *val;

        pid = bpf_get_current_pid_tgid();
        ts = bpf_ktime_get_ns();
        start.update(&pid, &ts);
        return 0;
}

TRACEPOINT_PROBE(arm_smmu_v3, issue_cmdlist_exit)
{
        u32 pid;
        u64 *tsp, delta;

        pid = bpf_get_current_pid_tgid();
        tsp = start.lookup(&pid);

        if (tsp != 0) {
                delta = bpf_ktime_get_ns() - *tsp;
                dist.increment(bpf_log2l(delta));
                start.delete(&pid);
        }

        return 0;
}

 cmdlistlat.py:
#!/usr/bin/python3
#
from __future__ import print_function
from bcc import BPF
from ctypes import c_ushort, c_int, c_ulonglong
from time import sleep
from sys import argv

def usage():
        print("USAGE: %s [interval [count]]" % argv[0])
        exit()

# arguments
interval = 5
count = -1
if len(argv) > 1:
        try:
                interval = int(argv[1])
                if interval == 0:
                        raise
                if len(argv) > 2:
                        count = int(argv[2])
        except: # also catches -h, --help
                usage()

# load BPF program
b = BPF(src_file = "cmdlistlat.c")

# header
print("Tracing... Hit Ctrl-C to end.")

# output
loop = 0
do_exit = 0
while (1):
        if count > 0:
                loop += 1
                if loop > count:
                        exit()
        try:
                sleep(interval)
        except KeyboardInterrupt:
                pass; do_exit = 1

        print()
        b["dist"].print_log2_hist("nsecs")
        b["dist"].clear()
        if do_exit:
                exit()


 drivers/iommu/arm/arm-smmu-v3/Makefile        |  1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-trace.h | 48 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  8 ++++
 3 files changed, 57 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-trace.h

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 569e24e9f162..dba1087f91f3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+ccflags-y += -I$(src)                   # needed for trace events
 obj-$(CONFIG_ARM_SMMU_V3) += arm-smmu-v3.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-trace.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-trace.h
new file mode 100644
index 000000000000..29ab96706124
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-trace.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Hisilicon Limited.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM arm_smmu_v3
+
+#if !defined(_ARM_SMMU_V3_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _ARM_SMMU_V3_TRACE_H
+
+#include <linux/tracepoint.h>
+
+struct device;
+
+DECLARE_EVENT_CLASS(issue_cmdlist_class,
+	TP_PROTO(struct device *dev, int n, bool sync),
+	TP_ARGS(dev, n, sync),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(dev))
+		__field(int, n)
+		__field(bool, sync)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(dev));
+		__entry->n = n;
+		__entry->sync = sync;
+	),
+	TP_printk("%s cmd number=%d sync=%d",
+			__get_str(device), __entry->n, __entry->sync)
+);
+
+#define DEFINE_ISSUE_CMDLIST_EVENT(name)       \
+DEFINE_EVENT(issue_cmdlist_class, name,        \
+	TP_PROTO(struct device *dev, int n, bool sync), \
+	TP_ARGS(dev, n, sync))
+
+DEFINE_ISSUE_CMDLIST_EVENT(issue_cmdlist_entry);
+DEFINE_ISSUE_CMDLIST_EVENT(issue_cmdlist_exit);
+
+#endif /* _ARM_SMMU_V3_TRACE_H */
+
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE arm-smmu-v3-trace
+#include <trace/define_trace.h>
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 7332251dd8cd..e2d7d5f1d234 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -33,6 +33,8 @@
 
 #include <linux/amba/bus.h>
 
+#include "arm-smmu-v3-trace.h"
+
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
 #define IDR0_ST_LVL			GENMASK(28, 27)
@@ -1389,6 +1391,8 @@ static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	}, head = llq;
 	int ret = 0;
 
+	trace_issue_cmdlist_entry(smmu->dev, n, sync);
+
 	/* 1. Allocate some space in the queue */
 	local_irq_save(flags);
 	llq.val = READ_ONCE(cmdq->q.llq.val);
@@ -1493,6 +1497,7 @@ static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	}
 
 	local_irq_restore(flags);
+	trace_issue_cmdlist_exit(smmu->dev, n, sync);
 	return ret;
 }
 
@@ -4166,6 +4171,9 @@ static struct platform_driver arm_smmu_driver = {
 };
 module_platform_driver(arm_smmu_driver);
 
+#define CREATE_TRACE_POINTS
+#include "arm-smmu-v3-trace.h"
+
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
 MODULE_ALIAS("platform:arm-smmu-v3");
-- 
2.27.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
