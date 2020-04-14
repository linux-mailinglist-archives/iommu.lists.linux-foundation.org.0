Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5C1A7C5F
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 354D120784;
	Tue, 14 Apr 2020 13:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqoLTkL700+W; Tue, 14 Apr 2020 13:16:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A632C20785;
	Tue, 14 Apr 2020 13:16:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93B57C1D7D;
	Tue, 14 Apr 2020 13:16:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FF45C0172;
 Tue, 14 Apr 2020 13:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 783CF87A12;
 Tue, 14 Apr 2020 13:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mw84CLkyMbGE; Tue, 14 Apr 2020 13:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DBA42879FF;
 Tue, 14 Apr 2020 13:16:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 31ED54F2; Tue, 14 Apr 2020 15:15:53 +0200 (CEST)
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
Subject: [PATCH v2 10/33] iommu: Move new probe_device path to separate
 function
Date: Tue, 14 Apr 2020 15:15:19 +0200
Message-Id: <20200414131542.25608-11-joro@8bytes.org>
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

This makes it easier to remove to old code-path when all drivers are
converted. As a side effect that it also fixes the error cleanup
path.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 69 ++++++++++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 18eb3623bd00..8be047a4808f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -218,12 +218,55 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	return ret;
 }
 
+static int __iommu_probe_device_helper(struct device *dev)
+{
+	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	struct iommu_group *group;
+	int ret;
+
+	ret = __iommu_probe_device(dev, NULL);
+	if (ret)
+		goto err_out;
+
+	/*
+	 * Try to allocate a default domain - needs support from the
+	 * IOMMU driver. There are still some drivers which don't
+	 * support default domains, so the return value is not yet
+	 * checked.
+	 */
+	iommu_alloc_default_domain(dev);
+
+	group = iommu_group_get(dev);
+	if (!group)
+		goto err_release;
+
+	if (group->default_domain)
+		ret = __iommu_attach_device(group->default_domain, dev);
+
+	iommu_group_put(group);
+
+	if (ret)
+		goto err_release;
+
+	if (ops->probe_finalize)
+		ops->probe_finalize(dev);
+
+	return 0;
+
+err_release:
+	iommu_release_device(dev);
+err_out:
+	return ret;
+
+}
+
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	int ret;
 
 	WARN_ON(dev->iommu_group);
+
 	if (!ops)
 		return -EINVAL;
 
@@ -235,30 +278,10 @@ int iommu_probe_device(struct device *dev)
 		goto err_free_dev_param;
 	}
 
-	if (ops->probe_device) {
-		struct iommu_group *group;
-
-		ret = __iommu_probe_device(dev, NULL);
-
-		/*
-		 * Try to allocate a default domain - needs support from the
-		 * IOMMU driver. There are still some drivers which don't
-		 * support default domains, so the return value is not yet
-		 * checked.
-		 */
-		if (!ret)
-			iommu_alloc_default_domain(dev);
-
-		group = iommu_group_get(dev);
-		if (group && group->default_domain) {
-			ret = __iommu_attach_device(group->default_domain, dev);
-			iommu_group_put(group);
-		}
-
-	} else {
-		ret = ops->add_device(dev);
-	}
+	if (ops->probe_device)
+		return __iommu_probe_device_helper(dev);
 
+	ret = ops->add_device(dev);
 	if (ret)
 		goto err_module_put;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
