Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A514856CD65
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2997F4188A;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2997F4188A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GDpkuZAI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBaX5i0CuQmp; Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6431541892;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6431541892
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1155DC0082;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 522B5C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CCDA41550
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CCDA41550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9D3Bylnt5dG for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:06:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B37409AB
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8B37409AB
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6r4ozgtGLyFarfcwQbHSaLL8cQOk08Ml/U9mW1qy+zg=; b=GDpkuZAIXlVROeTnh0qwWAa8AT
 nqr7nGH36OeqY15dACiG60SabatOSlKpdAHIpBqPt2aUQTP/JIxNQ0cNeFGXTOg4Bc8OSR+H/Yl48
 /8s9neefa4PlQQZI89E0x3Wlj7aBUwZSLhifL1ivs7bgrSd6uPaZnUgcZsPvyv9cE9uv+82R+GG73
 Nau3/Uz3mNAgdB4FDlD9n/GCvhtermrqcQ8DeuA7cYNnsKYFGkttFUg7Na/+At97h5NeyvBr1vtwp
 WtzmMojpLsOI80Lz5Nr6UDsK8I0I1da6iZ0Yqg3IDlCdyrCjtTX+EqxBwOgQjyjS6JSS44EYZp+02
 p9LTxANw==;
Received: from [2001:4bb8:189:3c4a:86c3:3c19:e6d7:68ff] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o9j0N-002MtN-1c; Fri, 08 Jul 2022 08:06:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Sven Peter <sven@svenpeter.dev>,
 David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 3/4] iommu: remove the put_resv_regions method
Date: Fri,  8 Jul 2022 10:06:15 +0200
Message-Id: <20220708080616.238833-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708080616.238833-1-hch@lst.de>
References: <20220708080616.238833-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

All drivers that implement get_resv_regions just use
generic_put_resv_regions to implement the put side.  Remove the
indirections and document the allocations constraints.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/amd/iommu.c                   |  1 -
 drivers/iommu/apple-dart.c                  |  1 -
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  1 -
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  1 -
 drivers/iommu/intel/iommu.c                 |  1 -
 drivers/iommu/iommu.c                       | 21 ++++-----------------
 drivers/iommu/mtk_iommu.c                   |  1 -
 drivers/iommu/virtio-iommu.c                |  5 ++---
 include/linux/iommu.h                       |  4 ----
 9 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 840831d5d2ad9..e66e071e8c3b9 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2280,7 +2280,6 @@ const struct iommu_ops amd_iommu_ops = {
 	.probe_finalize = amd_iommu_probe_finalize,
 	.device_group = amd_iommu_device_group,
 	.get_resv_regions = amd_iommu_get_resv_regions,
-	.put_resv_regions = generic_iommu_put_resv_regions,
 	.is_attach_deferred = amd_iommu_is_attach_deferred,
 	.pgsize_bitmap	= AMD_IOMMU_PGSIZES,
 	.def_domain_type = amd_iommu_def_domain_type,
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index e87d3cf54ed68..1b17257592626 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -768,7 +768,6 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.of_xlate = apple_dart_of_xlate,
 	.def_domain_type = apple_dart_def_domain_type,
 	.get_resv_regions = apple_dart_get_resv_regions,
-	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
 	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4d30a8d2bc236..4a5e435567f17 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2852,7 +2852,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.device_group		= arm_smmu_device_group,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
-	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.dev_enable_feat	= arm_smmu_dev_enable_feature,
 	.dev_disable_feat	= arm_smmu_dev_disable_feature,
 	.sva_bind		= arm_smmu_sva_bind,
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 588929bed1bc3..2d4129a4ccfc0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1584,7 +1584,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.device_group		= arm_smmu_device_group,
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
-	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
 	.owner			= THIS_MODULE,
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 44016594831de..49d616aa21489 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4911,7 +4911,6 @@ const struct iommu_ops intel_iommu_ops = {
 	.probe_finalize		= intel_iommu_probe_finalize,
 	.release_device		= intel_iommu_release_device,
 	.get_resv_regions	= intel_iommu_get_resv_regions,
-	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.device_group		= intel_iommu_device_group,
 	.dev_enable_feat	= intel_iommu_dev_enable_feat,
 	.dev_disable_feat	= intel_iommu_dev_disable_feat,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1bb016a6a2aa1..f53f8b2d27a54 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2579,27 +2579,14 @@ void iommu_get_resv_regions(struct device *dev, struct list_head *list)
 		ops->get_resv_regions(dev, list);
 }
 
-void iommu_put_resv_regions(struct device *dev, struct list_head *list)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (ops->put_resv_regions)
-		ops->put_resv_regions(dev, list);
-}
-
 /**
- * generic_iommu_put_resv_regions - Reserved region driver helper
+ * iommu_put_resv_regions - release resered regions
  * @dev: device for which to free reserved regions
  * @list: reserved region list for device
  *
- * IOMMU drivers can use this to implement their .put_resv_regions() callback
- * for simple reservations. If a per region callback is provided that will be
- * used to free all memory allocations associated with the reserved region or
- * else just free up the memory for the regions. If an IOMMU driver allocates
- * additional resources per region, it is going to have to implement a custom
- * callback.
+ * This releases a reserved region list acquired by iommu_get_resv_regions().
  */
