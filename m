Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC032215601
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 12:59:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 249318872A;
	Mon,  6 Jul 2020 10:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdeIGJWFNvlg; Mon,  6 Jul 2020 10:59:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A3B388719;
	Mon,  6 Jul 2020 10:59:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DA60C016F;
	Mon,  6 Jul 2020 10:59:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7C0EC016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 10:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D687386DAF
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 10:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oowAsFffUVjn for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 10:59:05 +0000 (UTC)
X-Greylist: delayed 00:07:12 by SQLgrey-1.7.6
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn
 [202.108.3.21])
 by whitealder.osuosl.org (Postfix) with SMTP id EC83F882EB
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 10:59:04 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.219.171.29])
 by sina.com with ESMTP
 id 5F0301B5000168FD; Mon, 6 Jul 2020 18:49:26 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 855812628790
From: Hillf Danton <hdanton@sina.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: [RFC PATCH] vfio: type1: fix kthread use case
Date: Mon,  6 Jul 2020 18:49:15 +0800
Message-Id: <20200706104915.11460-1-hdanton@sina.com>
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>,
 iommu@lists.linux-foundation.org, Markus Elfring <Markus.Elfring@web.de>,
 Christoph Hellwig <hch@lst.de>
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


It's incorrect to tell out if a task is kthread without checking
PF_KTHREAD at all.

What's also fixed, if no need to be in a seperate patch, is to
invoke kthread_use_mm() without checking the current mm first as
the kthread may hold a mm struct atm and it's not the right place
to switch mm.

Fixes: 8d46c0cca5f4 ("vfio: introduce vfio_dma_rw to read/write a range of IOVAs")
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Hillf Danton <hdanton@sina.com>
---

--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2798,7 +2798,8 @@ static int vfio_iommu_type1_dma_rw_chunk
 	struct mm_struct *mm;
 	unsigned long vaddr;
 	struct vfio_dma *dma;
-	bool kthread = current->mm == NULL;
+	bool kthread = current->flags & PF_KTHREAD;
+	bool use_mm = current->mm == NULL;
 	size_t offset;
 
 	*copied = 0;
@@ -2812,11 +2813,10 @@ static int vfio_iommu_type1_dma_rw_chunk
 		return -EPERM;
 
 	mm = get_task_mm(dma->task);
-
 	if (!mm)
 		return -EPERM;
 
-	if (kthread)
+	if (kthread && use_mm)
 		kthread_use_mm(mm);
 	else if (current->mm != mm)
 		goto out;
@@ -2843,7 +2843,7 @@ static int vfio_iommu_type1_dma_rw_chunk
 	} else
 		*copied = copy_from_user(data, (void __user *)vaddr,
 					   count) ? 0 : count;
-	if (kthread)
+	if (kthread && use_mm)
 		kthread_unuse_mm(mm);
 out:
 	mmput(mm);
--

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
