Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DE29F312
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 18:26:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A50F86C22;
	Thu, 29 Oct 2020 17:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBmpJmkLAUMr; Thu, 29 Oct 2020 17:26:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF6E686C26;
	Thu, 29 Oct 2020 17:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2EF2C0051;
	Thu, 29 Oct 2020 17:26:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F920C0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F239F86C15
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuwS-DW8bP83 for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 17:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2B97886C1E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:25:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2788DAC9A;
 Thu, 29 Oct 2020 17:25:56 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] arm64: Default to 32-bit wide ZONE_DMA
Date: Thu, 29 Oct 2020 18:25:43 +0100
Message-Id: <20201029172550.3523-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, will@kernel.org,
 jeremy.linton@arm.com, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 linux-riscv@lists.infradead.org, robin.murphy@arm.com,
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

Using two distinct DMA zones turned out to be problematic. Here's an
attempt go back to a saner default.

I tested this on both a RPi4 and QEMU.

---

Changes since v4:
 - Fix of_dma_get_max_cpu_address() so it returns the last addressable
   addres, not the limit

Changes since v3:
 - Drop patch adding define in dma-mapping
 - Address small review changes
 - Update Ard's patch
 - Add new patch removing examples from mmzone.h

Changes since v2:
 - Introduce Ard's patch
 - Improve OF dma-ranges parsing function
 - Add unit test for OF function
 - Address small changes
 - Move crashkernel reservation later in boot process

Changes since v1:
 - Parse dma-ranges instead of using machine compatible string

Ard Biesheuvel (1):
  arm64: mm: Set ZONE_DMA size based on early IORT scan

Nicolas Saenz Julienne (6):
  arm64: mm: Move reserve_crashkernel() into mem_init()
  arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
  of/address: Introduce of_dma_get_max_cpu_address()
  of: unittest: Add test for of_dma_get_max_cpu_address()
  arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
  mm: Remove examples from enum zone_type comment

 arch/arm64/mm/init.c      | 16 ++++++------
 drivers/acpi/arm64/iort.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/of/address.c      | 42 +++++++++++++++++++++++++++++++
 drivers/of/unittest.c     | 18 ++++++++++++++
 include/linux/acpi_iort.h |  4 +++
 include/linux/mmzone.h    | 20 ---------------
 include/linux/of.h        |  7 ++++++
 7 files changed, 130 insertions(+), 29 deletions(-)

-- 
2.29.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
