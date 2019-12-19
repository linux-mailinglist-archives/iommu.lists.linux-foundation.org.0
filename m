Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59B1259DA
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 04:17:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA08385ADF;
	Thu, 19 Dec 2019 03:17:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFbtOhoAVTr4; Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6089684973;
	Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EB67C077D;
	Thu, 19 Dec 2019 03:17:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A551CC077D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A1E9284B0F
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fo84rnFeHMlA for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 03:17:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB4B280CF3
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 03:17:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 19:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="222160398"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2019 19:17:30 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v4 0/7] Use 1st-level for IOVA translation
Date: Thu, 19 Dec 2019 11:16:27 +0800
Message-Id: <20191219031634.15168-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: kevin.tian@intel.com, ashok.raj@intel.com, kvm@vger.kernel.org,
 sanjay.k.kumar@intel.com, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, yi.y.sun@intel.com
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

Intel VT-d in scalable mode supports two types of page tables
for DMA translation: the first level page table and the second
level page table. The first level page table uses the same
format as the CPU page table, while the second level page table
keeps compatible with previous formats. The software is able
to choose any one of them for DMA remapping according to the use
case.

This patchset aims to move IOVA (I/O Virtual Address) translation
to 1st-level page table in scalable mode. This will simplify vIOMMU
(IOMMU simulated by VM hypervisor) design by using the two-stage
translation, a.k.a. nested mode translation.

As Intel VT-d architecture offers caching mode, guest IOVA (GIOVA)
support is currently implemented in a shadow page manner. The device
simulation software, like QEMU, has to figure out GIOVA->GPA mappings
and write them to a shadowed page table, which will be used by the
physical IOMMU. Each time when mappings are created or destroyed in
vIOMMU, the simulation software has to intervene. Hence, the changes
on GIOVA->GPA could be shadowed to host.


     .-----------.
     |  vIOMMU   |
     |-----------|                 .--------------------.
     |           |IOTLB flush trap |        QEMU        |
     .-----------. (map/unmap)     |--------------------|
     |GIOVA->GPA |---------------->|    .------------.  |
     '-----------'                 |    | GIOVA->HPA |  |
     |           |                 |    '------------'  |
     '-----------'                 |                    |
                                   |                    |
                                   '--------------------'
                                                |
            <------------------------------------
            |
            v VFIO/IOMMU API
      .-----------.
      |  pIOMMU   |
      |-----------|
      |           |
      .-----------.
      |GIOVA->HPA |
      '-----------'
      |           |
      '-----------'

In VT-d 3.0, scalable mode is introduced, which offers two-level
translation page tables and nested translation mode. Regards to
GIOVA support, it can be simplified by 1) moving the GIOVA support
over 1st-level page table to store GIOVA->GPA mapping in vIOMMU,
2) binding vIOMMU 1st level page table to the pIOMMU, 3) using pIOMMU
second level for GPA->HPA translation, and 4) enable nested (a.k.a.
dual-stage) translation in host. Compared with current shadow GIOVA
support, the new approach makes the vIOMMU design simpler and more
efficient as we only need to flush the pIOMMU IOTLB and possible
device-IOTLB when an IOVA mapping in vIOMMU is torn down.

     .-----------.
     |  vIOMMU   |
     |-----------|                 .-----------.
     |           |IOTLB flush trap |   QEMU    |
     .-----------.    (unmap)      |-----------|
     |GIOVA->GPA |---------------->|           |
     '-----------'                 '-----------'
     |           |                       |
     '-----------'                       |
           <------------------------------
           |      VFIO/IOMMU          
           |  cache invalidation and  
           | guest gpd bind interfaces
           v
     .-----------.
     |  pIOMMU   |
     |-----------|
     .-----------.
     |GIOVA->GPA |<---First level
     '-----------'
     | GPA->HPA  |<---Scond level
     '-----------'
     '-----------'

This patch applies the first level page table for IOVA translation
unless the DOMAIN_ATTR_NESTING domain attribution has been set.
Setting of this attribution means the second level will be used to
map gPA (guest physical address) to hPA (host physical address), and
the mappings between gVA (guest virtual address) and gPA will be
maintained by the guest with the page table address binding to host's
first level.

Based-on-idea-by: Ashok Raj <ashok.raj@intel.com>
Based-on-idea-by: Kevin Tian <kevin.tian@intel.com>
Based-on-idea-by: Liu Yi L <yi.l.liu@intel.com>
Based-on-idea-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Based-on-idea-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
Based-on-idea-by: Lu Baolu <baolu.lu@linux.intel.com>

Change log:

v3->v4:
 - The previous version was posted here
   https://lkml.org/lkml/2019/12/10/2126
 - Set Execute Disable (bit 63) in first level table entries.
 - Enhance pasid-based iotlb invalidation for both default domain
   and auxiliary domain.
 - Add debugfs file to expose page table internals.

v2->v3:
 - The previous version was posted here
   https://lkml.org/lkml/2019/11/27/1831
 - Accept Jacob's suggestion on merging two page tables.

 v1->v2
 - The first series was posted here
   https://lkml.org/lkml/2019/9/23/297
 - Use per domain page table ops to handle different page tables.
 - Use first level for DMA remapping by default on both bare metal
   and vm guest.
 - Code refine according to code review comments for v1.

Lu Baolu (7):
  iommu/vt-d: Identify domains using first level page table
  iommu/vt-d: Add set domain DOMAIN_ATTR_NESTING attr
  iommu/vt-d: Add PASID_FLAG_FL5LP for first-level pasid setup
  iommu/vt-d: Setup pasid entries for iova over first level
  iommu/vt-d: Flush PASID-based iotlb for iova over first level
  iommu/vt-d: Use iova over first level
  iommu/vt-d: debugfs: Add support to show page table internals

 drivers/iommu/dmar.c                |  41 ++++++
 drivers/iommu/intel-iommu-debugfs.c |  75 +++++++++++
 drivers/iommu/intel-iommu.c         | 201 +++++++++++++++++++++++++---
 drivers/iommu/intel-pasid.c         |   7 +-
 drivers/iommu/intel-pasid.h         |   6 +
 drivers/iommu/intel-svm.c           |   8 +-
 include/linux/intel-iommu.h         |  20 ++-
 7 files changed, 326 insertions(+), 32 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
