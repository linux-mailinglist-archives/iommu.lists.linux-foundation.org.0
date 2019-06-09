Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7103A619
	for <lists.iommu@lfdr.de>; Sun,  9 Jun 2019 15:42:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8943ACC6;
	Sun,  9 Jun 2019 13:41:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5542DCA1
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 13:41:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E6CFB7C3
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 13:41:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2019 06:41:18 -0700
X-ExtLoop1: 1
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2019 06:41:18 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Eric Auger <eric.auger@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH v4 12/22] iommu: Add I/O ASID allocator
Date: Sun,  9 Jun 2019 06:44:12 -0700
Message-Id: <1560087862-57608-13-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1560087862-57608-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
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

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Some devices might support multiple DMA address spaces, in particular
those that have the PCI PASID feature. PASID (Process Address Space ID)
allows to share process address spaces with devices (SVA), partition a
device into VM-assignable entities (VFIO mdev) or simply provide
multiple DMA address space to kernel drivers. Add a global PASID
allocator usable by different drivers at the same time. Name it I/O ASID
to avoid confusion with ASIDs allocated by arch code, which are usually
a separate ID space.

The IOASID space is global. Each device can have its own PASID space,
but by convention the IOMMU ended up having a global PASID space, so
that with SVA, each mm_struct is associated to a single PASID.

The allocator is primarily used by IOMMU subsystem but in rare occasions
drivers would like to allocate PASIDs for devices that aren't managed by
an IOMMU, using the same ID space as IOMMU.

There are two types of allocators:
1. default allocator - Always available, uses an XArray to track
2. custom allocators - Can be registered at runtime, take precedence
over the default allocator.

Custom allocators have these attributes:
- provides platform specific alloc()/free() functions with private data.
- allocation results lookup are not provided by the allocator, lookup
  request must be done by the IOASID framework by its own XArray.
- allocators can be unregistered at runtime, either fallback to the next
  custom allocator or to the default allocator.
- custom allocators can share the same set of alloc()/free() helpers, in
  this case they also share the same IOASID space, thus the same XArray.
- switching between allocators requires all outstanding IOASIDs to be
  freed unless the two allocators share the same alloc()/free() helpers.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Link: https://lkml.org/lkml/2019/4/26/462
---
 drivers/iommu/Kconfig  |   8 +
 drivers/iommu/Makefile |   1 +
 drivers/iommu/ioasid.c | 427 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/ioasid.h |  74 +++++++++
 4 files changed, 510 insertions(+)
 create mode 100644 drivers/iommu/ioasid.c
 create mode 100644 include/linux/ioasid.h

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 83664db..c40c4b5 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -3,6 +3,13 @@
 config IOMMU_IOVA
 	tristate
 
+# The IOASID allocator may also be used by non-IOMMU_API users
+config IOASID
+	tristate
+	help
+	  Enable the I/O Address Space ID allocator. A single ID space shared
+	  between different users.
+
 # IOMMU_API always gets selected by whoever wants it.
 config IOMMU_API
 	bool
@@ -207,6 +214,7 @@ config INTEL_IOMMU_SVM
 	depends on INTEL_IOMMU && X86
 	select PCI_PASID
 	select MMU_NOTIFIER
+	select IOASID
 	help
 	  Shared Virtual Memory (SVM) provides a facility for devices
 	  to access DMA resources through process address space by
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 8c71a15..0efac6f 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_IOMMU_DMA) += dma-iommu.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE) += io-pgtable.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) += io-pgtable-arm-v7s.o
 obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
+obj-$(CONFIG_IOASID) += ioasid.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
 obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
