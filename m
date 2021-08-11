Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD83E9074
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 14:22:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BB340557;
	Wed, 11 Aug 2021 12:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXPkZr87ToFA; Wed, 11 Aug 2021 12:22:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 15EFE4056A;
	Wed, 11 Aug 2021 12:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0293C000E;
	Wed, 11 Aug 2021 12:22:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2048CC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01503404CE
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEOR2a-0Q-SA for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 12:22:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FFF7404CC
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893FF13A1;
 Wed, 11 Aug 2021 05:22:06 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A99693F718;
 Wed, 11 Aug 2021 05:22:04 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v4 08/24] iommu/rockchip: Drop IOVA cookie management
Date: Wed, 11 Aug 2021 13:21:22 +0100
Message-Id: <aff51e2da1e431987ae5fdafa62a6a7c4bd042dc.1628682048.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628682048.git.robin.murphy@arm.com>
References: <cover.1628682048.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 dianders@chromium.org, iommu@lists.linux-foundation.org, rajatja@google.com,
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

Tested-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---

v3: Also remove unneeded include
---
 drivers/iommu/rockchip-iommu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 9febfb7f3025..5cb260820eda 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -10,7 +10,6 @@
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -1074,10 +1073,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 	if (!rk_domain)
 		return NULL;
 
-	if (type == IOMMU_DOMAIN_DMA &&
-	    iommu_get_dma_cookie(&rk_domain->domain))
-		goto err_free_domain;
-
 	/*
 	 * rk32xx iommus use a 2 level pagetable.
 	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
@@ -1085,7 +1080,7 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 	 */
 	rk_domain->dt = (u32 *)get_zeroed_page(GFP_KERNEL | GFP_DMA32);
 	if (!rk_domain->dt)
-		goto err_put_cookie;
+		goto err_free_domain;
 
 	rk_domain->dt_dma = dma_map_single(dma_dev, rk_domain->dt,
 					   SPAGE_SIZE, DMA_TO_DEVICE);
@@ -1106,9 +1101,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 
 err_free_dt:
 	free_page((unsigned long)rk_domain->dt);
-err_put_cookie:
-	if (type == IOMMU_DOMAIN_DMA)
-		iommu_put_dma_cookie(&rk_domain->domain);
 err_free_domain:
 	kfree(rk_domain);
 
@@ -1137,8 +1129,6 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 			 SPAGE_SIZE, DMA_TO_DEVICE);
 	free_page((unsigned long)rk_domain->dt);
 
-	if (domain->type == IOMMU_DOMAIN_DMA)
-		iommu_put_dma_cookie(&rk_domain->domain);
 	kfree(rk_domain);
 }
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
