Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 852633E9085
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 14:22:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B1340568;
	Wed, 11 Aug 2021 12:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5xuLj-IpvW2; Wed, 11 Aug 2021 12:22:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2F25B4055D;
	Wed, 11 Aug 2021 12:22:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19AB6C000E;
	Wed, 11 Aug 2021 12:22:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96344C000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78060404C6
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RWlztyCTTcbG for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 12:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A85404CA
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:22:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BEE51396;
 Wed, 11 Aug 2021 05:22:25 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A8003F718;
 Wed, 11 Aug 2021 05:22:23 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v4 17/24] iommu/amd: Prepare for multiple DMA domain types
Date: Wed, 11 Aug 2021 13:21:31 +0100
Message-Id: <6450b4f39a5a086d505297b4a53ff1e4a7a0fe7c.1628682049.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628682048.git.robin.murphy@arm.com>
References: <cover.1628682048.git.robin.murphy@arm.com>
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

The DMA ops reset/setup can simply be unconditional, since
iommu-dma already knows only to touch DMA domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/amd/iommu.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 0fd98d35d73b..02f9b4fffe90 100644
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
