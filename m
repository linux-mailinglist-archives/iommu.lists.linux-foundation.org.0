Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB71A7C88
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E97687935;
	Tue, 14 Apr 2020 13:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNC0BKNEt03G; Tue, 14 Apr 2020 13:16:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9AD6887BB1;
	Tue, 14 Apr 2020 13:16:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CB63C0172;
	Tue, 14 Apr 2020 13:16:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3898EC1D7D;
 Tue, 14 Apr 2020 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 32A0B859C1;
 Tue, 14 Apr 2020 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFvJZU5FT3Gt; Tue, 14 Apr 2020 13:16:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D04FB85D41;
 Tue, 14 Apr 2020 13:16:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 12DC670B; Tue, 14 Apr 2020 15:15:55 +0200 (CEST)
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
Subject: [PATCH v2 24/33] iommu/qcom: Convert to probe/release_device()
 call-backs
Date: Tue, 14 Apr 2020 15:15:33 +0200
Message-Id: <20200414131542.25608-25-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
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

Convert the QCOM IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/qcom_iommu.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0e2a96467767..054e476ebd49 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -524,14 +524,13 @@ static bool qcom_iommu_capable(enum iommu_cap cap)
 	}
 }
 
-static int qcom_iommu_add_device(struct device *dev)
+static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
-	struct iommu_group *group;
 	struct device_link *link;
 
 	if (!qcom_iommu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	/*
 	 * Establish the link between iommu and master, so that the
@@ -542,28 +541,19 @@ static int qcom_iommu_add_device(struct device *dev)
 	if (!link) {
 		dev_err(qcom_iommu->dev, "Unable to create device link between %s and %s\n",
 			dev_name(qcom_iommu->dev), dev_name(dev));
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
-	iommu_device_link(&qcom_iommu->iommu, dev);
-
-	return 0;
+	return &qcom_iommu->iommu;
 }
 
-static void qcom_iommu_remove_device(struct device *dev)
+static void qcom_iommu_release_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 
 	if (!qcom_iommu)
 		return;
 
-	iommu_device_unlink(&qcom_iommu->iommu, dev);
-	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
 
@@ -619,8 +609,8 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
 	.iotlb_sync	= qcom_iommu_iotlb_sync,
 	.iova_to_phys	= qcom_iommu_iova_to_phys,
-	.add_device	= qcom_iommu_add_device,
-	.remove_device	= qcom_iommu_remove_device,
+	.probe_device	= qcom_iommu_probe_device,
+	.release_device	= qcom_iommu_release_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
