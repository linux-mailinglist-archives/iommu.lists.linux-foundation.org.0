Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E19387989
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 15:07:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DCA606EA;
	Tue, 18 May 2021 13:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPvzB-NzoXSg; Tue, 18 May 2021 13:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664556069A;
	Tue, 18 May 2021 13:07:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49852C0001;
	Tue, 18 May 2021 13:07:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A2DFC0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 13:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1678840622
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 13:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rSM4eJuZORb for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 13:05:32 +0000 (UTC)
X-Greylist: delayed 00:09:59 by SQLgrey-1.8.0
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 398D440562
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 13:05:32 +0000 (UTC)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id F301F80D55
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 08:55:31 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 354876005B;
 Tue, 18 May 2021 08:55:29 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.225])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 6B7516005F;
 Tue, 18 May 2021 08:55:28 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma debug: report -EEXIST errors in add_dma_entry
Date: Tue, 18 May 2021 08:54:43 -0400
Message-Id: <20210518125443.34148-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 18 May 2021 13:07:38 +0000
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 iommu@lists.linux-foundation.org, Dan Williams <dan.j.williams@intel.com>,
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

Since, overlapping mappings are not supported by the DMA API we should
report an error if active_cacheline_insert returns -EEXIST.

Suggested-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 kernel/dma/debug.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 14de1271463f..dadae6255d05 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -566,11 +566,9 @@ static void add_dma_entry(struct dma_debug_entry *entry)
 	if (rc == -ENOMEM) {
 		pr_err("cacheline tracking ENOMEM, dma-debug disabled\n");
 		global_disable = true;
+	} else if (rc == -EEXIST) {
+		pr_err("cacheline tracking EEXIST, overlapping mappings aren't supported\n");
 	}
-
-	/* TODO: report -EEXIST errors here as overlapping mappings are
-	 * not supported by the DMA API
-	 */
 }
 
 static int dma_debug_create_entries(gfp_t gfp)
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
