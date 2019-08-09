Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE2880CE
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 19:08:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B862CA5;
	Fri,  9 Aug 2019 17:08:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8502BA9
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 774E676F
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 17:08:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1093015A2;
	Fri,  9 Aug 2019 10:08:13 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
	[10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAA4F3F575; 
	Fri,  9 Aug 2019 10:08:11 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Subject: [PATCH 00/15] Arm SMMU refactoring
Date: Fri,  9 Aug 2019 18:07:37 +0100
Message-Id: <cover.1565369764.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

This is a big refactoring of arm-smmu in order to help cope with the
various divergent implementation details currently flying around. So
far we've been accruing various quirks and errata workarounds within
the main flow of the driver, but given that it's written to an
architecture rather than any particular hardware implementation, after
a point these start to become increasingly invasive and potentially
conflict with each other.

These patches clean up the existing quirks handled by the driver to
lay a foundation on which we can continue to add more in a maintainable
fashion. The idea is that major vendor customisations can then be kept
in arm-smmu-<vendor>.c implementation files out of each others' way.

A branch is available at:

  git://linux-arm.org/linux-rm  iommu/smmu-impl

which I'll probably keep tweaking until I'm happy with the names of
things; I just didn't want to delay this initial posting any lomnger.

Robin.


Robin Murphy (15):
  iommu/arm-smmu: Convert GR0 registers to bitfields
  iommu/arm-smmu: Convert GR1 registers to bitfields
  iommu/arm-smmu: Convert context bank registers to bitfields
  iommu/arm-smmu: Rework cb_base handling
  iommu/arm-smmu: Split arm_smmu_tlb_inv_range_nosync()
  iommu/arm-smmu: Get rid of weird "atomic" write
  iommu/arm-smmu: Abstract GR1 accesses
  iommu/arm-smmu: Abstract context bank accesses
  iommu/arm-smmu: Abstract GR0 accesses
  iommu/arm-smmu: Rename arm-smmu-regs.h
  iommu/arm-smmu: Add implementation infrastructure
  iommu/arm-smmu: Move Secure access quirk to implementation
  iommu/arm-smmu: Add configuration implementation hook
  iommu/arm-smmu: Add reset implementation hook
  iommu/arm-smmu: Add context init implementation hook

 MAINTAINERS                   |   3 +-
 drivers/iommu/Makefile        |   2 +-
 drivers/iommu/arm-smmu-impl.c | 165 ++++++++++
 drivers/iommu/arm-smmu-regs.h | 210 -------------
 drivers/iommu/arm-smmu.c      | 570 +++++++++++-----------------------
 drivers/iommu/arm-smmu.h      | 386 +++++++++++++++++++++++
 drivers/iommu/qcom_iommu.c    |  15 +-
 7 files changed, 743 insertions(+), 608 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-impl.c
 delete mode 100644 drivers/iommu/arm-smmu-regs.h
 create mode 100644 drivers/iommu/arm-smmu.h

-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
