Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D852C1FE
	for <lists.iommu@lfdr.de>; Wed, 18 May 2022 20:17:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 936F04101C;
	Wed, 18 May 2022 18:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZITK7-dVZbZ; Wed, 18 May 2022 18:17:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 821CE4101B;
	Wed, 18 May 2022 18:17:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CBB9C007E;
	Wed, 18 May 2022 18:17:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B7DDC007E
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 18:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A52D61243
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 18:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMMB4kaVTZmu for <iommu@lists.linux-foundation.org>;
 Wed, 18 May 2022 18:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 702E761246
 for <iommu@lists.linux-foundation.org>; Wed, 18 May 2022 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652897855; x=1684433855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5VKbTR0g0tlRykbvGSeZDqc/YRgpbo6uTJXWIP5098I=;
 b=ESBWrZYLM3jAwfBvV9g3LYmjOr7AUy5H0ZxCxOYXOdxTy4o1hJTMOUKO
 LZFEfGJ4ydgNLnmVNQvCVtKMcDAgYWiWK3X+fXDDW1UJrC/myt4cy17Dv
 OMbE2zqlZJkIisfF5doOsJKZv3XWwqXzpyFy+UtMgXzZiGkTPULZuXW48
 MHLz1opG29rpsPODEAnwEq13jEXguLaKbajeIgk/V9HdIK3YfJfmgkZpc
 ilIykkHrs58XfvQ6UamZ5rvgG+1QK05Q17pHBGE+FOytjgFp0GtimRFJq
 mPSVAbLzteJWjlQ2lY1E+x/esYDqKTPWJ/fWRbPGQaPVqlpK4J9doa3jS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="259392426"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="259392426"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 11:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="639405503"
Received: from otc-wp-03.jf.intel.com (HELO jacob-builder.jf.intel.com)
 ([10.54.39.79])
 by fmsmga004.fm.intel.com with ESMTP; 18 May 2022 11:17:32 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 dmaengine@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Christoph Hellwig" <hch@infradead.org>, vkoul@kernel.org,
 robin.murphy@arm.com, will@kernel.org
Subject: [PATCH v4 4/6] iommu: Add PASID support for DMA mapping API users
Date: Wed, 18 May 2022 11:21:18 -0700
Message-Id: <20220518182120.1136715-5-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518182120.1136715-1-jacob.jun.pan@linux.intel.com>
References: <20220518182120.1136715-1-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>
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

DMA mapping API is the de facto standard for in-kernel DMA. It operates
on a per device/RID basis which is not PASID-aware.

Some modern devices such as Intel Data Streaming Accelerator, PASID is
required for certain work submissions. To allow such devices use DMA
mapping API, we need the following functionalities:
1. Provide device a way to retrieve a PASID for work submission within
the kernel
2. Enable the kernel PASID on the IOMMU for the device
3. Attach the kernel PASID to the device's default DMA domain, let it
be IOVA or physical address in case of pass-through.

This patch introduces a driver facing API that enables DMA API
PASID usage. Once enabled, device drivers can continue to use DMA APIs as
is. There is no difference in dma_handle between without PASID and with
PASID.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/dma-iommu.c | 114 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-iommu.h |   3 +
 2 files changed, 117 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 1ca85d37eeab..6ad7ba619ef0 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -34,6 +34,8 @@ struct iommu_dma_msi_page {
 	phys_addr_t		phys;
 };
 
+static DECLARE_IOASID_SET(iommu_dma_pasid);
+
 enum iommu_dma_cookie_type {
 	IOMMU_DMA_IOVA_COOKIE,
 	IOMMU_DMA_MSI_COOKIE,
@@ -370,6 +372,118 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 	domain->iova_cookie = NULL;
 }
 
