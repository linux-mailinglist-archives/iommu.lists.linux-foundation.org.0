Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1F3D161F
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 20:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93D7340517;
	Wed, 21 Jul 2021 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKI3UacQSIQJ; Wed, 21 Jul 2021 18:21:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B235440518;
	Wed, 21 Jul 2021 18:21:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83A19C0010;
	Wed, 21 Jul 2021 18:21:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFF9FC000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CED56404A8
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h36RWPKh2dtk for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 18:21:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16AEA40575
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 18:21:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A7B0113E;
 Wed, 21 Jul 2021 11:21:11 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1562A3F694;
 Wed, 21 Jul 2021 11:21:09 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 15/23] iommu/amd: Prepare for multiple DMA domain types
Date: Wed, 21 Jul 2021 19:20:26 +0100
Message-Id: <933496cfa22214e99bc8d48d62bdef112b44c80f.1626888445.git.robin.murphy@arm.com>
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

The DMA ops setup can simply be unconditional, since iommu-dma
already knows not to touch identity domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/amd/iommu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 40ae7130fc80..1e992ef21f34 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1707,14 +1707,9 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 
 static void amd_iommu_probe_finalize(struct device *dev)
 {
-	struct iommu_domain *domain;
-
 	/* Domains are initialized for this device - have a look what we ended up with */
-	domain = iommu_get_domain_for_dev(dev);
-	if (domain->type == IOMMU_DOMAIN_DMA)
-		iommu_setup_dma_ops(dev, 0, U64_MAX);
-	else
-		set_dma_ops(dev, NULL);
+	set_dma_ops(dev, NULL);
+	iommu_setup_dma_ops(dev, 0, U64_MAX);
 }
 
 static void amd_iommu_release_device(struct device *dev)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
