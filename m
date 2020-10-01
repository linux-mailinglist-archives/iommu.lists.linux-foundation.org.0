Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E5C2803B3
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 18:18:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B5EE87236;
	Thu,  1 Oct 2020 16:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPpeSYBe81Ns; Thu,  1 Oct 2020 16:18:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C58F8736E;
	Thu,  1 Oct 2020 16:18:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27FFEC0051;
	Thu,  1 Oct 2020 16:18:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B066CC0889
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 917AB86B0A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y62EJJS8EG0R for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 16:17:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C1F0686B0B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 16:17:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 558ADAD32;
 Thu,  1 Oct 2020 16:17:56 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de,
 robin.murphy@arm.com, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mm@kvack.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] dma-direct: Turn zone_dma_bits default value into a define
Date: Thu,  1 Oct 2020 18:17:38 +0200
Message-Id: <20201001161740.29064-3-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001161740.29064-1-nsaenzjulienne@suse.de>
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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

Other code might need to reference it.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 include/linux/dma-direct.h | 1 +
 kernel/dma/direct.c        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 38ed3b55034d..ef19ff505d09 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -12,6 +12,7 @@
 #include <linux/mem_encrypt.h>
 #include <linux/swiotlb.h>
 
+#define ZONE_DMA_BITS_DEFAULT	24
 extern unsigned int zone_dma_bits;
 
 /*
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 121a9c1969dd..4b3cfa02532b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -20,7 +20,7 @@
  * it for entirely different regions. In that case the arch code needs to
  * override the variable below for dma-direct to work properly.
  */
-unsigned int zone_dma_bits __ro_after_init = 24;
+unsigned int zone_dma_bits __ro_after_init = ZONE_DMA_BITS_DEFAULT;
 
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
