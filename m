Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA67F4F19
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 16:16:20 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EBE64DCF;
	Fri,  8 Nov 2019 15:16:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 33F28DB4
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:16:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C2FE8196
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 15:16:15 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8EBE2214DB;
	Fri,  8 Nov 2019 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573226175;
	bh=nD47Fyavvt+u4/f0W65Gr+cRRT2ED6dF9mWsjBW13dc=;
	h=From:To:Cc:Subject:Date:From;
	b=p2x2OLB9c0MkLxp4toBA4qT2FhiYuS31bX+d7J29WYWWLOgeJ+Y7yso8TiOKCaPJ9
	+N/wg4fwi0M12IGed/UzywZb4K/G9EiVycGbhAdw4ACh1Tuo9xw11EnSZ/BDXEXz7c
	UhLbZj/ZNuo/+4fCyWbeiNITXN2d+NxNy9daP8eA=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] iommu: Permit modular builds of ARM SMMU[v3] drivers
Date: Fri,  8 Nov 2019 15:15:59 +0000
Message-Id: <20191108151608.20932-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Saravana Kannan <saravanak@google.com>,
	Robin Murphy <robin.murphy@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Will Deacon <will@kernel.org>
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

Hi all,

This is version two of the patches I previously posted here:

  https://lore.kernel.org/lkml/20191030145112.19738-1-will@kernel.org/

Changes since v1 include:

  * Build single "arm-smmu-mod.ko" module for the Arm SMMU driver
  * Hold a reference to the IOMMU driver module across {add,remove}_device()
  * Take a reference to the IOMMU driver module during of_xlate()
  * Added Bjorn's ack on the PCI export patch

Please note that I haven't been able to test this properly, since I don't
currently have access to any Arm SMMU hardware.

Cheers,

Will

Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Saravana Kannan <saravanak@google.com>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>

--->8

Will Deacon (9):
  drivers/iommu: Export core IOMMU API symbols to permit modular drivers
  iommu/of: Request ACS from the PCI core when configuring IOMMU linkage
  PCI: Export pci_ats_disabled() as a GPL symbol to modules
  drivers/iommu: Take a ref to the IOMMU driver prior to ->add_device()
  iommu/of: Take a ref to the IOMMU driver during ->of_xlate()
  Revert "iommu/arm-smmu: Make arm-smmu-v3 explicitly non-modular"
  iommu/arm-smmu-v3: Allow building as a module
  Revert "iommu/arm-smmu: Make arm-smmu explicitly non-modular"
  iommu/arm-smmu: Allow building as a module

 drivers/iommu/Kconfig       | 16 ++++++-
 drivers/iommu/Makefile      |  3 +-
 drivers/iommu/arm-smmu-v3.c | 27 +++++++-----
 drivers/iommu/arm-smmu.c    | 87 ++++++++++++++++++++++---------------
 drivers/iommu/iommu-sysfs.c |  5 +++
 drivers/iommu/iommu.c       | 27 +++++++++++-
 drivers/iommu/of_iommu.c    | 17 +++++---
 drivers/pci/pci.c           |  1 +
 include/linux/iommu.h       |  2 +
 9 files changed, 130 insertions(+), 55 deletions(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
