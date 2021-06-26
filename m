Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7C3B4E4A
	for <lists.iommu@lfdr.de>; Sat, 26 Jun 2021 13:02:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8D560623;
	Sat, 26 Jun 2021 11:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqO4nbhs5b3M; Sat, 26 Jun 2021 11:02:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 899B96066D;
	Sat, 26 Jun 2021 11:02:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 535D1C001F;
	Sat, 26 Jun 2021 11:02:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71401C000E
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 11:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C6F7403F3
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 11:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6bW6doaHhzo for <iommu@lists.linux-foundation.org>;
 Sat, 26 Jun 2021 11:02:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 217284029F
 for <iommu@lists.linux-foundation.org>; Sat, 26 Jun 2021 11:02:13 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GBrRC6pVGzXkWv;
 Sat, 26 Jun 2021 18:56:55 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 19:02:08 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 26 Jun 2021 19:02:07 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH RFC 0/8] iommu/arm-smmu-v3: add support for ECMDQ register mode
Date: Sat, 26 Jun 2021 19:01:22 +0800
Message-ID: <20210626110130.2416-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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

SMMU v3.3 added a new feature, which is Enhanced Command queue interface
for reducing contention when submitting Commands to the SMMU, in this
patch set, ECMDQ is the abbreviation of Enhanced Command Queue.

When the hardware supports ECMDQ and each core can exclusively use one ECMDQ,
each core does not need to compete with other cores when using its own ECMDQ.
This means that each core can insert commands in parallel. If each ECMDQ can
execute commands in parallel, the overall performance may be better. However,
our hardware currently does not support multiple ECMDQ execute commands in
parallel.

In order to reuse existing code, I originally still call arm_smmu_cmdq_issue_cmdlist()
to insert commands. Even so, however, there was a performance improvement of nearly 12%
in strict mode.

The test environment is the EMU, which simulates the connection of the 200 Gbit/s NIC.
Number of queues:    passthrough   lazy   strict(ECMDQ)  strict(CMDQ)
      6                  188        180       162           145        --> 11.7% improvement
      8                  188        188       184           183        --> 0.55% improvement

In recent days, I implemented a new function without competition with other
cores to replace arm_smmu_cmdq_issue_cmdlist() when a core can have an ECMDQ.
I'm guessing it might get better performance results. Because the EMU is too
slow, it will take a while before the relevant data is available.


Zhen Lei (8):
  iommu/arm-smmu-v3: Use command queue batching helpers to improve
    performance
  iommu/arm-smmu-v3: Add and use static helper function
    arm_smmu_cmdq_issue_cmd_with_sync()
  iommu/arm-smmu-v3: Add and use static helper function
    arm_smmu_get_cmdq()
  iommu/arm-smmu-v3: Extract reusable function
    __arm_smmu_cmdq_skip_err()
  iommu/arm-smmu-v3: Add support for ECMDQ register mode
  iommu/arm-smmu-v3: Ensure that a set of associated commands are
    inserted in the same ECMDQ
  iommu/arm-smmu-v3: Add arm_smmu_ecmdq_issue_cmdlist() for non-shared
    ECMDQ
  iommu/arm-smmu-v3: Add support for less than one ECMDQ per core

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 483 ++++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  37 ++
 2 files changed, 489 insertions(+), 31 deletions(-)

-- 
2.26.0.106.g9fadedd


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
