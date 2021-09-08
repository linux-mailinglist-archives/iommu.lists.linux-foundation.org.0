Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38313403A29
	for <lists.iommu@lfdr.de>; Wed,  8 Sep 2021 14:55:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF84404AE;
	Wed,  8 Sep 2021 12:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzrfbN-KSxO7; Wed,  8 Sep 2021 12:55:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 77B1340204;
	Wed,  8 Sep 2021 12:55:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B83C000D;
	Wed,  8 Sep 2021 12:55:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8F34C000D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 12:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B9D260815
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 12:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxtAsbgndJiJ for <iommu@lists.linux-foundation.org>;
 Wed,  8 Sep 2021 12:55:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B54E60648
 for <iommu@lists.linux-foundation.org>; Wed,  8 Sep 2021 12:55:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 826C56D;
 Wed,  8 Sep 2021 05:55:45 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EB2C3F766;
 Wed,  8 Sep 2021 05:55:44 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH] iommu: Clarify default domain Kconfig
Date: Wed,  8 Sep 2021 13:55:37 +0100
Message-Id: <69a0c6f17b000b54b8333ee42b3124c1d5a869e2.1631105737.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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

Although strictly it is the AMD and Intel drivers which have an existing
expectation of lazy behaviour by default, it ends up being rather
unintuitive to describe this literally in Kconfig. Express it instead as
an architecture dependency, to clarify that it is a valid config-time
decision. The end result is the same since virtio-iommu doesn't support
lazy mode and thus falls back to strict at runtime regardless.

The per-architecture disparity is a matter of historical expectations:
the AMD and Intel drivers have been lazy by default since 2008, and
changing that gets noticed by people asking where their I/O throughput
has gone. Conversely, Arm-based systems with their wider assortment of
IOMMU drivers mostly only support strict mode anyway; only the Arm SMMU
drivers have later grown support for passthrough and lazy mode, for
users who wanted to explicitly trade off isolation for performance.
These days, reducing the default level of isolation in a way which may
go unnoticed by users who expect otherwise hardly seems worth risking
for the sake of one line of Kconfig, so here's where we are.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 8ad8618b3530..124c41adeca1 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -82,7 +82,7 @@ config IOMMU_DEBUGFS
 choice
 	prompt "IOMMU default domain type"
 	depends on IOMMU_API
-	default IOMMU_DEFAULT_DMA_LAZY if AMD_IOMMU || INTEL_IOMMU
+	default IOMMU_DEFAULT_DMA_LAZY if X86 || IA64
 	default IOMMU_DEFAULT_DMA_STRICT
 	help
 	  Choose the type of IOMMU domain used to manage DMA API usage by
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
