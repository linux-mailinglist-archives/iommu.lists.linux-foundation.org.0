Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A63D1614
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 20:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2191040362;
	Wed, 21 Jul 2021 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n-gefTxbWxU; Wed, 21 Jul 2021 18:20:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2D17A4036F;
	Wed, 21 Jul 2021 18:20:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06DF6C0010;
	Wed, 21 Jul 2021 18:20:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5DA5C0027
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2A904037E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4y_pSoH7RD0P for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 18:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BC4340362
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:20:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67AB6139F;
 Wed, 21 Jul 2021 11:20:52 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E28723F694;
 Wed, 21 Jul 2021 11:20:50 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 04/23] iommu/vt-d: Drop IOVA cookie management
Date: Wed, 21 Jul 2021 19:20:15 +0100
Message-Id: <6362cbb1cb25f04dea9545895763c52195ddfcbc.1626888444.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626888444.git.robin.murphy@arm.com>
References: <cover.1626888444.git.robin.murphy@arm.com>
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

The core code bakes its own cookies now.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/intel/iommu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index dd22fc7d5176..e2add5a0caef 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1980,10 +1980,6 @@ static void domain_exit(struct dmar_domain *domain)
 	/* Remove associated devices and clear attached or cached domains */
 	domain_remove_dev_info(domain);
 
-	/* destroy iovas */
-	if (domain->domain.type == IOMMU_DOMAIN_DMA)
-		iommu_put_dma_cookie(&domain->domain);
-
 	if (domain->pgd) {
 		struct page *freelist;
 
@@ -4544,10 +4540,6 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 			return NULL;
 		}
 
-		if (type == IOMMU_DOMAIN_DMA &&
-		    iommu_get_dma_cookie(&dmar_domain->domain))
-			return NULL;
-
 		domain = &dmar_domain->domain;
 		domain->geometry.aperture_start = 0;
 		domain->geometry.aperture_end   =
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
