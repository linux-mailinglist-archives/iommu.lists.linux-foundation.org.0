Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A594CB9CDA
	for <lists.iommu@lfdr.de>; Sat, 21 Sep 2019 09:08:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 51F57AB9;
	Sat, 21 Sep 2019 07:08:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2EA1F265
	for <iommu@lists.linux-foundation.org>;
	Sat, 21 Sep 2019 07:08:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A357B8A3
	for <iommu@lists.linux-foundation.org>;
	Sat, 21 Sep 2019 07:08:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Sep 2019 00:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,531,1559545200"; d="scan'208";a="363053071"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by orsmga005.jf.intel.com with ESMTP; 21 Sep 2019 00:08:41 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/1] iommu/vt-d: Refactor find_domain() helper
Date: Sat, 21 Sep 2019 15:06:44 +0800
Message-Id: <20190921070644.10630-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Current find_domain() helper checks and does the deferred domain
attachment and return the domain in use. This isn't always the
use case for the callers. Some callers only want to retrieve the
current domain in use.

This refactors find_domain() into two helpers: 1) find_domain()
only returns the domain in use; 2) deferred_attach_domain() does
the deferred domain attachment if required and return the domain
in use.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 87de0b975672..a8898b721099 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2420,14 +2420,24 @@ static void domain_remove_dev_info(struct dmar_domain *domain)
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
-/*
- * find_domain
- * Note: we use struct device->archdata.iommu stores the info
- */
 static struct dmar_domain *find_domain(struct device *dev)
 {
 	struct device_domain_info *info;
 
+	if (unlikely(dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO ||
+		     dev->archdata.iommu == DUMMY_DEVICE_DOMAIN_INFO))
+		return NULL;
+
+	/* No lock here, assumes no domain exit in normal case */
+	info = dev->archdata.iommu;
+	if (likely(info))
+		return info->domain;
+
+	return NULL;
+}
+
+static struct dmar_domain *deferred_attach_domain(struct device *dev)
+{
 	if (unlikely(dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO)) {
 		struct iommu_domain *domain;
 
@@ -2437,12 +2447,7 @@ static struct dmar_domain *find_domain(struct device *dev)
 			intel_iommu_attach_device(domain, dev);
 	}
 
-	/* No lock here, assumes no domain exit in normal case */
-	info = dev->archdata.iommu;
-
-	if (likely(info))
-		return info->domain;
-	return NULL;
+	return find_domain(dev);
 }
 
 static inline struct device_domain_info *
@@ -3512,7 +3517,7 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 
 	BUG_ON(dir == DMA_NONE);
 
-	domain = find_domain(dev);
+	domain = deferred_attach_domain(dev);
 	if (!domain)
 		return DMA_MAPPING_ERROR;
 
@@ -3732,7 +3737,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	if (!iommu_need_mapping(dev))
 		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
-	domain = find_domain(dev);
+	domain = deferred_attach_domain(dev);
 	if (!domain)
 		return 0;
 
@@ -3817,7 +3822,7 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	int prot = 0;
 	int ret;
 
-	domain = find_domain(dev);
+	domain = deferred_attach_domain(dev);
 	if (WARN_ON(dir == DMA_NONE || !domain))
 		return DMA_MAPPING_ERROR;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