-void generic_iommu_put_resv_regions(struct device *dev, struct list_head *list)
+void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 {
 	struct iommu_resv_region *entry, *next;
 
@@ -2610,7 +2597,7 @@ void generic_iommu_put_resv_regions(struct device *dev, struct list_head *list)
 			kfree(entry);
 	}
 }
-EXPORT_SYMBOL(generic_iommu_put_resv_regions);
+EXPORT_SYMBOL(iommu_put_resv_regions);
 
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
 						  size_t length, int prot,
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5c3d9366c25c7..95fd21c7207a3 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -928,7 +928,6 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
 	.get_resv_regions = mtk_iommu_get_resv_regions,
-	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.owner		= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 55337796a5f82..feeb5fde72a3b 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -964,7 +964,7 @@ static struct iommu_device *viommu_probe_device(struct device *dev)
 	return &viommu->iommu;
 
 err_free_dev:
-	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
+	iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 
 	return ERR_PTR(ret);
@@ -983,7 +983,7 @@ static void viommu_release_device(struct device *dev)
 {
 	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
 
-	generic_iommu_put_resv_regions(dev, &vdev->resv_regions);
+	iommu_put_resv_regions(dev, &vdev->resv_regions);
 	kfree(vdev);
 }
 
@@ -1007,7 +1007,6 @@ static struct iommu_ops viommu_ops = {
 	.release_device		= viommu_release_device,
 	.device_group		= viommu_device_group,
 	.get_resv_regions	= viommu_get_resv_regions,
-	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.of_xlate		= viommu_of_xlate,
 	.owner			= THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 0bc2eb14b0262..ea30f00dc1459 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -209,7 +209,6 @@ struct iommu_iotlb_gather {
  *                  group and attached to the groups domain
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
- * @put_resv_regions: Free list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
  * @is_attach_deferred: Check if domain attach should be deferred from iommu
  *                      driver init to device driver init (default no)
@@ -240,7 +239,6 @@ struct iommu_ops {
 
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
-	void (*put_resv_regions)(struct device *dev, struct list_head *list);
 
 	int (*of_xlate)(struct device *dev, struct of_phandle_args *args);
 	bool (*is_attach_deferred)(struct device *dev);
@@ -454,8 +452,6 @@ extern void iommu_set_fault_handler(struct iommu_domain *domain,
 
 extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
 extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
-extern void generic_iommu_put_resv_regions(struct device *dev,
-					   struct list_head *list);
 extern void iommu_set_default_passthrough(bool cmd_line);
 extern void iommu_set_default_translated(bool cmd_line);
 extern bool iommu_default_passthrough(void);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
