Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2E454FD2
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 22:54:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4122340945;
	Wed, 17 Nov 2021 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtvv8UJISh1m; Wed, 17 Nov 2021 21:54:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AC4014094D;
	Wed, 17 Nov 2021 21:54:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38145C0038;
	Wed, 17 Nov 2021 21:54:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CC44C0040
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0F560A83
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inTDcOlC5_WG for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 21:54:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA32E60A8D
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
 :references:content-disposition:in-reply-to;
 bh=Wg9VStK+xHdyNT2nLCQvhlsaBDPQH28JMwlCBIEjP2w=; b=kGMJauGwyGjyMQCTORlmgt2up0
 PZLaE0HB4+ZoWYYTSqOpv9BFFNfAIQewLEs7GrCIgAYqZj9cziJy8xjb/iq2YRIiFf2BNo6HOuhts
 c3NIwIEXRtBn3rZ3Ei82cLZdIait05at/f8B8sFofgRV/Ge8JzFg1DCNzdsThEXhkZVDplgRyls4L
 ueFgR4yvMWChZW5jmvxz2k1NXLEIHgxBNnn3SwXIZr5cSobLvYsTdJ3Yeg7X5YqDXQBit12NcPbs/
 ba10SS3Pl2bMLzL5LeDXEDNjv1mz+NmSJDMRdfC4RTlYSLPPGPt5rW8gfzhiaJzlQSu41dz8AggKJ
 Ieed558Q==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsi-000Zo3-T7; Wed, 17 Nov 2021 14:54:18 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsd-0000yl-0m; Wed, 17 Nov 2021 14:54:11 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Wed, 17 Nov 2021 14:53:47 -0700
Message-Id: <20211117215410.3695-1-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, jhubbard@nvidia.com,
 ddutile@redhat.com, willy@infradead.org, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, dave.hansen@linux.intel.com, helgaas@kernel.org,
 dan.j.williams@intel.com, andrzej.jakowski@intel.com, dave.b.minturn@intel.com,
 jianxin.xiong@intel.com, ira.weiny@intel.com, robin.murphy@arm.com,
 martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v4 00/23] Userspace P2PDMA with O_DIRECT NVMe devices
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ira Weiny <ira.weiny@intel.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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

Hi,

This patchset continues my work to add userspace P2PDMA access using
O_DIRECT NVMe devices. This posting fixes a lot of issues that were
addresed in the last posting, which is here[1].

The patchset enables userspace P2PDMA by allowing userspace to mmap()
allocated chunks of the CMB. The resulting VMA can be passed only
to O_DIRECT IO on NVMe backed files or block devices. A flag is added
to GUP() in Patch <>, then Patches <> through <> wire this flag up based
on whether the block queue indicates P2PDMA support. Patches <>
through <> enable the CMB to be mapped into userspace by mmaping
the nvme char device.

This is relatively straightforward, however the one significant
problem is that, presently, pci_p2pdma_map_sg() requires a homogeneous
SGL with all P2PDMA pages or all regular pages. Enhancing GUP to
support enforcing this rule would require a huge hack that I don't
expect would be all that pallatable. So the first 13 patches add
support for P2PDMA pages to dma_map_sg[table]() to the dma-direct
and dma-iommu implementations. Thus systems without an IOMMU plus
Intel and AMD IOMMUs are supported. (Other IOMMU implementations would
then be unsupported, notably ARM and PowerPC but support would be added
when they convert to dma-iommu).

dma_map_sgtable() is preferred when dealing with P2PDMA memory as it
will return -EREMOTEIO when the DMA device cannot map specific P2PDMA
pages based on the existing rules in calc_map_type_and_dist().

The other issue is dma_unmap_sg() needs a flag to determine whether a
given dma_addr_t was mapped regularly or as a PCI bus address. To allow
this, a third flag is added to the page_link field in struct
scatterlist. This effectively means support for P2PDMA will now depend
on CONFIG_64BIT.

Feedback welcome.

This series is based on v5.16-rc1. A git branch is available here:

  https://github.com/sbates130272/linux-p2pmem/  p2pdma_user_cmb_v4

Thanks,

Logan

[1] https://lore.kernel.org/all/20210916234100.122368-1-logang@deltatee.com

--

