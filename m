Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AA2EF461
	for <lists.iommu@lfdr.de>; Fri,  8 Jan 2021 16:02:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24A8086DD5;
	Fri,  8 Jan 2021 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cahXqKUjDJF0; Fri,  8 Jan 2021 15:02:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CC73886DDA;
	Fri,  8 Jan 2021 15:02:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5E41C013A;
	Fri,  8 Jan 2021 15:02:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5034C0891
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 969462041B
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXhrjL+HO2DS for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 15:02:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by silver.osuosl.org (Postfix) with ESMTPS id 679CF204F6
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g25so6888715wmh.1
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jan 2021 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PV/9lf8J6A+VXh8x4XHBCxczDhhwNotp37UK73tJcbU=;
 b=tqmdQ9KF9CvTMXHbnLGx62iCE1bHtHb6qI3kfDVWSW/pyzZPkgAsNcYzfpOEoH3TNI
 uiSlsMR1eoxchzSo/qdbmiMY86IIfQmmwgj9HemF2ChTGzolkHiYs4YVmObq2Af9FIQg
 buM3BOaqUCrO+24BhPcNqxyM9eW0vzBvV4eAbnm/DXc0HHBW3h8LDF2oDX8JaSWMh9SU
 EuHaoUBTgauEseObtKNbNcrmJNrYWu8fsJGL4rEqfgEaimO8BAFeyINdrJq34bnU2xXV
 +5v92dSE7UJOYuLeOWouYFCq/fUB9Q60dRgfhcPe6ethooPJZPjd9bF2FmCipcDxbaRO
 dUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PV/9lf8J6A+VXh8x4XHBCxczDhhwNotp37UK73tJcbU=;
 b=dWnTZNUSnqPmsV1xc6a8hRDIgG9f4dR9WXLu1bA7tg6ZWBxQi7jBpeXsaiOU88JFjF
 R4HwHFpZ6oVefTH1EruyXz0STAhJCcLNXRvN3562h2xG5Ahhh+OMkEe5ryAmwsd/pnlm
 LZZD5Pr1/nGHkMdER2dL16X+dklOXFPm5mVzikbFgzh1XJFpGHi3pAe/fjxKOaVnRk/T
 bvcbN9cI75eabtxpKGDzPsNLkubGv7nqIecJtPJKkS4Wjhlcht3JgH4xIbu5GqjZdLdS
 rmfKi2DVM1522qYi4Qq6INhNn/uKksteM3KFYvFnNX1qP2jNqP+oU7C/ag5nM6b4fIk3
 QeNw==
X-Gm-Message-State: AOAM531LgJmXQ4SxZJLxkOJ8h198HlEpQL3/3nrYPylz0fzaif8L07fM
 w6gWBhVrgkJpqCVbk0oEVVOFAw==
X-Google-Smtp-Source: ABdhPJz1GA59mz4naOsGZ+mB43oeyBmj10PQ5RTmGu+RPpli2derF6xVfgF4RHyyqZkzLYP2Vf+eOA==
X-Received: by 2002:a1c:e1c6:: with SMTP id y189mr3316457wmg.172.1610118156387; 
 Fri, 08 Jan 2021 07:02:36 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s13sm14258464wra.53.2021.01.08.07.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:02:35 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v9 06/10] iommu: Add a page fault handler
Date: Fri,  8 Jan 2021 15:52:14 +0100
Message-Id: <20210108145217.2254447-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108145217.2254447-1-jean-philippe@linaro.org>
References: <20210108145217.2254447-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, guohanjun@huawei.com,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-accelerators@lists.ozlabs.org, sudeep.holla@arm.com,
 vivek.gautam@arm.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

