Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94725B2F5
	for <lists.iommu@lfdr.de>; Wed,  2 Sep 2020 19:31:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AAD592279B;
	Wed,  2 Sep 2020 17:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiVXx+HhSUrT; Wed,  2 Sep 2020 17:31:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7D4A520521;
	Wed,  2 Sep 2020 17:31:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 691DAC0051;
	Wed,  2 Sep 2020 17:31:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B99FC0052
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 17:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 04C448692F
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 17:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2nTaPDAJYEE for <iommu@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 17:31:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8399B8692E
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 17:31:10 +0000 (UTC)
IronPort-SDR: CbT0PszvRWkZHwxci1aalK86HUWjxJD8AoU+OYsgSe8P2/KS1jwImpdqOkv+cn+EFRFfhMOGO+
 06uyoajOia3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="242263154"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="242263154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 10:31:09 -0700
IronPort-SDR: DPPLCodbmkUsNCbKq3Bu2E3FRKLXL5/tkk3jfOScZUh6glejTbX6hhxJeymR4iwnaEQCIN8IL3
 cX7NpIhp/uxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="405224501"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2020 10:31:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 500C6302; Wed,  2 Sep 2020 20:31:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, x86@kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/3] swiotlb: Mark max_segment with static keyword
Date: Wed,  2 Sep 2020 20:31:05 +0300
Message-Id: <20200902173105.38293-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902173105.38293-1-andriy.shevchenko@linux.intel.com>
References: <20200902173105.38293-1-andriy.shevchenko@linux.intel.com>
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

Sparse is not happy about max_segment declaration:

  CHECK   kernel/dma/swiotlb.c
  kernel/dma/swiotlb.c:96:14: warning: symbol 'max_segment' was not declared. Should it be static?

Mark it static as suggested.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 6499bda8f0b8..465a567678d9 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -93,7 +93,7 @@ static unsigned int io_tlb_index;
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
  */
-unsigned int max_segment;
+static unsigned int max_segment;
 
 /*
  * We need to save away the original address corresponding to a mapped entry
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
