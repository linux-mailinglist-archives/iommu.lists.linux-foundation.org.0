Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF383AEFED
	for <lists.iommu@lfdr.de>; Mon, 21 Jun 2021 18:41:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1823340225;
	Mon, 21 Jun 2021 16:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sr-HOVHjUdA9; Mon, 21 Jun 2021 16:41:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2EDCB40222;
	Mon, 21 Jun 2021 16:41:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 000ECC000C;
	Mon, 21 Jun 2021 16:41:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97A28C000C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 16:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7783440493
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 16:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3PlIuMsJ7_c8 for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 16:41:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14DC540341
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 16:41:43 +0000 (UTC)
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4G7w5p2wfjz6L7cg;
 Tue, 22 Jun 2021 00:31:42 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 18:41:39 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 17:41:36 +0100
From: John Garry <john.garry@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
Subject: [PATCH] iommu/arm-smmu-v3: Remove some unneeded init in
 arm_smmu_cmdq_issue_cmdlist()
Date: Tue, 22 Jun 2021 00:36:34 +0800
Message-ID: <1624293394-202509-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

Members of struct "llq" will be zero-inited, apart from member max_n_shift.
But we write llq.val straight after the init, so it was pointless to zero
init those other members. As such, separately init member max_n_shift
only.

In addition, struct "head" is initialised to "llq" only so that member
max_n_shift is set. But that member is never referenced for "head", so
remove any init there.

Removing these initializations is seen as a small performance optimisation,
as this code is (very) hot path.

Signed-off-by: John Garry <john.garry@huawei.com>

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 54b2f27b81d4..8a8ad49bb7fd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -727,11 +727,11 @@ static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
 	unsigned long flags;
 	bool owner;
 	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
-	struct arm_smmu_ll_queue llq = {
-		.max_n_shift = cmdq->q.llq.max_n_shift,
-	}, head = llq;
+	struct arm_smmu_ll_queue llq, head;
 	int ret = 0;
 
+	llq.max_n_shift = cmdq->q.llq.max_n_shift;
+
 	/* 1. Allocate some space in the queue */
 	local_irq_save(flags);
 	llq.val = READ_ONCE(cmdq->q.llq.val);
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
