Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F2024A4AE
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 19:13:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A4D1D2156F;
	Wed, 19 Aug 2020 17:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bimCztBxEJXP; Wed, 19 Aug 2020 17:13:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 81242203D6;
	Wed, 19 Aug 2020 17:13:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 793FAC0051;
	Wed, 19 Aug 2020 17:13:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45920C0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3272481E3B
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f54YWM4L57qb for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 17:13:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6718B81E34
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:13:36 +0000 (UTC)
IronPort-SDR: 6sO3n/rxXTJw5iQly2sa+8Ii0ENMGNXekB8xdTYMtD9QNslGXpY4Lq49tx8ktAoxn40gz2gmOt
 vDR4+Tf1jMHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="156231392"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="156231392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 10:13:35 -0700
IronPort-SDR: zImcgjOsEzstPjqa6z3047Z8QGYimMaTtLrxzf1lHSMmc0xZ23uxIQErNlXFn0rwCuTltr2RTR
 12nsUheZTDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="497313888"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2020 10:13:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7AA8E371; Wed, 19 Aug 2020 20:13:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, x86@kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v1 3/3] swiotlb: Mark max_segment with static keyword
Date: Wed, 19 Aug 2020 20:13:26 +0300
Message-Id: <20200819171326.35931-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819171326.35931-1-andriy.shevchenko@linux.intel.com>
References: <20200819171326.35931-1-andriy.shevchenko@linux.intel.com>
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
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 676ccf0e49d3..5afbc50621fe 100644
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
