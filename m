Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7196345
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 16:58:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E3EDCE3E;
	Tue, 20 Aug 2019 14:58:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 22A0CBB3
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8C25889B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0DD42AFA5;
	Tue, 20 Aug 2019 14:58:30 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
	marc.zyngier@arm.com, robh+dt@kernel.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 01/11] asm-generic: add dma_zone_size
Date: Tue, 20 Aug 2019 16:58:09 +0200
Message-Id: <20190820145821.27214-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820145821.27214-1-nsaenzjulienne@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, frowand.list@gmail.com,
	linux-kernel@vger.kernel.org, eric@anholt.net, mbrugger@suse.com,
	linux-rpi-kernel@lists.infradead.org, akpm@linux-foundation.org,
	will@kernel.org, nsaenzjulienne@suse.de
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Some architectures have platform specific DMA addressing limitations.
This will allow for hardware description code to provide the constraints
in a generic manner, so as for arch code to properly setup it's memory
zones and DMA mask.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes in v2: None

 include/asm-generic/dma.h | 8 +++++++-
 mm/page_alloc.c           | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/dma.h b/include/asm-generic/dma.h
index 43d0c8af8058..c2f39cdb64f6 100644
--- a/include/asm-generic/dma.h
+++ b/include/asm-generic/dma.h
@@ -8,7 +8,13 @@
  *
  * Some code relies on seeing MAX_DMA_ADDRESS though.
  */
-#define MAX_DMA_ADDRESS PAGE_OFFSET
+#define MAX_DMA_ADDRESS	 (PAGE_OFFSET + dma_zone_size)
+
+/*
+ * Some architectures may have platform specific DMA addressing constraints.
+ * Firmware can use this to fine tune the device's DMA memory zone.
+ */
+extern u64 dma_zone_size __ro_after_init;
 
 extern int request_dma(unsigned int dmanr, const char *device_id);
 extern void free_dma(unsigned int dmanr);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 272c6de1bf4e..b514afee5451 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -133,6 +133,9 @@ EXPORT_SYMBOL(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
+u64 dma_zone_size __ro_after_init;
+EXPORT_SYMBOL(dma_zone_size);
+
 int percpu_pagelist_fraction;
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 #ifdef CONFIG_INIT_ON_ALLOC_DEFAULT_ON
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
