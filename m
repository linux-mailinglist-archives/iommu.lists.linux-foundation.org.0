Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F156CD83
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D645E829FD;
	Sun, 10 Jul 2022 06:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D645E829FD
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=l2XZcBZK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WTAwAlRXVSd5; Sun, 10 Jul 2022 06:37:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A428F82A87;
	Sun, 10 Jul 2022 06:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A428F82A87
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57C73C0090;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3AA8C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16D8841619
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16D8841619
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com
 header.a=rsa-sha256 header.s=20200525 header.b=l2XZcBZK
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZDQh9NF-Tb8 for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 16:51:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C81FC41612
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C81FC41612
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
 :references:content-disposition:in-reply-to;
 bh=uL0cDSxKM7w1LKoYjFq3Avjqw8PzKhcnOjWTwepgs2s=; b=l2XZcBZKtMwgd6EiMrf5voDKN1
 NhJNVZJjz9gYqtN6NxihWiIf0cWC60ZXUEyN3sAUIr7c29RZP13WpnAGCIx3vReG8B1jB5y+CkPKj
 2PiXQdCEpyZ/9gXtNqiEGCaXJZLLiHvyOEKCsJMRfMcB4Flum+pbm+n8WHuq/yG+SKrfwkNL8CLzm
 xWjBTahm2x47ICkklDJUnpWfoGYH8gIDlAHSYd2SSBOrHp+G6FSEICulV5nDO7wXZjVi2PJE6AtAz
 STAVUhmjvYQT6x8dH/PGt12Ahx+IozcOreJiPzwjXEQoooo00kZR3xIaJ2sf8Ea62h9akORgvAWfd
 gYKLaPXg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1o9rCB-009xkE-SB; Fri, 08 Jul 2022 10:51:13 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1o9rC8-0001Jj-Sn; Fri, 08 Jul 2022 10:51:08 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev
Date: Fri,  8 Jul 2022 10:50:51 -0600
Message-Id: <20220708165104.5005-1-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev, sbates@raithlin.com,
 hch@lst.de, jgg@ziepe.ca, christian.koenig@amd.com, ddutile@redhat.com,
 willy@infradead.org, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, helgaas@kernel.org, dan.j.williams@intel.com,
 dave.b.minturn@intel.com, jianxin.xiong@intel.com, ira.weiny@intel.com,
 robin.murphy@arm.com, martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com,
 jhubbard@nvidia.com, rcampbell@nvidia.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v8 00/13] DMA Mapping P2PDMA Pages
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Xiong Jianxin <jianxin.xiong@intel.com>
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

This series is the first 13 patches from my previous Userspace P2P
with the CMB series[1]. These patches just do the first part which is to
allow passing P2PDMA pages into dma_map_sg() and support it with both
dma-direct and dma-iommu. The series ends with dropping the old
pci_p2pdma_[un]map_sg() interface.

This will be followed up later with the rest of the series which has
more issues to work out.

This series is based on v5.19-rc5. A git branch is available here:

  https://github.com/sbates130272/linux-p2pmem/  p2pdma_map_v8

Logan

[1] https://lkml.kernel.org/r/20220615161233.17527-1-logang@deltatee.com

--

Changes since v7 (first half of the series only):
  - Rebase onto v5.19-rc5
  - Collect reviewed-by tags from Christoph
  - Change the first patch to use a dma_flags field in the scatterlist
    instead of a bit in the page link, per an idea from Robin
  - Rework the iommu-dma implementation to store the bus addresses
    in iommu_dma_map_sg() and only copy them in __finalise_sg. This
    allows the code to use the same pci_p2pdma_map_segment() helper
    that the dma-direct code uses and we can drop the two specialized
    helpers. (Per Robin)
  - Instead of using a zero length segment which __iommu_map_sg()
    ignores, explicitly skip segments marked with as a dma bus address.
    (per Robin)
  - Rework the iommu_dma_unmap_sg() function per a suggestion from
    Robin.

