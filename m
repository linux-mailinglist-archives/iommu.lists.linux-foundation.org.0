Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB3358A7B
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 19:01:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A5C41988;
	Thu,  8 Apr 2021 17:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vl6N3rFjOTee; Thu,  8 Apr 2021 17:01:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C9B41999;
	Thu,  8 Apr 2021 17:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7C31C0012;
	Thu,  8 Apr 2021 17:01:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35358C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 101F240E5B
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CFWEV5XqEeyE for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 17:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EF51402AB
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
 :references:content-disposition:in-reply-to;
 bh=Yy165qiMfoD9wU7CLZMIhX0c30z5a4gBueBDk54t1c0=; b=l3U4k9Yq7Ab3rHMmVRrXGLuL9F
 KA5oYwXOoTAUBnmx584u9OeRdYiIh9OGOOdFpZhsNK0UKDaGVBt86ZgRxp2KC1bV+aK4uvzYgcG0k
 70wJ6jtR2dBxAAoqK/Ga5s3FtdLpb1TGLPgCMj2er64H0dcya5Xz/nXpJB2KLjGYL8kaMSOsDh1bf
 mJVhd4GQlUHMlNYkhRrqk0hbMG/ypOXGbOwwKnDYVCm6FK5jABHvaIInCDtj6zzPX2v6rjeN3x26S
 ahxbZgEnmAkO6giDEjzqFx5v2QNxnzLYIVeF+kN9tSUyrPZGpZABeNmdiDkW/pGr7gDCEze+wmkcw
 Q8BaL1pw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1lUY26-0002Li-Kj; Thu, 08 Apr 2021 11:01:32 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1lUY20-0002Ij-Vl; Thu, 08 Apr 2021 11:01:25 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Thu,  8 Apr 2021 11:01:07 -0600
Message-Id: <20210408170123.8788-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
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
 logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 00/16] Add new DMA mapping operation for P2PDMA
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
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

This patchset continues my work to to add P2PDMA support to the common
dma map operations. This allows for creating SGLs that have both P2PDMA
and regular pages which is a necessary step to allowing P2PDMA pages in
userspace.

The earlier RFC[1] generated a lot of great feedback and I heard no show
stopping objections. Thus, I've incorporated all the feedback and have
decided to post this as a proper patch series with hopes of eventually
getting it in mainline.

I'm happy to do a few more passes if anyone has any further feedback
or better ideas.

This series is based on v5.12-rc6 and a git branch can be found here:

  https://github.com/sbates130272/linux-p2pmem/  p2pdma_map_ops_v1

Thanks,

Logan

[1] https://lore.kernel.org/linux-block/20210311233142.7900-1-logang@deltatee.com/


Changes since the RFC:
 * Added comment and fixed up the pci_get_slot patch. (per Bjorn)
 * Fixed glaring sg_phys() double offset bug. (per Robin)
 * Created a new map operation (dma_map_sg_p2pdma()) with a new calling
   convention instead of modifying the calling convention of
   dma_map_sg(). (per Robin)
 * Integrated the two similar pci_p2pdma_dma_map_type() and
   pci_p2pdma_map_type() functions into one (per Ira)
 * Reworked some of the logic in the map_sg() implementations into
   helpers in the p2pdma code. (per Christoph)
 * Dropped a bunch of unnecessary symbol exports (per Christoph)
 * Expanded the code in dma_pci_p2pdma_supported() for clarity. (per
   Ira and Christoph)
 * Finished off using the new dma_map_sg_p2pdma() call in rdma_rw
   and removed the old pci_p2pdma_[un]map_sg(). (per Jason)

--

Logan Gunthorpe (16):
  PCI/P2PDMA: Pass gfp_mask flags to upstream_bridge_distance_warn()
  PCI/P2PDMA: Avoid pci_get_slot() which sleeps
  PCI/P2PDMA: Attempt to set map_type if it has not been set
  PCI/P2PDMA: Refactor pci_p2pdma_map_type() to take pagmap and device
  dma-mapping: Introduce dma_map_sg_p2pdma()
  lib/scatterlist: Add flag for indicating P2PDMA segments in an SGL
  PCI/P2PDMA: Make pci_p2pdma_map_type() non-static
  PCI/P2PDMA: Introduce helpers for dma_map_sg implementations
  dma-direct: Support PCI P2PDMA pages in dma-direct map_sg
  dma-mapping: Add flags to dma_map_ops to indicate PCI P2PDMA support
  iommu/dma: Support PCI P2PDMA pages in dma-iommu map_sg
  nvme-pci: Check DMA ops when indicating support for PCI P2PDMA
  nvme-pci: Convert to using dma_map_sg_p2pdma for p2pdma pages
  nvme-rdma: Ensure dma support when using p2pdma
  RDMA/rw: use dma_map_sg_p2pdma()
  PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()

 drivers/infiniband/core/rw.c |  50 +++-------
 drivers/iommu/dma-iommu.c    |  66 ++++++++++--
 drivers/nvme/host/core.c     |   3 +-
 drivers/nvme/host/nvme.h     |   2 +-
 drivers/nvme/host/pci.c      |  39 ++++----
 drivers/nvme/target/rdma.c   |   3 +-
 drivers/pci/Kconfig          |   2 +-
 drivers/pci/p2pdma.c         | 188 +++++++++++++++++++----------------
 include/linux/dma-map-ops.h  |   3 +
 include/linux/dma-mapping.h  |  20 ++++
 include/linux/pci-p2pdma.h   |  53 ++++++----
 include/linux/scatterlist.h  |  49 ++++++++-
 include/rdma/ib_verbs.h      |  32 ++++++
 kernel/dma/direct.c          |  25 ++++-
 kernel/dma/mapping.c         |  70 +++++++++++--
 15 files changed, 416 insertions(+), 189 deletions(-)


base-commit: e49d033bddf5b565044e2abe4241353959bc9120
--
2.20.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
