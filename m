Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF85209F28
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 15:08:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B5F3887D3;
	Thu, 25 Jun 2020 13:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjUf8u64tjbu; Thu, 25 Jun 2020 13:08:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 088C7884CD;
	Thu, 25 Jun 2020 13:08:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00217C016F;
	Thu, 25 Jun 2020 13:08:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D593AC08A5
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CB581230BD
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K+7wvO2fp1L6 for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 0BA8D230F6
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 821AE412; Thu, 25 Jun 2020 15:08:38 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 04/13] iommu/omap: Use dev_iommu_priv_get/set()
Date: Thu, 25 Jun 2020 15:08:27 +0200
Message-Id: <20200625130836.1916-5-joro@8bytes.org>
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
 drivers/iommu/omap-iommu.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index c8282cc212cb..e84ead6fb234 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -71,7 +71,7 @@ static struct omap_iommu_domain *to_omap_domain(struct iommu_domain *dom)
  **/
 void omap_iommu_save_ctx(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu *obj;
 	u32 *p;
 	int i;
@@ -101,7 +101,7 @@ EXPORT_SYMBOL_GPL(omap_iommu_save_ctx);
  **/
 void omap_iommu_restore_ctx(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu *obj;
 	u32 *p;
 	int i;
@@ -1398,7 +1398,7 @@ static size_t omap_iommu_unmap(struct iommu_domain *domain, unsigned long da,
 
 static int omap_iommu_count(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	int count = 0;
 
 	while (arch_data->iommu_dev) {
@@ -1459,8 +1459,8 @@ static void omap_iommu_detach_fini(struct omap_iommu_domain *odomain)
 static int
 omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
 	struct omap_iommu_device *iommu;
 	struct omap_iommu *oiommu;
 	int ret = 0;
@@ -1524,7 +1524,7 @@ omap_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 				   struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct omap_iommu_device *iommu = omap_domain->iommus;
 	struct omap_iommu *oiommu;
 	int i;
@@ -1650,7 +1650,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 	int num_iommus, i;
 
 	/*
-	 * Allocate the archdata iommu structure for DT-based devices.
+	 * Allocate the per-device iommu structure for DT-based devices.
 	 *
 	 * TODO: Simplify this when removing non-DT support completely from the
 	 * IOMMU users.
@@ -1698,7 +1698,7 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 		of_node_put(np);
 	}
 
-	dev->archdata.iommu = arch_data;
+	dev_iommu_priv_set(dev, arch_data);
 
 	/*
 	 * use the first IOMMU alone for the sysfs device linking.
@@ -1712,19 +1712,19 @@ static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 
 static void omap_iommu_release_device(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 
 	if (!dev->of_node || !arch_data)
 		return;
 
-	dev->archdata.iommu = NULL;
+	dev_iommu_priv_set(dev, NULL);
 	kfree(arch_data);
 
 }
 
 static struct iommu_group *omap_iommu_device_group(struct device *dev)
 {
-	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
+	struct omap_iommu_arch_data *arch_data = dev_iommu_priv_get(dev);
 	struct iommu_group *group = ERR_PTR(-EINVAL);
 
 	if (!arch_data)
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
