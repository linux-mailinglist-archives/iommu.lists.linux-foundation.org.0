Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7242774E6
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 17:09:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 30E962E0ED;
	Thu, 24 Sep 2020 15:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBU39A4Bnko7; Thu, 24 Sep 2020 15:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B60DE2E130;
	Thu, 24 Sep 2020 15:09:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADBB2C0859;
	Thu, 24 Sep 2020 15:09:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 838C3C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 15:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7CCCD86BDD
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 15:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdBlNuFH7rXv for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 15:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BA53B86BD6
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 15:00:33 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OExX1Z122632;
 Thu, 24 Sep 2020 15:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=gzg5twMJKNjp6lvCo9UI8kbkdEJTXqmja6D+xkQICEA=;
 b=Oz3z6I1pf/MhqRK+Fwig/UC8eTjoRwvzB4sufBARwl1AmwdlaaJd/3L0uWVDdAJFSgWP
 redcpUHS8SKhZNSXOoW2oxHNJIlDTuCsnB1hlA7wHWazWmQHYcz4C4z1bclTdTk14OLM
 olUdA5z7dfu9fmmc6n2zdE1KnrlzjQKEn6W5+L6Y0mbObgb0MANq9rXAAuMCxT0uKRh7
 FZ0VGn0PqYcKeV1SrsMXKoj+/RjhNoJB8byhZu7cCz4pCuOVtxfh16mKYC2+kEO33qls
 2DSWsEK78t+K0toZ/k7nmv1eKtlzicULeHi4PRRR40HDC1tOZ3JNud3thiUaGeQzQuAp Eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 33qcpu5qrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:00:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OEuAEc177202;
 Thu, 24 Sep 2020 14:58:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 33r28x3vka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 14:58:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08OEwEX9016160;
 Thu, 24 Sep 2020 14:58:14 GMT
Received: from disposition.us.oracle.com (/10.152.32.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 07:58:14 -0700
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 08/13] x86: Secure Launch kernel late boot stub
Date: Thu, 24 Sep 2020 10:58:36 -0400
Message-Id: <1600959521-24158-9-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240115
X-Mailman-Approved-At: Thu, 24 Sep 2020 15:09:23 +0000
Cc: dpsmith@apertussolutions.com, ross.philipson@oracle.com,
 luto@amacapital.net, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, trenchboot-devel@googlegroups.com
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

The routine slaunch_setup is called out of the x86 specific setup_arch
routine during early kernel boot. After determining what platform is
present, various operations specific to that platform occur. This
includes finalizing setting for the platform late launch and verifying
that memory protections are in place.

For TXT, this code also reserves the original compressed kernel setup
area where the APs were left looping so that this memory cannot be used.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 arch/x86/kernel/Makefile   |   1 +
 arch/x86/kernel/setup.c    |   3 +
 arch/x86/kernel/slaunch.c  | 495 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/iommu/intel/dmar.c |   4 +
 4 files changed, 503 insertions(+)
 create mode 100644 arch/x86/kernel/slaunch.c

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index e77261d..318366f 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_X86_32)		+= tls.o
 obj-$(CONFIG_IA32_EMULATION)	+= tls.o
 obj-y				+= step.o
 obj-$(CONFIG_INTEL_TXT)		+= tboot.o
+obj-$(CONFIG_SECURE_LAUNCH)	+= slaunch.o
 obj-$(CONFIG_ISA_DMA_API)	+= i8237.o
 obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
 obj-y				+= cpu/
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 3511736..cae9476 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -18,6 +18,7 @@
 #include <linux/sfi.h>
 #include <linux/hugetlb.h>
 #include <linux/tboot.h>
+#include <linux/slaunch.h>
 #include <linux/usb/xhci-dbgp.h>
 
 #include <uapi/linux/mount.h>
@@ -1009,6 +1010,8 @@ void __init setup_arch(char **cmdline_p)
 	early_gart_iommu_check();
 #endif
 
