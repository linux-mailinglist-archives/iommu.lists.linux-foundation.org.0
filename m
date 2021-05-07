Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE2376392
	for <lists.iommu@lfdr.de>; Fri,  7 May 2021 12:22:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B8F406A1;
	Fri,  7 May 2021 10:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4XyAawjEywX; Fri,  7 May 2021 10:22:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4705406AE;
	Fri,  7 May 2021 10:22:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9D2AC0001;
	Fri,  7 May 2021 10:22:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DB09C0001
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 10:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5694160E2C
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 10:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W88Qyt_LcvXz for <iommu@lists.linux-foundation.org>;
 Fri,  7 May 2021 10:22:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF3A60E50
 for <iommu@lists.linux-foundation.org>; Fri,  7 May 2021 10:22:51 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Fc5zw4crwzCr7C;
 Fri,  7 May 2021 18:20:12 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.224) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 7 May 2021 18:22:38 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "Will Deacon" <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, "Yi Sun" <yi.y.sun@linux.intel.com>, Tian Kevin
 <kevin.tian@intel.com>
Subject: [RFC PATCH v4 09/13] iommu/arm-smmu-v3: Add feature detection for BBML
Date: Fri, 7 May 2021 18:22:07 +0800
Message-ID: <20210507102211.8836-10-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210507102211.8836-1-zhukeqian1@huawei.com>
References: <20210507102211.8836-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.224]
X-CFilter-Loop: Reflected
Cc: jiangkunkun@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, lushenming@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

This detects BBML feature and if SMMU supports it, transfer BBMLx
quirk to io-pgtable.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 19 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c42e59655fd0..3a2dc3177180 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2051,6 +2051,11 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 	if (smmu->features & ARM_SMMU_FEAT_HD)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_HD;
 
+	if (smmu->features & ARM_SMMU_FEAT_BBML1)
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_BBML1;
+	else if (smmu->features & ARM_SMMU_FEAT_BBML2)
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_ARM_BBML2;
+
 	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
 	if (!pgtbl_ops)
 		return -ENOMEM;
@@ -3419,6 +3424,20 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	/* IDR3 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
+	switch (FIELD_GET(IDR3_BBML, reg)) {
+	case IDR3_BBML0:
+		break;
+	case IDR3_BBML1:
+		smmu->features |= ARM_SMMU_FEAT_BBML1;
+		break;
+	case IDR3_BBML2:
+		smmu->features |= ARM_SMMU_FEAT_BBML2;
+		break;
+	default:
+		dev_err(smmu->dev, "unknown/unsupported BBM behavior level\n");
+		return -ENXIO;
+	}
+
 	if (FIELD_GET(IDR3_RIL, reg))
 		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 3edcd31b046e..e3b6bdd292c9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -54,6 +54,10 @@
 #define IDR1_SIDSIZE			GENMASK(5, 0)
 
 #define ARM_SMMU_IDR3			0xc
+#define IDR3_BBML			GENMASK(12, 11)
+#define IDR3_BBML0			0
+#define IDR3_BBML1			1
+#define IDR3_BBML2			2
 #define IDR3_RIL			(1 << 10)
 
 #define ARM_SMMU_IDR5			0x14
@@ -613,6 +617,8 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_E2H		(1 << 18)
 #define ARM_SMMU_FEAT_HA		(1 << 19)
 #define ARM_SMMU_FEAT_HD		(1 << 20)
+#define ARM_SMMU_FEAT_BBML1		(1 << 21)
+#define ARM_SMMU_FEAT_BBML2		(1 << 22)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
