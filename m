Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6713749D
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 18:20:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8A89822274;
	Fri, 10 Jan 2020 17:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vAGmd9XkWsSq; Fri, 10 Jan 2020 17:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 30DB122264;
	Fri, 10 Jan 2020 17:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24B1EC0881;
	Fri, 10 Jan 2020 17:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0C8CC0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 17:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CAB3D203A0
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 17:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1+AadWQuJtMb for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 17:19:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 8B75E22264
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 17:19:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9D29B2B7;
 Fri, 10 Jan 2020 17:19:53 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] dma-contiguous: CMA: give precedence to cmdline
Date: Fri, 10 Jan 2020 18:19:33 +0100
Message-Id: <20200110171933.15014-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, phil@raspberrypi.org,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

Although the device tree might contain a reserved-memory DT node
dedicated as the default CMA pool, users might want to change CMA's
parameters using the kernel command line for debugging purposes and
whatnot. Honor this by bypassing the reserved memory CMA setup, which
will ultimately end up freeing the memblock and allow the command line
CMA configuration routine to run.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

NOTE: Tested this on arm and arm64 with the Raspberry Pi 4.

 kernel/dma/contiguous.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index daa4e6eefdde..8bc6f2d670f9 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -302,9 +302,16 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	phys_addr_t align = PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order);
 	phys_addr_t mask = align - 1;
 	unsigned long node = rmem->fdt_node;
+	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
 	struct cma *cma;
 	int err;
 
+	if (size_cmdline != -1 && default_cma) {
+		pr_info("Reserved memory: bypass %s node, using cmdline CMA params instead\n",
+			rmem->name);
+		return -EBUSY;
+	}
+
 	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
 	    of_get_flat_dt_prop(node, "no-map", NULL))
 		return -EINVAL;
@@ -322,7 +329,7 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	/* Architecture specific contiguous memory fixup. */
 	dma_contiguous_early_fixup(rmem->base, rmem->size);
 
-	if (of_get_flat_dt_prop(node, "linux,cma-default", NULL))
+	if (default_cma)
 		dma_contiguous_set_default(cma);
 
 	rmem->ops = &rmem_cma_ops;
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
