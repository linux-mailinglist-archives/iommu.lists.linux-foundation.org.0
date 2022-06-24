Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C1559DA6
	for <lists.iommu@lfdr.de>; Fri, 24 Jun 2022 17:52:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9526C60C33;
	Fri, 24 Jun 2022 15:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9526C60C33
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NEolLau7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxbmpDAytm37; Fri, 24 Jun 2022 15:52:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8814460B6E;
	Fri, 24 Jun 2022 15:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8814460B6E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E980C0081;
	Fri, 24 Jun 2022 15:52:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A23EC002D
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3659782486
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3659782486
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=NEolLau7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jMUlU4UT95NO for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jun 2022 15:52:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6449682410
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6449682410
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jun 2022 15:52:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A8A962258;
 Fri, 24 Jun 2022 15:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7BCC341D6;
 Fri, 24 Jun 2022 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656085955;
 bh=z0VIW50hHPorhgqCOjEj4pIbQj4gKEKNY/gMJ41P6tw=;
 h=From:To:Cc:Subject:Date:From;
 b=NEolLau7ihjMHKnysJJTyokDl06zDeTXySMwLvr7vqyVI0L6Nc0fQCjHbkY/zj8Iu
 G2xCgk13FrCQJFnP5wiJ9Plh24nPNake3VPaJ1jDX0SfVpT9BIR9P7BzlET5GnVu0W
 009KSRMprpkQXnDutZG8Vhd4dNM7gMIfiiiyFoLXJNioKUth+KVJbGuJv4bMy2eIWh
 g2BS1YRav2MMUWz7FNWsJdXmZpYZG7C1JSg0xkJF59/7egI/0vitb0b/H0jl0xQrd5
 emKVPOJRccRvz/AglHixFGdOa6q3Xd8SkI34jYzxj1PQZQcHcG8LCmScMy/HfqyGiu
 Kk4iuiK7m3XBw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-scsi@vger.kernel.org
Subject: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Fri, 24 Jun 2022 17:52:23 +0200
Message-Id: <20220624155226.2889613-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, "Maciej W . Rozycki" <macro@orcam.me.uk>,
 linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>,
 Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>,
 iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>,
 linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>
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
Kconfig dependencies, and are not actually broken. It might be
helpful as a follow-up to replace them with platform specific
helpers for amiga, m68k-vme and powermac.

There are still a number of drivers that are using virt_to_phys()
and phys_to_virt() in place of dma-mapping operations, and these
are often broken, but they are out of scope for this series.

If there are no more issues identified with this series, I'll
merge it through the asm-generic tree. The SCSI patches can
also get merged separately through the SCSI maintainers' tree
if they prefer.

      Arnd

---
Changes since v2:
 - Drop the dpt_i2o driver completely rather than fixing it
 - fix mistake in BusLogic patch

Changes since v1:
 - dropped VME patches that are already in staging-next
 - dropped media patch that gets merged independently
 - added a networking patch and dropped it again after it got merged
 - replace BusLogic removal with a workaround

Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org> # dma-mapping
Cc: Marek Szyprowski <m.szyprowski@samsung.com> # dma-mapping
Cc: Robin Murphy <robin.murphy@arm.com> # dma-mapping
Cc: iommu@lists.linux-foundation.org
Cc: Khalid Aziz <khalid@gonehiking.org> # buslogic
Cc: Maciej W. Rozycki <macro@orcam.me.uk> # buslogic
Cc: Matt Wang <wwentao@vmware.com> # buslogic
Cc: Miquel van Smoorenburg <mikevs@xs4all.net> # dpt_i2o
Cc: Mark Salyzyn <salyzyn@android.com> # dpt_i2o
Cc: linux-scsi@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-parisc@vger.kernel.org
Cc: Denis Efremov <efremov@linux.com> # floppy

Arnd Bergmann (3):
  scsi: BusLogic remove bus_to_virt
  scsi: dpt_i2o: remove obsolete driver
  arch/*/: remove CONFIG_VIRT_TO_BUS

 .../core-api/bus-virt-phys-mapping.rst        |  220 -
 Documentation/core-api/dma-api-howto.rst      |   14 -
 Documentation/core-api/index.rst              |    1 -
 .../translations/zh_CN/core-api/index.rst     |    1 -
 .../userspace-api/ioctl/ioctl-number.rst      |    2 +-
 MAINTAINERS                                   |    8 -
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
 drivers/scsi/BusLogic.c                       |   35 +-
 drivers/scsi/Kconfig                          |   13 +-
 drivers/scsi/Makefile                         |    1 -
 drivers/scsi/dpt/dpti_i2o.h                   |  441 --
 drivers/scsi/dpt/dpti_ioctl.h                 |  136 -
 drivers/scsi/dpt/dptsig.h                     |  336 --
 drivers/scsi/dpt/osd_defs.h                   |   79 -
 drivers/scsi/dpt/osd_util.h                   |  358 --
 drivers/scsi/dpt/sys_info.h                   |  417 --
 drivers/scsi/dpt_i2o.c                        | 3546 -----------------
 drivers/scsi/dpti.h                           |  331 --
 include/asm-generic/io.h                      |   14 -
 mm/Kconfig                                    |    8 -
 40 files changed, 35 insertions(+), 5989 deletions(-)
 delete mode 100644 Documentation/core-api/bus-virt-phys-mapping.rst
 delete mode 100644 drivers/scsi/dpt/dpti_i2o.h
 delete mode 100644 drivers/scsi/dpt/dpti_ioctl.h
 delete mode 100644 drivers/scsi/dpt/dptsig.h
 delete mode 100644 drivers/scsi/dpt/osd_defs.h
 delete mode 100644 drivers/scsi/dpt/osd_util.h
 delete mode 100644 drivers/scsi/dpt/sys_info.h
 delete mode 100644 drivers/scsi/dpt_i2o.c
 delete mode 100644 drivers/scsi/dpti.h

-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
