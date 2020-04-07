Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E91A1436
	for <lists.iommu@lfdr.de>; Tue,  7 Apr 2020 20:38:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02750221C6;
	Tue,  7 Apr 2020 18:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojcqg28Orr7v; Tue,  7 Apr 2020 18:38:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7F018221D5;
	Tue,  7 Apr 2020 18:38:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78477C0177;
	Tue,  7 Apr 2020 18:38:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AE56C1AE2;
 Tue,  7 Apr 2020 18:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 078A08796B;
 Tue,  7 Apr 2020 18:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52lsG9pLY6Yq; Tue,  7 Apr 2020 18:38:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A41B287BE0;
 Tue,  7 Apr 2020 18:37:58 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DA73D455; Tue,  7 Apr 2020 20:37:50 +0200 (CEST)
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
Subject: [RFC PATCH 13/34] iommu: Export bus_iommu_probe() and make is safe
 for re-probing
Date: Tue,  7 Apr 2020 20:37:21 +0200
Message-Id: <20200407183742.4344-14-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
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

Add a check to the bus_iommu_probe() call-path to make sure it ignores
devices which have already been successfully probed. Then export the
bus_iommu_probe() function so it can be used by IOMMU drivers.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 6 +++++-
 include/linux/iommu.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 844613850595..cf25c1e48830 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1615,6 +1615,10 @@ static int probe_iommu_group(struct device *dev, void *data)
 	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
+	/* Device is probed already if in a group */
+	if (iommu_group_get(dev) != NULL)
+		return 0;
+
 	if (!try_module_get(ops->owner)) {
 		ret = -EINVAL;
 		goto err_free_dev_iommu;
@@ -1783,7 +1787,7 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group)
 					  iommu_do_create_direct_mappings);
 }
 
-static int bus_iommu_probe(struct bus_type *bus)
+int bus_iommu_probe(struct bus_type *bus)
 {
 	const struct iommu_ops *ops = bus->iommu_ops;
 	int ret;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 30170d191e5e..fea1622408ad 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -445,6 +445,7 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 #define IOMMU_GROUP_NOTIFY_UNBOUND_DRIVER	6 /* Post Driver unbind */
 
 extern int bus_set_iommu(struct bus_type *bus, const struct iommu_ops *ops);
+extern int bus_iommu_probe(struct bus_type *bus);
 extern bool iommu_present(struct bus_type *bus);
 extern bool iommu_capable(struct bus_type *bus, enum iommu_cap cap);
 extern struct iommu_domain *iommu_domain_alloc(struct bus_type *bus);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
