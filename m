Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5D19DE08
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 20:36:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD6A0891EE;
	Fri,  3 Apr 2020 18:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLv+dnfw33nX; Fri,  3 Apr 2020 18:36:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB59288E41;
	Fri,  3 Apr 2020 18:36:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8E75C07FF;
	Fri,  3 Apr 2020 18:36:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 298BAC07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 17BA887DB8
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OANFJ74WieYB for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 18:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C0B68880DD
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 18:36:29 +0000 (UTC)
IronPort-SDR: agbXDnrvy9A/CF866pvVMVDoAdTws/IOm7oyGPSG3IFxj+cnpHC+uaWQe1GT8BwdqyMwHGrlEX
 FZNdWeQt2j0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 11:36:27 -0700
IronPort-SDR: 6me2BI9N5B8GJNyKec8lWaXDk8bYpxbNfWNYScucFBFkEQ3oouF6ciV4I9lEmKn7nSlBeGXqS9
 vNjGxhiqhAhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,340,1580803200"; d="scan'208";a="268439821"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 11:36:27 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v11 05/10] iommu/vt-d: Add bind guest PASID support
Date: Fri,  3 Apr 2020 11:42:09 -0700
Message-Id: <1585939334-21396-6-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: Yi L <yi.l.liu@linux.intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Liu@osuosl.org, Jonathan Cameron <jic23@kernel.org>
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

When supporting guest SVA with emulated IOMMU, the guest PASID
table is shadowed in VMM. Updates to guest vIOMMU PASID table
will result in PASID cache flush which will be passed down to
the host as bind guest PASID calls.

For the SL page tables, it will be harvested from device's
default domain (request w/o PASID), or aux domain in case of
mediated device.

    .-------------.  .---------------------------.
    |   vIOMMU    |  | Guest process CR3, FL only|
    |             |  '---------------------------'
    .----------------/
    | PASID Entry |--- PASID cache flush -
    '-------------'                       |
    |             |                       V
    |             |                CR3 in GPA
    '-------------'
Guest
------| Shadow |--------------------------|--------
      v        v                          v
Host
    .-------------.  .----------------------.
    |   pIOMMU    |  | Bind FL for GVA-GPA  |
    |             |  '----------------------'
    .----------------/  |
    | PASID Entry |     V (Nested xlate)
    '----------------\.------------------------------.
    |             |   |SL for GPA-HPA, default domain|
    |             |   '------------------------------'
    '-------------'
Where:
 - FL = First level/stage one page tables
 - SL = Second level/stage two page tables

---
v11: Fixed locking, avoid duplicated paging mode check, added helper to
free svm if device list is empty. Use rate limited error message since
the bind gpasid call comes from user space.
---

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Liu, Yi L <yi.l.liu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c |   4 +
 drivers/iommu/intel-svm.c   | 206 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/intel-iommu.h |   8 +-
 include/linux/intel-svm.h   |  17 ++++
 4 files changed, 234 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index c0dadec5a6b3..94c7993dac6a 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -6178,6 +6178,10 @@ const struct iommu_ops intel_iommu_ops = {
 	.dev_disable_feat	= intel_iommu_dev_disable_feat,
 	.is_attach_deferred	= intel_iommu_is_attach_deferred,
 	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
+#ifdef CONFIG_INTEL_IOMMU_SVM
+	.sva_bind_gpasid	= intel_svm_bind_gpasid,
+	.sva_unbind_gpasid	= intel_svm_unbind_gpasid,
+#endif
 };
 
 static void quirk_iommu_igfx(struct pci_dev *dev)
diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index d7f2a5358900..7cf711318b87 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -226,6 +226,212 @@ static LIST_HEAD(global_svm_list);
 	list_for_each_entry((sdev), &(svm)->devs, list)	\
 		if ((d) != (sdev)->dev) {} else
 
