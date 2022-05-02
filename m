Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434C516932
	for <lists.iommu@lfdr.de>; Mon,  2 May 2022 03:52:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AFED60E7E;
	Mon,  2 May 2022 01:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VraKoltRCC8J; Mon,  2 May 2022 01:52:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 174DA60E7C;
	Mon,  2 May 2022 01:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3797C0081;
	Mon,  2 May 2022 01:52:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 215FAC002D
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E84440147
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 632inxz2r1uw for <iommu@lists.linux-foundation.org>;
 Mon,  2 May 2022 01:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B74E408E5
 for <iommu@lists.linux-foundation.org>; Mon,  2 May 2022 01:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651456321; x=1682992321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLunroHcw+Dk9vHwlHN9l5rGHiKd6BvcZPGCo3wrg3M=;
 b=fVlNAk8lMJTBD+2spYszTwHCmxhgQNh//zY38+H4TVAx66426+COEE7c
 Y657grsWxzgM3wbZ90Byw+TSYg877beImFvJna5qGUKNYG/6RS9KEh/+F
 hs5upRdJsP+8vzVdcvjOhSml8q2t4Co/jUPNeuBBL1ba/icOEq4DZ7zHQ
 3AtnCyBOF7BvJbN0jmb766oudW+WEx40Rv9L8uQbDuOBu3uVJTgf2kDuQ
 /pyfQ3X1W6AKXUBjkZXLwhUmoX/qfxvY6VTfwSxqcRjU9SDKLvD1gAc3E
 v7HmJ99Ze0teZnGpdVf14McTnm4MKz9mJgEmgAc0dAaMl4hWrXMEeeY6k w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="254535326"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="254535326"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 18:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="707406461"
Received: from allen-box.sh.intel.com ([10.239.159.48])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2022 18:51:56 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Dave Jiang <dave.jiang@intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 04/12] iommu/sva: Basic data structures for SVA
Date: Mon,  2 May 2022 09:48:34 +0800
Message-Id: <20220502014842.991097-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502014842.991097-1-baolu.lu@linux.intel.com>
References: <20220502014842.991097-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>
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

Use below data structures for SVA implementation in the IOMMU core:

- struct iommu_sva_ioas
  Represent the I/O address space shared with an application CPU address
  space. This structure has a 1:1 relationship with an mm_struct. It
  grabs a "mm->mm_count" refcount during creation and drop it on release.

- struct iommu_domain (IOMMU_DOMAIN_SVA type)
  Represent a hardware pagetable that the IOMMU hardware could use for
  SVA translation. Multiple iommu domains could be bound with an SVA ioas
  and each grabs a refcount from ioas in order to make sure ioas could
  only be freed after all domains have been unbound.

- struct iommu_sva
  Represent a bond relationship between an SVA ioas and an iommu domain.
  If a bond already exists, it's reused and a reference is taken.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h         | 14 +++++++++++++-
 drivers/iommu/iommu-sva-lib.h |  1 +
 drivers/iommu/iommu-sva-lib.c | 18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ab36244d4e94..f582f434c513 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -42,6 +42,7 @@ struct notifier_block;
 struct iommu_sva;
 struct iommu_fault_event;
 struct iommu_dma_cookie;
+struct iommu_sva_ioas;
 
 /* iommu fault flags */
 #define IOMMU_FAULT_READ	0x0
@@ -64,6 +65,9 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_PT	(1U << 2)  /* Domain is identity mapped   */
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
+#define __IOMMU_DOMAIN_SHARED	(1U << 4)  /* Page table shared from CPU  */
+#define __IOMMU_DOMAIN_HOST_VA	(1U << 5)  /* Host CPU virtual address */
+
 /*
  * This are the possible domain-types
  *
@@ -86,6 +90,8 @@ struct iommu_domain_geometry {
 #define IOMMU_DOMAIN_DMA_FQ	(__IOMMU_DOMAIN_PAGING |	\
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
+#define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SHARED |	\
+				 __IOMMU_DOMAIN_HOST_VA)
 
 struct iommu_domain {
 	unsigned type;
@@ -95,6 +101,7 @@ struct iommu_domain {
 	void *handler_token;
 	struct iommu_domain_geometry geometry;
 	struct iommu_dma_cookie *iova_cookie;
+	struct iommu_sva_ioas *sva_ioas;
 };
 
 static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
@@ -628,7 +635,12 @@ struct iommu_fwspec {
  * struct iommu_sva - handle to a device-mm bond
  */
 struct iommu_sva {
-	struct device			*dev;
+	struct device		*dev;
+	struct iommu_sva_ioas	*sva_ioas;
+	struct iommu_domain	*domain;
+	/* Link to sva ioas's bonds list */
+	struct list_head	node;
+	refcount_t		users;
 };
 
 int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
diff --git a/drivers/iommu/iommu-sva-lib.h b/drivers/iommu/iommu-sva-lib.h
index 8909ea1094e3..9c5e108e2c8a 100644
--- a/drivers/iommu/iommu-sva-lib.h
+++ b/drivers/iommu/iommu-sva-lib.h
@@ -10,6 +10,7 @@
 
 int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t max);
 struct mm_struct *iommu_sva_find(ioasid_t pasid);
+struct mm_struct *iommu_sva_domain_mm(struct iommu_domain *domain);
 
 /* I/O Page fault */
 struct device;
diff --git a/drivers/iommu/iommu-sva-lib.c b/drivers/iommu/iommu-sva-lib.c
index 106506143896..d524a402be3b 100644
--- a/drivers/iommu/iommu-sva-lib.c
+++ b/drivers/iommu/iommu-sva-lib.c
@@ -3,6 +3,8 @@
  * Helpers for IOMMU drivers implementing SVA
  */
 #include <linux/mutex.h>
+#include <linux/iommu.h>
+#include <linux/slab.h>
 #include <linux/sched/mm.h>
 
 #include "iommu-sva-lib.h"
@@ -10,6 +12,22 @@
 static DEFINE_MUTEX(iommu_sva_lock);
 static DECLARE_IOASID_SET(iommu_sva_pasid);
 
+struct iommu_sva_ioas {
+	struct mm_struct *mm;
+	ioasid_t pasid;
+
+	/* Counter of domains attached to this ioas. */
+	refcount_t users;
+
+	/* All bindings are linked here. */
+	struct list_head bonds;
+};
+
+struct mm_struct *iommu_sva_domain_mm(struct iommu_domain *domain)
+{
+	return domain->sva_ioas->mm;
+}
+
 /**
  * iommu_sva_alloc_pasid - Allocate a PASID for the mm
  * @mm: the mm
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
