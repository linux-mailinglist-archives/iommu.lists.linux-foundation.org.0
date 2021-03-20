Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5543429F6
	for <lists.iommu@lfdr.de>; Sat, 20 Mar 2021 03:18:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F389E40349;
	Sat, 20 Mar 2021 02:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-n9ZBw4ClFB; Sat, 20 Mar 2021 02:18:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id C748F4034B;
	Sat, 20 Mar 2021 02:18:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B5F3C0001;
	Sat, 20 Mar 2021 02:18:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B867C0001
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 02:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAE1B83F07
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 02:18:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TvX150pleAyG for <iommu@lists.linux-foundation.org>;
 Sat, 20 Mar 2021 02:18:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F393183EED
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 02:18:39 +0000 (UTC)
IronPort-SDR: NS7T2J3I46COJW00n4mMICdDLXPzrpGKNFQEXofi7F/MzsaOWHCrQLJQ8LUfq2SScxT9RkQyVe
 RKexVa9rhSiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="210036368"
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="210036368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 19:18:38 -0700
IronPort-SDR: ifCZBgEbNVm4RtJUYXhspW+lf4lAWdTcukLek85azk0D9uY8kRdm8kqljVo6iT21BK1dRHFuzw
 GPjPR5c1+GDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="512681377"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2021 19:18:37 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 1/1] iommu/vt-d: Fix lockdep splat in
 intel_pasid_get_entry()
Date: Sat, 20 Mar 2021 10:09:16 +0800
Message-Id: <20210320020916.640115-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Dave Jiang <dave.jiang@intel.com>,
 linux-kernel@vger.kernel.org
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

The pasid_lock is used to synchronize different threads from modifying a
same pasid directory entry at the same time. It causes below lockdep splat.

[   83.296538] ========================================================
[   83.296538] WARNING: possible irq lock inversion dependency detected
[   83.296539] 5.12.0-rc3+ #25 Tainted: G        W
[   83.296539] --------------------------------------------------------
[   83.296540] bash/780 just changed the state of lock:
[   83.296540] ffffffff82b29c98 (device_domain_lock){..-.}-{2:2}, at:
           iommu_flush_dev_iotlb.part.0+0x32/0x110
[   83.296547] but this lock took another, SOFTIRQ-unsafe lock in the past:
[   83.296547]  (pasid_lock){+.+.}-{2:2}
[   83.296548]

           and interrupts could create inverse lock ordering between them.

[   83.296549] other info that might help us debug this:
[   83.296549] Chain exists of:
                 device_domain_lock --> &iommu->lock --> pasid_lock
[   83.296551]  Possible interrupt unsafe locking scenario:

[   83.296551]        CPU0                    CPU1
[   83.296552]        ----                    ----
[   83.296552]   lock(pasid_lock);
[   83.296553]                                local_irq_disable();
[   83.296553]                                lock(device_domain_lock);
[   83.296554]                                lock(&iommu->lock);
[   83.296554]   <Interrupt>
[   83.296554]     lock(device_domain_lock);
[   83.296555]
                *** DEADLOCK ***

Fix it by replacing the pasid_lock with an atomic exchange operation.

Reported-and-tested-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/pasid.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

Log:
v1->v2:
  - v1: https://lore.kernel.org/linux-iommu/20210317005834.173503-1-baolu.lu@linux.intel.com/
  - Use retry to make code neat;
  - Add a comment about no clear case, hence no race.

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 7a73385edcc0..f2c747e62c6a 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -24,7 +24,6 @@
 /*
  * Intel IOMMU system wide PASID name space:
  */
-static DEFINE_SPINLOCK(pasid_lock);
 u32 intel_pasid_max_id = PASID_MAX;
 
 int vcmd_alloc_pasid(struct intel_iommu *iommu, u32 *pasid)
@@ -259,19 +258,25 @@ struct pasid_entry *intel_pasid_get_entry(struct device *dev, u32 pasid)
 	dir_index = pasid >> PASID_PDE_SHIFT;
 	index = pasid & PASID_PTE_MASK;
 
-	spin_lock(&pasid_lock);
+retry:
 	entries = get_pasid_table_from_pde(&dir[dir_index]);
 	if (!entries) {
 		entries = alloc_pgtable_page(info->iommu->node);
-		if (!entries) {
-			spin_unlock(&pasid_lock);
+		if (!entries)
 			return NULL;
-		}
 
-		WRITE_ONCE(dir[dir_index].val,
-			   (u64)virt_to_phys(entries) | PASID_PTE_PRESENT);
+		/*
+		 * The pasid directory table entry won't be freed after
+		 * allocation. No worry about the race with free and
+		 * clear. However, this entry might be populated by others
+		 * while we are preparing it. Use theirs with a retry.
+		 */
+		if (cmpxchg64(&dir[dir_index].val, 0ULL,
+			      (u64)virt_to_phys(entries) | PASID_PTE_PRESENT)) {
+			free_pgtable_page(entries);
+			goto retry;
+		}
 	}
-	spin_unlock(&pasid_lock);
 
 	return &entries[index];
 }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
