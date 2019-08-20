Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2C964FF
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 17:46:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3E293B79;
	Tue, 20 Aug 2019 15:45:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BA04D97
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:45:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2D05A89B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:45:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB92360;
	Tue, 20 Aug 2019 08:45:57 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C36BA3F246; 
	Tue, 20 Aug 2019 08:45:56 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/4] iommu/arm-smmu-v3: Document ordering guarantees of
	command insertion
Date: Tue, 20 Aug 2019 16:45:46 +0100
Message-Id: <20190820154549.17018-2-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190820154549.17018-1-will@kernel.org>
References: <20190820154549.17018-1-will@kernel.org>
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

It turns out that we've always relied on some subtle ordering guarantees
when inserting commands into the SMMUv3 command queue. With the recent
changes to elide locking when possible, these guarantees become more
subtle and even more important.

Add a comment documented the barrier semantics of command insertion so
that we don't have to derive the behaviour from scratch each time it
comes up on the list.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/arm-smmu-v3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index b36a99971401..3402b1bc8e94 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1286,6 +1286,22 @@ static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64 *cmds,
 	}
 }
 
+/*
+ * This is the actual insertion function, and provides the following
+ * ordering guarantees to callers:
+ *
+ * - There is a dma_wmb() before publishing any commands to the queue.
+ *   This can be relied upon to order prior writes to data structures
+ *   in memory (such as a CD or an STE) before the command.
+ *
+ * - On completion of a CMD_SYNC, there is a control dependency.
+ *   This can be relied upon to order subsequent writes to memory (e.g.
+ *   freeing an IOVA) after completion of the CMD_SYNC.
+ *
+ * - Command insertion is totally ordered, so if two CPUs each race to
+ *   insert their own list of commands then all of the commands from one
+ *   CPU will appear before any of the commands from the other CPU.
+ */
 static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 				       u64 *cmds, int n, bool sync)
 {
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
