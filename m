Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D79F81A476D
	for <lists.iommu@lfdr.de>; Fri, 10 Apr 2020 16:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 317012153B;
	Fri, 10 Apr 2020 14:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0wxr25OBYRqY; Fri, 10 Apr 2020 14:30:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B54F20768;
	Fri, 10 Apr 2020 14:30:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0332BC0177;
	Fri, 10 Apr 2020 14:30:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 419D1C0177
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 14:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3103D881BE
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 14:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-wM39uYqlJq for <iommu@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 14:30:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 35A8485149
 for <iommu@lists.linux-foundation.org>; Fri, 10 Apr 2020 14:30:51 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
 id R2Wp2200M5USYZQ062Wp8i; Fri, 10 Apr 2020 16:30:49 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jMugD-0004re-5L; Fri, 10 Apr 2020 16:30:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jMugD-00058K-3B; Fri, 10 Apr 2020 16:30:49 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] iommu: Fix MTK_IOMMU dependencies
Date: Fri, 10 Apr 2020 16:30:47 +0200
Message-Id: <20200410143047.19691-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

If NO_DMA=y (e.g. Sun-3 all{mod,yes}-config):

    drivers/iommu/dma-iommu.o: In function `iommu_dma_mmap':
    dma-iommu.c:(.text+0x836): undefined reference to `dma_pgprot'

IOMMU_DMA must not be selected, unless HAS_DMA=y.

Hence fix this by making MTK_IOMMU depend on HAS_DMA.
While at it, remove the dependency on ARM || ARM64, as that is already
implied by the dependency on ARCH_MEDIATEK.

Fixes: e93a1695d7fb5513 ("iommu: Enable compile testing for some of drivers")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 58b4a4dbfc78b9a5..bead9aaea8429447 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -457,7 +457,7 @@ config S390_AP_IOMMU
 
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on HAS_DMA
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
