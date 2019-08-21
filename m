Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F373297E70
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 17:19:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A64F8ED2;
	Wed, 21 Aug 2019 15:19:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B61A4E93
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:19:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4F34FE6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 15:19:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8223337;
	Wed, 21 Aug 2019 08:19:19 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0AE3C3F718; 
	Wed, 21 Aug 2019 08:19:18 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 0/8] Sort out SMMUv3 ATC invalidation and locking
Date: Wed, 21 Aug 2019 16:17:41 +0100
Message-Id: <20190821151749.23743-1-will@kernel.org>
X-Mailer: git-send-email 2.11.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi again,

This is version two of the patches I posted yesterday:

  v1: https://lkml.kernel.org/r/20190820154549.17018-1-will@kernel.org

Changes since then include:

  * Fix 'ats_enabled' checking when enabling ATS
  * Remove redundant 'dev_is_pci()' calls
  * Remove bool bitfield
  * Add patch temporarily disabling ATS detection for -stable
  * Issue ATC invalidation even when non-leaf
  * Elide invalidation/SYNC for zero-sized address ranges
  * Shuffle the patches round a bit

Thanks,

Will

Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Robin Murphy <robin.murphy@arm.com>

--->8

Will Deacon (8):
  iommu/arm-smmu-v3: Document ordering guarantees of command insertion
  iommu/arm-smmu-v3: Disable detection of ATS and PRI
  iommu/arm-smmu-v3: Remove boolean bitfield for 'ats_enabled' flag
  iommu/arm-smmu-v3: Don't issue CMD_SYNC for zero-length invalidations
  iommu/arm-smmu-v3: Rework enabling/disabling of ATS for PCI masters
  iommu/arm-smmu-v3: Fix ATC invalidation ordering wrt main TLBs
  iommu/arm-smmu-v3: Avoid locking on invalidation path when not using
    ATS
  Revert "iommu/arm-smmu-v3: Disable detection of ATS and PRI"

 drivers/iommu/arm-smmu-v3.c | 117 ++++++++++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 30 deletions(-)

-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