new file mode 100644
index 0000000..0919b70
--- /dev/null
+++ b/drivers/iommu/ioasid.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I/O Address Space ID allocator. There is one global IOASID space, split into
+ * subsets. Users create a subset with DECLARE_IOASID_SET, then allocate and
+ * free IOASIDs with ioasid_alloc and ioasid_free.
+ */
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/xarray.h>
+#include <linux/ioasid.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+struct ioasid_data {
+	ioasid_t id;
+	struct ioasid_set *set;
+	void *private;
+	struct rcu_head rcu;
+};
+
+/*
+ * struct ioasid_allocator_data - Internal data structure to hold information
+ * about an allocator. There are two types of allocators:
+ *
+ * - Default allocator always has its own XArray to track the IOASIDs allocated.
+ * - Custom allocators may share allocation helpers with different private data.
+ *   Custom allocators share the same helper functions also share the same
+ *   XArray.
+ * Rules:
+ * 1. Default allocator is always available, not dynamically registered. This is
+ *    to prevent race conditions with early boot code that want to register
+ *    custom allocators or allocate IOASIDs.
+ * 2. Custom allocators take precedence over the default allocator.
+ * 3. When all custom allocators sharing the same helper functions are
+ *    unregistered (e.g. due to hotplug), all outstanding IOASIDs must be
+ *    freed.
+ * 4. When switching between custom allocators sharing the same helper
+ *    functions, outstanding IOASIDs are preserved.
+ * 5. When switching between custom allocator and default allocator, all IOASIDs
+ *    must be freed to ensure unadulterated space for the new allocator.
+ *
+ * @ops:	allocator helper functions and its data
+ * @list:	registered custom allocators
+ * @slist:	allocators share the same ops but different data
+ * @flags:	attributes of the allocator
+ * @users	number of allocators sharing the same ops and XArray
+ * @xa		xarray holds the IOASID space
+ */
+struct ioasid_allocator_data {
+	struct ioasid_allocator_ops *ops;
+	struct list_head list;
+	struct list_head slist;
+#define IOASID_ALLOCATOR_CUSTOM BIT(0) /* Needs framework to track results */
+	unsigned long flags;
+	struct xarray xa;
+	refcount_t users;
+};
+
+static DEFINE_MUTEX(ioasid_allocator_lock);
+static LIST_HEAD(allocators_list);
+static ioasid_t default_alloc(ioasid_t min, ioasid_t max, void *opaque);
+static void default_free(ioasid_t ioasid, void *opaque);
+
+static struct ioasid_allocator_ops default_ops = {
+	.alloc = default_alloc,
+	.free = default_free
+};
+
+static struct ioasid_allocator_data default_allocator = {
+	.ops = &default_ops,
+	.flags = 0,
+	.xa = XARRAY_INIT(ioasid_xa, XA_FLAGS_ALLOC)
+};
+
+static struct ioasid_allocator_data *active_allocator = &default_allocator;
+
+static ioasid_t default_alloc(ioasid_t min, ioasid_t max, void *opaque)
+{
+	ioasid_t id;
+
+	if (xa_alloc(&default_allocator.xa, &id, opaque, XA_LIMIT(min, max), GFP_KERNEL)) {
+		pr_err("Failed to alloc ioasid from %d to %d\n", min, max);
+		return INVALID_IOASID;
+	}
+
+	return id;
+}
+
+void default_free(ioasid_t ioasid, void *opaque)
+{
+	struct ioasid_data *ioasid_data;
+
+	ioasid_data = xa_erase(&default_allocator.xa, ioasid);
+	kfree_rcu(ioasid_data, rcu);
+}
+
+/* Allocate and initialize a new custom allocator with its helper functions */
+static inline struct ioasid_allocator_data *ioasid_alloc_allocator(struct ioasid_allocator_ops *ops)
+{
+	struct ioasid_allocator_data *ia_data;
+
+	ia_data = kzalloc(sizeof(*ia_data), GFP_KERNEL);
+	if (!ia_data)
+		return NULL;
+
+	xa_init_flags(&ia_data->xa, XA_FLAGS_ALLOC);
+	INIT_LIST_HEAD(&ia_data->slist);
+	ia_data->flags |= IOASID_ALLOCATOR_CUSTOM;
+	ia_data->ops = ops;
+
+	/* For tracking custom allocators that share the same ops */
+	list_add_tail(&ops->list, &ia_data->slist);
+	refcount_set(&ia_data->users, 1);
+
+	return ia_data;
+}
+
+static inline bool use_same_ops(struct ioasid_allocator_ops *a, struct ioasid_allocator_ops *b)
+{
+	return (a->free == b->free) && (a->alloc == b->alloc);
+}
+
+/**
+ * ioasid_register_allocator - register a custom allocator
+ * @ops: the custom allocator ops to be registered
+ *
+ * Custom allocators take precedence over the default xarray based allocator.
+ * Private data associated with the IOASID allocated by the custom allocators
+ * are managed by IOASID framework similar to data stored in xa by default
+ * allocator.
+ *
+ * There can be multiple allocators registered but only one is active. In case
+ * of runtime removal of a custom allocator, the next one is activated based
+ * on the registration ordering.
+ *
+ * Multiple allocators can share the same alloc() function, in this case the
+ * IOASID space is shared.
+ *
+ */
+int ioasid_register_allocator(struct ioasid_allocator_ops *ops)
+{
+	struct ioasid_allocator_data *ia_data;
+	struct ioasid_allocator_data *pallocator;
+	int ret = 0;
+
+	mutex_lock(&ioasid_allocator_lock);
+
+	ia_data = ioasid_alloc_allocator(ops);
+	if (!ia_data) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
+
+	/*
+	 * No particular preference, we activate the first one and keep
+	 * the later registered allocators in a list in case the first one gets
+	 * removed due to hotplug.
+	 */
+	if (list_empty(&allocators_list)) {
+		WARN_ON(active_allocator != &default_allocator);
+		/* Use this new allocator if default is not active */
+		if (xa_empty(&active_allocator->xa)) {
+			active_allocator = ia_data;
+			list_add_tail(&ia_data->list, &allocators_list);
+			goto out_unlock;
+		}
+		pr_warn("Default allocator active with outstanding IOASID\n");
+		ret = -EAGAIN;
+		goto out_free;
+	}
+
+	/* Check if the allocator is already registered */
+	list_for_each_entry(pallocator, &allocators_list, list) {
+		if (pallocator->ops == ops) {
+			pr_err("IOASID allocator already registered\n");
+			ret = -EEXIST;
+			goto out_free;
+		} else if (use_same_ops(pallocator->ops, ops)) {
+			/*
+			 * If the new allocator shares the same ops,
+			 * then they will share the same IOASID space.
+			 * We should put them under the same xarray.
+			 */
+			list_add_tail(&ops->list, &pallocator->slist);
+			refcount_inc(&pallocator->users);
+			pr_info("New IOASID allocator ops shared %u times\n",
+				refcount_read(&pallocator->users));
+			goto out_free;
+		}
+	}
+	list_add_tail(&ia_data->list, &allocators_list);
+
+	goto out_unlock;
+
+out_free:
+	kfree(ia_data);
+out_unlock:
+	mutex_unlock(&ioasid_allocator_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ioasid_register_allocator);
+
+static inline bool has_shared_ops(struct ioasid_allocator_data *allocator)
+{
+	return refcount_read(&allocator->users) > 1;
+}
+
+/**
+ * ioasid_unregister_allocator - Remove a custom IOASID allocator ops
+ * @ops: the custom allocator to be removed
+ *
+ * Remove an allocator from the list, activate the next allocator in
+ * the order it was registered. Or revert to default allocator if all
+ * custom allocators are unregistered without outstanding IOASIDs.
+ */
+void ioasid_unregister_allocator(struct ioasid_allocator_ops *ops)
+{
+	struct ioasid_allocator_data *pallocator;
+	struct ioasid_allocator_ops *sops;
+
+	mutex_lock(&ioasid_allocator_lock);
+	if (list_empty(&allocators_list)) {
+		pr_warn("No custom IOASID allocators active!\n");
+		goto exit_unlock;
+	}
+
+	list_for_each_entry(pallocator, &allocators_list, list) {
+		if (use_same_ops(pallocator->ops, ops)) {
+			if (refcount_read(&pallocator->users) == 1) {
+				/* No shared helper functions */
+				list_del(&pallocator->list);
+				/*
+				 * All IOASIDs should have been freed before
+				 * the last allocator that shares the same ops
+				 * is unregistered.
+				 */
+				WARN_ON(!xa_empty(&pallocator->xa));
+				kfree(pallocator);
+				if (list_empty(&allocators_list)) {
+					pr_info("No custom IOASID allocators, switch to default.\n");
+					active_allocator = &default_allocator;
+				} else if (pallocator == active_allocator) {
+					active_allocator = list_entry(&allocators_list, struct ioasid_allocator_data, list);
+					pr_info("IOASID allocator changed");
+				}
+				break;
+			}
+			/*
+			 * Find the matching shared ops to delete,
+			 * but keep outstanding IOASIDs
+			 */
+			list_for_each_entry(sops, &pallocator->slist, list) {
+				if (sops == ops) {
+					list_del(&ops->list);
+					if (refcount_dec_and_test(&pallocator->users))
+						pr_err("no shared ops\n");
+					break;
+				}
+			}
+			break;
+		}
+	}
+
+exit_unlock:
+	mutex_unlock(&ioasid_allocator_lock);
+}
+EXPORT_SYMBOL_GPL(ioasid_unregister_allocator);
+
+/**
+ * ioasid_set_data - Set private data for an allocated ioasid
+ * @ioasid: the ID to set data
+ * @data:   the private data
+ *
+ * For IOASID that is already allocated, private data can be set
+ * via this API. Future lookup can be done via ioasid_find.
+ */
+int ioasid_set_data(ioasid_t ioasid, void *data)
+{
+	struct ioasid_data *ioasid_data;
+	int ret = 0;
+
+	mutex_lock(&ioasid_allocator_lock);
+	ioasid_data = xa_load(&active_allocator->xa, ioasid);
+	if (ioasid_data)
+		ioasid_data->private = data;
+	else
+		ret = -ENOENT;
+	mutex_unlock(&ioasid_allocator_lock);
+
+	/* getter may use the private data */
+	synchronize_rcu();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ioasid_set_data);
+
+/**
+ * ioasid_alloc - Allocate an IOASID
+ * @set: the IOASID set
+ * @min: the minimum ID (inclusive)
+ * @max: the maximum ID (inclusive)
+ * @private: data private to the caller
+ *
+ * Allocate an ID between @min and @max. Return the allocated ID on success,
+ * or INVALID_IOASID on failure. The @private pointer is stored internally
+ * and can be retrieved with ioasid_find().
+ */
+ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
+		      void *private)
+{
+	ioasid_t id = INVALID_IOASID;
+	struct ioasid_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return INVALID_IOASID;
+
+	data->set = set;
+	data->private = private;
+
+	mutex_lock(&ioasid_allocator_lock);
+
+	id = active_allocator->ops->alloc(min, max, data);
+	if (id == INVALID_IOASID) {
+		pr_err("Failed ASID allocation %lu\n", active_allocator->flags);
+			mutex_unlock(&ioasid_allocator_lock);
+			goto exit_free;
+	}
+	if (active_allocator->flags & IOASID_ALLOCATOR_CUSTOM) {
+		/* Custom allocator needs framework to store and track allocation results */
+		min = id;
+		max = id + 1;
+
+		if (xa_alloc(&active_allocator->xa, &id, data, XA_LIMIT(min, max), GFP_KERNEL)) {
+			pr_err("Failed to alloc ioasid from %d to %d\n", min, max);
+			active_allocator->ops->free(id, NULL);
+			goto exit_free;
+		}
+	}
+	data->id = id;
+
+	mutex_unlock(&ioasid_allocator_lock);
+
+exit_free:
+	if (id == INVALID_IOASID) {
+		kfree(data);
+		return INVALID_IOASID;
+	}
+	return id;
+}
+EXPORT_SYMBOL_GPL(ioasid_alloc);
+
+/**
+ * ioasid_free - Free an IOASID
+ * @ioasid: the ID to remove
+ */
+void ioasid_free(ioasid_t ioasid)
+{
+	struct ioasid_data *ioasid_data;
+
+	mutex_lock(&ioasid_allocator_lock);
+
+	ioasid_data = xa_load(&active_allocator->xa, ioasid);
+	if (!ioasid_data) {
+		pr_err("Trying to free unknown IOASID %u\n", ioasid);
+		goto exit_unlock;
+	}
+
+	active_allocator->ops->free(ioasid, active_allocator->ops->pdata);
+	/* Custom allocator needs additional steps to free the xa */
+	if (active_allocator->flags & IOASID_ALLOCATOR_CUSTOM) {
+		ioasid_data = xa_erase(&active_allocator->xa, ioasid);
+		kfree_rcu(ioasid_data, rcu);
+	}
+
+exit_unlock:
+	mutex_unlock(&ioasid_allocator_lock);
+}
+EXPORT_SYMBOL_GPL(ioasid_free);
+
+/**
+ * ioasid_find - Find IOASID data
+ * @set: the IOASID set
+ * @ioasid: the IOASID to find
+ * @getter: function to call on the found object
+ *
+ * The optional getter function allows to take a reference to the found object
+ * under the rcu lock. The function can also check if the object is still valid:
+ * if @getter returns false, then the object is invalid and NULL is returned.
+ *
+ * If the IOASID has been allocated for this set, return the private pointer
+ * passed to ioasid_alloc. Private data can be NULL if not set. Return an error
+ * if the IOASID is not found or does not belong to the set.
+ */
+void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
+		  bool (*getter)(void *))
+{
+	void *priv = NULL;
+	struct ioasid_data *ioasid_data;
+
+	rcu_read_lock();
+	ioasid_data = xa_load(&active_allocator->xa, ioasid);
+	if (!ioasid_data) {
+		priv = ERR_PTR(-ENOENT);
+		goto unlock;
+	}
+	if (set && ioasid_data->set != set) {
+		/* data found but does not belong to the set */
+		priv = ERR_PTR(-EACCES);
+		goto unlock;
+	}
+	/* Now IOASID and its set is verified, we can return the private data */
+	priv = ioasid_data->private;
+	if (getter && !getter(priv))
+		priv = NULL;
+unlock:
+	rcu_read_unlock();
+
+	return priv;
+}
+EXPORT_SYMBOL_GPL(ioasid_find);
+
+MODULE_AUTHOR("Jean-Philippe Brucker <jean-philippe.brucker@arm.com>");
+MODULE_AUTHOR("Jacob Pan <jacob.jun.pan@linux.intel.com>");
+MODULE_DESCRIPTION("IO Address Space ID (IOASID) allocator");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
new file mode 100644
index 0000000..8c8d1c5
--- /dev/null
+++ b/include/linux/ioasid.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_IOASID_H
+#define __LINUX_IOASID_H
+
+#define INVALID_IOASID ((ioasid_t)-1)
+typedef unsigned int ioasid_t;
+typedef ioasid_t (*ioasid_alloc_fn_t)(ioasid_t min, ioasid_t max, void *data);
+typedef void (*ioasid_free_fn_t)(ioasid_t ioasid, void *data);
+
+struct ioasid_set {
+	int dummy;
+};
+
+/**
+ * struct ioasid_allocator_ops - IOASID allocator helper functions and data
+ *
+ * @alloc:	helper function to allocate IOASID
+ * @free:	helper function to free IOASID
+ * @list:	for tracking ops that share helper functions but not data
+ * @pdata:	data belong to the allocator, provided when calling alloc()
+ */
+struct ioasid_allocator_ops {
+	ioasid_alloc_fn_t alloc;
+	ioasid_free_fn_t free;
+	struct list_head list;
+	void *pdata;
+};
+
+#define DECLARE_IOASID_SET(name) struct ioasid_set name = { 0 }
+
+#if IS_ENABLED(CONFIG_IOASID)
+ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
+		      void *private);
+void ioasid_free(ioasid_t ioasid);
+
+void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
+			bool (*getter)(void *));
+int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
+void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
+int ioasid_set_data(ioasid_t ioasid, void *data);
+
+#else /* !CONFIG_IOASID */
+static inline ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min,
+				    ioasid_t max, void *private)
+{
+	return INVALID_IOASID;
+}
+
+static inline void ioasid_free(ioasid_t ioasid)
+{
+}
+
+static inline void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
+				bool (*getter)(void *))
+{
+	return NULL;
+}
+
+static inline int ioasid_register_allocator(struct ioasid_allocator_ops *allocator)
+{
+	return -ENODEV;
+}
+
+static inline void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator)
+{
+}
+
+static inline int ioasid_set_data(ioasid_t ioasid, void *data)
+{
+	return -ENODEV;
+}
+
+#endif /* CONFIG_IOASID */
+#endif /* __LINUX_IOASID_H */
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
