Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B44760CD
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 10:32:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2F61FC9F;
	Fri, 26 Jul 2019 08:32:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F13249F0
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 08:32:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1EE07709
	for <iommu@lists.linux-foundation.org>;
	Fri, 26 Jul 2019 08:32:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,310,1559487600"; d="scan'208";a="22504196"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 26 Jul 2019 17:32:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2074D42017BC;
	Fri, 26 Jul 2019 17:32:23 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Subject: [PATCH v9 0/5] treewide: improve R-Car SDHI performance
Date: Fri, 26 Jul 2019 17:31:11 +0900
Message-Id: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-block@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patch series is based on linux-next.git / next-20190726 tag.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or
more segments, the performance rate (especially, eMMC HS400 reading)
is not good. However, if IOMMU is enabled on the DMAC, since IOMMU will
map multiple scatter gather buffers as one contignous iova, the DMAC can
handle the iova as well and then the performance rate is possible to
improve. In fact, I have measured the performance by using bonnie++,
"Sequential Input - block" rate was improved on r8a7795.

To achieve this, this patch series modifies IOMMU and Block subsystem
at first. This patch series is strictly depended on each subsystem
modification, so that I submit it as treewide.

Changes from v8:
 - Rebase on next-20190726.
 - Use "1UL" instead of just "1" for iommu_dma_get_merge_boundary().
 - Add Simon-san's Reviewed-by into all patches.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=149023

Changes from v7:
 - Rebase on next-20190722 (v5.3-rc1 + next branches of subsystems)
 - Add some Reviewed-by.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=135391

Changes from v6:
 - [1/5 for DMA MAP] A new patch.
 - [2/5 for IOMMU] A new patch.
 - [3/5 for BLOCK] Add Reviewed-by.
 - [4/5 for BLOCK] Use a new DMA MAP API instead of device_iommu_mapped().
 - [5/5 for MMC] Likewise, and some minor fix.
 - Remove patch 4/5 of v6 from this v7 patch series.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=131769

Changes from v5:
 - Almost all patches are new code.
 - [4/5 for MMC] This is a refactor patch so that I don't add any
   {Tested,Reviewed}-by tags.
 - [5/5 for MMC] Modify MMC subsystem to use bigger segments instead of
   the renesas_sdhi driver.
 - [5/5 for MMC] Use BLK_MAX_SEGMENTS (128) instead of local value
   SDHI_MAX_SEGS_IN_IOMMU (512). Even if we use BLK_MAX_SEGMENTS,
   the performance is still good.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=127511

Changes from v4:
 - [DMA MAPPING] Add a new device_dma_parameters for iova contiguous.
 - [IOMMU] Add a new capable for "merging" segments.
 - [IOMMU] Add a capable ops into the ipmmu-vmsa driver.
 - [MMC] Sort headers in renesas_sdhi_core.c.
 - [MMC] Remove the following codes that made on v3 that can be achieved by
	 DMA MAPPING and IOMMU subsystem:
 -- Check if R-Car Gen3 IPMMU is used or not on patch 3.
 -- Check if all multiple segment buffers are aligned to PAGE_SIZE on patch 3.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=125593

Changes from v3:
 - Use a helper function device_iommu_mapped on patch 1 and 3.
 - Check if R-Car Gen3 IPMMU is used or not on patch 3.

Yoshihiro Shimoda (5):
  dma: Introduce dma_get_merge_boundary()
  iommu/dma: Add a new dma_map_ops of get_merge_boundary()
  block: sort headers on blk-setting.c
  block: add a helper function to merge the segments
  mmc: queue: Use bigger segments if DMA MAP layer can merge the
    segments

 Documentation/DMA-API.txt   |  8 ++++++++
 block/blk-settings.c        | 34 ++++++++++++++++++++++++++++------
 drivers/iommu/dma-iommu.c   | 11 +++++++++++
 drivers/mmc/core/queue.c    | 35 ++++++++++++++++++++++++++++++++---
 include/linux/blkdev.h      |  2 ++
 include/linux/dma-mapping.h |  6 ++++++
 include/linux/mmc/host.h    |  1 +
 kernel/dma/mapping.c        | 11 +++++++++++
 8 files changed, 99 insertions(+), 9 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
