Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E59635A
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 16:59:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 959C3E54;
	Tue, 20 Aug 2019 14:58:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E283E40
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B486612E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 292BEAFCB;
	Tue, 20 Aug 2019 14:58:34 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
	marc.zyngier@arm.com, robh+dt@kernel.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 04/11] of/fdt: add early_init_dt_get_dma_zone_size()
Date: Tue, 20 Aug 2019 16:58:12 +0200
Message-Id: <20190820145821.27214-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820145821.27214-1-nsaenzjulienne@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
	eric@anholt.net, mbrugger@suse.com,
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

Some devices might have weird DMA addressing limitations that only apply
to a subset of the available peripherals. For example the Raspberry Pi 4
has two interconnects, one able to address the whole lower 4G memory
area and another one limited to the lower 1G.

Being an uncommon situation we simply hardcode the device wide DMA
addressable memory size conditionally to the machine compatible name and
set 'dma_zone_size' accordingly.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

---

Changes in v2:
- New approach to getting dma_zone_size, instead of parsing the dts we
  hardcode it conditionally to the machine compatible name.

 drivers/of/fdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 06ffbd39d9af..f756e8c05a77 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -27,6 +27,7 @@
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
+#include <asm/dma.h>	/* for dma_zone_size */
 
 #include "of_private.h"
 
@@ -1195,6 +1196,12 @@ void __init early_init_dt_scan_nodes(void)
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 }
 
+void __init early_init_dt_get_dma_zone_size(void)
+{
+	if (of_fdt_machine_is_compatible("brcm,bcm2711"))
+		dma_zone_size = 0x3c000000;
+}
+
 bool __init early_init_dt_scan(void *params)
 {
 	bool status;
@@ -1204,6 +1211,7 @@ bool __init early_init_dt_scan(void *params)
 		return false;
 
 	early_init_dt_scan_nodes();
+	early_init_dt_get_dma_zone_size();
 	return true;
 }
 
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
