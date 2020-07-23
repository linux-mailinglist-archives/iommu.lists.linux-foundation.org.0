Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99B22B032
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 15:16:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E4C9589570;
	Thu, 23 Jul 2020 13:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jXohYQ6yiPF; Thu, 23 Jul 2020 13:16:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27F80888BD;
	Thu, 23 Jul 2020 13:16:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21355C004C;
	Thu, 23 Jul 2020 13:16:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0285EC004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 13:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F173B89956
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 13:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGtFBJisIQp1 for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 13:16:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BDEE18994A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 13:16:24 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D61BFCA37B11A3201EEB;
 Thu, 23 Jul 2020 21:16:19 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.202.55) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Jul 2020 21:16:13 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <hch@lst.de>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>,
 <will@kernel.org>, <ganapatrao.kulkarni@cavium.com>,
 <catalin.marinas@arm.com>
Subject: [PATCH v4 2/2] arm64: mm: reserve per-numa CMA to localize coherent
 dma buffers
Date: Fri, 24 Jul 2020 01:13:44 +1200
Message-ID: <20200723131344.41472-3-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200723131344.41472-1-song.bao.hua@hisilicon.com>
References: <20200723131344.41472-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.202.55]
X-CFilter-Loop: Reflected
Cc: Steve Capper <steve.capper@arm.com>, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, huangdaode@huawei.com, iommu@lists.linux-foundation.org,
 prime.zeng@hisilicon.com, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
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

Right now, smmu is using dma_alloc_coherent() to get memory to save queues
and tables. Typically, on ARM64 server, there is a default CMA located at
node0, which could be far away from node2, node3 etc.
with this patch, smmu will get memory from local numa node to save command
queues and page tables. that means dma_unmap latency will be shrunk much.
Meanwhile, when iommu.passthrough is on, device drivers which call dma_
alloc_coherent() will also get local memory and avoid the travel between
numa nodes.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni@cavium.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 -v4:
 * rebase on top of linux-next to avoid arch/arm64 conflicts

 arch/arm64/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index b6881d61b818..a6e19145ebb3 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -437,6 +437,8 @@ void __init bootmem_init(void)
 	arm64_hugetlb_cma_reserve();
 #endif
 
+	dma_pernuma_cma_reserve();
+
 	memblock_dump_all();
 }
 
-- 
2.27.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
