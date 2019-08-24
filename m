Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 924599BB59
	for <lists.iommu@lfdr.de>; Sat, 24 Aug 2019 05:19:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 68E6EC77;
	Sat, 24 Aug 2019 03:19:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6A31B5F
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 01:49:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF9F98A2
	for <iommu@lists.linux-foundation.org>;
	Sat, 24 Aug 2019 01:49:22 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 72B379924FCC14EF7B24;
	Sat, 24 Aug 2019 09:49:20 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.439.0; Sat, 24 Aug 2019 09:49:16 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <joro@8bytes.org>
Subject: [PATCH] iommu/dma: fix for dereferencing before null checking
Date: Sat, 24 Aug 2019 09:47:12 +0800
Message-ID: <1566611232-165399-1-git-send-email-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sat, 24 Aug 2019 03:19:35 +0000
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

The cookie is dereferenced before null checking in the function
iommu_dma_init_domain.

This patch moves the dereferencing after the null checking.

Fixes: fdbe574eb693 ("iommu/dma: Allow MSI-only cookies")
Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
---
 drivers/iommu/dma-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index d991d40..cdf7814 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -303,13 +303,15 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 		u64 size, struct device *dev)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
-	struct iova_domain *iovad = &cookie->iovad;
 	unsigned long order, base_pfn;
+	struct iova_domain *iovad;
 	int attr;
 
 	if (!cookie || cookie->type != IOMMU_DMA_IOVA_COOKIE)
 		return -EINVAL;
 
+	iovad = &cookie->iovad;
+
 	/* Use the smallest supported page size for IOVA granularity */
 	order = __ffs(domain->pgsize_bitmap);
 	base_pfn = max_t(unsigned long, 1, base >> order);
-- 
2.8.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
