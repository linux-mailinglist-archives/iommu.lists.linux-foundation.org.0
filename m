Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8053E1AE
	for <lists.iommu@lfdr.de>; Mon,  6 Jun 2022 10:41:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E843F403B3;
	Mon,  6 Jun 2022 08:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWdIJCK0tVLM; Mon,  6 Jun 2022 08:41:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DCC814010C;
	Mon,  6 Jun 2022 08:41:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC566C002D;
	Mon,  6 Jun 2022 08:41:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E31A1C002D
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B937D84035
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8WQ4qs5ex03 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jun 2022 08:41:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9740983FB6
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jun 2022 08:41:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2227CB8123D;
 Mon,  6 Jun 2022 08:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35532C34119;
 Mon,  6 Jun 2022 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654504884;
 bh=sDOLXYQR0wOt3J1gNTtbMOI7sGHc/kgPyuM8RXutK6o=;
 h=From:To:Cc:Subject:Date:From;
 b=SkDVuZeDrFJ5adNIjdWczP7EVnrZrEp+b8yU8nbse1AbBTmXLuujgQXqukIPdpKP3
 jSZ31jnOZ/+J/T/tRB28RAeo8NGiBd/TKqQnFCLbG+oG/dtT3GCqi/W3IS2bDK+hNi
 i0jDa5e9iaXrvGUPpvloldIKntp4YGFDBwTdkXFsEdbaMrGtGPlL0fuvuGwxCMBdVV
 76gpV0DFczhbrMGSff3e/ZOmlqAnKy+kOhfKLgF12HFzcDvn0yARasaaVFnbObBUAl
 uX74CL7XSW/CloOp4Tr2E8Z8nhD9gE9XMoP2apFoo0WvB+vAsfa8d7hBmEvkZ2XDcE
 aSXARa3ZlYuZg==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Subject: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
Date: Mon,  6 Jun 2022 10:41:03 +0200
Message-Id: <20220606084109.4108188-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

The virt_to_bus/bus_to_virt interface has been deprecated for
decades. After Jakub Kicinski put a lot of work into cleaning out the
network drivers using them, there are only a couple of other drivers
left, which can all be removed or otherwise cleaned up, to remove the
old interface for good.

Any out of tree drivers using virt_to_bus() should be converted to
using the dma-mapping interfaces, typically dma_alloc_coherent()
or dma_map_single()).

There are a few m68k and ppc32 specific drivers that keep using the
interfaces, but these are all guarded with architecture-specific
Kconfig dependencies, and are not actually broken.

There are still a number of drivers that are using virt_to_phys()
and phys_to_virt() in place of dma-mapping operations, and these
are often broken, but they are out of scope for this series.

      Arnd

Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org> # dma-mapping
Cc: Marek Szyprowski <m.szyprowski@samsung.com> # dma-mapping
Cc: Robin Murphy <robin.murphy@arm.com> # dma-mapping
Cc: iommu@lists.linux-foundation.org
Cc: Khalid Aziz <khalid@gonehiking.org> # buslogic
Cc: linux-scsi@vger.kernel.org
Cc: Manohar Vanga <manohar.vanga@gmail.com> # vme
Cc: Martyn Welch <martyn@welchs.me.uk> # vme
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> # vme
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-parisc@vger.kernel.org
Cc: Denis Efremov <efremov@linux.com> # floppy

