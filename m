Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C61C50A9
	for <lists.iommu@lfdr.de>; Tue,  5 May 2020 10:43:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 22DCF86D19;
	Tue,  5 May 2020 08:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWppNTYVI6UD; Tue,  5 May 2020 08:43:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2979086D08;
	Tue,  5 May 2020 08:43:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11737C0175;
	Tue,  5 May 2020 08:43:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8928C0175
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B388F89531
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C+P2Wd4+e30r for <iommu@lists.linux-foundation.org>;
 Tue,  5 May 2020 08:43:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9EF858951E
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:43:12 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200505084309euoutp01aad26b517edee301dcb65536b4d22318~MFU02OYiI0065500655euoutp01W
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 08:43:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200505084309euoutp01aad26b517edee301dcb65536b4d22318~MFU02OYiI0065500655euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588668189;
 bh=gWvd1hDyo79x/s7tOktXvp9ucuQRiTgmKZjpFecY7X0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=usnItLxxgUdMh6jZjR4EQ1AXCGMA2t/PLscZksyJqHW+MZhfdDoA4njWO0JXQExtt
 QonZDNG9gvziDO+LvgsIxbBo2K73AzUy/RZSEyd2yvyIfGxwLFhVdc7B+Cm94YGs2+
 G/dI+xm+BzswzjyMKqO9+RsWU/B70lFtpinEb1w4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200505084309eucas1p1c8645351ceb70dd394c27c84d73af9c1~MFU0btZIj0757407574eucas1p15;
 Tue,  5 May 2020 08:43:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id FF.A1.60679.D1721BE5; Tue,  5
 May 2020 09:43:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084308eucas1p1aa040c3ae325a6c7d92f956b1f5aad0d~MFUz90wG30752907529eucas1p15;
 Tue,  5 May 2020 08:43:08 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200505084308eusmtrp1f6d10f1165c581cda2504a3b128040e8~MFUz9FVZm0716407164eusmtrp12;
 Tue,  5 May 2020 08:43:08 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-a8-5eb1271dbcb6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 01.A0.07950.C1721BE5; Tue,  5
 May 2020 09:43:08 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200505084308eusmtip13a12b282487c6faf89fcb2ab4db393d5~MFUzetK7V0070700707eusmtip1g;
 Tue,  5 May 2020 08:43:08 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/25] DRM: fix struct sg_table nents vs. orig_nents misuse
Date: Tue,  5 May 2020 10:43:00 +0200
Message-Id: <20200505083926.28503-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djPc7qy6hvjDHbul7boPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgiuKySUnN
 ySxLLdK3S+DK2LXuA2PBPsuKno1r2RsYL+t0MXJySAiYSLxc/Zuti5GLQ0hgBaPEjpefmUAS
 QgJfGCX+r3aESHxmlJg7+TcLTMfdy8tYIBLLGSX2XG2HagfqeLjiNlg7m4ChRNfbLjYQW0Sg
 lVHiRC8PiM0sMINJ4ujrUhBbWCBA4sjX6WBTWQRUJR43tYDZvAK2Ev37ZrNDbJOXWL3hADPI
 AgmB6ewS2/vOQJ3hItHYc4MNwhaWeHV8C1SDjMTpyT0sEA3NQBedW8sO4fQwSlxumsEIUWUt
 cefcL6BuDqCTNCXW79KHCDtKPG29wAwSlhDgk7jxVhDiaD6JSdumQ4V5JTrahCCq1SRmHV8H
 t/bghUvMELaHxPtbLWDDhQRiJRY89ZnAKDcLYdUCRsZVjOKppcW56anFRnmp5XrFibnFpXnp
 esn5uZsYgQnm9L/jX3Yw7vqTdIhRgINRiYc34vP6OCHWxLLiytxDjBIczEoivMt+bIgT4k1J
 rKxKLcqPLyrNSS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgXHzrvouv+pGg5nb
 TN/NX2Nj9WFhafAfFu7VIl9C1/q03VfMlDy5Um0aq90ftgsXlPLXqQYtf+v2Ul+mqmrT366W
 j+KzpII3/Zx1+TarFUdZcr+g5V2F3Ncyta8OnJ+g4X4ope732cbydYntszvWPpd+Ev93ve/z
 xbnHyzqvfedsNu2s3zbXxU+JpTgj0VCLuag4EQCuXNZLLAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsVy+t/xu7oy6hvjDJYdsLDoPXeSyWLjjPWs
 Fv+3TWS2uPL1PZvFytVHmSwW7Le2+HLlIZPFpsfXWC0u75rDZrH2yF12i4MfnrA6cHusmbeG
 0WPvtwUsHtu/PWD1uN99nMlj85J6j9v/HjN7TL6xnNFj980GNo++LasYPT5vkgvgitKzKcov
 LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL2LXuA2PBPsuK
 no1r2RsYL+t0MXJySAiYSNy9vIyli5GLQ0hgKaPE4x1TWSESMhInpzVA2cISf651sUEUfWKU
 6Hu/hR0kwSZgKNH1FiIhItDJKDGt+yM7iMMsMI9JYtHDQ0AOB4ewgJ/E0/9JIA0sAqoSj5ta
 WEBsXgFbif59s9khNshLrN5wgHkCI88CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgcG9
 7djPLTsYu94FH2IU4GBU4uHd8HV9nBBrYllxZe4hRgkOZiUR3mU/NsQJ8aYkVlalFuXHF5Xm
 pBYfYjQFWj6RWUo0OR8YeXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqY
 ODilGhjF2hdPaUzmDRDJ/dU4qe7Sm9ki/5k/bQgxeBCwK+ZlsEvCg5p/mkH3tfXURMLOX1c3
 v1T5Lts09M33JW6TduXmiS40PRi3Se5LW2lE5j+u2+EZKxuC+Nwe/3/dKftFuF9FN7Hw1QmR
 v1Uqqp9mCKYzb4j6dORgaWvwxeSNCzqO7BIvjOlZ5KLEUpyRaKjFXFScCADCUtXChAIAAA==
