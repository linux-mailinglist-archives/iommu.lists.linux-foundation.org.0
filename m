Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B63DA7D1
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 17:49:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A780E405A4;
	Thu, 29 Jul 2021 15:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLixgLSi-kPh; Thu, 29 Jul 2021 15:49:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A06EB4059B;
	Thu, 29 Jul 2021 15:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E4ABC000E;
	Thu, 29 Jul 2021 15:49:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C1FAC000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D0A60607
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQ3LWOGJmvHy for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 15:49:10 +0000 (UTC)
X-Greylist: delayed 00:44:43 by SQLgrey-1.8.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B233260BEA
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 15:49:10 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1m97a1-0003o0-7g; Thu, 29 Jul 2021 17:04:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: joro@8bytes.org, will@kernel.org, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 00/24] iommu: Refactor DMA domain strictness
Date: Thu, 29 Jul 2021 17:04:12 +0200
Message-ID: <2947762.k3LOHGUjKi@diego>
In-Reply-To: <cover.1627468308.git.robin.murphy@arm.com>
References: <cover.1627468308.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: Maxime Ripard <mripard@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Chunyan Zhang <chunyan.zhang@unisoc.com>, dianders@chromium.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Hi Robin,

Am Mittwoch, 28. Juli 2021, 17:58:21 CEST schrieb Robin Murphy:
> Hi all,
> 
> Here's v2 where things start to look more realistic, hence the expanded
> CC list. The patches are now based on the current iommu/core branch to
> take John's iommu_set_dma_strict() cleanup into account.
> 
> The series remiains in two (or possibly 3) logical parts - for people
> CC'd on cookie cleanup patches, the later parts should not affect you
> since your drivers don't implement non-strict mode anyway; the cleanup
> is all pretty straightforward, but please do yell at me if I've managed
> to let a silly mistake slip through and broken your driver.
> 
> This time I have also build-tested x86 as well as arm64 :)

TL;DR: arm64 yay, arm32 nay ;-)

testcase:
5.14-rc3
+ iommu/next
+ patches 1+8 (the ones you cc'd me on)
  iommu: Pull IOVA cookie management into the core
  iommu/rockchip: Drop IOVA cookie management

rk3399+hdmi (puma): boots with graphics
rk3399+edp (kevin): boots with graphics
px30+dsi (minievb): boots with graphics

rk3288 (arm32, veyron-pinky): hangs when trying to start the rockchip-drm
at some points the rest of the system recovers and fills the log with

[   47.193776] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   47.193867] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:31:plane-0] commit wait timed out
[   57.433743] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
[   57.433828] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:40:plane-4] commit wait timed out

spews

testcase 2:
5.14-rc3
+ iommu/next

all works fine on both arm32+arm64


That whole iommu voodoo is a bit over my head right now, so I'm not sure
what to poke to diagnose this.


Heiko


> Changes in v2:
> 
> - Add iommu_is_dma_domain() helper to abstract flag check (and help
>   avoid silly typos like the one in v1).
> - Tweak a few commit messages for spelling and (hopefully) clarity.
> - Move the iommu_create_device_direct_mappings() update to patch #14
>   where it should have been.
> - Rewrite patch #20 as a conversion of the now-existing option.
> - Clean up the ops->flush_iotlb_all check which is also made redundant
>   by the new domain type
> - Add patch #24, which is arguably tangential, but it was something I
>   spotted during the rebase, so...
> 
> Once again, the whole lot is available on a branch here:
> 
> https://gitlab.arm.com/linux-arm/linux-rm/-/tree/iommu/fq
> 
> Thanks,
> Robin.
> 
> 
> CC: Marek Szyprowski <m.szyprowski@samsung.com>
> CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> CC: Geert Uytterhoeven <geert+renesas@glider.be>
> CC: Yong Wu <yong.wu@mediatek.com>
> CC: Heiko Stuebner <heiko@sntech.de>
> CC: Chunyan Zhang <chunyan.zhang@unisoc.com>
> CC: Chunyan Zhang <chunyan.zhang@unisoc.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Robin Murphy (24):
>   iommu: Pull IOVA cookie management into the core
>   iommu/amd: Drop IOVA cookie management
>   iommu/arm-smmu: Drop IOVA cookie management
>   iommu/vt-d: Drop IOVA cookie management
>   iommu/exynos: Drop IOVA cookie management
>   iommu/ipmmu-vmsa: Drop IOVA cookie management
>   iommu/mtk: Drop IOVA cookie management
>   iommu/rockchip: Drop IOVA cookie management
>   iommu/sprd: Drop IOVA cookie management
>   iommu/sun50i: Drop IOVA cookie management
>   iommu/virtio: Drop IOVA cookie management
>   iommu/dma: Unexport IOVA cookie management
>   iommu/dma: Remove redundant "!dev" checks
>   iommu: Introduce explicit type for non-strict DMA domains
>   iommu/amd: Prepare for multiple DMA domain types
>   iommu/arm-smmu: Prepare for multiple DMA domain types
>   iommu/vt-d: Prepare for multiple DMA domain types
>   iommu: Express DMA strictness via the domain type
>   iommu: Expose DMA domain strictness via sysfs
>   iommu: Merge strictness and domain type configs
>   iommu/dma: Factor out flush queue init
>   iommu: Allow enabling non-strict mode dynamically
>   iommu/arm-smmu: Allow non-strict in pgtable_quirks interface
>   iommu: Only log strictness for DMA domains
> 
>  .../ABI/testing/sysfs-kernel-iommu_groups     |  2 +
>  drivers/iommu/Kconfig                         | 80 +++++++++----------
>  drivers/iommu/amd/iommu.c                     | 21 +----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 25 ++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 29 ++++---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  8 --
>  drivers/iommu/dma-iommu.c                     | 44 +++++-----
>  drivers/iommu/exynos-iommu.c                  | 18 +----
>  drivers/iommu/intel/iommu.c                   | 23 ++----
>  drivers/iommu/iommu.c                         | 53 +++++++-----
>  drivers/iommu/ipmmu-vmsa.c                    | 27 +------
>  drivers/iommu/mtk_iommu.c                     |  6 --
>  drivers/iommu/rockchip-iommu.c                | 11 +--
>  drivers/iommu/sprd-iommu.c                    |  6 --
>  drivers/iommu/sun50i-iommu.c                  | 12 +--
>  drivers/iommu/virtio-iommu.c                  |  8 --
>  include/linux/dma-iommu.h                     |  9 ++-
>  include/linux/iommu.h                         | 15 +++-
>  18 files changed, 171 insertions(+), 226 deletions(-)
> 
> 




_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
