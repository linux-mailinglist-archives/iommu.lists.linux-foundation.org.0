Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954D56CD6A
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882858140F;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882858140F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOIH7Tio
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id av_Y3LX7o8DB; Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9B8AA813C7;
	Sun, 10 Jul 2022 06:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B8AA813C7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A315C0081;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0BC8C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB99F60B1B
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB99F60B1B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOIH7Tio
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z_Bxr3RPk9eB for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 08:06:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA78607B0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DA78607B0
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=H91OpEd1hOjPedV56oojfMmSHITnsiuMMxrv8EhylLc=; b=wOIH7TioI/nmyrUdirueCY9HED
 tWK26W1ovDXN+W6l96XNTmV3wXaa97vGJILg19Ysq78tl8c+spOuvHLeTO3CsLFTI/DtpFYBG5nMw
 28qBSg++/lk88xDVk9FS55Phut4sHWAv6vTKcNVgcPS9gdJj94axy7PMX8QJ7nNTMisbpJCezJ4TP
 AeBbhnDHRTn5riILaW005JyC8OEl8xghPHB5WFgH+aT+JhTzD3mmZftySdHRb64jQNNMjLMjUlMdi
 EamsCw5w3oePMBS7zdr7eSobsgzsKuS/GGCmvyK0SqgwhvVfCCSYmKViDB/0/KQZsXCfC2jk+hDCG
 FFwvbFYg==;
Received: from [2001:4bb8:189:3c4a:86c3:3c19:e6d7:68ff] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o9j0P-002MuY-SQ; Fri, 08 Jul 2022 08:06:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Sven Peter <sven@svenpeter.dev>,
 David Woodhouse <dwmw2@infradead.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 4/4] iommu/arm-smmu-v3: cleanup arm_smmu_dev_{enable,
 disable}_feature
Date: Fri,  8 Jul 2022 10:06:16 +0200
Message-Id: <20220708080616.238833-5-hch@lst.de>
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

Fold the arm_smmu_dev_has_feature arm_smmu_dev_feature_enabled into
the main methods.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 55 ++++++---------------
 1 file changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 4a5e435567f17..d32b02336411d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2765,58 +2765,27 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	iommu_dma_get_resv_regions(dev, head);
 }
 
-static bool arm_smmu_dev_has_feature(struct device *dev,
-				     enum iommu_dev_features feat)
-{
-	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
-
-	if (!master)
-		return false;
-
-	switch (feat) {
-	case IOMMU_DEV_FEAT_IOPF:
-		return arm_smmu_master_iopf_supported(master);
-	case IOMMU_DEV_FEAT_SVA:
-		return arm_smmu_master_sva_supported(master);
-	default:
-		return false;
-	}
-}
-
-static bool arm_smmu_dev_feature_enabled(struct device *dev,
-					 enum iommu_dev_features feat)
-{
-	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
-
-	if (!master)
-		return false;
-
-	switch (feat) {
-	case IOMMU_DEV_FEAT_IOPF:
-		return master->iopf_enabled;
-	case IOMMU_DEV_FEAT_SVA:
-		return arm_smmu_master_sva_enabled(master);
-	default:
-		return false;
-	}
-}
-
 static int arm_smmu_dev_enable_feature(struct device *dev,
 				       enum iommu_dev_features feat)
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	if (!arm_smmu_dev_has_feature(dev, feat))
+	if (!master)
 		return -ENODEV;
 
-	if (arm_smmu_dev_feature_enabled(dev, feat))
-		return -EBUSY;
-
 	switch (feat) {
 	case IOMMU_DEV_FEAT_IOPF:
+		if (!arm_smmu_master_iopf_supported(master))
+			return -EINVAL;
+		if (master->iopf_enabled)
+			return -EBUSY;
 		master->iopf_enabled = true;
 		return 0;
 	case IOMMU_DEV_FEAT_SVA:
+		if (!arm_smmu_master_sva_supported(master))
+			return -EINVAL;
+		if (arm_smmu_master_sva_enabled(master))
+			return -EBUSY;
 		return arm_smmu_master_enable_sva(master);
 	default:
 		return -EINVAL;
@@ -2828,16 +2797,20 @@ static int arm_smmu_dev_disable_feature(struct device *dev,
 {
 	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
 
-	if (!arm_smmu_dev_feature_enabled(dev, feat))
+	if (!master)
 		return -EINVAL;
 
 	switch (feat) {
 	case IOMMU_DEV_FEAT_IOPF:
+		if (!master->iopf_enabled)
+			return -EINVAL;
 		if (master->sva_enabled)
 			return -EBUSY;
 		master->iopf_enabled = false;
 		return 0;
 	case IOMMU_DEV_FEAT_SVA:
+		if (!arm_smmu_master_sva_enabled(master))
+			return -EINVAL;
 		return arm_smmu_master_disable_sva(master);
 	default:
 		return -EINVAL;
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
