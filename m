Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E0583209F27
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 15:08:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A461C230FE;
	Thu, 25 Jun 2020 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlZICTHWUEX0; Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9CD77231A0;
	Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BE38C088E;
	Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C39DC016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5B753854D7
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQrOSBoCrXFn for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B85278565B
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0044846A; Thu, 25 Jun 2020 15:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 06/13] iommu/tegra: Use dev_iommu_priv_get/set()
Date: Thu, 25 Jun 2020 15:08:29 +0200
Message-Id: <20200625130836.1916-7-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625130836.1916-1-joro@8bytes.org>
References: <20200625130836.1916-1-joro@8bytes.org>
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>
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

Remove the use of dev->archdata.iommu and use the private per-device
pointer provided by IOMMU core code instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/tegra-gart.c | 8 ++++----
 drivers/iommu/tegra-smmu.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index 5fbdff6ff41a..fac720273889 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -113,8 +113,8 @@ static int gart_iommu_attach_dev(struct iommu_domain *domain,
 
 	if (gart->active_domain && gart->active_domain != domain) {
 		ret = -EBUSY;
-	} else if (dev->archdata.iommu != domain) {
-		dev->archdata.iommu = domain;
+	} else if (dev_iommu_priv_get(dev) != domain) {
+		dev_iommu_priv_set(dev, domain);
 		gart->active_domain = domain;
 		gart->active_devices++;
 	}
@@ -131,8 +131,8 @@ static void gart_iommu_detach_dev(struct iommu_domain *domain,
 
 	spin_lock(&gart->dom_lock);
 
-	if (dev->archdata.iommu == domain) {
-		dev->archdata.iommu = NULL;
+	if (dev_iommu_priv_get(dev) == domain) {
+		dev_iommu_priv_set(dev, NULL);
 
 		if (--gart->active_devices == 0)
 			gart->active_domain = NULL;
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7426b7666e2b..124c8848ab7e 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -465,7 +465,7 @@ static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 				 struct device *dev)
 {
-	struct tegra_smmu *smmu = dev->archdata.iommu;
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -780,7 +780,7 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 			 * supported by the Linux kernel, so abort after the
 			 * first match.
 			 */
-			dev->archdata.iommu = smmu;
+			dev_iommu_priv_set(dev, smmu);
 
 			break;
 		}
@@ -797,7 +797,7 @@ static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 
 static void tegra_smmu_release_device(struct device *dev)
 {
-	dev->archdata.iommu = NULL;
+	dev_iommu_priv_set(dev, NULL);
 }
 
 static const struct tegra_smmu_group_soc *
@@ -856,7 +856,7 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 static struct iommu_group *tegra_smmu_device_group(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu *smmu = dev->archdata.iommu;
+	struct tegra_smmu *smmu = dev_iommu_priv_get(dev);
 	struct iommu_group *group;
 
 	group = tegra_smmu_group_get(smmu, fwspec->ids[0]);
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
