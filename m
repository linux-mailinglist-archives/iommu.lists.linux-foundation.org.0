Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E59E9DD7
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 15:51:22 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2F310C8F;
	Wed, 30 Oct 2019 14:51:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5A8D9C8E
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E60CE8A
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 64ED320856;
	Wed, 30 Oct 2019 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572447078;
	bh=fGY4lwQed6kXKr5Reh7oVYWsIVXScMRNH9ALNwy+qSg=;
	h=From:To:Cc:Subject:Date:From;
	b=SiVarWNl5Lv4nOXK6mU4X2uIu2qZbZcZKslAwfQCTX3dVRpk4EtEegjAXd2Z3/Jlt
	hVNdpEIViMEGTdmZMVV5eIbAZvOiXQ6A+g1iG0vrZ3ndOFzo/6BUTyYQLiZKJRQXIP
	h6nlrJJHJUJTbObV1dQdPhXT0aYnBO1cRVTrhf/c=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
Date: Wed, 30 Oct 2019 14:51:05 +0000
Message-Id: <20191030145112.19738-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

As part of the work to enable a "Generic Kernel Image" across multiple
Android devices, there is a need to seperate shared, core kernel code
from modular driver code that may not be needed by all SoCs. This means
building IOMMU drivers as modules.

It turns out that most of the groundwork has already been done to enable
the ARM SMMU drivers to be 'tristate' options in drivers/iommu/Kconfig;
with a few symbols exported from the IOMMU/PCI core, everything builds
nicely out of the box. The one exception is support for the legacy SMMU
DT binding, which is not in widespread use and has never worked with
modules, so we can simply remove that when building as a module rather
than try to paper over it with even more hacks.

Obviously you need to be careful about using IOMMU drivers as modules,
since late loading of the driver for an IOMMU serving active DMA masters
is going to end badly in many cases. On Android, we're using device links
to ensure that the IOMMU probes first.

Comments welcome,

Will

Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

--->8

Will Deacon (7):
  drivers/iommu: Export core IOMMU API symbols to permit modular drivers
  iommu/of: Request ACS from the PCI core when configuring IOMMU linkage
  PCI: Export pci_ats_disabled() as a GPL symbol to modules
  Revert "iommu/arm-smmu: Make arm-smmu-v3 explicitly non-modular"
  iommu/arm-smmu-v3: Allow building as a module
  Revert "iommu/arm-smmu: Make arm-smmu explicitly non-modular"
  iommu/arm-smmu: Allow building as a module

 drivers/iommu/Kconfig         | 16 ++++++-
 drivers/iommu/arm-smmu-impl.c |  6 +++
 drivers/iommu/arm-smmu-v3.c   | 26 +++++++----
 drivers/iommu/arm-smmu.c      | 86 +++++++++++++++++++++--------------
 drivers/iommu/iommu-sysfs.c   |  5 ++
 drivers/iommu/iommu.c         |  8 ++++
 drivers/iommu/of_iommu.c      |  1 +
 drivers/pci/pci.c             |  1 +
 8 files changed, 102 insertions(+), 47 deletions(-)

-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
