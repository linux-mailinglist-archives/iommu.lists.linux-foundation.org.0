Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C64FE2D54B4
	for <lists.iommu@lfdr.de>; Thu, 10 Dec 2020 08:35:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 77F1587898;
	Thu, 10 Dec 2020 07:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n+RRbmSAyCra; Thu, 10 Dec 2020 07:35:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E14858789F;
	Thu, 10 Dec 2020 07:35:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2CF4C013B;
	Thu, 10 Dec 2020 07:35:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 062F0C1D9F
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 07:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E2A1787613
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 07:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGeUtU9swca3 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Dec 2020 07:35:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 545F3872BB
 for <iommu@lists.linux-foundation.org>; Thu, 10 Dec 2020 07:35:43 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cs5Kg6N1tz7CCB;
 Thu, 10 Dec 2020 15:35:03 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 15:35:25 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <kvm@vger.kernel.org>,
 <kvmarm@lists.cs.columbia.edu>, Alex Williamson <alex.williamson@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Marc Zyngier <maz@kernel.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 1/7] vfio: iommu_type1: Clear added dirty bit when unwind pin
Date: Thu, 10 Dec 2020 15:34:19 +0800
Message-ID: <20201210073425.25960-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201210073425.25960-1-zhukeqian1@huawei.com>
References: <20201210073425.25960-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, jiangkunkun@huawei.com,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 James Morse <james.morse@arm.com>, wanghaibin.wang@huawei.com, Thomas
 Gleixner <tglx@linutronix.de>, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Julien Thierry <julien.thierry.kdev@gmail.com>
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

Currently we do not clear added dirty bit of bitmap when unwind
pin, so if pin failed at halfway, we set unnecessary dirty bit
in bitmap. Clearing added dirty bit when unwind pin, userspace
will see less dirty page, which can save much time to handle them.

Note that we should distinguish the bits added by pin and the bits
already set before pin, so introduce bitmap_added to record this.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 drivers/vfio/vfio_iommu_type1.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 67e827638995..f129d24a6ec3 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -637,7 +637,11 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	struct vfio_iommu *iommu = iommu_data;
 	struct vfio_group *group;
 	int i, j, ret;
+	unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
 	unsigned long remote_vaddr;
+	unsigned long bitmap_offset;
+	unsigned long *bitmap_added;
+	dma_addr_t iova;
 	struct vfio_dma *dma;
 	bool do_accounting;
 
@@ -650,6 +654,12 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 
 	mutex_lock(&iommu->lock);
 
+	bitmap_added = bitmap_zalloc(npage, GFP_KERNEL);
+	if (!bitmap_added) {
+		ret = -ENOMEM;
+		goto pin_done;
+	}
+
 	/* Fail if notifier list is empty */
 	if (!iommu->notifier.head) {
 		ret = -EINVAL;
@@ -664,7 +674,6 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 	do_accounting = !IS_IOMMU_CAP_DOMAIN_IN_CONTAINER(iommu);
 
 	for (i = 0; i < npage; i++) {
-		dma_addr_t iova;
 		struct vfio_pfn *vpfn;
 
 		iova = user_pfn[i] << PAGE_SHIFT;
@@ -699,14 +708,10 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 		}
 
 		if (iommu->dirty_page_tracking) {
-			unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
-
-			/*
-			 * Bitmap populated with the smallest supported page
-			 * size
-			 */
-			bitmap_set(dma->bitmap,
-				   (iova - dma->iova) >> pgshift, 1);
+			/* Populated with the smallest supported page size */
+			bitmap_offset = (iova - dma->iova) >> pgshift;
+			if (!test_and_set_bit(bitmap_offset, dma->bitmap))
+				set_bit(i, bitmap_added);
 		}
 	}
 	ret = i;
@@ -722,14 +727,20 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
 pin_unwind:
 	phys_pfn[i] = 0;
 	for (j = 0; j < i; j++) {
-		dma_addr_t iova;
-
 		iova = user_pfn[j] << PAGE_SHIFT;
 		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
 		vfio_unpin_page_external(dma, iova, do_accounting);
 		phys_pfn[j] = 0;
+
+		if (test_bit(j, bitmap_added)) {
+			bitmap_offset = (iova - dma->iova) >> pgshift;
+			clear_bit(bitmap_offset, dma->bitmap);
+		}
 	}
 pin_done:
+	if (bitmap_added)
+		bitmap_free(bitmap_added);
+
 	mutex_unlock(&iommu->lock);
 	return ret;
 }
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
