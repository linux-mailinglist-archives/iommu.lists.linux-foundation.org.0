Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9625592E
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 13:13:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53D6187FFE;
	Fri, 28 Aug 2020 11:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agqt0LOVWIUu; Fri, 28 Aug 2020 11:13:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 783EA87EA8;
	Fri, 28 Aug 2020 11:13:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CE3CC0051;
	Fri, 28 Aug 2020 11:13:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC81DC0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 11:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 94A1986DC6
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 11:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id be7rD2peXxbL for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 11:13:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 55A3486D5B
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 11:13:15 +0000 (UTC)
IronPort-SDR: 71bp9XE76PfEPrXtZBvglUKV4mJdxw/3nTziePq140dPnJS5MoffRBO8mZnZE3XOqogdkIQhMk
 h4G7pGyhqljA==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="136711191"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="136711191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 04:13:14 -0700
IronPort-SDR: eZzUmeMtN4aVFi8u6VajLQELVFynrJzK4ab5Ecfxm/ukKE+94MUdQQmo8T8tMJ0LYoTfCQC3XD
 LjOmk8K/vKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="313571214"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 28 Aug 2020 04:13:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 91B311B4; Fri, 28 Aug 2020 14:13:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org
Subject: [PATCH v1] iommu/dma: Use DMA ops setter instead of direct assignment
Date: Fri, 28 Aug 2020 14:13:10 +0300
Message-Id: <20200828111310.8032-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Use DMA ops setter instead of direct assignment. Even we know that
this module doesn't perform access to the dma_ops member of struct device,
it's better to use setter to avoid potential problems in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 5141d49a046b..2dcbc8f1d0c0 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1153,7 +1153,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size)
 	if (domain->type == IOMMU_DOMAIN_DMA) {
 		if (iommu_dma_init_domain(domain, dma_base, size, dev))
 			goto out_err;
-		dev->dma_ops = &iommu_dma_ops;
+		set_dma_ops(dev, &iommu_dma_ops);
 	}
 
 	return;
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