X-CMS-MailID: 20200505084308eucas1p1aa040c3ae325a6c7d92f956b1f5aad0d
X-Msg-Generator: CA
X-RootMTR: 20200505084308eucas1p1aa040c3ae325a6c7d92f956b1f5aad0d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084308eucas1p1aa040c3ae325a6c7d92f956b1f5aad0d
References: <CGME20200505084308eucas1p1aa040c3ae325a6c7d92f956b1f5aad0d@eucas1p1.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Dear All,

During the Exynos DRM GEM rework and fixing the issues in the 
drm_prime_sg_to_page_addr_arrays() function [1] I've noticed that most
drivers in DRM framework incorrectly use nents and orig_nents entries of
the struct sg_table.

In case of the most DMA-mapping implementations exchanging those two
entries or using nents for all loops on the scatterlist is harmless,
because they both have the same value. There exists however a DMA-mapping
implementations, for which such incorrect usage breaks things. The nents
returned by dma_map_sg() might be lower than the nents passed as its
parameter and this is perfectly fine. DMA framework or IOMMU is allowed
to join consecutive chunks while mapping if such operation is supported
by the underlying HW (bus, bridge, IOMMU, etc). Example of the case
where dma_map_sg() might return 1 'DMA' chunk for the 4 'physical' pages
is described here [2]

The DMA-mapping framework documentation [3] states that dma_map_sg()
returns the numer of the created entries in the DMA address space.
However the subsequent calls to dma_sync_sg_for_{device,cpu} and
dma_unmap_sg must be called with the original number of entries passed to
dma_map_sg. The common pattern in DRM drivers were to assign the
dma_map_sg() return value to sg_table->nents and use that value for
the subsequent calls to dma_sync_sg_* or dma_unmap_sg functions. Also
the code iterated over nents times to access the pages stored in the
processed scatterlist, while it should use orig_nents as the numer of
the page entries.

I've tried to identify all such incorrect usage of sg_table->nents and
this is a result of my research. It looks that the incorrect pattern has
been copied over the many drivers mainly in the DRM subsystem. Too bad in
most cases it even worked correctly if the system used simple, linear
DMA-mapping implementation, for which swapping nents and orig_nents
doesn't make any difference. To avoid similar issues in the future, I've
introduced a common dma-mapping wrappers, which operate directly on the
sg_table objects.

The biggest TODO is DRM/i915 driver and I don't feel brave enough to fix
it fully. The driver creatively uses sg_table->orig_nents to store the
size of the allocate scatterlist and ignores the number of the entries
returned by dma_map_sg function. In this patchset I only fixed the
sg_table objects exported by dmabuf related functions. I hope that I
didn't break anything there.

Patches are based on top of Linux next-20200504.

Best regards,
Marek Szyprowski


References:

[1] https://lkml.org/lkml/2020/3/27/555 
[2] https://lkml.org/lkml/2020/3/29/65
[3] Documentation/DMA-API-HOWTO.txt


