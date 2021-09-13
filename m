Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C00408B2A
	for <lists.iommu@lfdr.de>; Mon, 13 Sep 2021 14:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAC10400C3;
	Mon, 13 Sep 2021 12:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8-u4BWk99YZ; Mon, 13 Sep 2021 12:40:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D69314027C;
	Mon, 13 Sep 2021 12:40:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 297F5C0025;
	Mon, 13 Sep 2021 12:40:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35885C0011
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24AFF4027C
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z_FwJbq-SJ-r for <iommu@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 12:40:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 827A6400C3
 for <iommu@lists.linux-foundation.org>; Mon, 13 Sep 2021 12:40:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF066101E;
 Mon, 13 Sep 2021 05:40:12 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 141793F59C;
 Mon, 13 Sep 2021 05:40:11 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 1/2] iommu/dart: Clean up IOVA cookie crumbs
Date: Mon, 13 Sep 2021 13:40:05 +0100
Message-Id: <edb72b4965baa8999dd70b8294785d6deebd4183.1631531973.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631531973.git.robin.murphy@arm.com>
References: <cover.1631531973.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

The addition of the DART driver crossed over with moving IOVA cookie
management into core code; clean up the now-unnecessary remnants here.

Acked-by: Sven Peter <sven@svenpeter.dev>
Tested-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/apple-dart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 559db9259e65..cdc2e83b2186 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -15,7 +15,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -596,7 +595,6 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 	if (!dart_domain)
 		return NULL;
 
-	iommu_get_dma_cookie(&dart_domain->domain);
 	mutex_init(&dart_domain->init_lock);
 
 	/* no need to allocate pgtbl_ops or do any other finalization steps */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
