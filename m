Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A44761077E7
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 20:17:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03CAD883BD;
	Fri, 22 Nov 2019 19:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vq7RNMxrkjYa; Fri, 22 Nov 2019 19:17:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2467D8839A;
	Fri, 22 Nov 2019 19:17:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 190ADC18DA;
	Fri, 22 Nov 2019 19:17:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75770C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 19:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B3A120354
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 19:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IC5KHeNoK9nE for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 19:17:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 5ED9A20243
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 19:17:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 30so9015816qtz.12
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 11:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Qb3jkfznea5AOIJ97DEoFWbKQNlXPlyeiYtdLKGq9UA=;
 b=n28AV1LNImQJRoVO3F0upOGhmdimfpNQYUUthfTCs0OL20Xe6Az2zBBSy0WPnLpVsb
 +9jh+Q5azPcP2FPOd091ezksFEoC9bzAo2yNpu55N58TpOk38iTyWY3Tvf0xioQt2A6j
 KXHTgzuBtnLKZqJI80Yki3x6LmLb7uVFGK4D8yFfJt4layvGi1Vtr0E4xe89wfOVgtkN
 5TEt6BjJ7HQJOixNdDFhabcbjUP06vdvuSIUlRMqs2yu81ExlY3/iCB9Hty19WOqLJgJ
 +lf7Wsu8AfOd0M1GO0kAmYrhKl4dXYPl4FXLr/G2Xm2akGQ0M7CJ5bVjzswjz9mPy+4u
 fqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qb3jkfznea5AOIJ97DEoFWbKQNlXPlyeiYtdLKGq9UA=;
 b=KcIHvpkhbcKa6WzdsYdXWKeBdSIyyQUUd90+oBH6dMRVXI3sUnJiHeIKZNghYf+qAK
 Q3cCa4V+HFXG1frUK2OGoYtPJtK4IlfaOVIzqA2ySCDOQDyYmbmOL2BZ+kzFMnvg068+
 Plz0VWfyiyNyy9YBn1OR7Wr6CdSIHXVc4ttJ8HS0Jsc0VP21dpir7wfs07JdKpWdzK60
 FbjamQeSDVDMU3a/FJm/qRak1W9K9wI77UzyGhPDfTYbiR2e0wd4sqiSN8wyAMglWv2o
 XSUNQfQD8uRlV+1iJLiuZJ/0VmYbq9I49Ys1ibzDMpvdUU99yI8EguhwB4zl2k77MLrM
 QMnQ==
X-Gm-Message-State: APjAAAU4Pgc59Ja1Hj9I8HEEz+lgaCmAiOQU3ej1hUWGQlafhMEA2sUM
 PvgzKji8PXoliS8cj34G/CPPEg==
X-Google-Smtp-Source: APXvYqwCJjI7cVRSiYbFakX35Oih35f8INaRnbpgBab4tlcf9hU/GTJsIJ1qisnMfSf5rCvVSWNeHg==
X-Received: by 2002:ac8:2f4e:: with SMTP id k14mr5309709qta.357.1574450227230; 
 Fri, 22 Nov 2019 11:17:07 -0800 (PST)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id y28sm3915540qtk.65.2019.11.22.11.17.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Nov 2019 11:17:06 -0800 (PST)
From: Qian Cai <cai@lca.pw>
To: jroedel@suse.de
Subject: [PATCH v4] iommu/iova: silence warnings under memory pressure
Date: Fri, 22 Nov 2019 14:16:54 -0500
Message-Id: <1574450214-19432-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 joe@perches.com, dwmw2@infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

