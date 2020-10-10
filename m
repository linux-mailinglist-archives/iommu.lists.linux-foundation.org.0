Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FB28A0B9
	for <lists.iommu@lfdr.de>; Sat, 10 Oct 2020 17:12:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 242EB8777F;
	Sat, 10 Oct 2020 15:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjuOTuQ5PL3i; Sat, 10 Oct 2020 15:12:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B8C087788;
	Sat, 10 Oct 2020 15:12:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70533C016F;
	Sat, 10 Oct 2020 15:12:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 611AEC0051
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5D37E8704F
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twh9VC4p5TFO for <iommu@lists.linux-foundation.org>;
 Sat, 10 Oct 2020 15:12:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 07EA686FAF
 for <iommu@lists.linux-foundation.org>; Sat, 10 Oct 2020 15:12:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 502E5ACA3;
 Sat, 10 Oct 2020 15:12:44 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: Default to 32-bit wide ZONE_DMA
Date: Sat, 10 Oct 2020 17:12:30 +0200
Message-Id: <20201010151235.20585-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

I realized this morning after reading Ard's patch fixing the same issue
in ACPI that we can move the zone_dma_bits initialization later in the
init process. This permits the use of OF to parse dma-ranges in the
system. Something we though we couldn't do on previous iterations of
this.

The series sits on top of Ard's patch "arm64: mm: set ZONE_DMA size
based on early IORT scan."

--- Original cover letter

Using two distinct DMA zones turned out to be problematic. Here's an
attempt go back to a saner default.

I tested this on both a RPi4 and QEMU.

---

Changes since v1:
 - Parse dma-ranges instead of using machine compatible string

Nicolas Saenz Julienne (5):
  arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
  of/address: Introduce of_dma_lower_bus_limit()
  dma-direct: Turn zone_dma_bits default value into a define
  arm64: mm: Dynamically resize zone_dma_bits based on system's
    constraints
  mm: Update DMA zones description

 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/mm/init.c               | 12 ++++-------
 drivers/of/address.c               | 34 ++++++++++++++++++++++++++++++
 include/linux/dma-direct.h         |  3 +++
 include/linux/mmzone.h             |  5 +++--
 include/linux/of.h                 |  7 ++++++
 kernel/dma/direct.c                |  2 +-
 7 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
