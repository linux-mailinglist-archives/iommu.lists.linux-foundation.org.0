Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A256CD64
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B883260E2D;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B883260E2D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPMu1GVZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NC69bAfd4ZpN; Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7301160E33;
	Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7301160E33
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F2AEC0091;
	Sun, 10 Jul 2022 06:37:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8290CC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C27484686
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C27484686
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPMu1GVZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EYogWkTkYdy for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:06:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C628584684
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C628584684
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=gguGp9hLWChCK3dgB20UETeXgBVE6aedRQ50ynIprhI=; b=QPMu1GVZBrZRoyJh8V2BtxGXt2
 r1lzs96/6w1waRcB7Vk/OQICvIoBcjetLUdAgadqFcuBM3zqPvabB5ui8FBA8LZLiBaT5jl/K9u5c
 U93HlIKsfN31ewIgPfYBL/Hm6IzeEEk+A0gQw+Mb6I8ksgnFe9x6qQ624X4mj1EsxBw3shtWzdt+O
 XJeWD2lzHDWsz//dBxIH9RdH5OromaMYSOxmJGvdDvGy+F08WVQuxCtI/vahAa6tut0Pvm+TyWueu
 YvI9PFubwgIOkP02PhNXAVCAmt8ilVI80fquxQQd1Ye5DskeuoCylroaO1Bh1T/JcythS1Rc+lZdp
 cC5tNCew==;
Received: from [2001:4bb8:189:3c4a:86c3:3c19:e6d7:68ff] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o9j0K-002Mro-60; Fri, 08 Jul 2022 08:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Sven Peter <sven@svenpeter.dev>,
 David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 2/4] iommu: remove iommu_dev_feature_enabled
Date: Fri,  8 Jul 2022 10:06:14 +0200
Message-Id: <20220708080616.238833-3-hch@lst.de>
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

Remove the unused iommu_dev_feature_enabled function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  1 -
 drivers/iommu/iommu.c                       | 13 -------------
 include/linux/iommu.h                       |  9 ---------
 3 files changed, 23 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1b6c17dd81ee4..4d30a8d2bc236 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2853,7 +2853,6 @@ static struct iommu_ops arm_smmu_ops = {
 	.of_xlate		= arm_smmu_of_xlate,
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
-	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
 	.dev_enable_feat	= arm_smmu_dev_enable_feature,
 	.dev_disable_feat	= arm_smmu_dev_disable_feature,
 	.sva_bind		= arm_smmu_sva_bind,
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0aa141646bdf4..1bb016a6a2aa1 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2760,19 +2760,6 @@ int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features feat)
 }
 EXPORT_SYMBOL_GPL(iommu_dev_disable_feature);
 
-bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
-{
-	if (dev->iommu && dev->iommu->iommu_dev) {
-		const struct iommu_ops *ops = dev->iommu->iommu_dev->ops;
-
-		if (ops->dev_feat_enabled)
-			return ops->dev_feat_enabled(dev, feat);
-	}
-
-	return false;
-}
-EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
-
 /**
  * iommu_sva_bind_device() - Bind a process address space to a device
  * @dev: the device
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a3acdb46b9391..0bc2eb14b0262 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -215,7 +215,6 @@ struct iommu_iotlb_gather {
  *                      driver init to device driver init (default no)
  * @dev_has/enable/disable_feat: per device entries to check/enable/disable
  *                               iommu specific features.
- * @dev_feat_enabled: check enabled feature
  * @sva_bind: Bind process address space to device
  * @sva_unbind: Unbind process address space from device
  * @sva_get_pasid: Get PASID associated to a SVA handle
@@ -247,7 +246,6 @@ struct iommu_ops {
 	bool (*is_attach_deferred)(struct device *dev);
 
 	/* Per device IOMMU features */
-	bool (*dev_feat_enabled)(struct device *dev, enum iommu_dev_features f);
 	int (*dev_enable_feat)(struct device *dev, enum iommu_dev_features f);
 	int (*dev_disable_feat)(struct device *dev, enum iommu_dev_features f);
 
@@ -670,7 +668,6 @@ void iommu_release_device(struct device *dev);
 
 int iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features f);
 int iommu_dev_disable_feature(struct device *dev, enum iommu_dev_features f);
-bool iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features f);
 
 struct iommu_sva *iommu_sva_bind_device(struct device *dev,
 					struct mm_struct *mm,
@@ -997,12 +994,6 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
 	return NULL;
 }
 
-static inline bool
-iommu_dev_feature_enabled(struct device *dev, enum iommu_dev_features feat)
-{
-	return false;
-}
-
 static inline int
 iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
 {
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
