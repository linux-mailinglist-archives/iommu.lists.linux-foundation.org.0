Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0996360
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 16:59:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC159E56;
	Tue, 20 Aug 2019 14:58:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D660E52
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 12E3C12E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 14:58:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 88554AFCC;
	Tue, 20 Aug 2019 14:58:35 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: catalin.marinas@arm.com, hch@lst.de, wahrenst@gmx.net,
	marc.zyngier@arm.com, robh+dt@kernel.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] arm64: mm: use arm64_dma_phys_limit instead of
	calling max_zone_dma_phys()
Date: Tue, 20 Aug 2019 16:58:13 +0200
Message-Id: <20190820145821.27214-6-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820145821.27214-1-nsaenzjulienne@suse.de>
References: <20190820145821.27214-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, f.fainelli@gmail.com, frowand.list@gmail.com,
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

By the time we call zones_sizes_init() arm64_dma_phys_limit already
contains the result of max_zone_dma_phys(). We use the variable instead
of calling the function directly to save some precious cpu time.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes in v2: None

 arch/arm64/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index f3c795278def..6112d6c90fa8 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -181,7 +181,7 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
 
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(max_zone_dma_phys());
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max;
 
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
