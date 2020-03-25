Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30741193448
	for <lists.iommu@lfdr.de>; Thu, 26 Mar 2020 00:11:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 80316881DE;
	Wed, 25 Mar 2020 23:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3RMoOPslrji; Wed, 25 Mar 2020 23:11:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D4076882E7;
	Wed, 25 Mar 2020 23:11:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB858C0177;
	Wed, 25 Mar 2020 23:11:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9860CC1D7C
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 23:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94CE087DC1
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 23:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAo2Jo93jhvS for <iommu@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 23:11:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9C1B087E08
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 23:11:25 +0000 (UTC)
IronPort-SDR: f4gKg5YPPYAoy+itlfw0vsOfbHz+fjEzH/B1bMHtdB1TKmewqFwCStYeZfb/M/qLC8vsZmqo4K
 5Ld+QkkOtHyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 16:11:24 -0700
IronPort-SDR: q1SfkvZ/eKjh21PLtsAMc9gjXTkvpsc68UU2/mRAJlJVCfyeGhTw56vpaYrL2GVtkx0J0w0q4z
 OlX+tXSt+WwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="236083689"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga007.jf.intel.com with ESMTP; 25 Mar 2020 16:11:24 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH v2 1/3] iommu/uapi: Define uapi version and capabilities
Date: Wed, 25 Mar 2020 16:17:05 -0700
Message-Id: <1585178227-17061-2-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585178227-17061-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1585178227-17061-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

Having a single UAPI version to govern the user-kernel data structures
makes compatibility check straightforward. On the contrary, supporting
combinations of multiple versions of the data can be a nightmare to
maintain.

This patch defines a unified UAPI version to be used for compatibility
checks between user and kernel.

---
v2: Rewrite extension rules to disallow adding new members. Use padding
    and union extensions only.
---

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Link: https://lkml.org/lkml/2020/2/3/1126
---
 include/uapi/linux/iommu.h | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
index d7bcbc5f79b0..25dba9198d7f 100644
--- a/include/uapi/linux/iommu.h
+++ b/include/uapi/linux/iommu.h
@@ -8,6 +8,59 @@
 
 #include <linux/types.h>
 
+/**
+ * Current version of the IOMMU user API. This is intended for query
+ * between user and kernel to determine compatible data structures.
+ *
+ * UAPI version can be bumped up with the following rules:
+ * 1. All data structures passed between user and kernel space share
+ *    the same version number. i.e. any extension to any structure
+ *    results in version number increment.
+ *
+ * 2. Data structures are open to extension but closed to modification.
+ *    Extensions are allowed in two places:
+ *    - the padding bytes with a flag bit for each new member
+ *    - new union members at the end of each structure
+ *
+ *    No new members can be added after padding bytes are exhausted.
+ *    The reason is that the union size can change when new members are
+ *    added, having new member at the end would break backward
+ *    compatibility. Expansion of the union would move the new member
+ *    to different offset between versions.
+ *
+ *    Flag bits can be added without size change but existing ones
+ *    cannot be altered.
+ *
+ * 3. Versions are backward compatible.
+ *
+ * 4. Version to size lookup is supported by kernel internal API for each
+ *    API function type. @version is mandatory for new data structures
+ *    and must be at the beginning with type of __u32.
+ */
+#define IOMMU_UAPI_VERSION	1
+static inline int iommu_get_uapi_version(void)
+{
+	return IOMMU_UAPI_VERSION;
+}
+
+/*
+ * Supported UAPI features that can be reported to user space.
+ * These types represent the capability available in the kernel.
+ *
+ * REVISIT: UAPI version also implies the capabilities. Should we
+ * report them explicitly?
+ */
+enum IOMMU_UAPI_DATA_TYPES {
+	IOMMU_UAPI_BIND_GPASID,
+	IOMMU_UAPI_CACHE_INVAL,
+	IOMMU_UAPI_PAGE_RESP,
+	NR_IOMMU_UAPI_TYPE,
+};
+
+#define IOMMU_UAPI_CAP_MASK ((1 << IOMMU_UAPI_BIND_GPASID) |	\
+				(1 << IOMMU_UAPI_CACHE_INVAL) |	\
+				(1 << IOMMU_UAPI_PAGE_RESP))
+
 #define IOMMU_FAULT_PERM_READ	(1 << 0) /* read */
 #define IOMMU_FAULT_PERM_WRITE	(1 << 1) /* write */
 #define IOMMU_FAULT_PERM_EXEC	(1 << 2) /* exec */
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