+/* Protect iommu_domain DMA PASID data */
+static DEFINE_MUTEX(dma_pasid_lock);
+/**
+ * iommu_attach_dma_pasid --Attach a PASID for in-kernel DMA. Use the device's
+ * DMA domain.
+ * @dev: Device to be enabled
+ * @pasid: The returned kernel PASID to be used for DMA
+ *
+ * DMA request with PASID will be mapped the same way as the legacy DMA.
+ * If the device is in pass-through, PASID will also pass-through. If the
+ * device is in IOVA, the PASID will point to the same IOVA page table.
+ *
+ * @return err code or 0 on success
+ */
+int iommu_attach_dma_pasid(struct device *dev, ioasid_t *pasid)
+{
+	struct iommu_domain *dom;
+	ioasid_t id, max;
+	int ret = 0;
+
+	dom = iommu_get_domain_for_dev(dev);
+	if (!dom || !dom->ops || !dom->ops->attach_dev_pasid)
+		return -ENODEV;
+
+	/* Only support domain types that DMA API can be used */
+	if (dom->type == IOMMU_DOMAIN_UNMANAGED ||
+	    dom->type == IOMMU_DOMAIN_BLOCKED) {
+		dev_warn(dev, "Invalid domain type %d", dom->type);
+		return -EPERM;
+	}
+
+	mutex_lock(&dma_pasid_lock);
+	id = dom->dma_pasid;
+	if (!id) {
+		/*
+		 * First device to use PASID in its DMA domain, allocate
+		 * a single PASID per DMA domain is all we need, it is also
+		 * good for performance when it comes down to IOTLB flush.
+		 */
+		max = 1U << dev->iommu->pasid_bits;
+		if (!max) {
+			ret = -EINVAL;
+			goto done_unlock;
+		}
+
+		id = ioasid_alloc(&iommu_dma_pasid, 1, max, dev);
+		if (id == INVALID_IOASID) {
+			ret = -ENOMEM;
+			goto done_unlock;
+		}
+
+		dom->dma_pasid = id;
+		atomic_set(&dom->dma_pasid_users, 1);
+	}
+
+	ret = iommu_attach_device_pasid(dom, dev, id);
+	if (!ret) {
+		*pasid = id;
+		atomic_inc(&dom->dma_pasid_users);
+		goto done_unlock;
+	}
+
+	if (atomic_dec_and_test(&dom->dma_pasid_users)) {
+		ioasid_free(id);
+		dom->dma_pasid = 0;
+	}
+done_unlock:
+	mutex_unlock(&dma_pasid_lock);
+	return ret;
+}
+EXPORT_SYMBOL(iommu_attach_dma_pasid);
+
+/**
+ * iommu_detach_dma_pasid --Disable in-kernel DMA request with PASID
+ * @dev:	Device's PASID DMA to be disabled
+ *
+ * It is the device driver's responsibility to ensure no more incoming DMA
+ * requests with the kernel PASID before calling this function. IOMMU driver
+ * ensures PASID cache, IOTLBs related to the kernel PASID are cleared and
+ * drained.
+ *
+ */
+void iommu_detach_dma_pasid(struct device *dev)
+{
+	struct iommu_domain *dom;
+	ioasid_t pasid;
+
+	dom = iommu_get_domain_for_dev(dev);
+	if (WARN_ON(!dom || !dom->ops || !dom->ops->detach_dev_pasid))
+		return;
+
+	/* Only support DMA API managed domain type */
+	if (WARN_ON(dom->type == IOMMU_DOMAIN_UNMANAGED ||
+		    dom->type == IOMMU_DOMAIN_BLOCKED))
+		return;
+
+	mutex_lock(&dma_pasid_lock);
+	pasid = iommu_get_pasid_from_domain(dev, dom);
+	if (!pasid || pasid == INVALID_IOASID) {
+		dev_err(dev, "No valid DMA PASID attached\n");
+		mutex_unlock(&dma_pasid_lock);
+		return;
+	}
+	iommu_detach_device_pasid(dom, dev, pasid);
+	if (atomic_dec_and_test(&dom->dma_pasid_users)) {
+		ioasid_free(pasid);
+		dom->dma_pasid = 0;
+	}
+	mutex_unlock(&dma_pasid_lock);
+}
+EXPORT_SYMBOL(iommu_detach_dma_pasid);
+
 /**
  * iommu_dma_get_resv_regions - Reserved region driver helper
  * @dev: Device from iommu_get_resv_regions()
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 24607dc3c2ac..538650b9cb75 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -18,6 +18,9 @@ int iommu_get_dma_cookie(struct iommu_domain *domain);
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 void iommu_put_dma_cookie(struct iommu_domain *domain);
 
+int iommu_attach_dma_pasid(struct device *dev, ioasid_t *pasid);
+void iommu_detach_dma_pasid(struct device *dev);
+
 /* Setup call for arch DMA mapping code */
 void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
 int iommu_dma_init_fq(struct iommu_domain *domain);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
