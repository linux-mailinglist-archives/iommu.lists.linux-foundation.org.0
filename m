Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A56983F2CF6
	for <lists.iommu@lfdr.de>; Fri, 20 Aug 2021 15:14:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56CE7613F0;
	Fri, 20 Aug 2021 13:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWzJSt5h_5kh; Fri, 20 Aug 2021 13:14:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 550A8613E6;
	Fri, 20 Aug 2021 13:14:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F69EC0022;
	Fri, 20 Aug 2021 13:14:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC503C000E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 13:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB02A40194
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 13:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btFdP-1n7K5O for <iommu@lists.linux-foundation.org>;
 Fri, 20 Aug 2021 13:14:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id D62AA4011A
 for <iommu@lists.linux-foundation.org>; Fri, 20 Aug 2021 13:14:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC59811FB;
 Fri, 20 Aug 2021 06:14:49 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BC8713F66F;
 Fri, 20 Aug 2021 06:14:48 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	joro@8bytes.org
Subject: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
Date: Fri, 20 Aug 2021 14:14:42 +0100
Message-Id: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
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

Previously io-pgtable merely passed the iommu_iotlb_gather pointer
through to helpers, but now it has grown its own direct dereference.
This turns out to break the build for !IOMMU_API configs where the
structure only has a dummy definition. It will probably also crash
drivers who don't use the gather mechanism and simply pass in NULL.

Wrap this dereference in a suitable helper which can both be stubbed
out for !IOMMU_API and encapsulate a NULL check otherwise.

Fixes: 7a7c5badf858 ("iommu: Indicate queued flushes via gather data")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c |  2 +-
 drivers/iommu/io-pgtable-arm.c     |  2 +-
 include/linux/iommu.h              | 10 ++++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index e84478d39705..bfb6acb651e5 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -700,7 +700,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
 						ARM_V7S_BLOCK_SIZE(lvl + 1));
 				ptep = iopte_deref(pte[i], lvl, data);
 				__arm_v7s_free_table(ptep, lvl + 1, data);
-			} else if (!gather->queued) {
+			} else if (!iommu_iotlb_gather_queued(gather)) {
 				io_pgtable_tlb_add_page(iop, gather, iova, blk_size);
 			}
 			iova += blk_size;
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 9e3beace0470..dd9e47189d0d 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -650,7 +650,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 				io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
 							  ARM_LPAE_GRANULE(data));
 				__arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
-			} else if (!gather->queued) {
+			} else if (!iommu_iotlb_gather_queued(gather)) {
 				io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
 			}
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e7581c39f2df..6633040a13f9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -594,6 +594,11 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 	iommu_iotlb_gather_add_range(gather, iova, size);
 }
 
+static inline bool iommu_iotlb_gather_queued(struct iommu_iotlb_gather *gather)
+{
+	return gather && gather->queued;
+}
+
 /* PCI device grouping function */
 extern struct iommu_group *pci_device_group(struct device *dev);
 /* Generic device grouping function */
@@ -942,6 +947,11 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 {
 }
 
+static inline bool iommu_iotlb_gather_queued(struct iommu_iotlb_gather *gather)
+{
+	return false;
+}
+
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
