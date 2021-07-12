Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D142C3C4671
	for <lists.iommu@lfdr.de>; Mon, 12 Jul 2021 12:12:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BB082690;
	Mon, 12 Jul 2021 10:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1P5_wWyAkhV; Mon, 12 Jul 2021 10:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82DA2825BF;
	Mon, 12 Jul 2021 10:12:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D2AC0022;
	Mon, 12 Jul 2021 10:12:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD2A0C000E
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 10:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 936D9400BF
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 10:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qi2I_IEhf2sz for <iommu@lists.linux-foundation.org>;
 Mon, 12 Jul 2021 10:12:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDE4A400A4
 for <iommu@lists.linux-foundation.org>; Mon, 12 Jul 2021 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:4cb:a870:f80c:c923:a77f:9641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5C1BC1F4210D;
 Mon, 12 Jul 2021 11:12:40 +0100 (BST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	heiko@sntech.de
Subject: [PATCH v3] iommu/rockchip: Fix physical address decoding
Date: Mon, 12 Jul 2021 12:12:32 +0200
Message-Id: <20210712101232.318589-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Restore bits 39 to 32 at correct position.
It reverses the operation done in rk_dma_addr_dte_v2().

Fixes: c55356c534aa ("iommu: rockchip: Add support for iommu v2")

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
 - change commit header to match with IOMMU tree convention

 drivers/iommu/rockchip-iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 94b9d8e5b9a40..9febfb7f3025b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -544,12 +544,14 @@ static inline u32 rk_dma_addr_dte(dma_addr_t dt_dma)
 }
 
 #define DT_HI_MASK GENMASK_ULL(39, 32)
+#define DTE_BASE_HI_MASK GENMASK(11, 4)
 #define DT_SHIFT   28
 
 static inline phys_addr_t rk_dte_addr_phys_v2(u32 addr)
 {
-	return (phys_addr_t)(addr & RK_DTE_PT_ADDRESS_MASK) |
-	       ((addr & DT_HI_MASK) << DT_SHIFT);
+	u64 addr64 = addr;
+	return (phys_addr_t)(addr64 & RK_DTE_PT_ADDRESS_MASK) |
+	       ((addr64 & DTE_BASE_HI_MASK) << DT_SHIFT);
 }
 
 static inline u32 rk_dma_addr_dte_v2(dma_addr_t dt_dma)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