+	slaunch_setup();
+
 	/*
 	 * partially used pages are not usable - thus
 	 * we are rounding upwards:
diff --git a/arch/x86/kernel/slaunch.c b/arch/x86/kernel/slaunch.c
new file mode 100644
index 0000000..e040e32
--- /dev/null
+++ b/arch/x86/kernel/slaunch.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Secure Launch late validation/setup, securityfs exposure and
+ * finalization support.
+ *
+ * Copyright (c) 2020, Oracle and/or its affiliates.
+ * Copyright (c) 2020 Apertus Solutions, LLC
+ *
+ * Author(s):
+ *     Daniel P. Smith <dpsmith@apertussolutions.com>
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/linkage.h>
+#include <linux/mm.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/security.h>
+#include <linux/memblock.h>
+#include <asm/segment.h>
+#include <asm/sections.h>
+#include <asm/boot.h>
+#include <asm/msr.h>
+#include <asm/tlbflush.h>
+#include <asm/processor-flags.h>
+#include <asm/asm-offsets.h>
+#include <asm/e820/api.h>
+#include <asm/bootparam.h>
+#include <asm/setup.h>
+#include <linux/slaunch.h>
+
+static u32 sl_flags;
+static struct sl_ap_wake_info ap_wake_info;
+static u64 evtlog_addr;
+static u32 evtlog_size;
+static u64 vtd_pmr_lo_size;
+
+/* This should be plenty of room */
+static u8 txt_dmar[PAGE_SIZE] __aligned(16);
+
+u32 slaunch_get_flags(void)
+{
+	return sl_flags;
+}
+EXPORT_SYMBOL(slaunch_get_flags);
+
+struct sl_ap_wake_info *slaunch_get_ap_wake_info(void)
+{
+	return &ap_wake_info;
+}
+
+struct acpi_table_header *slaunch_get_dmar_table(struct acpi_table_header *dmar)
+{
+	/* The DMAR is only stashed and provided via TXT on Intel systems */
+	if (memcmp(txt_dmar, "DMAR", 4))
+		return dmar;
+
+	return (struct acpi_table_header *)(&txt_dmar[0]);
+}
+
+static void __init __noreturn slaunch_txt_reset(void __iomem *txt,
+						const char *msg, u64 error)
+{
+	u64 one = 1, val;
+
+	pr_err("%s", msg);
+
+	/*
+	 * This performs a TXT reset with a sticky error code. The reads of
+	 * TXT_CR_E2STS act as barriers.
+	 */
+	memcpy_toio(txt + TXT_CR_ERRORCODE, &error, sizeof(u64));
+	memcpy_fromio(&val, txt + TXT_CR_E2STS, sizeof(u64));
+	memcpy_toio(txt + TXT_CR_CMD_NO_SECRETS, &one, sizeof(u64));
+	memcpy_fromio(&val, txt + TXT_CR_E2STS, sizeof(u64));
+	memcpy_toio(txt + TXT_CR_CMD_UNLOCK_MEM_CONFIG, &one, sizeof(u64));
+	memcpy_fromio(&val, txt + TXT_CR_E2STS, sizeof(u64));
+	memcpy_toio(txt + TXT_CR_CMD_RESET, &one, sizeof(u64));
+
+	for ( ; ; )
+		asm volatile ("hlt");
+
+	unreachable();
+}
+
+/*
+ * The TXT heap is too big to map all at once with early_ioremap
+ * so it is done a table at a time.
+ */
+static void __init *txt_early_get_heap_table(void __iomem *txt, u32 type,
+					     u32 bytes)
+{
+	void *heap;
+	u64 base, size, offset = 0;
+	int i;
+
+	if (type > TXT_SINIT_MLE_DATA_TABLE)
+		slaunch_txt_reset(txt,
+			"Error invalid table type for early heap walk\n",
+			SL_ERROR_HEAP_WALK);
+
+	memcpy_fromio(&base, txt + TXT_CR_HEAP_BASE, sizeof(u64));
+	memcpy_fromio(&size, txt + TXT_CR_HEAP_SIZE, sizeof(u64));
+
+	/* Iterate over heap tables looking for table of "type" */
+	for (i = 0; i < type; i++) {
+		base += offset;
+		heap = early_memremap(base, sizeof(u64));
+		if (!heap)
+			slaunch_txt_reset(txt,
+				"Error early_memremap of heap for heap walk\n",
+				SL_ERROR_HEAP_WALK);
+
+		offset = *((u64 *)heap);
+
+		/*
+		 * After the first iteration, any offset of zero is invalid and
+		 * implies the TXT heap is corrupted.
+		 */
+		if (!offset)
+			slaunch_txt_reset(txt,
+				"Error invalid 0 offset in heap walk\n",
+				SL_ERROR_HEAP_ZERO_OFFSET);
+
+		early_memunmap(heap, sizeof(u64));
+	}
+
+	/* Skip the size field at the head of each table */
+	base += sizeof(u64);
+	heap = early_memremap(base, bytes);
+	if (!heap)
+		slaunch_txt_reset(txt,
+				  "Error early_memremap of heap section\n",
+				  SL_ERROR_HEAP_MAP);
+
+	return heap;
+}
+
+/*
+ * TXT uses a special set of VTd registers to protect all of memory from DMA
+ * until the IOMMU can be programmed to protect memory. There is the low
+ * memory PMR that can protect all memory up to 4G. The high memory PRM can
+ * be setup to protect all memory beyond 4Gb. Validate that these values cover
+ * what is expected.
+ */
+static void __init slaunch_verify_pmrs(void __iomem *txt)
+{
+	struct txt_os_sinit_data *os_sinit_data;
+	unsigned long last_pfn, initrd_extent;
+	u32 field_offset, err = 0;
+	const char *errmsg = "";
+
+	field_offset = offsetof(struct txt_os_sinit_data, lcp_po_base);
+	os_sinit_data = txt_early_get_heap_table(txt, TXT_OS_SINIT_DATA_TABLE,
+						 field_offset);
+
+	/* Save a copy */
+	vtd_pmr_lo_size = os_sinit_data->vtd_pmr_lo_size;
+
+	last_pfn = e820__end_of_ram_pfn();
+
+	/*
+	 * First make sure the hi PMR covers all memory above 4G. In the
+	 * unlikely case where there is < 4G on the system, the hi PMR will
+	 * not be set.
+	 */
+	if (os_sinit_data->vtd_pmr_hi_base != 0x0ULL) {
+		if (os_sinit_data->vtd_pmr_hi_base != 0x100000000ULL) {
+			err = SL_ERROR_HI_PMR_BASE;
+			errmsg =  "Error hi PMR base\n";
+			goto out;
+		}
+
+		if (last_pfn << PAGE_SHIFT >
+		    os_sinit_data->vtd_pmr_hi_base +
+		    os_sinit_data->vtd_pmr_hi_size) {
+			err = SL_ERROR_HI_PMR_SIZE;
+			errmsg = "Error hi PMR size\n";
+			goto out;
+		}
+	}
+
+	/* Lo PMR base should always be 0 */
+	if (os_sinit_data->vtd_pmr_lo_base != 0x0ULL) {
+		err = SL_ERROR_LO_PMR_BASE;
+		errmsg = "Error lo PMR base\n";
+		goto out;
+	}
+
+	/*
+	 * Check that if the kernel was loaded below 4G, that it is protected
+	 * by the lo PMR. Note this is the decompressed kernel. The ACM would
+	 * have ensured the compressed kernel (the MLE image) was protected.
+	 */
+	if ((__pa_symbol(_end) < 0x100000000ULL) &&
+	    (__pa_symbol(_end) > os_sinit_data->vtd_pmr_lo_size)) {
+		err = SL_ERROR_LO_PMR_MLE;
+		errmsg = "Error lo PMR does not cover MLE kernel\n";
+		goto out;
+	}
+
+	/* Check that the AP wake block is protected by the lo PMR. */
+	if (ap_wake_info.ap_wake_block + PAGE_SIZE >
+	    os_sinit_data->vtd_pmr_lo_size) {
+		err = SL_ERROR_LO_PMR_MLE;
+		errmsg = "Error lo PMR does not cover AP wake block\n";
+	}
+
+	/*
+	 * If an external initrd is present and loaded below 4G, check
+	 * that it is protected by the lo PMR.
+	 */
+	if (boot_params.hdr.ramdisk_image != 0 &&
+	    boot_params.hdr.ramdisk_size != 0) {
+		initrd_extent = boot_params.hdr.ramdisk_image +
+				boot_params.hdr.ramdisk_size;
+		if ((initrd_extent < 0x100000000ULL) &&
+		    (initrd_extent > os_sinit_data->vtd_pmr_lo_size)) {
+			err = SL_ERROR_LO_PMR_INITRD;
+			errmsg = "Error lo PMR does not cover external initrd\n";
+			goto out;
+		}
+	}
+
+out:
+	early_memunmap(os_sinit_data, field_offset);
+
+	if (err)
+		slaunch_txt_reset(txt, errmsg, err);
+}
+
+static void __init slaunch_txt_reserve_range(u64 base, u64 size)
+{
+	int type;
+
+	type = e820__get_entry_type(base, base + size - 1);
+	if (type == E820_TYPE_RAM) {
+		pr_info("memblock reserve base: %llx size: %llx\n", base, size);
+		memblock_reserve(base, size);
+	}
+}
+
+/*
+ * For Intel, certain regions of memory must be marked as reserved by putting
+ * them on the memblock reserved list if they are not already e820 reserved.
+ * This includes:
+ *  - The TXT HEAP
+ *  - The ACM area
+ *  - The TXT private register bank
+ *  - The MDR list sent to the MLE by the ACM (see TXT specification)
+ *  (Normally the above are properly reserved by firmware but if it was not
+ *  done, reserve them now)
+ *  - The AP wake block
+ *  - TPM log external to the TXT heap
+ *
+ * Also if the low PMR doesn't cover all memory < 4G, any RAM regions above
+ * the low PMR must be reservered too.
+ */
+static void __init slaunch_txt_reserve(void __iomem *txt)
+{
+	struct txt_sinit_memory_descriptor_record *mdr;
+	struct txt_sinit_mle_data *sinit_mle_data;
+	void *mdrs;
+	u64 base, size, heap_base, heap_size;
+	u32 field_offset, mdrnum, mdroffset, mdrslen, i;
+
+	base = TXT_PRIV_CONFIG_REGS_BASE;
+	size = TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE;
+	slaunch_txt_reserve_range(base, size);
+
+	memcpy_fromio(&heap_base, txt + TXT_CR_HEAP_BASE, sizeof(u64));
+	memcpy_fromio(&heap_size, txt + TXT_CR_HEAP_SIZE, sizeof(u64));
+	slaunch_txt_reserve_range(heap_base, heap_size);
+
+	memcpy_fromio(&base, txt + TXT_CR_SINIT_BASE, sizeof(u64));
+	memcpy_fromio(&size, txt + TXT_CR_SINIT_SIZE, sizeof(u64));
+	slaunch_txt_reserve_range(base, size);
+
+	field_offset = offsetof(struct txt_sinit_mle_data,
+				sinit_vtd_dmar_table_size);
+	sinit_mle_data = txt_early_get_heap_table(txt, TXT_SINIT_MLE_DATA_TABLE,
+					field_offset);
+
+	mdrnum = sinit_mle_data->num_of_sinit_mdrs;
+	mdroffset = sinit_mle_data->sinit_mdrs_table_offset;
+
+	early_memunmap(sinit_mle_data, field_offset);
+
+	if (!mdrnum)
+		goto nomdr;
+
+	mdrslen = (mdrnum * sizeof(struct txt_sinit_memory_descriptor_record));
+
+	mdrs = txt_early_get_heap_table(txt, TXT_SINIT_MLE_DATA_TABLE,
+					mdroffset + mdrslen - 8);
+
+	mdr = (struct txt_sinit_memory_descriptor_record *)
+			(mdrs + mdroffset - 8);
+
+	for (i = 0; i < mdrnum; i++, mdr++) {
+		/* Spec says some entries can have length 0, ignore them */
+		if (mdr->type > 0 && mdr->length > 0)
+			slaunch_txt_reserve_range(mdr->address, mdr->length);
+	}
+
+	early_memunmap(mdrs, mdroffset + mdrslen - 8);
+
+nomdr:
+	slaunch_txt_reserve_range(ap_wake_info.ap_wake_block,
+				  ap_wake_info.ap_wake_block_size);
+
+	if (evtlog_addr < heap_base || evtlog_addr > (heap_base + heap_size))
+		slaunch_txt_reserve_range(evtlog_addr, evtlog_size);
+
+	for (i = 0; i < e820_table->nr_entries; i++) {
+		base = e820_table->entries[i].addr;
+		size = e820_table->entries[i].size;
+		if ((base > vtd_pmr_lo_size) && (base < 0x100000000ULL))
+			slaunch_txt_reserve_range(base, size);
+	}
+}
+
+/*
+ * TXT stashes a safe copy of the DMAR ACPI table to prevent tampering.
+ * It is stored in the TXT heap. Fetch it from there and make it available
+ * to the IOMMU driver.
+ */
+static void __init slaunch_copy_dmar_table(void __iomem *txt)
+{
+	struct txt_sinit_mle_data *sinit_mle_data;
+	void *dmar;
+	u32 field_offset, dmar_size, dmar_offset;
+
+	memset(&txt_dmar, 0, PAGE_SIZE);
+
+	field_offset = offsetof(struct txt_sinit_mle_data,
+				processor_scrtm_status);
+	sinit_mle_data = txt_early_get_heap_table(txt, TXT_SINIT_MLE_DATA_TABLE,
+						  field_offset);
+
+	dmar_size = sinit_mle_data->sinit_vtd_dmar_table_size;
+	dmar_offset = sinit_mle_data->sinit_vtd_dmar_table_offset;
+
+	early_memunmap(sinit_mle_data, field_offset);
+
+	if (!dmar_size || !dmar_offset)
+		slaunch_txt_reset(txt,
+				  "Error invalid DMAR table values\n",
+				  SL_ERROR_HEAP_INVALID_DMAR);
+
+	if (unlikely(dmar_size > PAGE_SIZE))
+		slaunch_txt_reset(txt,
+				  "Error DMAR too big to store\n",
+				  SL_ERROR_HEAP_DMAR_SIZE);
+
+
+	dmar = txt_early_get_heap_table(txt, TXT_SINIT_MLE_DATA_TABLE,
+					dmar_offset + dmar_size - 8);
+	if (!dmar)
+		slaunch_txt_reset(txt,
+				  "Error early_ioremap of DMAR\n",
+				  SL_ERROR_HEAP_DMAR_MAP);
+
+	memcpy(&txt_dmar[0], dmar + dmar_offset - 8, dmar_size);
+
+	early_memunmap(dmar, dmar_offset + dmar_size - 8);
+}
+
+/*
+ * The location of the safe AP wake code block is stored in the TXT heap.
+ * Fetch it here in the early init code for later use in SMP startup.
+ *
+ * Also get the TPM event log values that may have to be put on the
+ * memblock reserve list later.
+ */
+static void __init slaunch_fetch_os_mle_fields(void __iomem *txt)
+{
+	struct txt_os_mle_data *os_mle_data;
+	u8 *jmp_offset;
+
+	os_mle_data = txt_early_get_heap_table(txt, TXT_OS_MLE_DATA_TABLE,
+					       sizeof(struct txt_os_mle_data));
+
+	ap_wake_info.ap_wake_block = os_mle_data->ap_wake_block;
+	ap_wake_info.ap_wake_block_size = os_mle_data->ap_wake_block_size;
+
+	jmp_offset = os_mle_data->mle_scratch + SL_SCRATCH_AP_JMP_OFFSET;
+	ap_wake_info.ap_jmp_offset = *((u32 *)jmp_offset);
+
+	evtlog_addr = os_mle_data->evtlog_addr;
+	evtlog_size = os_mle_data->evtlog_size;
+
+	early_memunmap(os_mle_data, sizeof(struct txt_os_mle_data));
+}
+
+/*
+ * Intel specific late stub setup and validation.
+ */
+static void __init slaunch_setup_intel(void)
+{
+	void __iomem *txt;
+	u64 val = 0x1ULL;
+
+	/*
+	 * First see if SENTER was done and not by TBOOT by reading the status
+	 * register in the public space.
+	 */
+	txt = early_ioremap(TXT_PUB_CONFIG_REGS_BASE,
+			    TXT_NR_CONFIG_PAGES * PAGE_SIZE);
+	if (!txt) {
+		/* This is really bad, no where to go from here */
+		panic("Error early_ioremap of TXT pub registers\n");
+	}
+
+	memcpy_fromio(&val, txt + TXT_CR_STS, sizeof(u64));
+	early_iounmap(txt, TXT_NR_CONFIG_PAGES * PAGE_SIZE);
+
+	/* Was SENTER done? */
+	if (!(val & TXT_SENTER_DONE_STS))
+		return;
+
+	/* Was it done by TBOOT? */
+	if (boot_params.tboot_addr)
+		return;
+
+	/* Now we want to use the private register space */
+	txt = early_ioremap(TXT_PRIV_CONFIG_REGS_BASE,
+			    TXT_NR_CONFIG_PAGES * PAGE_SIZE);
+	if (!txt) {
+		/* This is really bad, no where to go from here */
+		panic("Error early_ioremap of TXT priv registers\n");
+	}
+
+	/*
+	 * Try to read the Intel VID from the TXT private registers to see if
+	 * TXT measured launch happened properly and the private space is
+	 * available.
+	 */
+	memcpy_fromio(&val, txt + TXT_CR_DIDVID, sizeof(u64));
+	if ((u16)(val & 0xffff) != 0x8086) {
+		/*
+		 * Can't do a proper TXT reset since it appears something is
+		 * wrong even though SENTER happened and it should be in SMX
+		 * mode.
+		 */
+		panic("Invalid TXT vendor ID, not in SMX mode\n");
+	}
+
+	/* Set flags so subsequent code knows the status of the launch */
+	sl_flags |= (SL_FLAG_ACTIVE|SL_FLAG_ARCH_TXT);
+
+	/*
+	 * Reading the proper DIDVID from the private register space means we
+	 * are in SMX mode and private registers are open for read/write.
+	 */
+
+	/* On Intel, have to handle TPM localities via TXT */
+	val = 0x1ULL;
+	memcpy_toio(txt + TXT_CR_CMD_SECRETS, &val, sizeof(u64));
+	memcpy_fromio(&val, txt + TXT_CR_E2STS, sizeof(u64));
+	val = 0x1ULL;
+	memcpy_toio(txt + TXT_CR_CMD_OPEN_LOCALITY1, &val, sizeof(u64));
+	memcpy_fromio(&val, txt + TXT_CR_E2STS, sizeof(u64));
+
+	slaunch_fetch_os_mle_fields(txt);
+
+	slaunch_verify_pmrs(txt);
+
+	slaunch_txt_reserve(txt);
+
+	slaunch_copy_dmar_table(txt);
+
+	early_iounmap(txt, TXT_NR_CONFIG_PAGES * PAGE_SIZE);
+
+	pr_info("Intel TXT setup complete\n");
+}
+
+void __init slaunch_setup(void)
+{
+	u32 vendor[4];
+
+	/* Get manufacturer string with CPUID 0 */
+	cpuid(0, &vendor[0], &vendor[1], &vendor[2], &vendor[3]);
+
+	/* Only Intel TXT is supported at this point */
+	if (vendor[1] == INTEL_CPUID_MFGID_EBX &&
+	    vendor[2] == INTEL_CPUID_MFGID_ECX &&
+	    vendor[3] == INTEL_CPUID_MFGID_EDX)
+		slaunch_setup_intel();
+}
diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 93e6345..d9856b5 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -29,6 +29,7 @@
 #include <linux/iommu.h>
 #include <linux/numa.h>
 #include <linux/limits.h>
+#include <linux/slaunch.h>
 #include <asm/irq_remapping.h>
 #include <asm/iommu_table.h>
 
@@ -633,6 +634,9 @@ static inline int dmar_walk_dmar_table(struct acpi_table_dmar *dmar,
 	 */
 	dmar_tbl = tboot_get_dmar_table(dmar_tbl);
 
+	/* If Secure Launch is active, it has similar logic */
+	dmar_tbl = slaunch_get_dmar_table(dmar_tbl);
+
 	dmar = (struct acpi_table_dmar *)dmar_tbl;
 	if (!dmar)
 		return -ENODEV;
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
