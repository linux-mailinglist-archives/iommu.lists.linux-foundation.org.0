Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E83D9286
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 17:59:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14CA583A49;
	Wed, 28 Jul 2021 15:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwyL4_iR8Lm5; Wed, 28 Jul 2021 15:59:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2949783A73;
	Wed, 28 Jul 2021 15:59:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03810C0022;
	Wed, 28 Jul 2021 15:59:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 065F8C000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EADF783A49
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arksEie5S-3K for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 15:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5829583A42
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB3CE1FB;
 Wed, 28 Jul 2021 08:59:21 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 109E33F70D;
 Wed, 28 Jul 2021 08:59:19 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 09/24] iommu/sprd: Drop IOVA cookie management
Date: Wed, 28 Jul 2021 16:58:30 +0100
Message-Id: <7aa0f8aece44391df4dd5d8d1a780f3d3ef2a1a2.1627468309.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627468308.git.robin.murphy@arm.com>
References: <cover.1627468308.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Chunyan Zhang <chunyan.zhang@unisoc.com>,
 dianders@chromium.org, iommu@lists.linux-foundation.org,
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

CC: Chunyan Zhang <chunyan.zhang@unisoc.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/sprd-iommu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 73dfd9946312..2bc1de6e823d 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -144,11 +144,6 @@ static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
 	if (!dom)
 		return NULL;
 
-	if (iommu_get_dma_cookie(&dom->domain)) {
-		kfree(dom);
-		return NULL;
-	}
-
 	spin_lock_init(&dom->pgtlock);
 
 	dom->domain.geometry.aperture_start = 0;
@@ -161,7 +156,6 @@ static void sprd_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct sprd_iommu_domain *dom = to_sprd_domain(domain);
 
-	iommu_put_dma_cookie(domain);
 	kfree(dom);
 }
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
