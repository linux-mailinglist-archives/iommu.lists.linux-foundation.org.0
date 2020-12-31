Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD52E7D88
	for <lists.iommu@lfdr.de>; Thu, 31 Dec 2020 02:01:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48143873A9;
	Thu, 31 Dec 2020 01:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9LqulCfjXd8; Thu, 31 Dec 2020 01:01:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D2CB873A5;
	Thu, 31 Dec 2020 01:01:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38B58C013A;
	Thu, 31 Dec 2020 01:01:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59DE8C013A
 for <iommu@lists.linux-foundation.org>; Thu, 31 Dec 2020 01:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 382F12E0E9
 for <iommu@lists.linux-foundation.org>; Thu, 31 Dec 2020 01:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZnpEtAmkORP for <iommu@lists.linux-foundation.org>;
 Thu, 31 Dec 2020 01:01:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 4179A2E0E4
 for <iommu@lists.linux-foundation.org>; Thu, 31 Dec 2020 01:01:32 +0000 (UTC)
IronPort-SDR: qpjCZ7Ojsl9C8mz2mYlX8PA3xmuwZKwXoe3yujAEhIDn2iJPrIHeWX2RtCgB32WIqmKAm3ATpW
 8vOMZ0y2dgfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="176754128"
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; d="scan'208";a="176754128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2020 17:01:31 -0800
IronPort-SDR: HfdAZnglGbI/Th0VZeMQpjJL1gRX6ChZ9Gk0rhtYaHUnupDsyAJDH/R61ZkfJmnbXmO6WBEiRG
 yX+o02/zdYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; d="scan'208";a="460676251"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2020 17:01:27 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 4/5] Revert "iommu: Add quirk for Intel graphic devices in
 map_sg"
Date: Thu, 31 Dec 2020 08:53:22 +0800
Message-Id: <20201231005323.2178523-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
References: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Guo Kaijie <Kaijie.Guo@intel.com>,
 Logan Gunthorpe <logang@deltatee.com>
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

This reverts commit 65f746e8285f0a67d43517d86fedb9e29ead49f2.

As commit 8a473dbadccfc ("drm/i915: Fix DMA mapped scatterlist walks") and
commit 934941ed5a307 ("drm/i915: Fix DMA mapped scatterlist lookup") fixed
the DMA scatterlist limitations in the i915 driver, remove this temporary
workaround.

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Tom Murphy <murphyt7@tcd.ie>
Cc: Logan Gunthorpe <logang@deltatee.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/dma-iommu.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f0305e6aac1b..4078358ed66e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -863,33 +863,6 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 	unsigned int cur_len = 0, max_len = dma_get_max_seg_size(dev);
 	int i, count = 0;
 
-	/*
-	 * The Intel graphic driver is used to assume that the returned
-	 * sg list is not combound. This blocks the efforts of converting
-	 * Intel IOMMU driver to dma-iommu api's. Add this quirk to make the
-	 * device driver work and should be removed once it's fixed in i915
-	 * driver.
-	 */
-	if (IS_ENABLED(CONFIG_DRM_I915) && dev_is_pci(dev) &&
-	    to_pci_dev(dev)->vendor == PCI_VENDOR_ID_INTEL &&
-	    (to_pci_dev(dev)->class >> 16) == PCI_BASE_CLASS_DISPLAY) {
-		for_each_sg(sg, s, nents, i) {
-			unsigned int s_iova_off = sg_dma_address(s);
-			unsigned int s_length = sg_dma_len(s);
-			unsigned int s_iova_len = s->length;
-
-			s->offset += s_iova_off;
-			s->length = s_length;
-			sg_dma_address(s) = dma_addr + s_iova_off;
-			sg_dma_len(s) = s_length;
-			dma_addr += s_iova_len;
-
-			pr_info_once("sg combining disabled due to i915 driver\n");
-		}
-
-		return nents;
-	}
-
 	for_each_sg(sg, s, nents, i) {
 		/* Restore this segment's original unaligned fields first */
 		unsigned int s_iova_off = sg_dma_address(s);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