Changes since v3:
  - Add some comment and commit message cleanups I had missed for v3,
    also moved the prototypes for some of the p2pdma helpers to
    dma-map-ops.h (which I missed in v3 and was suggested in v2).
  - Add separate cleanup patch for scatterlist.h and change the macros
    to functions. (Suggested by Chaitanya and Jason, respectively)
  - Rename sg_dma_mark_pci_p2pdma() and sg_is_dma_pci_p2pdma() to
    sg_dma_mark_bus_address() and sg_is_dma_bus_address() which
    is a more generic name (As requested by Jason)
  - Fixes to some comments and commit messages as suggested by Bjorn
    and Jason.
  - Ensure swiotlb is not used with P2PDMA pages. (Per Jason)
  - The sgtable coversion in RDMA was split out and sent upstream
    separately, the new patch is only the removal. (Per Jason)
  - Moved the FOLL_PCI_P2PDMA check outside of get_dev_pagemap() as
    Jason suggested this will be removed in the near term.
  - Add two patches to ensure that zone device pages with different
    pgmaps are never merged in the block layer or
    sg_alloc_append_table_from_pages() (Per Jason)
  - Ensure synchronize_rcu() or call_rcu() is used before returning
    pages to the genalloc. (Jason pointed out that pages are not
    gauranteed to be unused in all architectures until at least
    after an RCU grace period, and that synchronize_rcu() was likely
    too slow to use in the vma close operation.
  - Collected Acks and Reviews by Bjorn, Jason and Max.

Logan Gunthorpe (23):
  lib/scatterlist: cleanup macros into static inline functions
  lib/scatterlist: add flag for indicating P2PDMA segments in an SGL
  PCI/P2PDMA: Attempt to set map_type if it has not been set
  PCI/P2PDMA: Expose pci_p2pdma_map_type()
  PCI/P2PDMA: Introduce helpers for dma_map_sg implementations
  dma-mapping: allow EREMOTEIO return code for P2PDMA transfers
  dma-direct: support PCI P2PDMA pages in dma-direct map_sg
  dma-mapping: add flags to dma_map_ops to indicate PCI P2PDMA support
  iommu/dma: support PCI P2PDMA pages in dma-iommu map_sg
  nvme-pci: check DMA ops when indicating support for PCI P2PDMA
  nvme-pci: convert to using dma_map_sgtable()
  RDMA/core: introduce ib_dma_pci_p2p_dma_supported()
  RDMA/rw: drop pci_p2pdma_[un]map_sg()
  PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()
  mm: introduce FOLL_PCI_P2PDMA to gate getting PCI P2PDMA pages
  iov_iter: introduce iov_iter_get_pages_[alloc_]flags()
  block: add check when merging zone device pages
  lib/scatterlist: add check when merging zone device pages
  block: set FOLL_PCI_P2PDMA in __bio_iov_iter_get_pages()
  block: set FOLL_PCI_P2PDMA in bio_map_user_iov()
  mm: use custom page_free for P2PDMA pages
  PCI/P2PDMA: Introduce pci_mmap_p2pmem()
  nvme-pci: allow mmaping the CMB in userspace

 block/bio.c                  |  10 +-
 block/blk-map.c              |   7 +-
 drivers/infiniband/core/rw.c |  45 +---
 drivers/iommu/dma-iommu.c    |  67 +++++-
 drivers/nvme/host/core.c     |  18 +-
 drivers/nvme/host/nvme.h     |   4 +-
 drivers/nvme/host/pci.c      |  98 ++++----
 drivers/nvme/target/rdma.c   |   2 +-
 drivers/pci/Kconfig          |   6 +
 drivers/pci/p2pdma.c         | 441 ++++++++++++++++++++++++++++++-----
 include/linux/dma-map-ops.h  |  76 ++++++
 include/linux/dma-mapping.h  |   5 +
 include/linux/mm.h           |  25 ++
 include/linux/pci-p2pdma.h   |  38 +--
 include/linux/scatterlist.h  |  71 +++++-
 include/linux/uio.h          |  21 +-
 include/rdma/ib_verbs.h      |  11 +
 include/uapi/linux/magic.h   |   1 +
 kernel/dma/Kconfig           |  10 +
 kernel/dma/direct.c          |  43 +++-
 kernel/dma/direct.h          |   7 +-
 kernel/dma/mapping.c         |  22 +-
 lib/iov_iter.c               |  15 +-
 lib/scatterlist.c            |  25 +-
 mm/gup.c                     |  22 +-
 mm/memremap.c                |  12 +-
 26 files changed, 882 insertions(+), 220 deletions(-)


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
--
2.30.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
