Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E220CE75
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 14:11:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0087A887E5;
	Mon, 29 Jun 2020 12:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qb9CyauHoWpG; Mon, 29 Jun 2020 12:11:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B7DD88389;
	Mon, 29 Jun 2020 12:11:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 179DBC08A0;
	Mon, 29 Jun 2020 12:11:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DCE1C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7ABB4204F2
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBs2MCBu9xjd for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 12:11:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
 by silver.osuosl.org (Postfix) with ESMTPS id 6D12F203E7
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 12:11:50 +0000 (UTC)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:ddd:9277:6399:6268])
 by albert.telenet-ops.be with bizsmtp
 id x0Bn220091qNRsK060BnaB; Mon, 29 Jun 2020 14:11:48 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jpsdX-0001l7-Hw; Mon, 29 Jun 2020 14:11:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jpsdX-0006G0-Ex; Mon, 29 Jun 2020 14:11:47 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Joerg Roedel <joro@8bytes.org>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] iommu: SUN50I_IOMMU should depend on HAS_DMA
Date: Mon, 29 Jun 2020 14:11:46 +0200
Message-Id: <20200629121146.24011-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org
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

If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):

    drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
    dma-iommu.c:(.text+0x92e): undefined reference to `dma_pgprot'

IOMMU_DMA must not be selected, unless HAS_DMA=y.

Hence fix this by making SUN50I_IOMMU depend on HAS_DMA.

Fixes: 4100b8c229b32835 ("iommu: Add Allwinner H6 IOMMU driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6dc49ed8377a5c12..b0f308cb7f7c2fc2 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -305,6 +305,7 @@ config ROCKCHIP_IOMMU
 
 config SUN50I_IOMMU
 	bool "Allwinner H6 IOMMU Support"
+	depends on HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
