Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1B73D161A
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 20:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82ED0404BE;
	Wed, 21 Jul 2021 18:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8MZnosurLTj; Wed, 21 Jul 2021 18:21:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6229E404E5;
	Wed, 21 Jul 2021 18:21:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FD58C000E;
	Wed, 21 Jul 2021 18:21:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09FFBC000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B7D608B6
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiKYPrSlVi5M for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 18:21:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB40608B2
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E96113E;
 Wed, 21 Jul 2021 11:21:02 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A04B3F694;
 Wed, 21 Jul 2021 11:21:01 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 10/23] iommu/sun50i: Drop IOVA cookie management
Date: Wed, 21 Jul 2021 19:20:21 +0100
Message-Id: <41bede7a3a1377e0fb2e3b6bc1f9f0b4ceff6f25.1626888444.git.robin.murphy@arm.com>
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
 drivers/iommu/sun50i-iommu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 181bb1c3437c..c349a95ec7bd 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -610,14 +610,10 @@ static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
 	if (!sun50i_domain)
 		return NULL;
 
-	if (type == IOMMU_DOMAIN_DMA &&
-	    iommu_get_dma_cookie(&sun50i_domain->domain))
-		goto err_free_domain;
-
 	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 						    get_order(DT_SIZE));
 	if (!sun50i_domain->dt)
-		goto err_put_cookie;
+		goto err_free_domain;
 
 	refcount_set(&sun50i_domain->refcnt, 1);
 
@@ -627,10 +623,6 @@ static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
 
 	return &sun50i_domain->domain;
 
-err_put_cookie:
-	if (type == IOMMU_DOMAIN_DMA)
-		iommu_put_dma_cookie(&sun50i_domain->domain);
-
 err_free_domain:
 	kfree(sun50i_domain);
 
@@ -644,8 +636,6 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
 	free_pages((unsigned long)sun50i_domain->dt, get_order(DT_SIZE));
 	sun50i_domain->dt = NULL;
 
-	iommu_put_dma_cookie(domain);
-
 	kfree(sun50i_domain);
 }
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
