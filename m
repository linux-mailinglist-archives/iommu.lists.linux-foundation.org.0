Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451653E1B1
	for <lists.iommu@lfdr.de>; Mon,  6 Jun 2022 10:41:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86AB98414E;
	Mon,  6 Jun 2022 08:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hSIIg2DJdtg; Mon,  6 Jun 2022 08:41:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 960BC84148;
	Mon,  6 Jun 2022 08:41:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F9ABC002D;
	Mon,  6 Jun 2022 08:41:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C90FBC002D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B33B760E5F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HRvPHTmI4htz for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 08:41:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 237C960BFC
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 667916125D;
 Mon,  6 Jun 2022 08:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA3DC34119;
 Mon,  6 Jun 2022 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654504897;
 bh=D+RdnsGxCjpna2nFhDsPH8yn1kQWXeuteyiCbSjG4Ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nqkhvRnQT5TdcQzFwYUC5t6BbcwuV7Wpx2G1o5hTpanlR8yXaV4ODVU7ew7jL8DvO
 l3JTVw7DKobxXEKQZ3heVLvDfhUmjB940bcalu6UvoP2LwHrYPpKg12kYzTLQS6pKT
 kf317YxZeSp6jD/5DgCpKbSN6CjRhym31MHdvdZtORbIwmeGN1epari6VDm6Zv3KZl
 sRRdHvKbw8lAF0HX5L+i6MurK8fE/6XIhEVBIspfhVP5cePJ7g5c65vcGINxSZpFqa
 vlwgUpxU3YlmZrSSRp2xN6dqcrwPKgCERmeHhrZ2pBVMMXljYfaBR5K2rCGXZ4IYSq
 D/00l/vISah5w==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Subject: [PATCH 3/6] media: sta2x11: remove VIRT_TO_BUS dependency
Date: Mon,  6 Jun 2022 10:41:06 +0200
Message-Id: <20220606084109.4108188-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220606084109.4108188-1-arnd@kernel.org>
References: <20220606084109.4108188-1-arnd@kernel.org>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Denis Efremov <efremov@linux.com>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>,
 Robin Murphy <robin.murphy@arm.com>
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

From: Arnd Bergmann <arnd@arndb.de>

This driver does not use the virt_to_bus() function, though it
depends on x86 specific fixups in the swiotlb code, which was
last rewritten in commit e380a0394c36 ("x86/PCI: sta2x11: use
default DMA address translation").

It is possible that the driver still fails to build on some
architectures that are missing CONFIG_VIRT_TO_BUS, but it is
always set on x86 machines with the STA2X11 platform enabled.

More likely though is that it was never meant to depend on
CONFIG_VIRT_TO_BUS, and the Kconfig dependency was kept from
an out-of-tree version when the driver was originally merged.

Fixes: efeb98b4e2b2 ("[media] STA2X11 VIP: new V4L2 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/sta2x11/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
index a96e170ab04e..118b922c08c3 100644
--- a/drivers/media/pci/sta2x11/Kconfig
+++ b/drivers/media/pci/sta2x11/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config STA2X11_VIP
 	tristate "STA2X11 VIP Video For Linux"
-	depends on PCI && VIDEO_DEV && VIRT_TO_BUS && I2C
+	depends on PCI && VIDEO_DEV && I2C
 	depends on STA2X11 || COMPILE_TEST
 	select GPIOLIB if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