When running heavy memory pressure workloads, this 5+ old system is
throwing endless warnings below because disk IO is too slow to recover
from swapping. Since the volume from alloc_iova_fast() could be large,
once it calls printk(), it will trigger disk IO (writing to the log
files) and pending softirqs which could cause an infinite loop and make
no progress for days by the ongoimng memory reclaim. This is the counter
part for Intel where the AMD part has already been merged. See the
commit 3d708895325b ("iommu/amd: Silence warnings under memory
pressure"). Since the allocation failure will be reported in
intel_alloc_iova(), so just call dev_err_once() there because even the
"ratelimited" is too much, and silence the one in alloc_iova_mem() to
avoid the expensive warn_alloc().

 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 slab_out_of_memory: 66 callbacks suppressed
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
   cache: iommu_iova, object size: 40, buffer size: 448, default order:
0, min order: 0
   node 0: slabs: 1822, objs: 16398, free: 0
   node 1: slabs: 2051, objs: 18459, free: 31
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
   cache: iommu_iova, object size: 40, buffer size: 448, default order:
0, min order: 0
   node 0: slabs: 1822, objs: 16398, free: 0
   node 1: slabs: 2051, objs: 18459, free: 31
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
   cache: iommu_iova, object size: 40, buffer size: 448, default order:
0, min order: 0
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   node 0: slabs: 697, objs: 4182, free: 0
   node 0: slabs: 697, objs: 4182, free: 0
   node 0: slabs: 697, objs: 4182, free: 0
   node 0: slabs: 697, objs: 4182, free: 0
   node 1: slabs: 381, objs: 2286, free: 27
   node 1: slabs: 381, objs: 2286, free: 27
   node 1: slabs: 381, objs: 2286, free: 27
   node 1: slabs: 381, objs: 2286, free: 27
   node 0: slabs: 1822, objs: 16398, free: 0
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   node 1: slabs: 2051, objs: 18459, free: 31
   node 0: slabs: 697, objs: 4182, free: 0
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
   node 1: slabs: 381, objs: 2286, free: 27
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   node 0: slabs: 697, objs: 4182, free: 0
   node 1: slabs: 381, objs: 2286, free: 27
 hpsa 0000:03:00.0: DMAR: Allocating 1-page iova failed
 warn_alloc: 96 callbacks suppressed
 kworker/11:1H: page allocation failure: order:0,
mode:0xa20(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0-1
 CPU: 11 PID: 1642 Comm: kworker/11:1H Tainted: G    B
 Hardware name: HP ProLiant XL420 Gen9/ProLiant XL420 Gen9, BIOS U19
12/27/2015
 Workqueue: kblockd blk_mq_run_work_fn
 Call Trace:
  dump_stack+0xa0/0xea
  warn_alloc.cold.94+0x8a/0x12d
  __alloc_pages_slowpath+0x1750/0x1870
  __alloc_pages_nodemask+0x58a/0x710
  alloc_pages_current+0x9c/0x110
  alloc_slab_page+0xc9/0x760
  allocate_slab+0x48f/0x5d0
  new_slab+0x46/0x70
  ___slab_alloc+0x4ab/0x7b0
  __slab_alloc+0x43/0x70
  kmem_cache_alloc+0x2dd/0x450
 SLUB: Unable to allocate memory on node -1, gfp=0xa20(GFP_ATOMIC)
  alloc_iova+0x33/0x210
   cache: skbuff_head_cache, object size: 208, buffer size: 640, default
order: 0, min order: 0
   node 0: slabs: 697, objs: 4182, free: 0
  alloc_iova_fast+0x62/0x3d1
   node 1: slabs: 381, objs: 2286, free: 27
  intel_alloc_iova+0xce/0xe0
  intel_map_sg+0xed/0x410
  scsi_dma_map+0xd7/0x160
  scsi_queue_rq+0xbf7/0x1310
  blk_mq_dispatch_rq_list+0x4d9/0xbc0
  blk_mq_sched_dispatch_requests+0x24a/0x300
  __blk_mq_run_hw_queue+0x156/0x230
  blk_mq_run_work_fn+0x3b/0x40
  process_one_work+0x579/0xb90
  worker_thread+0x63/0x5b0
  kthread+0x1e6/0x210
  ret_from_fork+0x3a/0x50
 Mem-Info:
 active_anon:2422723 inactive_anon:361971 isolated_anon:34403
  active_file:2285 inactive_file:1838 isolated_file:0
  unevictable:0 dirty:1 writeback:5 unstable:0
  slab_reclaimable:13972 slab_unreclaimable:453879
  mapped:2380 shmem:154 pagetables:6948 bounce:0
  free:19133 free_pcp:7363 free_cma:0

Signed-off-by: Qian Cai <cai@lca.pw>
---

v4: use dev_err_once() instead as mentioned above.
v3: insert a "\n" in dev_err_ratelimited() per Joe.
v2: use dev_err_ratelimited() and improve the commit messages.

 drivers/iommu/intel-iommu.c | 3 ++-
 drivers/iommu/iova.c        | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0c8d81f56a30..8c944bbbed8a 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3406,7 +3406,8 @@ static unsigned long intel_alloc_iova(struct device *dev,
 	iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
 				   IOVA_PFN(dma_mask), true);
 	if (unlikely(!iova_pfn)) {
-		dev_err(dev, "Allocating %ld-page iova failed", nrpages);
+		dev_err_once(dev, "Allocating %ld-page iova failed\n",
+			     nrpages);
 		return 0;
 	}
 
diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 41c605b0058f..aa1a56aaa5ee 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -233,7 +233,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
 
 struct iova *alloc_iova_mem(void)
 {
-	return kmem_cache_alloc(iova_cache, GFP_ATOMIC);
+	return kmem_cache_alloc(iova_cache, GFP_ATOMIC | __GFP_NOWARN);
 }
 EXPORT_SYMBOL(alloc_iova_mem);
 
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