Changelog:

v3:
- introduce dma_*_sgtable_* wrappers and use them in all patches

v2: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- dropped most of the changes to drm/i915
- added fixes for rcar-du, xen, media and ion
- fixed a few issues pointed by kbuild test robot
- added wide cc: list for each patch

v1: https://lore.kernel.org/linux-iommu/c01c9766-9778-fd1f-f36e-2dc7bd376ba4@arm.com/T/
- initial version


Patch summary:

Marek Szyprowski (25):
  dma-mapping: add generic helpers for mapping sgtable objects
  drm: core: fix common struct sg_table related issues
  drm: amdgpu: fix common struct sg_table related issues
  drm: armada: fix common struct sg_table related issues
  drm: etnaviv: fix common struct sg_table related issues
  drm: exynos: fix common struct sg_table related issues
  drm: i915: fix common struct sg_table related issues
  drm: lima: fix common struct sg_table related issues
  drm: msm: fix common struct sg_table related issues
  drm: panfrost: fix common struct sg_table related issues
  drm: radeon: fix common struct sg_table related issues
  drm: rockchip: fix common struct sg_table related issues
  drm: tegra: fix common struct sg_table related issues
  drm: virtio: fix common struct sg_table related issues
  drm: vmwgfx: fix common struct sg_table related issues
  xen: gntdev: fix common struct sg_table related issues
  drm: host1x: fix common struct sg_table related issues
  drm: rcar-du: fix common struct sg_table related issues
  dmabuf: fix common struct sg_table related issues
  staging: ion: fix common struct sg_table related issues
  staging: tegra-vde: fix common struct sg_table related issues
  misc: fastrpc: fix common struct sg_table related issues
  rapidio: fix common struct sg_table related issues
  samples: vfio-mdev/mbochs: fix common struct sg_table related issues
  media: pci: fix common ALSA DMA-mapping related codes

 drivers/dma-buf/heaps/heap-helpers.c             | 13 +++++-----
 drivers/dma-buf/udmabuf.c                        |  7 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c      |  6 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  9 +++----
 drivers/gpu/drm/armada/armada_gem.c              | 10 ++++----
 drivers/gpu/drm/drm_cache.c                      |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c           | 14 +++++++----
 drivers/gpu/drm/drm_prime.c                      | 13 +++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gem.c            | 12 ++++-----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c          |  9 +++----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       | 13 ++++------
 drivers/gpu/drm/i915/gem/selftests/mock_dmabuf.c |  7 +++---
 drivers/gpu/drm/lima/lima_gem.c                  | 11 +++++---
 drivers/gpu/drm/msm/msm_gem.c                    | 13 ++++------
 drivers/gpu/drm/msm/msm_iommu.c                  |  2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c          |  4 +--
 drivers/gpu/drm/panfrost/panfrost_mmu.c          |  5 ++--
 drivers/gpu/drm/radeon/radeon_ttm.c              | 11 ++++----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c      | 26 +++++++++----------
 drivers/gpu/drm/tegra/gem.c                      | 27 ++++++++------------
 drivers/gpu/drm/tegra/plane.c                    | 15 ++++-------
 drivers/gpu/drm/virtio/virtgpu_object.c          | 17 ++++++-------
 drivers/gpu/drm/virtio/virtgpu_vq.c              | 10 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c       | 17 +++----------
 drivers/gpu/host1x/job.c                         | 22 ++++++----------
 drivers/media/pci/cx23885/cx23885-alsa.c         |  2 +-
 drivers/media/pci/cx25821/cx25821-alsa.c         |  2 +-
 drivers/media/pci/cx88/cx88-alsa.c               |  2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c         |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c           |  9 ++++---
 drivers/misc/fastrpc.c                           |  4 +--
 drivers/rapidio/devices/rio_mport_cdev.c         |  8 +++---
 drivers/staging/android/ion/ion.c                | 25 ++++++++----------
 drivers/staging/android/ion/ion_heap.c           |  6 ++---
 drivers/staging/android/ion/ion_system_heap.c    |  2 +-
 drivers/staging/media/tegra-vde/iommu.c          |  4 +--
 drivers/xen/gntdev-dmabuf.c                      |  7 +++---
 include/linux/dma-mapping.h                      | 32 ++++++++++++++++++++++++
 include/linux/iommu.h                            |  6 +++++
 samples/vfio-mdev/mbochs.c                       |  3 ++-
 40 files changed, 202 insertions(+), 207 deletions(-)

-- 
1.9.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
