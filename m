Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16A341E3F
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:30:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 367654012F;
	Fri, 19 Mar 2021 13:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrnTyAbr3L-1; Fri, 19 Mar 2021 13:30:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC8E240138;
	Fri, 19 Mar 2021 13:30:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E898C0001;
	Fri, 19 Mar 2021 13:30:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 979FCC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8349D4B60F
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HABgEv2MDUXc for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 764854ADED
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:30:22 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F24T25Y6CzPkQv;
 Fri, 19 Mar 2021 21:27:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Mar 2021 21:30:06 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <hch@lst.de>, <m.szyprowski@samsung.com>,
 <robin.murphy@arm.com>
Subject: [PATCH 0/6] dma mapping/iommu: Allow IOMMU IOVA rcache range to be
 configured
Date: Fri, 19 Mar 2021 21:25:42 +0800
Message-ID: <1616160348-29451-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linuxarm@huawei.com
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

For streaming DMA mappings involving an IOMMU and whose IOVA len regularly
exceeds the IOVA rcache upper limit (meaning that they are not cached),
performance can be reduced. 

This is much more pronounced from commit 4e89dce72521 ("iommu/iova: Retry
from last rb tree node if iova search fails"), as discussed at [0].

IOVAs which cannot be cached are highly involved in the IOVA aging issue,
as discussed at [1].

This series attempts to allow the device driver hint what upper limit its
DMA mapping IOVA lengths would be, so that the caching range may be
increased.

Some figures on storage scenario:
v5.12-rc3 baseline:			600K IOPS
With series:				1300K IOPS
With reverting 4e89dce72521: 		1250K IOPS

All above are for IOMMU strict mode. Non-strict mode gives ~1750K IOPS in
all scenarios.

I will say that APIs and their semantics are a bit ropey - any better
ideas welcome...

[0] https://lore.kernel.org/linux-iommu/20210129092120.1482-1-thunder.leizhen@huawei.com/
[1] https://lore.kernel.org/linux-iommu/1607538189-237944-1-git-send-email-john.garry@huawei.com/

John Garry (6):
  iommu: Move IOVA power-of-2 roundup into allocator
  iova: Add a per-domain count of reserved nodes
  iova: Allow rcache range upper limit to be configurable
  iommu: Add iommu_dma_set_opt_size()
  dma-mapping/iommu: Add dma_set_max_opt_size()
  scsi: hisi_sas: Set max optimal DMA size for v3 hw

 drivers/iommu/dma-iommu.c              | 23 ++++---
 drivers/iommu/iova.c                   | 88 ++++++++++++++++++++------
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c |  2 +
 include/linux/dma-map-ops.h            |  1 +
 include/linux/dma-mapping.h            |  5 ++
 include/linux/iova.h                   | 12 +++-
 kernel/dma/mapping.c                   | 11 ++++
 7 files changed, 115 insertions(+), 27 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
