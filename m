Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8928599
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 20:07:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B3C95F29;
	Thu, 23 May 2019 18:07:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A627F27
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 18:07:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C29B487D
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 18:07:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 846A415BF;
	Thu, 23 May 2019 11:07:07 -0700 (PDT)
Received: from ostrya.cambridge.arm.com (ostrya.cambridge.arm.com
	[10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DABF43F5AF; 
	Thu, 23 May 2019 11:07:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: joro@8bytes.org,
	alex.williamson@redhat.com
Subject: [PATCH 2/4] iommu: Introduce device fault data
Date: Thu, 23 May 2019 19:06:11 +0100
Message-Id: <20190523180613.55049-3-jean-philippe.brucker@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523180613.55049-1-jean-philippe.brucker@arm.com>
References: <20190523180613.55049-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: yi.l.liu@linux.intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
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

From: Jacob Pan <jacob.jun.pan@linux.intel.com>

Device faults detected by IOMMU can be reported outside the IOMMU
subsystem for further processing. This patch introduces
a generic device fault data structure.

The fault can be either an unrecoverable fault or a page request,
also referred to as a recoverable fault.

We only care about non internal faults that are likely to be reported
to an external subsystem.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
Signed-off-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/linux/iommu.h      |  43 ++++++++++++++
 include/uapi/linux/iommu.h | 118 +++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 include/uapi/linux/iommu.h

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a815cf6f6f47..d442f5f3fa93 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -25,6 +25,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <uapi/linux/iommu.h>
 
 #define IOMMU_READ	(1 << 0)
 #define IOMMU_WRITE	(1 << 1)
@@ -49,6 +50,7 @@ struct device;
 struct iommu_domain;
 struct notifier_block;
 struct iommu_sva;
+struct iommu_fault_event;
 
 /* iommu fault flags */
 #define IOMMU_FAULT_READ	0x0
@@ -58,6 +60,7 @@ typedef int (*iommu_fault_handler_t)(struct iommu_domain *,
 			struct device *, unsigned long, int, void *);
 typedef int (*iommu_mm_exit_handler_t)(struct device *dev, struct iommu_sva *,
 				       void *);
+typedef int (*iommu_dev_fault_handler_t)(struct iommu_fault_event *, void *);
 
 struct iommu_domain_geometry {
 	dma_addr_t aperture_start; /* First address that can be mapped    */
@@ -301,6 +304,45 @@ struct iommu_device {
 	struct device *dev;
 };
 
+/**
+ * struct iommu_fault_event - Generic fault event
+ *
+ * Can represent recoverable faults such as a page requests or
+ * unrecoverable faults such as DMA or IRQ remapping faults.
+ *
+ * @fault: fault descriptor
+ * @iommu_private: used by the IOMMU driver for storing fault-specific
+ *                 data. Users should not modify this field before
+ *                 sending the fault response.
+ */
+struct iommu_fault_event {
+	struct iommu_fault fault;
+	u64 iommu_private;
+};
+
+/**
+ * struct iommu_fault_param - per-device IOMMU fault data
+ * @handler: Callback function to handle IOMMU faults at device level
+ * @data: handler private data
+ */
+struct iommu_fault_param {
+	iommu_dev_fault_handler_t handler;
+	void *data;
+};
+
+/**
+ * struct iommu_param - collection of per-device IOMMU data
+ *
+ * @fault_param: IOMMU detected device fault reporting data
+ *
+ * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
+ *	struct iommu_group	*iommu_group;
+ *	struct iommu_fwspec	*iommu_fwspec;
+ */
+struct iommu_param {
+	struct iommu_fault_param *fault_param;
+};
+
 int  iommu_device_register(struct iommu_device *iommu);
 void iommu_device_unregister(struct iommu_device *iommu);
 int  iommu_device_sysfs_add(struct iommu_device *iommu,
@@ -504,6 +546,7 @@ struct iommu_ops {};
 struct iommu_group {};
 struct iommu_fwspec {};
 struct iommu_device {};
+struct iommu_fault_param {};
 
 static inline bool iommu_present(struct bus_type *bus)
 {
diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
new file mode 100644
index 000000000000..796402174d6c
--- /dev/null
+++ b/include/uapi/linux/iommu.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * IOMMU user API definitions
+ */
+
+#ifndef _UAPI_IOMMU_H
+#define _UAPI_IOMMU_H
+
+#include <linux/types.h>
+
+#define IOMMU_FAULT_PERM_READ	(1 << 0) /* read */
+#define IOMMU_FAULT_PERM_WRITE	(1 << 1) /* write */
+#define IOMMU_FAULT_PERM_EXEC	(1 << 2) /* exec */
+#define IOMMU_FAULT_PERM_PRIV	(1 << 3) /* privileged */
+
+/* Generic fault types, can be expanded IRQ remapping fault */
+enum iommu_fault_type {
+	IOMMU_FAULT_DMA_UNRECOV = 1,	/* unrecoverable fault */
+	IOMMU_FAULT_PAGE_REQ,		/* page request fault */
+};
+
+enum iommu_fault_reason {
+	IOMMU_FAULT_REASON_UNKNOWN = 0,
+
+	/* Could not access the PASID table (fetch caused external abort) */
+	IOMMU_FAULT_REASON_PASID_FETCH,
+
+	/* PASID entry is invalid or has configuration errors */
+	IOMMU_FAULT_REASON_BAD_PASID_ENTRY,
+
+	/*
+	 * PASID is out of range (e.g. exceeds the maximum PASID
+	 * supported by the IOMMU) or disabled.
+	 */
+	IOMMU_FAULT_REASON_PASID_INVALID,
+
+	/*
+	 * An external abort occurred fetching (or updating) a translation
+	 * table descriptor
+	 */
+	IOMMU_FAULT_REASON_WALK_EABT,
+
+	/*
+	 * Could not access the page table entry (Bad address),
+	 * actual translation fault
+	 */
+	IOMMU_FAULT_REASON_PTE_FETCH,
+
+	/* Protection flag check failed */
+	IOMMU_FAULT_REASON_PERMISSION,
+
+	/* access flag check failed */
+	IOMMU_FAULT_REASON_ACCESS,
+
+	/* Output address of a translation stage caused Address Size fault */
+	IOMMU_FAULT_REASON_OOR_ADDRESS,
+};
+
+/**
+ * struct iommu_fault_unrecoverable - Unrecoverable fault data
+ * @reason: reason of the fault, from &enum iommu_fault_reason
+ * @flags: parameters of this fault (IOMMU_FAULT_UNRECOV_* values)
+ * @pasid: Process Address Space ID
+ * @perm: requested permission access using by the incoming transaction
+ *        (IOMMU_FAULT_PERM_* values)
+ * @addr: offending page address
+ * @fetch_addr: address that caused a fetch abort, if any
+ */
+struct iommu_fault_unrecoverable {
+	__u32	reason;
+#define IOMMU_FAULT_UNRECOV_PASID_VALID		(1 << 0)
+#define IOMMU_FAULT_UNRECOV_ADDR_VALID		(1 << 1)
+#define IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID	(1 << 2)
+	__u32	flags;
+	__u32	pasid;
+	__u32	perm;
+	__u64	addr;
+	__u64	fetch_addr;
+};
+
+/**
+ * struct iommu_fault_page_request - Page Request data
+ * @flags: encodes whether the corresponding fields are valid and whether this
+ *         is the last page in group (IOMMU_FAULT_PAGE_REQUEST_* values)
+ * @pasid: Process Address Space ID
+ * @grpid: Page Request Group Index
+ * @perm: requested page permissions (IOMMU_FAULT_PERM_* values)
+ * @addr: page address
+ * @private_data: device-specific private information
+ */
+struct iommu_fault_page_request {
+#define IOMMU_FAULT_PAGE_REQUEST_PASID_VALID	(1 << 0)
+#define IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE	(1 << 1)
+#define IOMMU_FAULT_PAGE_REQUEST_PRIV_DATA	(1 << 2)
+	__u32	flags;
+	__u32	pasid;
+	__u32	grpid;
+	__u32	perm;
+	__u64	addr;
+	__u64	private_data[2];
+};
+
+/**
+ * struct iommu_fault - Generic fault data
+ * @type: fault type from &enum iommu_fault_type
+ * @padding: reserved for future use (should be zero)
+ * @event: fault event, when @type is %IOMMU_FAULT_DMA_UNRECOV
+ * @prm: Page Request message, when @type is %IOMMU_FAULT_PAGE_REQ
+ */
+struct iommu_fault {
+	__u32	type;
+	__u32	padding;
+	union {
+		struct iommu_fault_unrecoverable event;
+		struct iommu_fault_page_request prm;
+	};
+};
+#endif /* _UAPI_IOMMU_H */
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
