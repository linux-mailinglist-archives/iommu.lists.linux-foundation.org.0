Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F0D6971
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 20:32:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 547082D1A;
	Mon, 14 Oct 2019 18:31:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DA9C32D04
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FEDC831
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E3DD2BB7F;
	Mon, 14 Oct 2019 18:31:51 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 4/5] dma/direct: check for overflows in ARM's dma_capable()
Date: Mon, 14 Oct 2019 20:31:06 +0200
Message-Id: <20191014183108.24804-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014183108.24804-1-nsaenzjulienne@suse.de>
References: <20191014183108.24804-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: f.fainelli@gmail.com, Russell King <linux@armlinux.org.uk>,
	mbrugger@suse.com, wahrenst@gmx.net,
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

The Raspberry Pi 4 has a 1GB ZONE_DMA area starting at address
0x00000000 and a mapping between physical and DMA memory offset by
0xc0000000.  It transpires that, on non LPAE systems, any attempt to
translate physical addresses outside of ZONE_DMA will result in an
overflow. The resulting DMA addresses will not be detected by arm's
dma_capable() as they still fit in the device's DMA mask.

Fix this by failing to validate a DMA address smaller than the lowest
possible DMA address.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm/include/asm/dma-direct.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index b67e5fc1fe43..ee8ad47a14e3 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -2,6 +2,8 @@
 #ifndef ASM_ARM_DMA_DIRECT_H
 #define ASM_ARM_DMA_DIRECT_H 1
 
+#include <linux/memblock.h>
+
 static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	unsigned int offset = paddr & ~PAGE_MASK;
@@ -21,6 +23,10 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
 	if (!dev->dma_mask)
 		return 0;
 
+	/* Check if address overflowed */
+	if (addr < __phys_to_dma(dev, PFN_UP(min_low_pfn)))
+		return 0;
+
 	mask = *dev->dma_mask;
 
 	limit = (mask + 1) & ~mask;
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
