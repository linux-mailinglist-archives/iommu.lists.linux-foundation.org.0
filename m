Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70A1EA321
	for <lists.iommu@lfdr.de>; Mon,  1 Jun 2020 13:54:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB02187D46;
	Mon,  1 Jun 2020 11:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTdLurF0x4yc; Mon,  1 Jun 2020 11:54:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78AE487D55;
	Mon,  1 Jun 2020 11:54:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C6C8C0176;
	Mon,  1 Jun 2020 11:54:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E997DC0176
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 11:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CBB6D20432
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 11:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LVEeyQxS17X for <iommu@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 11:54:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id E8B9220403
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 11:54:46 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 727A1D4B5A6A15A60BF1;
 Mon,  1 Jun 2020 19:54:43 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 1 Jun 2020 19:54:37 +0800
From: John Garry <john.garry@huawei.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
Subject: [PATCH RFC 0/2] iommu/arm-smmu-v3: Improve cmdq lock efficiency
Date: Mon, 1 Jun 2020 19:50:46 +0800
Message-ID: <1591012248-37956-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: maz@kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
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

As mentioned in [0], the CPU may consume many cycles processing
arm_smmu_cmdq_issue_cmdlist(). One issue we find is the cmpxchg() loop to
get space on the queue takes approx 25% of the cycles for this function.

The cmpxchg() is removed as follows:
- We assume that the cmdq can never fill with changes to limit the
  batch size (where necessary) and always issue a CMD_SYNC for a batch
  We need to do this since we no longer maintain the cons value in
  software, and we cannot deal with no available space properly.
- Replace cmpxchg() with atomic inc operation, to maintain the prod
  and owner values.

Early experiments have shown that we may see a 25% boost in throughput
IOPS for my NVMe test with these changes. And some CPUs, which were
loaded at ~55%, now see a ~45% load.

So, even though the changes are incomplete and other parts of the driver
will need fixing up (and it looks maybe broken for !MSI support), the
performance boost seen would seem to be worth the effort of exploring
this.

Comments requested please.

Thanks

[0] https://lore.kernel.org/linux-iommu/B926444035E5E2439431908E3842AFD24B86DB@DGGEMI525-MBS.china.huawei.com/T/#ma02e301c38c3e94b7725e685757c27e39c7cbde3

John Garry (2):
  iommu/arm-smmu-v3: Calculate bits for prod and owner
  iommu/arm-smmu-v3: Remove cmpxchg() in arm_smmu_cmdq_issue_cmdlist()

 drivers/iommu/arm-smmu-v3.c | 92 +++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 45 deletions(-)

-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
