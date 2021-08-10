Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DED3D929F
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 17:59:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975E54062A;
	Wed, 28 Jul 2021 15:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gH61Rtl5UKis; Wed, 28 Jul 2021 15:59:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A4359405FA;
	Wed, 28 Jul 2021 15:59:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8008AC000E;
	Wed, 28 Jul 2021 15:59:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38441C0022
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1871840526
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNp4CxsoYtpb for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 15:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4769840249
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC1F41424;
 Wed, 28 Jul 2021 08:59:48 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6669C3F70D;
 Wed, 28 Jul 2021 08:59:47 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 24/24] iommu: Only log strictness for DMA domains
Date: Wed, 28 Jul 2021 16:58:45 +0100
Message-Id: <b2da9ba999b54acded9198cf92cf9b7d0fce1b45.1627468310.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627468308.git.robin.murphy@arm.com>
References: <cover.1627468308.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

When passthrough is enabled, the default strictness policy becomes
irrelevant, since any subsequent runtime override to a DMA domain type
now embodies an explicit choice of strictness as well. Save on noise by
only logging the default policy when it is meaningfully in effect.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index be399d630953..87d7b299436e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -144,10 +144,11 @@ static int __init iommu_subsys_init(void)
 		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
 			"(set via kernel command line)" : "");
 
-	pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
-		iommu_dma_strict ? "strict" : "lazy",
-		(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
-			"(set via kernel command line)" : "");
+	if (!iommu_default_passthrough())
+		pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
+			iommu_dma_strict ? "strict" : "lazy",
+			(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
+				"(set via kernel command line)" : "");
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
