Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B169B3BC09
	for <lists.iommu@lfdr.de>; Mon, 10 Jun 2019 20:51:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4238DDC1;
	Mon, 10 Jun 2019 18:51:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C4CFDD98
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 18:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4AEDD174
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 18:51:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C227C337;
	Mon, 10 Jun 2019 11:51:48 -0700 (PDT)
Received: from ostrya.cambridge.arm.com (ostrya.cambridge.arm.com
	[10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 511F03F246; 
	Mon, 10 Jun 2019 11:51:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: will.deacon@arm.com
Subject: [PATCH 0/8] iommu: Add auxiliary domain and PASID support to Arm
	SMMUv3
Date: Mon, 10 Jun 2019 19:47:06 +0100
Message-Id: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Add substreams and PCI PASID support to the SMMUv3 driver. At the moment
the driver supports a single address space per device. PASID enables
multiple address spaces per device, up to a million in theory (1 << 20).

Two kernel features will make use of PASIDs, auxiliary domains (AUXD)
and Shared Virtual Addressing (SVA). Auxiliary domains allow to program
PASID contexts using IOMMU domains. SVA allows to bind process address
spaces to device contexts and relieve device drivers of DMA management.

Since SVA support for SMMUv3 has a lot more dependencies (new fault API,
ASID pinning, generic bind, PRI or stall support, and so on),
introducing PASID support to the SMMUv3 driver is easier with auxiliary
domains.

The AUXD API allows device drivers to easily test PASID support of their
devices, although they need to allocate IOVA and pages themselves
because the DMA API doesn't support AUXD for the moment:

	iommu_dev_enable_feature(dev, IOMMU_DEV_FEAT_AUX);
	domain = iommu_domain_alloc(dev->bus);
	iommu_aux_attach_device(domain, dev);
	iommu_map(domain, iova, phys_addr, size, prot);
	pasid = iommu_aux_get_pasid(domain);
	/* Then launch DMA with the PASID and IOVA */

Auxiliary domains also allow to split devices into multiple contexts
assignable to guest, with vfio-mdev.

Past discussions for these patches:
* Auxiliary domains (patch 6)
  [RFC PATCH 0/6] Auxiliary IOMMU domains and Arm SMMUv3
  https://www.spinics.net/lists/iommu/msg30637.html
* SSID support for the SMMU (patches 2, 3, 4, 5, 7 and 8)
  [PATCH v2 00/40] Shared Virtual Addressing for the IOMMU
  https://lists.linuxfoundation.org/pipermail/iommu/2018-May/027595.html
* I/O ASID (patch 1)
  [PATCH v3 00/16] Shared virtual address IOMMU and VT-d support
  https://lkml.kernel.org/lkml/1556922737-76313-4-git-send-email-jacob.jun.pan@linux.intel.com/

Jean-Philippe Brucker (8):
  iommu: Add I/O ASID allocator
  dt-bindings: document PASID property for IOMMU masters
  iommu/arm-smmu-v3: Support platform SSID
  iommu/arm-smmu-v3: Add support for Substream IDs
  iommu/arm-smmu-v3: Add second level of context descriptor table
  iommu/arm-smmu-v3: Support auxiliary domains
  iommu/arm-smmu-v3: Improve add_device() error handling
  iommu/arm-smmu-v3: Add support for PCI PASID

 .../devicetree/bindings/iommu/iommu.txt       |   6 +
 drivers/iommu/Kconfig                         |   5 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/arm-smmu-v3.c                   | 714 ++++++++++++++++--
 drivers/iommu/ioasid.c                        | 150 ++++
 drivers/iommu/of_iommu.c                      |   6 +-
 include/linux/ioasid.h                        |  49 ++
 include/linux/iommu.h                         |   1 +
 8 files changed, 865 insertions(+), 67 deletions(-)
 create mode 100644 drivers/iommu/ioasid.c
 create mode 100644 include/linux/ioasid.h

-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
