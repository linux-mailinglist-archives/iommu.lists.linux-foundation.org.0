Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0166BF3D
	for <lists.iommu@lfdr.de>; Wed, 17 Jul 2019 17:40:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2BB59DD8;
	Wed, 17 Jul 2019 15:40:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F20BADA4
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 15:31:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 87D51756
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 15:31:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id EB414B048;
	Wed, 17 Jul 2019 15:31:46 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: linux-arm-kernel@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC 3/4] dma-direct: add dma_direct_min_mask
Date: Wed, 17 Jul 2019 17:31:34 +0200
Message-Id: <20190717153135.15507-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190717153135.15507-1-nsaenzjulienne@suse.de>
References: <20190717153135.15507-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 17 Jul 2019 15:40:12 +0000
Cc: stefan.wahren@i2se.com, f.fainelli@gmail.com, catalin.marinas@arm.com,
	phil@raspberrypi.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Jisheng.Zhang@synaptics.com,
	mbrugger@suse.com, will@kernel.org,
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

Historically devices with ZONE_DMA32 have been assumed to be able to
address at least the lower 4GB of ram for DMA. This is still the defualt
behavior yet the Raspberry Pi 4 is limited to the first GB of memory.
This has been observed to trigger failures in dma_direct_supported() as
the 'min_mask' isn't properly set.

We create 'dma_direct_min_mask' in order for the arch init code to be
able to fine-tune dma direct's 'min_dma' mask.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 kernel/dma/direct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index b90e1aede743..3c8cd730648b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -23,6 +23,8 @@
 #define ARCH_ZONE_DMA_BITS 24
 #endif
 
+u64 dma_direct_min_mask __ro_after_init = DMA_BIT_MASK(32);
+
 /*
  * For AMD SEV all DMA must be to unencrypted addresses.
  */
@@ -393,7 +395,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
 		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
 	else
-		min_mask = DMA_BIT_MASK(32);
+		min_mask = dma_direct_min_mask;
 
 	min_mask = min_t(u64, min_mask, (max_pfn - 1) << PAGE_SHIFT);
 
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
