Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1592FFF0D
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 10:27:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE8ED87342;
	Fri, 22 Jan 2021 09:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBB87k-rszlZ; Fri, 22 Jan 2021 09:27:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39E7B87341;
	Fri, 22 Jan 2021 09:27:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29032C013A;
	Fri, 22 Jan 2021 09:27:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 761B2C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 09:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6653A86EC7
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 09:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnYUANbIS-gu for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 09:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB7F586EBA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 09:27:01 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DMYld4qd8z15vnr;
 Fri, 22 Jan 2021 17:25:49 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Fri, 22 Jan 2021 17:26:48 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>,
 <iommu@lists.linux-foundation.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "Cornelia Huck" <cohuck@redhat.com>
Subject: [PATCH v3 1/2] vfio/iommu_type1: Populate full dirty when detach
 non-pinned group
Date: Fri, 22 Jan 2021 17:26:34 +0800
Message-ID: <20210122092635.19900-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210122092635.19900-1-zhukeqian1@huawei.com>
References: <20210122092635.19900-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, jiangkunkun@huawei.com,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexios Zavras <alexios.zavras@intel.com>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, wanghaibin.wang@huawei.com,
 Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>,
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

If a group with non-pinned-page dirty scope is detached with dirty
logging enabled, we should fully populate the dirty bitmaps at the
time it's removed since we don't know the extent of its previous DMA,
nor will the group be present to trigger the full bitmap when the user
retrieves the dirty bitmap.

Fixes: d6a4c185660c ("vfio iommu: Implementation of ioctl for dirty pages tracking")
Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 drivers/vfio/vfio_iommu_type1.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 0b4dedaa9128..161725395f2f 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -236,6 +236,18 @@ static void vfio_dma_populate_bitmap(struct vfio_dma *dma, size_t pgsize)
 	}
 }
 
+static void vfio_iommu_populate_bitmap_full(struct vfio_iommu *iommu)
+{
+	struct rb_node *n;
+	unsigned long pgshift = __ffs(iommu->pgsize_bitmap);
+
+	for (n = rb_first(&iommu->dma_list); n; n = rb_next(n)) {
+		struct vfio_dma *dma = rb_entry(n, struct vfio_dma, node);
+
+		bitmap_set(dma->bitmap, 0, dma->size >> pgshift);
+	}
+}
+
 static int vfio_dma_bitmap_alloc_all(struct vfio_iommu *iommu, size_t pgsize)
 {
 	struct rb_node *n;
@@ -2415,8 +2427,11 @@ static void vfio_iommu_type1_detach_group(void *iommu_data,
 	 * Removal of a group without dirty tracking may allow the iommu scope
 	 * to be promoted.
 	 */
-	if (update_dirty_scope)
+	if (update_dirty_scope) {
 		update_pinned_page_dirty_scope(iommu);
+		if (iommu->dirty_page_tracking)
+			vfio_iommu_populate_bitmap_full(iommu);
+	}
 	mutex_unlock(&iommu->lock);
 }
 
-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
