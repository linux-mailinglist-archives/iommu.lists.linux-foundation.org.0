Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB2255E99
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 18:12:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B7F4C22C31;
	Fri, 28 Aug 2020 16:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRVGLsvB8TFH; Fri, 28 Aug 2020 16:12:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3A12322DB0;
	Fri, 28 Aug 2020 16:12:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16EB9C016F;
	Fri, 28 Aug 2020 16:12:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21394C0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 097F386FC4
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:12:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyQz_iFgVJGz for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 16:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C316286FB2
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:12:16 +0000 (UTC)
IronPort-SDR: 6x/gmCeojInf5YfBLqCyuJqcSde6SCTp2sPM8N8/wyvHkzi+EMjHJgwXMav2NDT3EzNzVoNeSp
 PcOLXK+pXuPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="144366275"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="144366275"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:12:15 -0700
IronPort-SDR: 7uGZ+Phx7vPs4qTtXb1wKBAPnde1Fjh3Bdb+SYl7w5lX+RLSkMAfVYApOGWzt+EW2eln3HXxTZ
 ovDOOeyUZhJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="324061620"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2020 09:12:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 88A84166; Fri, 28 Aug 2020 19:12:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v1] iommu/vt-d: Move intel_iommu_gfx_mapped to Intel IOMMU
 header
Date: Fri, 28 Aug 2020 19:12:11 +0300
Message-Id: <20200828161212.71294-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Static analyzer is not happy about intel_iommu_gfx_mapped declaration:

.../drivers/iommu/intel/iommu.c:364:5: warning: symbol 'intel_iommu_gfx_mapped' was not declared. Should it be static?

Move its declaration to Intel IOMMU header file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/drm/intel-gtt.h     | 5 +----
 include/linux/intel-iommu.h | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index 71d81923e6b0..abfefaaf897a 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -5,6 +5,7 @@
 #define	_DRM_INTEL_GTT_H
 
 #include <linux/agp_backend.h>
+#include <linux/intel-iommu.h>
 #include <linux/kernel.h>
 
 void intel_gtt_get(u64 *gtt_total,
@@ -33,8 +34,4 @@ void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries);
 /* flag for GFDT type */
 #define AGP_USER_CACHED_MEMORY_GFDT (1 << 3)
 
-#ifdef CONFIG_INTEL_IOMMU
-extern int intel_iommu_gfx_mapped;
-#endif
-
 #endif
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 64fa5c56c825..fbd3bb64649b 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -794,6 +794,7 @@ extern int iommu_calculate_max_sagaw(struct intel_iommu *iommu);
 extern int dmar_disabled;
 extern int intel_iommu_enabled;
 extern int intel_iommu_tboot_noforce;
+extern int intel_iommu_gfx_mapped;
 #else
 static inline int iommu_calculate_agaw(struct intel_iommu *iommu)
 {
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
