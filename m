Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4D24A4B0
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 19:13:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F40E875C0;
	Wed, 19 Aug 2020 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bT9WBCcL-9fL; Wed, 19 Aug 2020 17:13:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA750875E0;
	Wed, 19 Aug 2020 17:13:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0AA7C0051;
	Wed, 19 Aug 2020 17:13:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9177CC0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 86D5F2001A
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OrU6ein1qXz for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 17:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 422CF203D6
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:36 +0000 (UTC)
IronPort-SDR: d7CSDqBFQ/VfVQbOnOgpio2StgTPMFn+MaD4NVCZr2MMgUyzqalIk8KeLtpQslAPavKXi7JaOZ
 c57e9lkIVflw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="154423243"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="154423243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 10:13:35 -0700
IronPort-SDR: 3A+sVwkuPT1XN1/VIy6fBQmcFY7T0BTJGgNrvrT4TqVKC0FSsnyQxAj6ku0Yn9RIfOycfRsOsL
 +2ZPmAAThvaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="310843027"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2020 10:13:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5C9EA26A; Wed, 19 Aug 2020 20:13:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, x86@kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v1 1/3] swiotlb: Use %pa to print phys_addr_t variables
Date: Wed, 19 Aug 2020 20:13:24 +0300
Message-Id: <20200819171326.35931-1-andriy.shevchenko@linux.intel.com>
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

There is an extension to a %p to print phys_addr_t type of variables.
Use it here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 kernel/dma/swiotlb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c19379fabd20..676ccf0e49d3 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -165,17 +165,14 @@ unsigned long swiotlb_size_or_default(void)
 
 void swiotlb_print_info(void)
 {
-	unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
+	unsigned long mb = (io_tlb_nslabs << IO_TLB_SHIFT) >> 20;
 
 	if (no_iotlb_memory) {
 		pr_warn("No low mem\n");
 		return;
 	}
 
-	pr_info("mapped [mem %#010llx-%#010llx] (%luMB)\n",
-	       (unsigned long long)io_tlb_start,
-	       (unsigned long long)io_tlb_end,
-	       bytes >> 20);
+	pr_info("mapped [mem %pa-%pa] (%luMB)\n", &io_tlb_start, &io_tlb_end, mb);
 }
 
 /*
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
