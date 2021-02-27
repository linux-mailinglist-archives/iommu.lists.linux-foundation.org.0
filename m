Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1CD327125
	for <lists.iommu@lfdr.de>; Sun, 28 Feb 2021 07:33:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA496F9D9;
	Sun, 28 Feb 2021 06:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIfTD96Wbrad; Sun, 28 Feb 2021 06:33:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F8C6F9E4;
	Sun, 28 Feb 2021 06:33:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B400C000F;
	Sun, 28 Feb 2021 06:33:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 269B7C000E
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15A7E6F96D
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JglskH47QsNy for <iommu@lists.linux-foundation.org>;
 Sun, 28 Feb 2021 06:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32FF36F5A4
 for <iommu@lists.linux-foundation.org>; Sun, 28 Feb 2021 06:33:12 +0000 (UTC)
IronPort-SDR: b/7bhkMzCWERJ5l58IO51siCxWGlJDeif7jyECNoBWyb/F4lGYVF3+kkXvQY88w4NimRPqEzyp
 DnfkfZlnME5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9908"; a="247624812"
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="247624812"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 22:33:10 -0800
IronPort-SDR: zRnRxXScn+KW1qsE4bGRWvsozcby9n3F2xNpTl8FDxjxDrV6padueFBgOK9oRk8roY+tedX8oE
 7aWkAIKkj1rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,211,1610438400"; d="scan'208";a="517029728"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga004.jf.intel.com with ESMTP; 27 Feb 2021 22:33:09 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 cgroups@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH V4 11/18] iommu/ioasid: Add ownership check in guest bind
Date: Sat, 27 Feb 2021 14:01:19 -0800
Message-Id: <1614463286-97618-12-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Wu Hao <hao.wu@intel.com>
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

Bind guest page table call comes with an IOASID provided by the
userspace.  To prevent attacks by malicious users, we must ensure the
IOASID was allocated under the same process.

This patch adds a new API that will perform an ownership check that is
based on whether the IOASID belongs to the ioasid_set allocated with the
mm_struct pointer as a token.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/ioasid.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/iommu.c  | 16 ++++++++++++++--
 include/linux/ioasid.h |  6 ++++++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/ioasid.c b/drivers/iommu/ioasid.c
index 96e941dfada7..28a2e9b6594d 100644
--- a/drivers/iommu/ioasid.c
+++ b/drivers/iommu/ioasid.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
+#include <linux/sched/mm.h>
 
 /*
  * An IOASID can have multiple consumers where each consumer may have
@@ -1028,6 +1029,42 @@ int ioasid_get(struct ioasid_set *set, ioasid_t ioasid)
 }
 EXPORT_SYMBOL_GPL(ioasid_get);
 
+/**
+ * ioasid_get_if_owned - obtain a reference to the IOASID if the IOASID belongs
+ * 		to the ioasid_set with the current mm as token
+ * @ioasid:	the IOASID to get reference
+ *
+ *
+ * Return: 0 on success, error if failed.
+ */
+int ioasid_get_if_owned(ioasid_t ioasid)
+{
+	struct ioasid_set *set;
+	int ret;
+
+	spin_lock(&ioasid_allocator_lock);
+	set = ioasid_find_set(ioasid);
+	if (IS_ERR_OR_NULL(set)) {
+		ret = -ENOENT;
+		goto done_unlock;
+	}
+	if (set->type != IOASID_SET_TYPE_MM) {
+		ret = -EINVAL;
+		goto done_unlock;
+	}
+	if (current->mm != set->token) {
+		ret = -EPERM;
+		goto done_unlock;
+	}
+
+	ret = ioasid_get_locked(set, ioasid);
+done_unlock:
+	spin_unlock(&ioasid_allocator_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ioasid_get_if_owned);
+
 bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid)
 {
 	struct ioasid_data *data;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index fd76e2f579fe..18716d856b02 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2169,7 +2169,13 @@ int iommu_uapi_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	if (ret)
 		return ret;
 
-	return domain->ops->sva_bind_gpasid(domain, dev, &data);
+	ret = ioasid_get_if_owned(data.hpasid);
+	if (ret)
+		return ret;
+	ret = domain->ops->sva_bind_gpasid(domain, dev, &data);
+	ioasid_put(NULL, data.hpasid);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_uapi_sva_bind_gpasid);
 
@@ -2196,7 +2202,13 @@ int iommu_uapi_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev
 	if (ret)
 		return ret;
 
-	return iommu_sva_unbind_gpasid(domain, dev, data.hpasid);
+	ret = ioasid_get_if_owned(data.hpasid);
+	if (ret)
+		return ret;
+	ret = iommu_sva_unbind_gpasid(domain, dev, data.hpasid);
+	ioasid_put(NULL, data.hpasid);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(iommu_uapi_sva_unbind_gpasid);
 
diff --git a/include/linux/ioasid.h b/include/linux/ioasid.h
index c97e80ff65cc..9624b665f810 100644
--- a/include/linux/ioasid.h
+++ b/include/linux/ioasid.h
@@ -111,6 +111,7 @@ ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
 		      void *private);
 int ioasid_get(struct ioasid_set *set, ioasid_t ioasid);
 int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid);
+int ioasid_get_if_owned(ioasid_t ioasid);
 bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid);
 bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid);
 void ioasid_free(struct ioasid_set *set, ioasid_t ioasid);
@@ -180,6 +181,11 @@ static inline int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid)
 	return -ENOTSUPP;
 }
 
+static inline int ioasid_get_if_owned(ioasid_t ioasid)
+{
+	return -ENOTSUPP;
+}
+
 static inline bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid)
 {
 	return false;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