Arnd Bergmann (6):
  vme: remove ca91cx42 Universe-II support
  vme: move back to staging
  media: sta2x11: remove VIRT_TO_BUS dependency
  scsi: dpt_i2o: drop stale VIRT_TO_BUS dependency
  scsi: remove stale BusLogic driver
  arch/*/: remove CONFIG_VIRT_TO_BUS

 .../core-api/bus-virt-phys-mapping.rst        |  220 -
 Documentation/core-api/dma-api-howto.rst      |   14 -
 Documentation/core-api/index.rst              |    1 -
 Documentation/driver-api/vme.rst              |    4 +-
 Documentation/scsi/BusLogic.rst               |  581 --
 Documentation/scsi/FlashPoint.rst             |  176 -
 .../translations/zh_CN/core-api/index.rst     |    1 -
 MAINTAINERS                                   |   11 +-
 arch/alpha/Kconfig                            |    1 -
 arch/alpha/include/asm/floppy.h               |    2 +-
 arch/alpha/include/asm/io.h                   |    8 +-
 arch/ia64/Kconfig                             |    1 -
 arch/ia64/include/asm/io.h                    |    8 -
 arch/m68k/Kconfig                             |    1 -
 arch/m68k/include/asm/virtconvert.h           |    4 +-
 arch/microblaze/Kconfig                       |    1 -
 arch/microblaze/include/asm/io.h              |    2 -
 arch/mips/Kconfig                             |    1 -
 arch/mips/include/asm/io.h                    |    9 -
 arch/parisc/Kconfig                           |    1 -
 arch/parisc/include/asm/floppy.h              |    4 +-
 arch/parisc/include/asm/io.h                  |    2 -
 arch/powerpc/Kconfig                          |    1 -
 arch/powerpc/include/asm/io.h                 |    2 -
 arch/riscv/include/asm/page.h                 |    1 -
 arch/x86/Kconfig                              |    1 -
 arch/x86/include/asm/io.h                     |    9 -
 arch/xtensa/Kconfig                           |    1 -
 arch/xtensa/include/asm/io.h                  |    3 -
 drivers/Kconfig                               |    2 -
 drivers/Makefile                              |    1 -
 drivers/media/pci/sta2x11/Kconfig             |    2 +-
 drivers/scsi/BusLogic.c                       | 3727 --------
 drivers/scsi/BusLogic.h                       | 1284 ---
 drivers/scsi/FlashPoint.c                     | 7560 -----------------
 drivers/scsi/Kconfig                          |   26 +-
 drivers/scsi/dpt_i2o.c                        |    4 +-
 drivers/staging/vme_user/Kconfig              |   27 +
 drivers/staging/vme_user/Makefile             |    3 +
 drivers/{vme => staging/vme_user}/vme.c       |    2 +-
 .../linux => drivers/staging/vme_user}/vme.h  |    0
 .../{vme => staging/vme_user}/vme_bridge.h    |    2 +-
 .../bridges => staging/vme_user}/vme_fake.c   |    4 +-
 .../bridges => staging/vme_user}/vme_tsi148.c |    4 +-
 .../bridges => staging/vme_user}/vme_tsi148.h |    0
 drivers/staging/vme_user/vme_user.c           |    2 +-
 drivers/vme/Kconfig                           |   18 -
 drivers/vme/Makefile                          |    8 -
 drivers/vme/boards/Kconfig                    |   10 -
 drivers/vme/boards/Makefile                   |    6 -
 drivers/vme/boards/vme_vmivme7805.c           |  106 -
 drivers/vme/boards/vme_vmivme7805.h           |   33 -
 drivers/vme/bridges/Kconfig                   |   24 -
 drivers/vme/bridges/Makefile                  |    4 -
 drivers/vme/bridges/vme_ca91cx42.c            | 1928 -----
 drivers/vme/bridges/vme_ca91cx42.h            |  579 --
 include/asm-generic/io.h                      |   14 -
 mm/Kconfig                                    |    8 -
 58 files changed, 54 insertions(+), 16405 deletions(-)
 delete mode 100644 Documentation/core-api/bus-virt-phys-mapping.rst
 delete mode 100644 Documentation/scsi/BusLogic.rst
 delete mode 100644 Documentation/scsi/FlashPoint.rst
 delete mode 100644 drivers/scsi/BusLogic.c
 delete mode 100644 drivers/scsi/BusLogic.h
 delete mode 100644 drivers/scsi/FlashPoint.c
 rename drivers/{vme => staging/vme_user}/vme.c (99%)
 rename {include/linux => drivers/staging/vme_user}/vme.h (100%)
 rename drivers/{vme => staging/vme_user}/vme_bridge.h (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_fake.c (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_tsi148.c (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_tsi148.h (100%)
 delete mode 100644 drivers/vme/Kconfig
 delete mode 100644 drivers/vme/Makefile
 delete mode 100644 drivers/vme/boards/Kconfig
 delete mode 100644 drivers/vme/boards/Makefile
 delete mode 100644 drivers/vme/boards/vme_vmivme7805.c
 delete mode 100644 drivers/vme/boards/vme_vmivme7805.h
 delete mode 100644 drivers/vme/bridges/Kconfig
 delete mode 100644 drivers/vme/bridges/Makefile
 delete mode 100644 drivers/vme/bridges/vme_ca91cx42.c
 delete mode 100644 drivers/vme/bridges/vme_ca91cx42.h

-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