Changes since v6:
  - Rebase onto v5.19-rc1
  - Rework how the pages are stored in the VMA per Jason's suggestion

Changes since v5:
  - Rebased onto v5.18-rc1 which includes Christophs cleanup to
    free_zone_device_page() (similar to Ralph's patch).
  - Fix bug with concurrent first calls to pci_p2pdma_vma_fault()
    that caused a double allocation and lost p2p memory. Noticed
    by Andrew Maier.
  - Collected a Reviewed-by tag from Chaitanya.
  - Numerous minor fixes to commit messages

Changes since v4:
  - Rebase onto v5.17-rc1.
  - Included Ralph Cambell's patches which removes the ZONE_DEVICE page
    reference count offset. This is just to demonstrate that this
    series is compatible with that direction.
  - Added a comment in pci_p2pdma_map_sg_attrs(), per Chaitanya and
    included his Reviewed-by tags.
  - Patch 1 in the last series which cleaned up scatterlist.h
    has been upstreamed.
  - Dropped NEED_SG_DMA_BUS_ADDR_FLAG seeing depends on doesn't
    work with selected symbols, per Christoph.
  - Switched iov_iter_get_pages_[alloc_]flags to be exported with
    EXPORT_SYMBOL_GPL, per Christoph.
  - Renamed zone_device_pages_are_mergeable() to
    zone_device_pages_have_same_pgmap(), per Christoph.
  - Renamed .mmap_file_open operation in nvme_ctrl_ops to
    cdev_file_open(), per Christoph.

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

--

Logan Gunthorpe (13):
  lib/scatterlist: add flag for indicating P2PDMA segments in an SGL
  PCI/P2PDMA: Attempt to set map_type if it has not been set
  PCI/P2PDMA: Introduce helpers for dma_map_sg implementations
  dma-mapping: allow EREMOTEIO return code for P2PDMA transfers
  dma-direct: support PCI P2PDMA pages in dma-direct map_sg
  dma-mapping: add flags to dma_map_ops to indicate PCI P2PDMA support
  iommu: Explicitly skip bus address marked segments  in
    __iommu_map_sg()
  iommu/dma: support PCI P2PDMA pages in dma-iommu map_sg
  nvme-pci: check DMA ops when indicating support for PCI P2PDMA
  nvme-pci: convert to using dma_map_sgtable()
  RDMA/core: introduce ib_dma_pci_p2p_dma_supported()
  RDMA/rw: drop pci_p2pdma_[un]map_sg()
  PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()

 drivers/infiniband/core/rw.c | 45 ++++------------
 drivers/iommu/dma-iommu.c    | 99 +++++++++++++++++++++++++++++++-----
 drivers/iommu/iommu.c        |  4 ++
 drivers/nvme/host/core.c     |  3 +-
 drivers/nvme/host/nvme.h     |  2 +-
 drivers/nvme/host/pci.c      | 81 ++++++++++++++---------------
 drivers/nvme/target/rdma.c   |  2 +-
 drivers/pci/Kconfig          |  5 ++
 drivers/pci/p2pdma.c         | 93 +++++++++++----------------------
 include/linux/dma-map-ops.h  | 63 +++++++++++++++++++++++
 include/linux/dma-mapping.h  |  5 ++
 include/linux/pci-p2pdma.h   | 27 ----------
 include/linux/scatterlist.h  | 69 +++++++++++++++++++++++++
 include/rdma/ib_verbs.h      | 11 ++++
 kernel/dma/direct.c          | 43 +++++++++++++---
 kernel/dma/direct.h          |  8 ++-
 kernel/dma/mapping.c         | 23 ++++++++-
 17 files changed, 390 insertions(+), 193 deletions(-)


base-commit: 88084a3df1672e131ddc1b4e39eeacfd39864acf
--
2.30.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