Some systems allow devices to handle I/O Page Faults in the core mm. For
example systems implementing the PCIe PRI extension or Arm SMMU stall
model. Infrastructure for reporting these recoverable page faults was
added to the IOMMU core by commit 0c830e6b3282 ("iommu: Introduce device
fault report API"). Add a page fault handler for host SVA.

IOMMU driver can now instantiate several fault workqueues and link them
to IOPF-capable devices. Drivers can choose between a single global
workqueue, one per IOMMU device, one per low-level fault queue, one per
domain, etc.

When it receives a fault event, supposedly in an IRQ handler, the IOMMU
driver reports the fault using iommu_report_device_fault(), which calls
the registered handler. The page fault handler then calls the mm fault
handler, and reports either success or failure with iommu_page_response().
When the handler succeeds, the IOMMU retries the access.

The iopf_param pointer could be embedded into iommu_fault_param. But
putting iopf_param into the iommu_param structure allows us not to care
about ordering between calls to iopf_queue_add_device() and
iommu_register_device_fault_handler().

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/Makefile        |   1 +
 drivers/iommu/iommu-sva-lib.h |  53 ++++
 include/linux/iommu.h         |   2 +
 drivers/iommu/io-pgfault.c    | 462 ++++++++++++++++++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 drivers/iommu/io-pgfault.c

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 61bd30cd8369..60fafc23dee6 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
 obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
 obj-$(CONFIG_IOMMU_SVA_LIB) += iommu-sva-lib.o
+obj-$(CONFIG_IOMMU_SVA_LIB) += io-pgfault.o
diff --git a/drivers/iommu/iommu-sva-lib.h b/drivers/iommu/iommu-sva-lib.h
index b40990aef3fd..031155010ca8 100644
--- a/drivers/iommu/iommu-sva-lib.h
+++ b/drivers/iommu/iommu-sva-lib.h
@@ -12,4 +12,57 @@ int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t max);
 void iommu_sva_free_pasid(struct mm_struct *mm);
 struct mm_struct *iommu_sva_find(ioasid_t pasid);
 
