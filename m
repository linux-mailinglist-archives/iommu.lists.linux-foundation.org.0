Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC1964FC
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 17:45:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1ADDADC9;
	Tue, 20 Aug 2019 15:45:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6E560B79
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:45:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 0DEDD89B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:45:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FF3D28;
	Tue, 20 Aug 2019 08:45:55 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 96B563F246; 
	Tue, 20 Aug 2019 08:45:54 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/4] Sort out SMMUv3 ATC invalidation and locking
Date: Tue, 20 Aug 2019 16:45:45 +0100
Message-Id: <20190820154549.17018-1-will@kernel.org>
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

Hi all,

This series arose from my attempt to remove the 'devices_lock' from the
->unmap() path. In actual fact, I think the current code in mainline
gets this wrong, so I've fixed up the ordering and then removed the lock.
Unfortunately, this relies on my deferred invalidation work so that the
invalidation range is propagated through to the sync callback:

  https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=iommu/cmdq

At this point, if we decide to do anything for earier kernels, the easiest
thing is probably to nobble the ATS feature at probe time.

NOTE: this has not been tested, since I don't have access to any systems
capable of ATS!

Feedback welcome,

Will

Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: John Garry <john.garry@huawei.com>
Cc: Robin Murphy <robin.murphy@arm.com>

--->8

Will Deacon (4):
  iommu/arm-smmu-v3: Document ordering guarantees of command insertion
  iommu/arm-smmu-v3: Rework enabling/disabling of ATS for PCI masters
  iommu/arm-smmu-v3: Fix ATC invalidation ordering wrt main TLBs
  iommu/arm-smmu-v3: Avoid locking on invalidation path when not using
    ATS

 drivers/iommu/arm-smmu-v3.c | 105 ++++++++++++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 28 deletions(-)

-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
