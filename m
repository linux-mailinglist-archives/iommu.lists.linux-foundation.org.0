Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 116A420580C
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 18:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA5CE88CCB;
	Tue, 23 Jun 2020 16:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRXX+rf9vqDw; Tue, 23 Jun 2020 16:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B28988D6D;
	Tue, 23 Jun 2020 16:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65220C0891;
	Tue, 23 Jun 2020 16:57:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 203FFC016F
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 16:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0898E203A6
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 16:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHanjGDgnR5J for <iommu@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id 886DB203D0
 for <iommu@lists.linux-foundation.org>; Tue, 23 Jun 2020 16:57:30 +0000 (UTC)
IronPort-SDR: QrxaAXpp1JKywZcsOw2HfK2JClS7GtVqUltKhibz+Br/rtRbLihxEBMEY+IqLInBqLnUs7tuWJ
 uAi+w9Jyhs6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132541406"
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; d="scan'208";a="132541406"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 09:57:28 -0700
IronPort-SDR: 6rWLdZr1MKX8EfLVte3qQNbQid/YwBhoEz3m5KJY/1rFE3Xc29LibDl1t9Y51wu8UPYQ8YPgtV
 uCJtSU+2Q5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,271,1589266800"; d="scan'208";a="452290905"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga005.jf.intel.com with ESMTP; 23 Jun 2020 09:57:28 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v3 5/5] iommu/uapi: Support both kernel and user unbind guest
 PASID
Date: Tue, 23 Jun 2020 10:03:57 -0700
Message-Id: <1592931837-58223-6-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592931837-58223-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1592931837-58223-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Christoph Hellwig <hch@infradead.org>, David Woodhouse <dwmw2@infradead.org>
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

Guest SVA unbind data can come from either kernel and user space, if a
user pointer is passed in, IOMMU driver must copy from data from user.
If the unbind data is assembled in kernel, data can be trusted and
directly used. This patch creates a wrapper for unbind gpasid such that
user pointer can be parsed and sanitized before calling into the kernel
unbind function. Common user data copy code also consolidated.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/iommu.c | 70 ++++++++++++++++++++++++++++++++++++++-------------
 include/linux/iommu.h | 13 ++++++++--
 2 files changed, 64 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4a025c429b41..595527e4c6b7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2010,19 +2010,15 @@ int iommu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(iommu_cache_invalidate);
 
-int iommu_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
-						void __user *udata)
-{
 
-	struct iommu_gpasid_bind_data data;
+static int iommu_sva_prepare_bind_data(void __user *udata, bool bind,
+				       struct iommu_gpasid_bind_data *data)
+{
 	unsigned long minsz, maxsz;
 
-	if (unlikely(!domain->ops->sva_bind_gpasid))
-		return -ENODEV;
-
 	/* Current kernel data size is the max to be copied from user */
 	maxsz = sizeof(struct iommu_gpasid_bind_data);
-	memset((void *)&data, 0, maxsz);
+	memset((void *)data, 0, maxsz);
 
 	/*
 	 * No new spaces can be added before the variable sized union, the
@@ -2031,11 +2027,11 @@ int iommu_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	minsz = offsetof(struct iommu_gpasid_bind_data, vendor);
 
 	/* Copy minsz from user to get flags and argsz */
-	if (copy_from_user(&data, udata, minsz))
+	if (copy_from_user(data, udata, minsz))
 		return -EFAULT;
 
 	/* Fields before variable size union is mandatory */
-	if (data.argsz < minsz)
+	if (data->argsz < minsz)
 		return -EINVAL;
 	/*
 	 * User might be using a newer UAPI header, we shall let IOMMU vendor
@@ -2043,26 +2039,66 @@ int iommu_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 	 * can be vendor specific, larger argsz could be the result of extension
 	 * for one vendor but it should not affect another vendor.
 	 */
-	if (data.argsz > maxsz)
-		data.argsz = maxsz;
+	if (data->argsz > maxsz)
+		data->argsz = maxsz;
+
+	/*
+	 * For unbind, we don't need any extra data, host PASID is included in
+	 * the minsz and that is all we need.
+	 */
+	if (!bind)
+		return 0;
 
 	/* Copy the remaining user data _after_ minsz */
-	if (copy_from_user((void *)&data + minsz, udata + minsz,
-				data.argsz - minsz))
+	if (copy_from_user((void *)data + minsz, udata + minsz,
+				data->argsz - minsz))
 		return -EFAULT;
 
+	return 0;
+}
+
+int iommu_sva_bind_gpasid(struct iommu_domain *domain, struct device *dev,
+						void __user *udata)
+{
+
+	struct iommu_gpasid_bind_data data;
+	int ret;
+
+	if (unlikely(!domain->ops->sva_bind_gpasid))
+		return -ENODEV;
+
+	ret = iommu_sva_prepare_bind_data(udata, true, &data);
+	if (ret)
+		return ret;
 
 	return domain->ops->sva_bind_gpasid(domain, dev, &data);
 }
 EXPORT_SYMBOL_GPL(iommu_sva_bind_gpasid);
 
-int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
-			     ioasid_t pasid)
+int __iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
+			struct iommu_gpasid_bind_data *data)
 {
 	if (unlikely(!domain->ops->sva_unbind_gpasid))
 		return -ENODEV;
 
-	return domain->ops->sva_unbind_gpasid(dev, pasid);
+	return domain->ops->sva_unbind_gpasid(dev, data->hpasid);
+}
+EXPORT_SYMBOL_GPL(__iommu_sva_unbind_gpasid);
+
+int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
+			void __user *udata)
+{
+	struct iommu_gpasid_bind_data data;
+	int ret;
+
+	if (unlikely(!domain->ops->sva_bind_gpasid))
+		return -ENODEV;
+
+	ret = iommu_sva_prepare_bind_data(udata, false, &data);
+	if (ret)
+		return ret;
+
+	return __iommu_sva_unbind_gpasid(domain, dev, &data);
 }
 EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a688fea42ae5..2567c33dc4e8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -437,7 +437,9 @@ extern int iommu_cache_invalidate(struct iommu_domain *domain,
 extern int iommu_sva_bind_gpasid(struct iommu_domain *domain,
 				struct device *dev, void __user *udata);
 extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-				struct device *dev, ioasid_t pasid);
+				struct device *dev, void __user *udata);
+extern int __iommu_sva_unbind_gpasid(struct iommu_domain *domain,
+				struct device *dev, struct iommu_gpasid_bind_data *data);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
@@ -1069,7 +1071,14 @@ static inline int iommu_sva_bind_gpasid(struct iommu_domain *domain,
 }
 
 static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
-					   struct device *dev, int pasid)
+					   struct device *dev, void __user *udata)
+{
+	return -ENODEV;
+}
+
+static inline int __iommu_sva_unbind_gpasid(struct iommu_domain *domain,
+					struct device *dev,
+					struct iommu_gpasid_bind_data *data)
 {
 	return -ENODEV;
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
