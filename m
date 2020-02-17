Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F85A161BBE
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 20:39:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B613584B26;
	Mon, 17 Feb 2020 19:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVi9ToPF9cwV; Mon, 17 Feb 2020 19:39:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F64884B80;
	Mon, 17 Feb 2020 19:39:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15A6EC1D89;
	Mon, 17 Feb 2020 19:39:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A88F5C089F
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 19:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5C5186D51
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 19:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2ARDNiyMZ6s for <iommu@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 19:39:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3276486CD3
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 19:39:10 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3973D608; Mon, 17 Feb 2020 20:39:07 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 4/5] iommu/vt-d: Remove deferred_attach_domain()
Date: Mon, 17 Feb 2020 20:38:57 +0100
Message-Id: <20200217193858.26990-5-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217193858.26990-1-joro@8bytes.org>
References: <20200217193858.26990-1-joro@8bytes.org>
Cc: jroedel@suse.de, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

The function is now only a wrapper around find_domain(). Remove the
function and call find_domain() directly at the call-sites.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/intel-iommu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 32f43695a22b..16e47ca505eb 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2539,11 +2539,6 @@ static void do_deferred_attach(struct device *dev)
 		intel_iommu_attach_device(domain, dev);
 }
 
-static struct dmar_domain *deferred_attach_domain(struct device *dev)
-{
-	return find_domain(dev);
-}
-
 static inline struct device_domain_info *
 dmar_search_domain_by_dev_info(int segment, int bus, int devfn)
 {
@@ -3643,7 +3638,7 @@ static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
 
 	BUG_ON(dir == DMA_NONE);
 
-	domain = deferred_attach_domain(dev);
+	domain = find_domain(dev);
 	if (!domain)
 		return DMA_MAPPING_ERROR;
 
@@ -3863,7 +3858,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	if (!iommu_need_mapping(dev))
 		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
-	domain = deferred_attach_domain(dev);
+	domain = find_domain(dev);
 	if (!domain)
 		return 0;
 
@@ -3958,7 +3953,7 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	int prot = 0;
 	int ret;
 
-	domain = deferred_attach_domain(dev);
+	domain = find_domain(dev);
 	if (WARN_ON(dir == DMA_NONE || !domain))
 		return DMA_MAPPING_ERROR;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
