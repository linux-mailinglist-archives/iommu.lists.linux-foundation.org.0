Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A873ACB8E
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 15:01:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CC360ADE;
	Fri, 18 Jun 2021 13:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4DKyr5Cn4zR; Fri, 18 Jun 2021 13:01:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B174160AD5;
	Fri, 18 Jun 2021 13:01:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81CFCC000B;
	Fri, 18 Jun 2021 13:01:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EBE7C000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04CBD403C1
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7OjS0UkJIAL for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:00:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD36A403BD
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 13:00:58 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:4cb:a870:141f:c87a:873e:7b6f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D2ED41F448BD;
 Fri, 18 Jun 2021 14:00:54 +0100 (BST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: will@kernel.org, robh+dt@kernel.org, heiko@sntech.de, xxm@rock-chips.com,
 robin.murphy@arm.com, joro@8bytes.org, dan.carpenter@oracle.com
Subject: [PATCH v2] iommu: rockchip: Fix physical address decoding
Date: Fri, 18 Jun 2021 15:00:47 +0200
Message-Id: <20210618130047.547986-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-arm-kernel@lists.infradead.org
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
