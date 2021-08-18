Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0CC3F054D
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 15:52:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9C36064B;
	Wed, 18 Aug 2021 13:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5sBrCESUKeu; Wed, 18 Aug 2021 13:51:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4C9806070B;
	Wed, 18 Aug 2021 13:51:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3889CC000E;
	Wed, 18 Aug 2021 13:51:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D66ADC000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D32FD402DF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtwH8bT_wLdm for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D00D40395
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="214478872"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="214478872"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 06:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449729239"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2021 06:51:52 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 5/9] iommu/vt-d: Preset A/D bits for user space DMA usage
Date: Wed, 18 Aug 2021 21:48:48 +0800
Message-Id: <20210818134852.1847070-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
References: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

We preset the access and dirty bits for IOVA over first level usage only
for the kernel DMA (i.e., when domain type is IOMMU_DOMAIN_DMA). We should
also preset the FL A/D for user space DMA usage. The idea is that even the
user space A/D bit memory write is unnecessary. We should avoid it to
minimize the overhead.

Suggested-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210720013856.4143880-1-baolu.lu@linux.intel.com
---
 drivers/iommu/intel/iommu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 8c9a9ed7dc09..8d4d49e12c51 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2334,13 +2334,9 @@ __domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 	attr = prot & (DMA_PTE_READ | DMA_PTE_WRITE | DMA_PTE_SNP);
 	attr |= DMA_FL_PTE_PRESENT;
 	if (domain_use_first_level(domain)) {
-		attr |= DMA_FL_PTE_XD | DMA_FL_PTE_US;
-
-		if (iommu_is_dma_domain(&domain->domain)) {
-			attr |= DMA_FL_PTE_ACCESS;
-			if (prot & DMA_PTE_WRITE)
-				attr |= DMA_FL_PTE_DIRTY;
-		}
+		attr |= DMA_FL_PTE_XD | DMA_FL_PTE_US | DMA_FL_PTE_ACCESS;
+		if (prot & DMA_PTE_WRITE)
+			attr |= DMA_FL_PTE_DIRTY;
 	}
 
 	pteval = ((phys_addr_t)phys_pfn << VTD_PAGE_SHIFT) | attr;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
