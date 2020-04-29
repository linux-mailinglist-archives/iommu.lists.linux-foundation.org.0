Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 291861BDDE6
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 15:38:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD95A86A59;
	Wed, 29 Apr 2020 13:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wx5pq_Fqtoo2; Wed, 29 Apr 2020 13:37:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ADD7D86A37;
	Wed, 29 Apr 2020 13:37:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6D72C0864;
	Wed, 29 Apr 2020 13:37:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35E5EC0172;
 Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 312E1883F5;
 Wed, 29 Apr 2020 13:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oy-quo0iGmyr; Wed, 29 Apr 2020 13:37:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 95846883E0;
 Wed, 29 Apr 2020 13:37:49 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DF0ACECD; Wed, 29 Apr 2020 15:37:38 +0200 (CEST)
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
Subject: [PATCH v3 19/34] iommu/s390: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:36:57 +0200
Message-Id: <20200429133712.31431-20-joro@8bytes.org>
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

Convert the S390 IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/s390-iommu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 1137f3ddcb85..610f0828f22d 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -166,21 +166,14 @@ static void s390_iommu_detach_device(struct iommu_domain *domain,
 	}
 }
 
-static int s390_iommu_add_device(struct device *dev)
+static struct iommu_device *s390_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group = iommu_group_get_for_dev(dev);
 	struct zpci_dev *zdev = to_pci_dev(dev)->sysdata;
 
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
-	iommu_device_link(&zdev->iommu_dev, dev);
-
-	return 0;
+	return &zdev->iommu_dev;
 }
 
-static void s390_iommu_remove_device(struct device *dev)
+static void s390_iommu_release_device(struct device *dev)
 {
 	struct zpci_dev *zdev = to_pci_dev(dev)->sysdata;
 	struct iommu_domain *domain;
@@ -191,7 +184,7 @@ static void s390_iommu_remove_device(struct device *dev)
 	 * to vfio-pci and completing the VFIO_SET_IOMMU ioctl (which triggers
 	 * the attach_dev), removing the device via
 	 * "echo 1 > /sys/bus/pci/devices/.../remove" won't trigger detach_dev,
-	 * only remove_device will be called via the BUS_NOTIFY_REMOVED_DEVICE
+	 * only release_device will be called via the BUS_NOTIFY_REMOVED_DEVICE
 	 * notifier.
 	 *
 	 * So let's call detach_dev from here if it hasn't been called before.
@@ -201,9 +194,6 @@ static void s390_iommu_remove_device(struct device *dev)
 		if (domain)
 			s390_iommu_detach_device(domain, dev);
 	}
-
-	iommu_device_unlink(&zdev->iommu_dev, dev);
-	iommu_group_remove_device(dev);
 }
 
 static int s390_iommu_update_trans(struct s390_domain *s390_domain,
@@ -373,8 +363,8 @@ static const struct iommu_ops s390_iommu_ops = {
 	.map = s390_iommu_map,
 	.unmap = s390_iommu_unmap,
 	.iova_to_phys = s390_iommu_iova_to_phys,
-	.add_device = s390_iommu_add_device,
-	.remove_device = s390_iommu_remove_device,
+	.probe_device = s390_iommu_probe_device,
+	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = S390_IOMMU_PGSIZES,
 };
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