+/* I/O Page fault */
+struct device;
+struct iommu_fault;
+struct iopf_queue;
+
+#ifdef CONFIG_IOMMU_SVA_LIB
+int iommu_queue_iopf(struct iommu_fault *fault, void *cookie);
+
+int iopf_queue_add_device(struct iopf_queue *queue, struct device *dev);
+int iopf_queue_remove_device(struct iopf_queue *queue,
+			     struct device *dev);
+int iopf_queue_flush_dev(struct device *dev);
+struct iopf_queue *iopf_queue_alloc(const char *name);
+void iopf_queue_free(struct iopf_queue *queue);
+int iopf_queue_discard_partial(struct iopf_queue *queue);
+
+#else /* CONFIG_IOMMU_SVA_LIB */
+static inline int iommu_queue_iopf(struct iommu_fault *fault, void *cookie)
+{
+	return -ENODEV;
+}
+
+static inline int iopf_queue_add_device(struct iopf_queue *queue,
+					struct device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int iopf_queue_remove_device(struct iopf_queue *queue,
+					   struct device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int iopf_queue_flush_dev(struct device *dev)
+{
+	return -ENODEV;
+}
+
+static inline struct iopf_queue *iopf_queue_alloc(const char *name)
+{
+	return NULL;
+}
+
+static inline void iopf_queue_free(struct iopf_queue *queue)
+{
+}
+
+static inline int iopf_queue_discard_partial(struct iopf_queue *queue)
+{
+	return -ENODEV;
+}
+#endif /* CONFIG_IOMMU_SVA_LIB */
 #endif /* _IOMMU_SVA_LIB_H */
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 701b2eeb0dc5..1c721f472d25 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -366,6 +366,7 @@ struct iommu_fault_param {
  * struct dev_iommu - Collection of per-device IOMMU data
  *
  * @fault_param: IOMMU detected device fault reporting data
+ * @iopf_param:	 I/O Page Fault queue and data
  * @fwspec:	 IOMMU fwspec data
  * @iommu_dev:	 IOMMU device this device is linked to
  * @priv:	 IOMMU Driver private data
@@ -376,6 +377,7 @@ struct iommu_fault_param {
 struct dev_iommu {
 	struct mutex lock;
 	struct iommu_fault_param	*fault_param;
+	struct iopf_device_param	*iopf_param;
 	struct iommu_fwspec		*fwspec;
 	struct iommu_device		*iommu_dev;
 	void				*priv;
diff --git a/drivers/iommu/io-pgfault.c b/drivers/iommu/io-pgfault.c
new file mode 100644
index 000000000000..fc1d5d29ac37
--- /dev/null
+++ b/drivers/iommu/io-pgfault.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Handle device page faults
+ *
+ * Copyright (C) 2020 ARM Ltd.
+ */
+
+#include <linux/iommu.h>
+#include <linux/list.h>
+#include <linux/sched/mm.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "iommu-sva-lib.h"
+
+/**
+ * struct iopf_queue - IO Page Fault queue
+ * @wq: the fault workqueue
+ * @devices: devices attached to this queue
+ * @lock: protects the device list
+ */
+struct iopf_queue {
+	struct workqueue_struct		*wq;
+	struct list_head		devices;
+	struct mutex			lock;
+};
+
+/**
+ * struct iopf_device_param - IO Page Fault data attached to a device
+ * @dev: the device that owns this param
+ * @queue: IOPF queue
+ * @queue_list: index into queue->devices
+ * @partial: faults that are part of a Page Request Group for which the last
+ *           request hasn't been submitted yet.
+ */
+struct iopf_device_param {
+	struct device			*dev;
+	struct iopf_queue		*queue;
+	struct list_head		queue_list;
+	struct list_head		partial;
+};
+
+struct iopf_fault {
+	struct iommu_fault		fault;
+	struct list_head		list;
+};
+
+struct iopf_group {
+	struct iopf_fault		last_fault;
+	struct list_head		faults;
+	struct work_struct		work;
+	struct device			*dev;
+};
+
+static int iopf_complete_group(struct device *dev, struct iopf_fault *iopf,
+			       enum iommu_page_response_code status)
+{
+	struct iommu_page_response resp = {
+		.version		= IOMMU_PAGE_RESP_VERSION_1,
+		.pasid			= iopf->fault.prm.pasid,
+		.grpid			= iopf->fault.prm.grpid,
+		.code			= status,
+	};
+
+	if ((iopf->fault.prm.flags & IOMMU_FAULT_PAGE_REQUEST_PASID_VALID) &&
+	    (iopf->fault.prm.flags & IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID))
+		resp.flags = IOMMU_PAGE_RESP_PASID_VALID;
+
+	return iommu_page_response(dev, &resp);
+}
+
+static enum iommu_page_response_code
+iopf_handle_single(struct iopf_fault *iopf)
+{
+	vm_fault_t ret;
+	struct mm_struct *mm;
+	struct vm_area_struct *vma;
+	unsigned int access_flags = 0;
+	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+	struct iommu_fault_page_request *prm = &iopf->fault.prm;
+	enum iommu_page_response_code status = IOMMU_PAGE_RESP_INVALID;
+
+	if (!(prm->flags & IOMMU_FAULT_PAGE_REQUEST_PASID_VALID))
+		return status;
+
+	mm = iommu_sva_find(prm->pasid);
+	if (IS_ERR_OR_NULL(mm))
+		return status;
+
+	mmap_read_lock(mm);
+
+	vma = find_extend_vma(mm, prm->addr);
+	if (!vma)
+		/* Unmapped area */
+		goto out_put_mm;
+
+	if (prm->perm & IOMMU_FAULT_PERM_READ)
+		access_flags |= VM_READ;
+
+	if (prm->perm & IOMMU_FAULT_PERM_WRITE) {
+		access_flags |= VM_WRITE;
+		fault_flags |= FAULT_FLAG_WRITE;
+	}
+
+	if (prm->perm & IOMMU_FAULT_PERM_EXEC) {
+		access_flags |= VM_EXEC;
+		fault_flags |= FAULT_FLAG_INSTRUCTION;
+	}
+
+	if (!(prm->perm & IOMMU_FAULT_PERM_PRIV))
+		fault_flags |= FAULT_FLAG_USER;
+
+	if (access_flags & ~vma->vm_flags)
+		/* Access fault */
+		goto out_put_mm;
+
+	ret = handle_mm_fault(vma, prm->addr, fault_flags, NULL);
+	status = ret & VM_FAULT_ERROR ? IOMMU_PAGE_RESP_INVALID :
+		IOMMU_PAGE_RESP_SUCCESS;
+
+out_put_mm:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return status;
+}
+
+static void iopf_handle_group(struct work_struct *work)
+{
+	struct iopf_group *group;
+	struct iopf_fault *iopf, *next;
+	enum iommu_page_response_code status = IOMMU_PAGE_RESP_SUCCESS;
+
+	group = container_of(work, struct iopf_group, work);
+
+	list_for_each_entry_safe(iopf, next, &group->faults, list) {
+		/*
+		 * For the moment, errors are sticky: don't handle subsequent
+		 * faults in the group if there is an error.
+		 */
+		if (status == IOMMU_PAGE_RESP_SUCCESS)
+			status = iopf_handle_single(iopf);
+
+		if (!(iopf->fault.prm.flags &
+		      IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE))
+			kfree(iopf);
+	}
+
+	iopf_complete_group(group->dev, &group->last_fault, status);
+	kfree(group);
+}
+
+/**
+ * iommu_queue_iopf - IO Page Fault handler
+ * @fault: fault event
+ * @cookie: struct device, passed to iommu_register_device_fault_handler.
+ *
+ * Add a fault to the device workqueue, to be handled by mm.
+ *
+ * This module doesn't handle PCI PASID Stop Marker; IOMMU drivers must discard
+ * them before reporting faults. A PASID Stop Marker (LRW = 0b100) doesn't
+ * expect a response. It may be generated when disabling a PASID (issuing a
+ * PASID stop request) by some PCI devices.
+ *
+ * The PASID stop request is issued by the device driver before unbind(). Once
+ * it completes, no page request is generated for this PASID anymore and
+ * outstanding ones have been pushed to the IOMMU (as per PCIe 4.0r1.0 - 6.20.1
+ * and 10.4.1.2 - Managing PASID TLP Prefix Usage). Some PCI devices will wait
+ * for all outstanding page requests to come back with a response before
+ * completing the PASID stop request. Others do not wait for page responses, and
+ * instead issue this Stop Marker that tells us when the PASID can be
+ * reallocated.
+ *
+ * It is safe to discard the Stop Marker because it is an optimization.
+ * a. Page requests, which are posted requests, have been flushed to the IOMMU
+ *    when the stop request completes.
+ * b. The IOMMU driver flushes all fault queues on unbind() before freeing the
+ *    PASID.
+ *
+ * So even though the Stop Marker might be issued by the device *after* the stop
+ * request completes, outstanding faults will have been dealt with by the time
+ * the PASID is freed.
+ *
+ * Return: 0 on success and <0 on error.
+ */
+int iommu_queue_iopf(struct iommu_fault *fault, void *cookie)
+{
+	int ret;
+	struct iopf_group *group;
+	struct iopf_fault *iopf, *next;
+	struct iopf_device_param *iopf_param;
+
+	struct device *dev = cookie;
+	struct dev_iommu *param = dev->iommu;
+
+	lockdep_assert_held(&param->lock);
+
+	if (fault->type != IOMMU_FAULT_PAGE_REQ)
+		/* Not a recoverable page fault */
+		return -EOPNOTSUPP;
+
+	/*
+	 * As long as we're holding param->lock, the queue can't be unlinked
+	 * from the device and therefore cannot disappear.
+	 */
+	iopf_param = param->iopf_param;
+	if (!iopf_param)
+		return -ENODEV;
+
+	if (!(fault->prm.flags & IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE)) {
+		iopf = kzalloc(sizeof(*iopf), GFP_KERNEL);
+		if (!iopf)
+			return -ENOMEM;
+
+		iopf->fault = *fault;
+
+		/* Non-last request of a group. Postpone until the last one */
+		list_add(&iopf->list, &iopf_param->partial);
+
+		return 0;
+	}
+
+	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	if (!group) {
+		/*
+		 * The caller will send a response to the hardware. But we do
+		 * need to clean up before leaving, otherwise partial faults
+		 * will be stuck.
+		 */
+		ret = -ENOMEM;
+		goto cleanup_partial;
+	}
+
+	group->dev = dev;
+	group->last_fault.fault = *fault;
+	INIT_LIST_HEAD(&group->faults);
+	list_add(&group->last_fault.list, &group->faults);
+	INIT_WORK(&group->work, iopf_handle_group);
+
+	/* See if we have partial faults for this group */
+	list_for_each_entry_safe(iopf, next, &iopf_param->partial, list) {
+		if (iopf->fault.prm.grpid == fault->prm.grpid)
+			/* Insert *before* the last fault */
+			list_move(&iopf->list, &group->faults);
+	}
+
+	queue_work(iopf_param->queue->wq, &group->work);
+	return 0;
+
+cleanup_partial:
+	list_for_each_entry_safe(iopf, next, &iopf_param->partial, list) {
+		if (iopf->fault.prm.grpid == fault->prm.grpid) {
+			list_del(&iopf->list);
+			kfree(iopf);
+		}
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_queue_iopf);
+
+/**
+ * iopf_queue_flush_dev - Ensure that all queued faults have been processed
+ * @dev: the endpoint whose faults need to be flushed.
+ *
+ * The IOMMU driver calls this before releasing a PASID, to ensure that all
+ * pending faults for this PASID have been handled, and won't hit the address
+ * space of the next process that uses this PASID. The driver must make sure
+ * that no new fault is added to the queue. In particular it must flush its
+ * low-level queue before calling this function.
+ *
+ * Return: 0 on success and <0 on error.
+ */
+int iopf_queue_flush_dev(struct device *dev)
+{
+	int ret = 0;
+	struct iopf_device_param *iopf_param;
+	struct dev_iommu *param = dev->iommu;
+
+	if (!param)
+		return -ENODEV;
+
+	mutex_lock(&param->lock);
+	iopf_param = param->iopf_param;
+	if (iopf_param)
+		flush_workqueue(iopf_param->queue->wq);
+	else
+		ret = -ENODEV;
+	mutex_unlock(&param->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iopf_queue_flush_dev);
+
+/**
+ * iopf_queue_discard_partial - Remove all pending partial fault
+ * @queue: the queue whose partial faults need to be discarded
+ *
+ * When the hardware queue overflows, last page faults in a group may have been
+ * lost and the IOMMU driver calls this to discard all partial faults. The
+ * driver shouldn't be adding new faults to this queue concurrently.
+ *
+ * Return: 0 on success and <0 on error.
+ */
+int iopf_queue_discard_partial(struct iopf_queue *queue)
+{
+	struct iopf_fault *iopf, *next;
+	struct iopf_device_param *iopf_param;
+
+	if (!queue)
+		return -EINVAL;
+
+	mutex_lock(&queue->lock);
+	list_for_each_entry(iopf_param, &queue->devices, queue_list) {
+		list_for_each_entry_safe(iopf, next, &iopf_param->partial,
+					 list) {
+			list_del(&iopf->list);
+			kfree(iopf);
+		}
+	}
+	mutex_unlock(&queue->lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(iopf_queue_discard_partial);
+
+/**
+ * iopf_queue_add_device - Add producer to the fault queue
+ * @queue: IOPF queue
+ * @dev: device to add
+ *
+ * Return: 0 on success and <0 on error.
+ */
+int iopf_queue_add_device(struct iopf_queue *queue, struct device *dev)
+{
+	int ret = -EBUSY;
+	struct iopf_device_param *iopf_param;
+	struct dev_iommu *param = dev->iommu;
+
+	if (!param)
+		return -ENODEV;
+
+	iopf_param = kzalloc(sizeof(*iopf_param), GFP_KERNEL);
+	if (!iopf_param)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&iopf_param->partial);
+	iopf_param->queue = queue;
+	iopf_param->dev = dev;
+
+	mutex_lock(&queue->lock);
+	mutex_lock(&param->lock);
+	if (!param->iopf_param) {
+		list_add(&iopf_param->queue_list, &queue->devices);
+		param->iopf_param = iopf_param;
+		ret = 0;
+	}
+	mutex_unlock(&param->lock);
+	mutex_unlock(&queue->lock);
+
+	if (ret)
+		kfree(iopf_param);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iopf_queue_add_device);
+
+/**
+ * iopf_queue_remove_device - Remove producer from fault queue
+ * @queue: IOPF queue
+ * @dev: device to remove
+ *
+ * Caller makes sure that no more faults are reported for this device.
+ *
+ * Return: 0 on success and <0 on error.
+ */
+int iopf_queue_remove_device(struct iopf_queue *queue, struct device *dev)
+{
+	int ret = 0;
+	struct iopf_fault *iopf, *next;
+	struct iopf_device_param *iopf_param;
+	struct dev_iommu *param = dev->iommu;
+
+	if (!param || !queue)
+		return -EINVAL;
+
+	mutex_lock(&queue->lock);
+	mutex_lock(&param->lock);
+	iopf_param = param->iopf_param;
+	if (iopf_param && iopf_param->queue == queue) {
+		list_del(&iopf_param->queue_list);
+		param->iopf_param = NULL;
+	} else {
+		ret = -EINVAL;
+	}
+	mutex_unlock(&param->lock);
+	mutex_unlock(&queue->lock);
+	if (ret)
+		return ret;
+
+	/* Just in case some faults are still stuck */
+	list_for_each_entry_safe(iopf, next, &iopf_param->partial, list)
+		kfree(iopf);
+
+	kfree(iopf_param);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(iopf_queue_remove_device);
+
+/**
+ * iopf_queue_alloc - Allocate and initialize a fault queue
+ * @name: a unique string identifying the queue (for workqueue)
+ *
+ * Return: the queue on success and NULL on error.
+ */
+struct iopf_queue *iopf_queue_alloc(const char *name)
+{
+	struct iopf_queue *queue;
+
+	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	if (!queue)
+		return NULL;
+
+	/*
+	 * The WQ is unordered because the low-level handler enqueues faults by
+	 * group. PRI requests within a group have to be ordered, but once
+	 * that's dealt with, the high-level function can handle groups out of
+	 * order.
+	 */
+	queue->wq = alloc_workqueue("iopf_queue/%s", WQ_UNBOUND, 0, name);
+	if (!queue->wq) {
+		kfree(queue);
+		return NULL;
+	}
+
+	INIT_LIST_HEAD(&queue->devices);
+	mutex_init(&queue->lock);
+
+	return queue;
+}
+EXPORT_SYMBOL_GPL(iopf_queue_alloc);
+
+/**
+ * iopf_queue_free - Free IOPF queue
+ * @queue: queue to free
+ *
+ * Counterpart to iopf_queue_alloc(). The driver must not be queuing faults or
+ * adding/removing devices on this queue anymore.
+ */
+void iopf_queue_free(struct iopf_queue *queue)
+{
+	struct iopf_device_param *iopf_param, *next;
+
+	if (!queue)
+		return;
+
+	list_for_each_entry_safe(iopf_param, next, &queue->devices, queue_list)
+		iopf_queue_remove_device(queue, iopf_param->dev);
+
+	destroy_workqueue(queue->wq);
+	kfree(queue);
+}
+EXPORT_SYMBOL_GPL(iopf_queue_free);
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
