Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A824A2A306
	for <lists.iommu@lfdr.de>; Sat, 25 May 2019 07:48:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E690AC9F;
	Sat, 25 May 2019 05:48:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13994481
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:48:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 76C43A9
	for <iommu@lists.linux-foundation.org>;
	Sat, 25 May 2019 05:48:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2019 22:48:49 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga006.fm.intel.com with ESMTP; 24 May 2019 22:48:47 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v4 01/15] iommu: Add API to request DMA domain for device
Date: Sat, 25 May 2019 13:41:22 +0800
Message-Id: <20190525054136.27810-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190525054136.27810-1-baolu.lu@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
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

Normally during iommu probing a device, a default doamin will
be allocated and attached to the device. The domain type of
the default domain is statically defined, which results in a
situation where the allocated default domain isn't suitable
for the device due to some limitations. We already have API
iommu_request_dm_for_dev() to replace a DMA domain with an
identity one. This adds iommu_request_dma_domain_for_dev()
to request a dma domain if an allocated identity domain isn't
suitable for the device in question.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 36 +++++++++++++++++++++++++-----------
 include/linux/iommu.h |  6 ++++++
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c09d60401778..03ba8406d1e4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1910,10 +1910,10 @@ struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
 	return region;
 }
 
-/* Request that a device is direct mapped by the IOMMU */
-int iommu_request_dm_for_dev(struct device *dev)
+static int
+request_default_domain_for_dev(struct device *dev, unsigned long type)
 {
-	struct iommu_domain *dm_domain;
+	struct iommu_domain *domain;
 	struct iommu_group *group;
 	int ret;
 
@@ -1926,8 +1926,7 @@ int iommu_request_dm_for_dev(struct device *dev)
 
 	/* Check if the default domain is already direct mapped */
 	ret = 0;
-	if (group->default_domain &&
-	    group->default_domain->type == IOMMU_DOMAIN_IDENTITY)
+	if (group->default_domain && group->default_domain->type == type)
 		goto out;
 
 	/* Don't change mappings of existing devices */
@@ -1937,23 +1936,26 @@ int iommu_request_dm_for_dev(struct device *dev)
 
 	/* Allocate a direct mapped domain */
 	ret = -ENOMEM;
-	dm_domain = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_IDENTITY);
-	if (!dm_domain)
+	domain = __iommu_domain_alloc(dev->bus, type);
+	if (!domain)
 		goto out;
 
 	/* Attach the device to the domain */
-	ret = __iommu_attach_group(dm_domain, group);
+	ret = __iommu_attach_group(domain, group);
 	if (ret) {
-		iommu_domain_free(dm_domain);
+		iommu_domain_free(domain);
 		goto out;
 	}
 
+	iommu_group_create_direct_mappings(group, dev);
+
 	/* Make the direct mapped domain the default for this group */
 	if (group->default_domain)
 		iommu_domain_free(group->default_domain);
-	group->default_domain = dm_domain;
+	group->default_domain = domain;
 
-	dev_info(dev, "Using iommu direct mapping\n");
+	dev_info(dev, "Using iommu %s mapping\n",
+		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
 
 	ret = 0;
 out:
@@ -1963,6 +1965,18 @@ int iommu_request_dm_for_dev(struct device *dev)
 	return ret;
 }
 
+/* Request that a device is direct mapped by the IOMMU */
+int iommu_request_dm_for_dev(struct device *dev)
+{
+	return request_default_domain_for_dev(dev, IOMMU_DOMAIN_IDENTITY);
+}
+
+/* Request that a device can't be direct mapped by the IOMMU */
+int iommu_request_dma_domain_for_dev(struct device *dev)
+{
+	return request_default_domain_for_dev(dev, IOMMU_DOMAIN_DMA);
+}
+
 const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = NULL;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 14a521f85f14..593a3411d860 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -368,6 +368,7 @@ extern void iommu_set_fault_handler(struct iommu_domain *domain,
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern int iommu_request_dm_for_dev(struct device *dev);
+extern int iommu_request_dma_domain_for_dev(struct device *dev);
 extern struct iommu_resv_region *
 iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
 			enum iommu_resv_type type, gfp_t flags);
@@ -632,6 +633,11 @@ static inline int iommu_request_dm_for_dev(struct device *dev)
 	return -ENODEV;
 }
 
+static inline int iommu_request_dma_domain_for_dev(struct device *dev)
+{
+	return -ENODEV;
+}
+
 static inline int iommu_attach_group(struct iommu_domain *domain,
 				     struct iommu_group *group)
 {
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
