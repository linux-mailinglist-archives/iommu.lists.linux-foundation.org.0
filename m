Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F0407412
	for <lists.iommu@lfdr.de>; Sat, 11 Sep 2021 01:54:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C559403C2;
	Fri, 10 Sep 2021 23:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlksV3bZN1Kr; Fri, 10 Sep 2021 23:54:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E360402BE;
	Fri, 10 Sep 2021 23:54:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07E92C001E;
	Fri, 10 Sep 2021 23:54:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48919C000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 23:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2097A4068C
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 23:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZhwJRvZ49oy for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 23:54:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 286EA40532
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 23:54:29 +0000 (UTC)
Received: from MTA-15-3.privateemail.com (MTA-15-1.privateemail.com
 [198.54.118.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id A0E3382877
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 19:54:27 -0400 (EDT)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id 2C61B18000B2;
 Fri, 10 Sep 2021 19:54:25 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.209])
 by mta-15.privateemail.com (Postfix) with ESMTPA id 4FAAF18000A3;
 Fri, 10 Sep 2021 19:54:24 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] dma-debug: prevent an error message from causing runtime
 problems
Date: Fri, 10 Sep 2021 19:53:37 -0400
Message-Id: <20210910235337.13172-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Jeremy Linton <jeremy.linton@arm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

For some drivers, that use the DMA API. This error message can be reached
several millions of times per second, causing spam to the kernel's printk
buffer and bringing the CPU usage up to 100% (so, it should be rate
limited). However, since there is at least one driver that is in the
mainline and suffers from the error condition, it is more useful to
err_printk() here instead of just rate limiting the error message (in hopes
that it will make it easier for other drivers that suffer from this issue
to be spotted).

Link: https://lkml.kernel.org/r/fd67fbac-64bf-f0ea-01e1-5938ccfab9d0@arm.com
Reported-by: Jeremy Linton <jeremy.linton@arm.com>
Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
v2: use err_printk() and make some clarifications in the commit message.
---
 kernel/dma/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 6c90c69e5311..718a7f455df6 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -567,7 +567,8 @@ static void add_dma_entry(struct dma_debug_entry *entry)
 		pr_err("cacheline tracking ENOMEM, dma-debug disabled\n");
 		global_disable = true;
 	} else if (rc == -EEXIST) {
-		pr_err("cacheline tracking EEXIST, overlapping mappings aren't supported\n");
+		err_printk(entry->dev, entry, "cacheline tracking EEXIST, "
+			   "overlapping mappings aren't supported\n");
 	}
 }
 
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
