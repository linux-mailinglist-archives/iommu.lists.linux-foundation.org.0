Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 699834B7DF7
	for <lists.iommu@lfdr.de>; Wed, 16 Feb 2022 03:54:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E168540647;
	Wed, 16 Feb 2022 02:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69_GED_ATKXI; Wed, 16 Feb 2022 02:54:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B6DF408BF;
	Wed, 16 Feb 2022 02:54:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53009C000B;
	Wed, 16 Feb 2022 02:54:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A93BC000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B91D41582
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_EBQRoG3V9k for <iommu@lists.linux-foundation.org>;
 Wed, 16 Feb 2022 02:54:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4AB241575
 for <iommu@lists.linux-foundation.org>; Wed, 16 Feb 2022 02:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644980088; x=1676516088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPnDGZYqEL8lzJ/a++F6WRyRimejmxMhswRnFUkhPWs=;
 b=Ij2vCWagcrvdg2lzMhKb/iL37cUi3yHxAF5GXFP8YWKsZQ+qgJQN14PA
 jIjfdYS3UkkEslTvr5BgwbtKcFzzHXlQJ4fkVtppNxZZXXJ20mrJdYpUt
 qNnJFtlQVHJhMyZ8eLFQCTaeKEmzaK5t6qwofCVKntn36K3WEyJrwYTVP
 TzNrDNbzw72Ut7RtHzEj6bDaldoaKfBU5FNjxzY5UDnAonpKb4mBLFkYX
 vp3Y/7AliFzMCsn4/mtOWfZo6wVtZRDL+AKzrORBPIxT+lPYv8eR8Fdph
 0pN26yqsCD2QNBoyVHOI3XJsRrj7do8Pj9LkkwC3kSGAsY3iUUYPjWuf5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248106885"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="248106885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 18:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="681312475"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 18:54:44 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 5/9] iommu: Remove apply_resv_region
Date: Wed, 16 Feb 2022 10:52:45 +0800
Message-Id: <20220216025249.3459465-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>
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

The apply_resv_region callback in iommu_ops was introduced to reserve an
IOVA range in the given DMA domain when the IOMMU driver manages the IOVA
by itself. As all drivers converted to use dma-iommu in the core, there's
no driver using this anymore. Remove it to avoid dead code.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/iommu.h | 4 ----
 drivers/iommu/iommu.c | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9983a01373b2..9ffa2e88f3d0 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -214,7 +214,6 @@ struct iommu_iotlb_gather {
  * @set_pgtable_quirks: Set io page table quirks (IO_PGTABLE_QUIRK_*)
  * @get_resv_regions: Request list of reserved regions for a device
  * @put_resv_regions: Free list of reserved regions for a device
- * @apply_resv_region: Temporary helper call-back for iova reserved ranges
  * @of_xlate: add OF master IDs to iommu grouping
  * @is_attach_deferred: Check if domain attach should be deferred from iommu
  *                      driver init to device driver init (default no)
@@ -268,9 +267,6 @@ struct iommu_ops {
 	/* Request/Free a list of reserved regions for a device */
 	void (*get_resv_regions)(struct device *dev, struct list_head *list);
 	void (*put_resv_regions)(struct device *dev, struct list_head *list);
-	void (*apply_resv_region)(struct device *dev,
-				  struct iommu_domain *domain,
-				  struct iommu_resv_region *region);
 
 	int (*of_xlate)(struct device *dev, struct of_phandle_args *args);
 	bool (*is_attach_deferred)(struct iommu_domain *domain, struct device *dev);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0ebaf561a70e..7cf073c56036 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -790,9 +790,6 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 		dma_addr_t start, end, addr;
 		size_t map_size = 0;
 
-		if (domain->ops->apply_resv_region)
-			domain->ops->apply_resv_region(dev, domain, entry);
-
 		start = ALIGN(entry->start, pg_size);
 		end   = ALIGN(entry->start + entry->length, pg_size);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
