Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 358AD2803B4
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 18:18:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E865987372;
	Thu,  1 Oct 2020 16:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3OWr9IrBkjk; Thu,  1 Oct 2020 16:18:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71B9187370;
	Thu,  1 Oct 2020 16:18:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8D6C0889;
	Thu,  1 Oct 2020 16:18:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2829CC0889
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA25727233
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPMI3pKGMWnO for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 16:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 4CC7723600
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:17:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD042AF26;
 Thu,  1 Oct 2020 16:17:56 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de,
 robin.murphy@arm.com, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: Default to 32-bit ZONE_DMA
Date: Thu,  1 Oct 2020 18:17:39 +0200
Message-Id: <20201001161740.29064-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001161740.29064-1-nsaenzjulienne@suse.de>
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: will@kernel.org, linux-rpi-kernel@lists.infradead.org,
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

The Raspberry Pi 4 needs two DMA zones as some of its devices can only
DMA into the 30-bit physical address space. We solved that by creating
an extra ZONE_DMA covering the 30-bit. It turns out that creating extra
zones unnecessarily broke Kdump on large systems. So default to a single
32-bit wide ZONE_DMA and only define both zones if running on RPi4.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm64/mm/init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index e1a69a618832..3c3f462466eb 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -43,8 +43,6 @@
 #include <asm/tlb.h>
 #include <asm/alternative.h>
 
-#define ARM64_ZONE_DMA_BITS	30
-
 /*
  * We need to be able to catch inadvertent references to memstart_addr
  * that occur (potentially in generic code) before arm64_memblock_init()
@@ -388,8 +386,14 @@ void __init arm64_memblock_init(void)
 	early_init_fdt_scan_reserved_mem();
 
 	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
-		zone_dma_bits = ARM64_ZONE_DMA_BITS;
-		arm64_dma_phys_limit = max_zone_phys(ARM64_ZONE_DMA_BITS);
+		/*
+		 * early_init_dt_scan() might alter zone_dma_bits based on the
+		 * device's DT. Otherwise, have it cover the 32-bit address
+		 * space.
+		 */
+		if (zone_dma_bits == ZONE_DMA_BITS_DEFAULT)
+			zone_dma_bits = 32;
+		arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
 	}
 
 	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
