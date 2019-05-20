Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F161222CEA
	for <lists.iommu@lfdr.de>; Mon, 20 May 2019 09:31:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E070AAE0;
	Mon, 20 May 2019 07:30:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED08BACC
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 07:30:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA7BE875
	for <iommu@lists.linux-foundation.org>;
	Mon, 20 May 2019 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ju/RqGP90XZgvPmH9rBY/iir4lrqKXLkPO1RUnFwzk8=;
	b=ZtB/yopoyqoal+9canvX4RiB0v
	dKVbg4LnKN/RQOaAMr8DB9ODvh437Wg0NRJr6pcpNwvkni1/rErvyaLCJlIpvaELGf5PfCzS7XJZf
	+bbfZjEHkWQSkb19P+GW8Vz2WQgD5tYyg6Yz8s2V9tTBiOKp+ePViJAnGUvoKUSUVp7HNvkdEH+x2
	1C+uAZ+z58R7h35DL7aRJTCPX63PqOt/DHtld2vTelm1hXAjcXdFZhvdJVH14SrADB94QtW+mDZtz
	uMtj0ZcMnmgqwH6LupJ9esVc7tLG+olihUyLrA+IdTfZx4WP3oGRp1lPoHergiE+SGKKNMEPnQagt
	uY2WTVCw==;
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hScl0-0003pR-6l; Mon, 20 May 2019 07:30:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 04/24] iommu/dma: Use for_each_sg in iommu_dma_alloc
Date: Mon, 20 May 2019 09:29:28 +0200
Message-Id: <20190520072948.11412-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520072948.11412-1-hch@lst.de>
References: <20190520072948.11412-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

arch_dma_prep_coherent can handle physically contiguous ranges larger
than PAGE_SIZE just fine, which means we don't need a page-based
iterator.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/dma-iommu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index aac12433ffef..9b7f120d7381 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -606,15 +606,11 @@ struct page **iommu_dma_alloc(struct device *dev, size_t size, gfp_t gfp,
 		goto out_free_iova;
 
 	if (!(prot & IOMMU_CACHE)) {
-		struct sg_mapping_iter miter;
-		/*
-		 * The CPU-centric flushing implied by SG_MITER_TO_SG isn't
-		 * sufficient here, so skip it by using the "wrong" direction.
-		 */
-		sg_miter_start(&miter, sgt.sgl, sgt.orig_nents, SG_MITER_FROM_SG);
-		while (sg_miter_next(&miter))
-			arch_dma_prep_coherent(miter.page, PAGE_SIZE);
-		sg_miter_stop(&miter);
+		struct scatterlist *sg;
+		int i;
+
+		for_each_sg(sgt.sgl, sg, sgt.orig_nents, i)
+			arch_dma_prep_coherent(sg_page(sg), sg->length);
 	}
 
 	if (iommu_map_sg(domain, iova, sgt.sgl, sgt.orig_nents, prot)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
