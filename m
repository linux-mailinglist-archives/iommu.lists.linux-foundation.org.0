Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DE41D200
	for <lists.iommu@lfdr.de>; Thu, 30 Sep 2021 05:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA17C84040;
	Thu, 30 Sep 2021 03:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOVXLSmDplDj; Thu, 30 Sep 2021 03:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E4D768402E;
	Thu, 30 Sep 2021 03:52:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1F85C001E;
	Thu, 30 Sep 2021 03:52:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FC79C000D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 174568402E
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96qe6ewtWP8X for <iommu@lists.linux-foundation.org>;
 Thu, 30 Sep 2021 03:52:02 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DB6383E9F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Sep 2021 03:52:02 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id B1B46AE8002D;
 Wed, 29 Sep 2021 23:44:58 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/iommu: Report the correct most efficient DMA
 mask for PCI devices
Date: Thu, 30 Sep 2021 13:44:54 +1000
Message-Id: <20210930034454.95794-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, Carol L Soto <clsoto@us.ibm.com>
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

According to dma-api.rst, the dma_get_required_mask() helper should return
"the mask that the platform requires to operate efficiently". Which in
the case of PPC64 means the bypass mask and not a mask from an IOMMU table
which is shorter and slower to use due to map/unmap operations (especially
expensive on "pseries").

However the existing implementation ignores the possibility of bypassing
and returns the IOMMU table mask on the pseries platform which makes some
drivers (mpt3sas is one example) choose 32bit DMA even though bypass is
supported. The powernv platform sort of handles it by having a bigger
default window with a mask >=40 but it only works as drivers choose
63/64bit if the required mask is >32 which is rather pointless.

This reintroduces the bypass capability check to let drivers make
a better choice of the DMA mask.

Fixes: f1565c24b596 ("powerpc: use the generic dma_ops_bypass mode")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/dma-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 111249fd619d..d646077bcbcf 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -184,6 +184,14 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 	u64 mask;
 
+	if (dev_is_pci(dev)) {
+		u64 bypass_mask = dma_direct_get_required_mask(dev);
+
+		if (dma_iommu_dma_supported(dev, bypass_mask)) {
+			dev_info(dev, "%s: returning bypass mask 0x%llx\n", __func__, bypass_mask);
+			return bypass_mask;
+		}
+	}
 	if (!tbl)
 		return 0;
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
