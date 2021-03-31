Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090E349213
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 13:34:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D06B84803;
	Thu, 25 Mar 2021 12:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7i0ptsb4-Ftt; Thu, 25 Mar 2021 12:34:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC768485C;
	Thu, 25 Mar 2021 12:34:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 843E0C0012;
	Thu, 25 Mar 2021 12:34:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10A3AC000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 12:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C34C2401CA
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 12:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdLw46hoMQcc for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 12:34:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5123F401C2
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 12:34:20 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5kxW07yFzPlr5;
 Thu, 25 Mar 2021 20:31:43 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 20:34:07 +0800
From: John Garry <john.garry@huawei.com>
To: <joro@8bytes.org>, <will@kernel.org>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, <robin.murphy@arm.com>
Subject: [PATCH v2 0/4] iommu/iova: Add CPU hotplug handler to flush rcaches
 to core code
Date: Thu, 25 Mar 2021 20:29:57 +0800
Message-ID: <1616675401-151997-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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

The Intel IOMMU driver supports flushing the per-CPU rcaches when a CPU is
offlined.

Let's move it to core code, so everyone can take advantage.

Also throw in a patch to stop exporting free_iova_fast().

Differences to v1:
- Add RB tags (thanks!)
- Add patch to stop exporting free_iova_fast()
- Drop patch to correct comment
- Add patch to delete iommu_dma_free_cpu_cached_iovas() and associated
  changes

John Garry (4):
  iova: Add CPU hotplug handler to flush rcaches
  iommu/vt-d: Remove IOVA domain rcache flushing for CPU offlining
  iommu: Delete iommu_dma_free_cpu_cached_iovas()
  iommu: Stop exporting free_iova_fast()

 drivers/iommu/dma-iommu.c   |  9 ---------
 drivers/iommu/intel/iommu.c | 31 -------------------------------
 drivers/iommu/iova.c        | 34 +++++++++++++++++++++++++++++++---
 include/linux/cpuhotplug.h  |  2 +-
 include/linux/dma-iommu.h   |  8 --------
 include/linux/iova.h        |  6 +-----
 6 files changed, 33 insertions(+), 57 deletions(-)

-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
