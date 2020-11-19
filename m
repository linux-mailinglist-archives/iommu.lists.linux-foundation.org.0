Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FA2B9A06
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 18:54:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E139B87473;
	Thu, 19 Nov 2020 17:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1A+EPP390+4l; Thu, 19 Nov 2020 17:54:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7841187476;
	Thu, 19 Nov 2020 17:54:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63002C0891;
	Thu, 19 Nov 2020 17:54:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC0A7C163C
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E874C871DC
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BLC4iJKb63U8 for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 17:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5499387473
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 17:54:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA567AC2D;
 Thu, 19 Nov 2020 17:54:06 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] arm64: mm: Move reserve_crashkernel() into mem_init()
Date: Thu, 19 Nov 2020 18:53:53 +0100
Message-Id: <20201119175400.9995-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119175400.9995-1-nsaenzjulienne@suse.de>
References: <20201119175400.9995-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, will@kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 guohanjun@huawei.com, robin.murphy@arm.com,
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

crashkernel might reserve memory located in ZONE_DMA. We plan to delay
ZONE_DMA's initialization after unflattening the devicetree and ACPI's
boot table initialization, so move it later in the boot process.
Specifically into bootmem_init() since request_standard_resources()
depends on it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jeremy Linton <jeremy.linton@arm.com>

---

Changes since v6:
 - Move crashkernel reserve placement earlier, in bootmem_init()

 arch/arm64/mm/init.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 71d463544400..fafdf992fd32 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -389,8 +389,6 @@ void __init arm64_memblock_init(void)
 	else
 		arm64_dma32_phys_limit = PHYS_MASK + 1;
 
-	reserve_crashkernel();
-
 	reserve_elfcorehdr();
 
 	high_memory = __va(memblock_end_of_DRAM() - 1) + 1;
@@ -430,6 +428,12 @@ void __init bootmem_init(void)
 	sparse_init();
 	zone_sizes_init(min, max);
 
+	/*
+	 * request_standard_resources() depends on crashkernel's memory being
+	 * reserved, so do it here.
+	 */
+	reserve_crashkernel();
+
 	memblock_dump_all();
 }
 
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
