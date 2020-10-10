Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D412728A0BC
	for <lists.iommu@lfdr.de>; Sat, 10 Oct 2020 17:12:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 505AD87846;
	Sat, 10 Oct 2020 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeQVryXCuw-8; Sat, 10 Oct 2020 15:12:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8A7587839;
	Sat, 10 Oct 2020 15:12:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB31BC0051;
	Sat, 10 Oct 2020 15:12:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71754C0051
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 614458704F
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5gwICxo0Ngv for <iommu@lists.linux-foundation.org>;
 Sat, 10 Oct 2020 15:12:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D493186FAF
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76492B14E;
 Sat, 10 Oct 2020 15:12:47 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 3/5] dma-direct: Turn zone_dma_bits default value into a
 define
Date: Sat, 10 Oct 2020 17:12:33 +0200
Message-Id: <20201010151235.20585-4-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201010151235.20585-1-nsaenzjulienne@suse.de>
References: <20201010151235.20585-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org
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

So as for architecture code to set their own default values when
relevant.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Note: This is not really needed, but I think it nicer having
architectures use this than setting zone_dma_bits in a random place in
arch code. That said, I'll hapily edit it out if you don't agree.

 include/linux/dma-direct.h | 3 +++
 kernel/dma/direct.c        | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 18aade195884..e433d90cbacf 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -12,6 +12,9 @@
 #include <linux/mem_encrypt.h>
 #include <linux/swiotlb.h>
 
+#ifndef ZONE_DMA_BITS_DEFAULT
+#define ZONE_DMA_BITS_DEFAULT	24
+#endif
 extern unsigned int zone_dma_bits;
 
 /*
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06c111544f61..c0d97f536e93 100644
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
