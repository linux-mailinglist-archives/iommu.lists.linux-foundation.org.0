Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF7209F22
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 15:08:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8273884A0;
	Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2fsfLjswVao; Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 143DA884CD;
	Thu, 25 Jun 2020 13:08:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0049CC016F;
	Thu, 25 Jun 2020 13:08:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A170C016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 27A20884A0
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0-ALbSTMMDs for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:08:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A610788461
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 13:08:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F104136D; Thu, 25 Jun 2020 15:08:37 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 00/13] iommu: Remove usage of dev->archdata.iommu
Date: Thu, 25 Jun 2020 15:08:23 +0200
Message-Id: <20200625130836.1916-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>
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

From: Joerg Roedel <jroedel@suse.de>

Hi,

here is a patch-set to remove the usage of dev->archdata.iommu from
the IOMMU code in the kernel and replace its uses by the iommu per-device
private data field. The changes also remove the field entirely from
the architectures which no longer need it.

On PowerPC the field is called dev->archdata.iommu_domain and was only
used by the PAMU IOMMU driver. It gets removed as well.

The patches have been runtime tested on Intel VT-d and compile tested
with allyesconfig for:

	* x86 (32 and 64 bit)
	* arm and arm64
	* ia64 (only drivers/ because build failed for me in
	        arch/ia64)
	* PPC64

Besides that the changes also survived my IOMMU tree compile tests.

Please review.

Regards,

	Joerg

Joerg Roedel (13):
  iommu/exynos: Use dev_iommu_priv_get/set()
  iommu/vt-d: Use dev_iommu_priv_get/set()
  iommu/msm: Use dev_iommu_priv_get/set()
  iommu/omap: Use dev_iommu_priv_get/set()
  iommu/rockchip: Use dev_iommu_priv_get/set()
  iommu/tegra: Use dev_iommu_priv_get/set()
  iommu/pamu: Use dev_iommu_priv_get/set()
  iommu/mediatek: Do no use dev->archdata.iommu
  x86: Remove dev->archdata.iommu pointer
  ia64: Remove dev->archdata.iommu pointer
  arm: Remove dev->archdata.iommu pointer
  arm64: Remove dev->archdata.iommu pointer
  powerpc/dma: Remove dev->archdata.iommu_domain

 arch/arm/include/asm/device.h                 |  3 ---
 arch/arm64/include/asm/device.h               |  3 ---
 arch/ia64/include/asm/device.h                |  3 ---
 arch/powerpc/include/asm/device.h             |  3 ---
 arch/x86/include/asm/device.h                 |  3 ---
 .../gpu/drm/i915/selftests/mock_gem_device.c  | 10 ++++++++--
 drivers/iommu/exynos-iommu.c                  | 20 +++++++++----------
 drivers/iommu/fsl_pamu_domain.c               |  8 ++++----
 drivers/iommu/intel/iommu.c                   | 18 ++++++++---------
 drivers/iommu/msm_iommu.c                     |  4 ++--
 drivers/iommu/mtk_iommu.h                     |  2 ++
 drivers/iommu/mtk_iommu_v1.c                  | 10 ++++------
 drivers/iommu/omap-iommu.c                    | 20 +++++++++----------
 drivers/iommu/rockchip-iommu.c                |  8 ++++----
 drivers/iommu/tegra-gart.c                    |  8 ++++----
 drivers/iommu/tegra-smmu.c                    |  8 ++++----
 .../media/platform/s5p-mfc/s5p_mfc_iommu.h    |  4 +++-
 17 files changed, 64 insertions(+), 71 deletions(-)

-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
