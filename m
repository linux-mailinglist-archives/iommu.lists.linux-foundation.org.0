Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC7D696D
	for <lists.iommu@lfdr.de>; Mon, 14 Oct 2019 20:31:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B88832D09;
	Mon, 14 Oct 2019 18:31:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 90FC62D04
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF573821
	for <iommu@lists.linux-foundation.org>;
	Mon, 14 Oct 2019 18:31:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E5637BB6A;
	Mon, 14 Oct 2019 18:31:46 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
Subject: [PATCH RFC 0/5] ARM: Raspberry Pi 4 DMA support
Date: Mon, 14 Oct 2019 20:31:02 +0200
Message-Id: <20191014183108.24804-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, f.fainelli@gmail.com,
	linux-kernel@vger.kernel.org, mbrugger@suse.com,
	wahrenst@gmx.net, linuxppc-dev@lists.ozlabs.org,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

Hi all,
the Raspberry Pi 4 offers up to 4GB of memory, of which only the first
is DMA capable device wide. This forces us to use of bounce buffers,
which are currently not very well supported by ARM's custom DMA ops.
Among other things the current mechanism (see dmabounce.c) isn't
suitable for high memory. Instead of fixing it, this series introduces a
way of selecting dma-direct as the default DMA ops provider which allows
for the Raspberry Pi to make use of swiotlb.

Regards,
Nicolas

---

Nicolas Saenz Julienne (5):
  dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
  ARM: introduce arm_dma_direct
  ARM: let machines select dma-direct over arch's DMA implementation
  dma/direct: check for overflows in ARM's dma_capable()
  ARM: bcm2711: use dma-direct

 arch/arm/include/asm/dma-direct.h  |  6 ++++++
 arch/arm/include/asm/dma-mapping.h |  3 ++-
 arch/arm/include/asm/dma.h         |  2 ++
 arch/arm/include/asm/mach/arch.h   |  1 +
 arch/arm/mach-bcm/Kconfig          |  1 +
 arch/arm/mach-bcm/bcm2711.c        |  1 +
 arch/arm/mm/dma-mapping.c          | 10 ++--------
 arch/arm/mm/init.c                 | 21 ++++++++++++++++++++-
 arch/arm64/include/asm/page.h      |  2 --
 arch/arm64/mm/init.c               |  9 +++++++--
 arch/powerpc/include/asm/page.h    |  9 ---------
 arch/powerpc/mm/mem.c              | 20 +++++++++++++++-----
 arch/s390/include/asm/page.h       |  2 --
 arch/s390/mm/init.c                |  1 +
 include/linux/dma-direct.h         |  2 ++
 kernel/dma/direct.c                | 13 ++++++-------
 16 files changed, 66 insertions(+), 37 deletions(-)

-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
