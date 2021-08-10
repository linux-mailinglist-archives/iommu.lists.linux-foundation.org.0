Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1E3E066F
	for <lists.iommu@lfdr.de>; Wed,  4 Aug 2021 19:16:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B91608EA;
	Wed,  4 Aug 2021 17:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bm6Ddijcljt3; Wed,  4 Aug 2021 17:16:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1F7C1608E4;
	Wed,  4 Aug 2021 17:16:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2968C000E;
	Wed,  4 Aug 2021 17:16:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CE49C000E
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F8C8405B3
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3n9w6T6WVhb for <iommu@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 17:16:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AB644059A
 for <iommu@lists.linux-foundation.org>; Wed,  4 Aug 2021 17:16:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFD331424;
 Wed,  4 Aug 2021 10:16:16 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 27B8C3F66F;
 Wed,  4 Aug 2021 10:16:15 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v3 04/25] iommu/vt-d: Drop IOVA cookie management
Date: Wed,  4 Aug 2021 18:15:32 +0100
Message-Id: <41521d47ef64c79f5821e1595759f6482dd30528.1628094601.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628094600.git.robin.murphy@arm.com>
References: <cover.1628094600.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, rajatja@google.com,
 linux-arm-kernel@lists.infradead.org
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

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/intel/iommu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index c12cc955389a..7e168634c433 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1979,10 +1979,6 @@ static void domain_exit(struct dmar_domain *domain)
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
