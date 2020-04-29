Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FC1BDE05
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 15:38:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8478878DD;
	Wed, 29 Apr 2020 13:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKx3MMBpmsUw; Wed, 29 Apr 2020 13:38:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C64E87A68;
	Wed, 29 Apr 2020 13:38:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79D7DC0172;
	Wed, 29 Apr 2020 13:38:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FCABC088C;
 Wed, 29 Apr 2020 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C025883E4;
 Wed, 29 Apr 2020 13:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMVKfVK-Uguw; Wed, 29 Apr 2020 13:37:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DE831883F5;
 Wed, 29 Apr 2020 13:37:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7A310F07; Wed, 29 Apr 2020 15:37:40 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 27/34] iommu/renesas: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:37:05 +0200
Message-Id: <20200429133712.31431-28-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com
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

From: Joerg Roedel <jroedel@suse.de>

Convert the Renesas IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/ipmmu-vmsa.c | 60 +++++++++++++-------------------------
 1 file changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 310cf09feea3..fb7e702dee23 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -805,24 +805,8 @@ static int ipmmu_of_xlate(struct device *dev,
 static int ipmmu_init_arm_mapping(struct device *dev)
 {
 	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
-	struct iommu_group *group;
 	int ret;
 
-	/* Create a device group and add the device to it. */
-	group = iommu_group_alloc();
-	if (IS_ERR(group)) {
-		dev_err(dev, "Failed to allocate IOMMU group\n");
-		return PTR_ERR(group);
-	}
-
-	ret = iommu_group_add_device(group, dev);
-	iommu_group_put(group);
-
-	if (ret < 0) {
-		dev_err(dev, "Failed to add device to IPMMU group\n");
-		return ret;
-	}
-
 	/*
 	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
 	 * VAs. This will allocate a corresponding IOMMU domain.
@@ -856,48 +840,39 @@ static int ipmmu_init_arm_mapping(struct device *dev)
 	return 0;
 
 error:
-	iommu_group_remove_device(dev);
 	if (mmu->mapping)
 		arm_iommu_release_mapping(mmu->mapping);
 
 	return ret;
 }
 
-static int ipmmu_add_device(struct device *dev)
+static struct iommu_device *ipmmu_probe_device(struct device *dev)
 {
 	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
-	struct iommu_group *group;
-	int ret;
 
 	/*
 	 * Only let through devices that have been verified in xlate()
 	 */
 	if (!mmu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
-	if (IS_ENABLED(CONFIG_ARM) && !IS_ENABLED(CONFIG_IOMMU_DMA)) {
-		ret = ipmmu_init_arm_mapping(dev);
-		if (ret)
-			return ret;
-	} else {
-		group = iommu_group_get_for_dev(dev);
-		if (IS_ERR(group))
-			return PTR_ERR(group);
+	return &mmu->iommu;
+}
 
-		iommu_group_put(group);
-	}
+static void ipmmu_probe_finalize(struct device *dev)
+{
+	int ret = 0;
 
-	iommu_device_link(&mmu->iommu, dev);
-	return 0;
+	if (IS_ENABLED(CONFIG_ARM) && !IS_ENABLED(CONFIG_IOMMU_DMA))
+		ret = ipmmu_init_arm_mapping(dev);
+
+	if (ret)
+		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }
 
-static void ipmmu_remove_device(struct device *dev)
+static void ipmmu_release_device(struct device *dev)
 {
-	struct ipmmu_vmsa_device *mmu = to_ipmmu(dev);
-
-	iommu_device_unlink(&mmu->iommu, dev);
 	arm_iommu_detach_device(dev);
-	iommu_group_remove_device(dev);
 }
 
 static struct iommu_group *ipmmu_find_group(struct device *dev)
@@ -925,9 +900,14 @@ static const struct iommu_ops ipmmu_ops = {
 	.flush_iotlb_all = ipmmu_flush_iotlb_all,
 	.iotlb_sync = ipmmu_iotlb_sync,
 	.iova_to_phys = ipmmu_iova_to_phys,
-	.add_device = ipmmu_add_device,
-	.remove_device = ipmmu_remove_device,
+	.probe_device = ipmmu_probe_device,
+	.release_device = ipmmu_release_device,
+	.probe_finalize = ipmmu_probe_finalize,
+#if defined(CONFIG_ARM) && !defined(CONFIG_IOMMU_DMA)
+	.device_group = generic_device_group,
+#else
 	.device_group = ipmmu_find_group,
+#endif
 	.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K,
 	.of_xlate = ipmmu_of_xlate,
 };
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
