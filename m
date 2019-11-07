Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101AF31FF
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 16:07:19 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 654C4157A;
	Thu,  7 Nov 2019 15:07:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A724B156E
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 261848B1
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 15:07:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 84B61B258;
	Thu,  7 Nov 2019 15:07:07 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: rubini@gnudd.com, hch@infradead.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 1/2] dma-direct: check for overflows on 32 bit DMA addresses
Date: Thu,  7 Nov 2019 16:06:44 +0100
Message-Id: <20191107150646.13485-2-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107150646.13485-1-nsaenzjulienne@suse.de>
References: <20191107150646.13485-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

As seen on the new Raspberry Pi 4 and sta2x11's DMA implementation it is
possible for a device configured with 32 bit DMA addresses and a partial
DMA mapping located at the end of the address space to overflow. It
happens when a higher physical address, not DMAable, is translated to
it's DMA counterpart.

For example the Raspberry Pi 4, configurable up to 4 GB of memory, has
an interconnect capable of addressing the lower 1 GB of physical memory
with a DMA offset of 0xc0000000. It transpires that, any attempt to
translate physical addresses higher than the first GB will result in an
overflow which dma_capable() can't detect as it only checks for
addresses bigger then the maximum allowed DMA address.

Fix this by verifying in dma_capable() if the DMA address range provided
is at any point lower than the minimum possible DMA address on the bus.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

---

Changes since v2:
  - Cleanup code: use IS_ENABLED, a tmp variable for end, and
    use phys_to_dma().

 include/linux/dma-direct.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index adf993a3bd58..6a18a97b76a8 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -3,8 +3,11 @@
 #define _LINUX_DMA_DIRECT_H 1
 
 #include <linux/dma-mapping.h>
+#include <linux/memblock.h> /* for min_low_pfn */
 #include <linux/mem_encrypt.h>
 
+static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
+
 #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
 #include <asm/dma-direct.h>
 #else
@@ -24,11 +27,16 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 
 static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
 {
+	dma_addr_t end = addr + size - 1;
+
 	if (!dev->dma_mask)
 		return false;
 
-	return addr + size - 1 <=
-		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
+	if (!IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
+	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
+		return false;
+
+	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
 }
 #endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
