Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691A8EB2A
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 14:11:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 99B7510A7;
	Thu, 15 Aug 2019 12:11:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 87FA910A7
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 12:11:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EDDAB711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 12:11:42 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 71EE8288D19D6B69B9DB;
	Thu, 15 Aug 2019 20:11:40 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.439.0; Thu, 15 Aug 2019 20:11:33 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, "Jean-Philippe
	Brucker" <jean-philippe@linaro.org>, John Garry <john.garry@huawei.com>,
	"Robin Murphy" <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Joerg
	Roedel <joro@8bytes.org>, iommu <iommu@lists.linux-foundation.org>, Omer
	Peleg <omer@cs.technion.ac.il>, Adam Morrison <mad@cs.technion.ac.il>, 
	Shaohua Li <shli@fb.com>, Ben Serebrin <serebrin@google.com>,
	David Woodhouse <David.Woodhouse@intel.com>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] iommu/iova: introduce iova_magazine_compact_pfns()
Date: Thu, 15 Aug 2019 20:11:03 +0800
Message-ID: <20190815121104.29140-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190815121104.29140-1-thunder.leizhen@huawei.com>
References: <20190815121104.29140-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

iova_magazine_free_pfns() can only free the whole magazine buffer, add
iova_magazine_compact_pfns() to support free part of it.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/iova.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 3e1a8a6755723a9..4b7a9efa0ef40af 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -795,18 +795,19 @@ static void iova_magazine_free(struct iova_magazine *mag)
 	kfree(mag);
 }
 
-static void
-iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
+static void iova_magazine_compact_pfns(struct iova_magazine *mag,
+				       struct iova_domain *iovad,
+				       unsigned long newsize)
 {
 	unsigned long flags;
 	int i;
 
-	if (!mag)
+	if (!mag || mag->size <= newsize)
 		return;
 
 	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
 
-	for (i = 0 ; i < mag->size; ++i) {
+	for (i = newsize; i < mag->size; ++i) {
 		struct iova *iova = private_find_iova(iovad, mag->pfns[i]);
 
 		BUG_ON(!iova);
@@ -815,7 +816,13 @@ static void iova_magazine_free(struct iova_magazine *mag)
 
 	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
 
-	mag->size = 0;
+	mag->size = newsize;
+}
+
+static void
+iova_magazine_free_pfns(struct iova_magazine *mag, struct iova_domain *iovad)
+{
+	iova_magazine_compact_pfns(mag, iovad, 0);
 }
 
 static bool iova_magazine_full(struct iova_magazine *mag)
-- 
1.8.3


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
