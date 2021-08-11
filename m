Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F53E9067
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 14:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E206087C;
	Wed, 11 Aug 2021 12:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnTui1PNnBKp; Wed, 11 Aug 2021 12:21:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 19CE160878;
	Wed, 11 Aug 2021 12:21:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8AE0C000E;
	Wed, 11 Aug 2021 12:21:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0374AC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5AFB4054D
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odsl361e7dOG for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 12:21:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id C414D40476
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 12:21:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84A2106F;
 Wed, 11 Aug 2021 05:21:48 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BD7B3F718;
 Wed, 11 Aug 2021 05:21:46 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v4 00/24] iommu: Refactor DMA domain strictness
Date: Wed, 11 Aug 2021 13:21:14 +0100
Message-Id: <cover.1628682048.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Maxime Ripard <mripard@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-kernel@vger.kernel.org, Chunyan Zhang <chunyan.zhang@unisoc.com>,
 dianders@chromium.org, iommu@lists.linux-foundation.org, rajatja@google.com,
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

v1: https://lore.kernel.org/linux-iommu/cover.1626888444.git.robin.murphy@arm.com/
v2: https://lore.kernel.org/linux-iommu/cover.1627468308.git.robin.murphy@arm.com/
v3: https://lore.kernel.org/linux-iommu/cover.1628094600.git.robin.murphy@arm.com/

Hi all,

I'm hoping this is good to go now. Changes from v3 are minimal, just
rolling back patch #2 to the non-broken version, and tidying up the
final patch as documented there.

Cheers,
Robin.


CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Yong Wu <yong.wu@mediatek.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Chunyan Zhang <chunyan.zhang@unisoc.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Jean-Philippe Brucker <jean-philippe@linaro.org>


Robin Murphy (24):
  iommu: Pull IOVA cookie management into the core
  iommu/amd: Drop IOVA cookie management
  iommu/arm-smmu: Drop IOVA cookie management
  iommu/vt-d: Drop IOVA cookie management
  iommu/exynos: Drop IOVA cookie management
  iommu/ipmmu-vmsa: Drop IOVA cookie management
  iommu/mtk: Drop IOVA cookie management
  iommu/rockchip: Drop IOVA cookie management
  iommu/sprd: Drop IOVA cookie management
  iommu/sun50i: Drop IOVA cookie management
  iommu/virtio: Drop IOVA cookie management
  iommu/dma: Unexport IOVA cookie management
  iommu/dma: Remove redundant "!dev" checks
  iommu: Indicate queued flushes via gather data
  iommu/io-pgtable: Remove non-strict quirk
  iommu: Introduce explicit type for non-strict DMA domains
  iommu/amd: Prepare for multiple DMA domain types
  iommu/arm-smmu: Prepare for multiple DMA domain types
  iommu/vt-d: Prepare for multiple DMA domain types
  iommu: Express DMA strictness via the domain type
  iommu: Expose DMA domain strictness via sysfs
  iommu: Only log strictness for DMA domains
  iommu: Merge strictness and domain type configs
  iommu: Allow enabling non-strict mode dynamically

 .../ABI/testing/sysfs-kernel-iommu_groups     |  6 +-
 .../admin-guide/kernel-parameters.txt         |  8 +-
 drivers/iommu/Kconfig                         | 80 +++++++++----------
 drivers/iommu/amd/iommu.c                     | 21 +----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 11 +--
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 19 ++---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  9 ---
 drivers/iommu/dma-iommu.c                     | 58 ++++++++------
 drivers/iommu/exynos-iommu.c                  | 19 +----
 drivers/iommu/intel/iommu.c                   | 23 ++----
 drivers/iommu/io-pgtable-arm-v7s.c            | 12 +--
 drivers/iommu/io-pgtable-arm.c                | 12 +--
 drivers/iommu/iommu.c                         | 56 ++++++++-----
 drivers/iommu/iova.c                          | 14 +++-
 drivers/iommu/ipmmu-vmsa.c                    | 28 +------
 drivers/iommu/mtk_iommu.c                     |  7 --
 drivers/iommu/mtk_iommu_v1.c                  |  1 -
 drivers/iommu/rockchip-iommu.c                | 12 +--
 drivers/iommu/sprd-iommu.c                    |  7 --
 drivers/iommu/sun50i-iommu.c                  | 13 +--
 drivers/iommu/virtio-iommu.c                  |  8 --
 include/linux/dma-iommu.h                     |  6 ++
 include/linux/io-pgtable.h                    |  5 --
 include/linux/iommu.h                         | 23 +++++-
 24 files changed, 184 insertions(+), 274 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
