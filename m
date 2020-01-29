Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECE14C635
	for <lists.iommu@lfdr.de>; Wed, 29 Jan 2020 06:57:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65EC4861B3;
	Wed, 29 Jan 2020 05:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5lZUe+9Ku-E; Wed, 29 Jan 2020 05:56:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 69F3A8735C;
	Wed, 29 Jan 2020 05:56:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57BC4C0171;
	Wed, 29 Jan 2020 05:56:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D2E9C0881
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29D3386DC1
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOrh8MsdMmeO for <iommu@lists.linux-foundation.org>;
 Wed, 29 Jan 2020 05:56:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7112F86DCC
 for <iommu@lists.linux-foundation.org>; Wed, 29 Jan 2020 05:56:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 21:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,376,1574150400"; d="scan'208";a="252500720"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2020 21:56:53 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/3] iommu/uapi: Add helper function for size lookup
Date: Tue, 28 Jan 2020 22:02:04 -0800
Message-Id: <1580277724-66994-4-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580277724-66994-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1580277724-66994-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Jonathan Cameron <jic23@kernel.org>
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

IOMMU UAPI can be extended in the future by adding new
fields at the end of each user data structure. Since we use
a unified UAPI version for compatibility checking, a lookup
function is needed to find the correct user data size to copy
from user.

This patch adds a helper function based on a 2D lookup with
version and type as input arguments.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/iommu.c | 22 ++++++++++++++++++++++
 include/linux/iommu.h |  6 ++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7dd51c5d2ba1..9e5de9abebdf 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1696,6 +1696,28 @@ int iommu_sva_unbind_gpasid(struct iommu_domain *domain, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
 
+
+/**
+ * Maintain a UAPI version to user data structure size lookup for each
+ * API function types we support. e.g. bind guest pasid, cache invalidation.
+ * As data structures being extended with new members, the offsetofend()
+ * will identify the new sizes.
+ */
+const static int iommu_uapi_data_size[NR_IOMMU_UAPI_TYPE][IOMMU_UAPI_VERSION] = {
+	/* IOMMU_UAPI_BIND_GPASID */
+	{offsetofend(struct iommu_gpasid_bind_data, vtd)},
+	/* IOMMU_UAPI_CACHE_INVAL */
+	{offsetofend(struct iommu_cache_invalidate_info, addr_info)},
+	/* IOMMU_UAPI_PAGE_RESP */
+	{offsetofend(struct iommu_page_response, code)},
+};
+
+int iommu_uapi_get_data_size(int type, int version)
+{
+	return iommu_uapi_data_size[type][version - 1];
+}
+EXPORT_SYMBOL_GPL(iommu_uapi_get_data_size);
+
 static void __iommu_detach_device(struct iommu_domain *domain,
 				  struct device *dev)
 {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9718c109ea0a..416fe02160ba 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -500,6 +500,7 @@ extern int iommu_report_device_fault(struct device *dev,
 				     struct iommu_fault_event *evt);
 extern int iommu_page_response(struct device *dev,
 			       struct iommu_page_response *msg);
+extern int iommu_uapi_get_data_size(int type, int version);
 
 extern int iommu_group_id(struct iommu_group *group);
 extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
@@ -885,6 +886,11 @@ static inline int iommu_page_response(struct device *dev,
 	return -ENODEV;
 }
 
+static int iommu_uapi_get_data_size(int type, int version)
+{
+	return -ENODEV;
+}
+
 static inline int iommu_group_id(struct iommu_group *group)
 {
 	return -ENODEV;
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
