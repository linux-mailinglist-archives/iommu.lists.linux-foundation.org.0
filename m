Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128229A98C
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 11:26:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7D5D1FF59;
	Tue, 27 Oct 2020 10:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzQ8KrpmXU9y; Tue, 27 Oct 2020 10:26:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ECBE02045F;
	Tue, 27 Oct 2020 10:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9939C0051;
	Tue, 27 Oct 2020 10:26:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1FE4C0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C055485DA0
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wx8-nwAZVSVX for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 10:25:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by whitealder.osuosl.org (Postfix) with ESMTP id F3A8786519
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:25:57 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 51269AE80279;
 Tue, 27 Oct 2020 06:18:13 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 2/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
Date: Tue, 27 Oct 2020 21:18:41 +1100
Message-Id: <20201027101841.96056-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027101841.96056-1-aik@ozlabs.ru>
References: <20201027101841.96056-1-aik@ozlabs.ru>
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

So far we have been using huge DMA windows to map all the RAM available.
The RAM is normally mapped to the VM address space contiguously, and
there is always a reasonable upper limit for possible future hot plugged
RAM which makes it easy to map all RAM via IOMMU.

Now there is persistent memory ("ibm,pmemory" in the FDT) which (unlike
normal RAM) can map anywhere in the VM space beyond the maximum RAM size
and since it can be used for DMA, it requires extending the huge window
up to MAX_PHYSMEM_BITS which requires hypervisor support for:
1. huge TCE tables;
2. multilevel TCE tables;
3. huge IOMMU pages.

Certain hypervisors cannot do either so the only option left is
restricting the huge DMA window to include only RAM and fallback to
the default DMA window for persistent memory.

This checks if the system has persistent memory. If it does not,
the DMA bypass mode is selected, i.e.
* dev->bus_dma_limit = 0
* dev->dma_ops_bypass = true <- this avoid calling dma_ops for mapping.

If there is such memory, this creates identity mapping only for RAM and
sets the dev->bus_dma_limit to let the generic code decide whether to
call into the direct DMA or the indirect DMA ops.

This should not change the existing behaviour when no persistent memory
as dev->dma_ops_bypass is expected to be set.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/dma-iommu.c        | 12 +++++--
 arch/powerpc/platforms/pseries/iommu.c | 44 ++++++++++++++++++++------
 arch/powerpc/Kconfig                   |  1 +
 3 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index a1c744194018..d123b7205f76 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -90,8 +90,16 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
-		dev->dma_ops_bypass = true;
-		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
+		/*
+		 * dma_iommu_bypass_supported() sets dma_max when there is
+		 * 1:1 mapping but it is somehow limited.
+		 * ibm,pmemory is one example.
+		 */
+		dev->dma_ops_bypass = dev->bus_dma_limit == 0;
+		if (!dev->dma_ops_bypass)
+			dev_warn(dev, "iommu: 64-bit OK but using default ops\n");
+		else
+			dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index e4198700ed1a..91112e748491 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -839,7 +839,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 			np, ret);
 }
 
-static u64 find_existing_ddw(struct device_node *pdn)
+static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
@@ -851,6 +851,7 @@ static u64 find_existing_ddw(struct device_node *pdn)
 		if (window->device == pdn) {
 			direct64 = window->prop;
 			dma_addr = be64_to_cpu(direct64->dma_base);
+			*window_shift = be32_to_cpu(direct64->window_shift);
 			break;
 		}
 	}
@@ -1111,11 +1112,13 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
  */
 static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
-	int len, ret;
+	int len = 0, ret;
+	bool pmem_present = of_find_node_by_type(NULL, "ibm,pmemory") != NULL;
+	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr, max_addr;
+	u64 dma_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
@@ -1126,7 +1129,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&direct_window_init_mutex);
 
-	dma_addr = find_existing_ddw(pdn);
+	dma_addr = find_existing_ddw(pdn, &len);
 	if (dma_addr != 0)
 		goto out_unlock;
 
@@ -1212,14 +1215,26 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
-	max_addr = ddw_memory_hotplug_max();
-	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
-			  1ULL << page_shift);
+	/*
+	 * The "ibm,pmemory" can appear anywhere in the address space.
+	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
+	 * for the upper limit and fallback to max RAM otherwise but this
+	 * disables device::dma_ops_bypass.
+	 */
+	len = max_ram_len;
+	if (pmem_present) {
+		if (query.largest_available_block >=
+		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
+			len = MAX_PHYSMEM_BITS - page_shift;
+		else
+			dev_info(&dev->dev, "Skipping ibm,pmemory");
+	}
+
+	if (query.largest_available_block < (1ULL << (len - page_shift))) {
+		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu %llu-sized pages\n",
+			1ULL << len, query.largest_available_block, 1ULL << page_shift);
 		goto out_failed;
 	}
-	len = order_base_2(max_addr);
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
@@ -1299,6 +1314,15 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 out_unlock:
 	mutex_unlock(&direct_window_init_mutex);
+
+	/*
+	 * If we have persistent memory and the window size is only as big
+	 * as RAM, then we failed to create a window to cover persistent
+	 * memory and need to set the DMA limit.
+	 */
+	if (pmem_present && dma_addr && (len == max_ram_len))
+		dev->dev.bus_dma_limit = dma_addr + (1ULL << len);
+
 	return dma_addr;
 }
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..5a8881bf140e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -159,6 +159,7 @@ config PPC
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS				if PPC64
 	select DMA_OPS_BYPASS			if PPC64
+	select DMA_OPS_BYPASS_BUS_LIMIT		if PPC64 && PPC_PSERIES
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