+
+static inline void intel_svm_free_if_empty(struct intel_svm *svm, u64 pasid)
+{
+	if (list_empty(&svm->devs)) {
+		ioasid_set_data(pasid, NULL);
+		kfree(svm);
+	}
+}
+
+int intel_svm_bind_gpasid(struct iommu_domain *domain,
+			struct device *dev,
+			struct iommu_gpasid_bind_data *data)
+{
+	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
+	struct dmar_domain *dmar_domain;
+	struct intel_svm_dev *sdev;
+	struct intel_svm *svm;
+	int ret = 0;
+
+	if (WARN_ON(!iommu) || !data)
+		return -EINVAL;
+
+	if (data->version != IOMMU_GPASID_BIND_VERSION_1 ||
+	    data->format != IOMMU_PASID_FORMAT_INTEL_VTD)
+		return -EINVAL;
+
+	if (dev_is_pci(dev)) {
+		/* VT-d supports devices with full 20 bit PASIDs only */
+		if (pci_max_pasids(to_pci_dev(dev)) != PASID_MAX)
+			return -EINVAL;
+	} else {
+		return -ENOTSUPP;
+	}
+
+	/*
+	 * We only check host PASID range, we have no knowledge to check
+	 * guest PASID range.
+	 */
+	if (data->hpasid <= 0 || data->hpasid >= PASID_MAX)
+		return -EINVAL;
+
+	dmar_domain = to_dmar_domain(domain);
+
+	mutex_lock(&pasid_mutex);
+	svm = ioasid_find(NULL, data->hpasid, NULL);
+	if (IS_ERR(svm)) {
+		ret = PTR_ERR(svm);
+		goto out;
+	}
+
+	if (svm) {
+		/*
+		 * If we found svm for the PASID, there must be at
+		 * least one device bond, otherwise svm should be freed.
+		 */
+		if (WARN_ON(list_empty(&svm->devs))) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		for_each_svm_dev(sdev, svm, dev) {
+			/* In case of multiple sub-devices of the same pdev
+			 * assigned, we should allow multiple bind calls with
+			 * the same PASID and pdev.
+			 */
+			sdev->users++;
+			goto out;
+		}
+	} else {
+		/* We come here when PASID has never been bond to a device. */
+		svm = kzalloc(sizeof(*svm), GFP_KERNEL);
+		if (!svm) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		/* REVISIT: upper layer/VFIO can track host process that bind the PASID.
+		 * ioasid_set = mm might be sufficient for vfio to check pasid VMM
+		 * ownership. We can drop the following line once VFIO and IOASID set
+		 * check is in place.
+		 */
+		svm->mm = get_task_mm(current);
+		svm->pasid = data->hpasid;
+		if (data->flags & IOMMU_SVA_GPASID_VAL) {
+			svm->gpasid = data->gpasid;
+			svm->flags |= SVM_FLAG_GUEST_PASID;
+		}
+		ioasid_set_data(data->hpasid, svm);
+		INIT_LIST_HEAD_RCU(&svm->devs);
+		mmput(svm->mm);
+	}
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev) {
+		/*
+		 * If this is a new PASID that never bond to a device, then
+		 * the device list must be empty which indicates struct svm
+		 * was allocated in this function.
+		 */
+		intel_svm_free_if_empty(svm, data->hpasid);
+		ret = -ENOMEM;
+		goto out;
+	}
+	sdev->dev = dev;
+	sdev->users = 1;
+
+	/* Set up device context entry for PASID if not enabled already */
+	ret = intel_iommu_enable_pasid(iommu, sdev->dev);
+	if (ret) {
+		dev_err_ratelimited(dev, "Failed to enable PASID capability\n");
+		kfree(sdev);
+		intel_svm_free_if_empty(svm, data->hpasid);
+		goto out;
+	}
+
+	/*
+	 * PASID table is per device for better security. Therefore, for
+	 * each bind of a new device even with an existing PASID, we need to
+	 * call the nested mode setup function here.
+	 */
+	spin_lock(&iommu->lock);
+	ret = intel_pasid_setup_nested(iommu,
+				       dev,
+				       (pgd_t *)data->gpgd,
+				       data->hpasid,
+				       &data->vtd,
+				       dmar_domain,
+				       data->addr_width);
+	if (ret) {
+		dev_err_ratelimited(dev, "Failed to set up PASID %llu in nested mode, Err %d\n",
+			data->hpasid, ret);
+		/*
+		 * PASID entry should be in cleared state if nested mode
+		 * set up failed. So we only need to clear IOASID tracking
+		 * data such that free call will succeed.
+		 */
+		kfree(sdev);
+		intel_svm_free_if_empty(svm, data->hpasid);
+		spin_unlock(&iommu->lock);
+		goto out;
+	}
+	spin_unlock(&iommu->lock);
+	svm->flags |= SVM_FLAG_GUEST_MODE;
+
+	init_rcu_head(&sdev->rcu);
+	list_add_rcu(&sdev->list, &svm->devs);
+ out:
+	mutex_unlock(&pasid_mutex);
+	return ret;
+}
+
+int intel_svm_unbind_gpasid(struct device *dev, int pasid)
+{
+	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
+	struct intel_svm_dev *sdev;
+	struct intel_svm *svm;
+	int ret = -EINVAL;
+
+	if (WARN_ON(!iommu))
+		return -EINVAL;
+
+	mutex_lock(&pasid_mutex);
+	svm = ioasid_find(NULL, pasid, NULL);
+	if (!svm) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (IS_ERR(svm)) {
+		ret = PTR_ERR(svm);
+		goto out;
+	}
+
+	for_each_svm_dev(sdev, svm, dev) {
+		ret = 0;
+		sdev->users--;
+		if (!sdev->users) {
+			list_del_rcu(&sdev->list);
+			intel_pasid_tear_down_entry(iommu, dev, svm->pasid);
+			/* TODO: Drain in flight PRQ for the PASID since it
+			 * may get reused soon, we don't want to
+			 * confuse with its previous life.
+			 * intel_svm_drain_prq(dev, pasid);
+			 */
+			kfree_rcu(sdev, rcu);
+
+			if (list_empty(&svm->devs)) {
+				/*
+				 * We do not free the IOASID here in that
+				 * IOMMU driver did not allocate it.
+				 * Unlike native SVM, IOASID for guest use was
+				 * allocated prior to the bind call.
+				 * In any case, if the free call comes before
+				 * the unbind, IOMMU driver will get notified
+				 * and perform cleanup.
+				 */
+				ioasid_set_data(pasid, NULL);
+				kfree(svm);
+			}
+		}
+		break;
+	}
+out:
+	mutex_unlock(&pasid_mutex);
+
+	return ret;
+}
+
 int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_ops *ops)
 {
 	struct intel_iommu *iommu = intel_svm_device_to_iommu(dev);
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 6da03f627ba3..a5bd53cf190c 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -706,7 +706,9 @@ struct dmar_domain *find_domain(struct device *dev);
 extern void intel_svm_check(struct intel_iommu *iommu);
 extern int intel_svm_enable_prq(struct intel_iommu *iommu);
 extern int intel_svm_finish_prq(struct intel_iommu *iommu);
-
+extern int intel_svm_bind_gpasid(struct iommu_domain *domain,
+		struct device *dev, struct iommu_gpasid_bind_data *data);
+extern int intel_svm_unbind_gpasid(struct device *dev, int pasid);
 struct svm_dev_ops;
 
 struct intel_svm_dev {
@@ -723,9 +725,13 @@ struct intel_svm_dev {
 struct intel_svm {
 	struct mmu_notifier notifier;
 	struct mm_struct *mm;
+
 	struct intel_iommu *iommu;
 	int flags;
 	int pasid;
+	int gpasid; /* Guest PASID in case of vSVA bind with non-identity host
+		     * to guest PASID mapping.
+		     */
 	struct list_head devs;
 	struct list_head list;
 };
diff --git a/include/linux/intel-svm.h b/include/linux/intel-svm.h
index d7c403d0dd27..c19690937540 100644
--- a/include/linux/intel-svm.h
+++ b/include/linux/intel-svm.h
@@ -44,6 +44,23 @@ struct svm_dev_ops {
  * do such IOTLB flushes automatically.
  */
 #define SVM_FLAG_SUPERVISOR_MODE	(1<<1)
+/*
+ * The SVM_FLAG_GUEST_MODE flag is used when a guest process bind to a device.
+ * In this case the mm_struct is in the guest kernel or userspace, its life
+ * cycle is managed by VMM and VFIO layer. For IOMMU driver, this API provides
+ * means to bind/unbind guest CR3 with PASIDs allocated for a device.
+ */
+#define SVM_FLAG_GUEST_MODE	(1<<2)
+/*
+ * The SVM_FLAG_GUEST_PASID flag is used when a guest has its own PASID space,
+ * which requires guest and host PASID translation at both directions. We keep
+ * track of guest PASID in order to provide lookup service to device drivers.
+ * One such example is a physical function (PF) driver that supports mediated
+ * device (mdev) assignment. Guest programming of mdev configuration space can
+ * only be done with guest PASID, therefore PF driver needs to find the matching
+ * host PASID to program the real hardware.
+ */
+#define SVM_FLAG_GUEST_PASID	(1<<3)
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
