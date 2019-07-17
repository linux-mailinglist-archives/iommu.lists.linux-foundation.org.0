Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460E6B69C
	for <lists.iommu@lfdr.de>; Wed, 17 Jul 2019 08:26:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 095FBC4E;
	Wed, 17 Jul 2019 06:26:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A4173C3E
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3501112E
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OLwTCcLK9RCDLApQkrPt1aEZJtEp881EMTzP2xH5Nhs=;
	b=bBnd0AdOa9hsjs95DLZBAj9wOu
	71SngVQOvq1F+jY06WmWvge52T04SRT5Th26KVoNHdiBc0susGmKQZReAbCj8/9X3cVg/4WZ84kR2
	NmMVO8GukhfU7LlPZKWeyTh30O8Pr//KBdWHKuaGrVUOQGvGYIevCAbDkx85VrQZiVJ6SDc9pVMpw
	oPCq5ICplg/V35SDoQhpUribj7InOPzVApExlLAIL8D4O3iEdCFsRhB6mgo2shJO7pN/+Gd+ie0su
	1oL4/pa/hcD9CRAW6GeVKpJR2f0mGPj8zMYhSgl6j0TspJw0MuL+poTX8xJLFcBI0ncvF/cWApd27
	kIpw7SKA==;
Received: from [213.208.157.38] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hndOS-0003n0-Eu; Wed, 17 Jul 2019 06:26:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] dma-direct: only limit the mapping size if swiotlb could
	be used
Date: Wed, 17 Jul 2019 08:26:15 +0200
Message-Id: <20190717062615.10569-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717062615.10569-1-hch@lst.de>
References: <20190717062615.10569-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	RCVD_IN_SBL_CSS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org
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

Don't just check for a swiotlb buffer, but also if buffering might
be required for this particular device.

Fixes: 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
Reported-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Tested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 kernel/dma/direct.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index d7cec866d16b..e269b6f9b444 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -399,11 +399,9 @@ int dma_direct_supported(struct device *dev, u64 mask)
 
 size_t dma_direct_max_mapping_size(struct device *dev)
 {
-	size_t size = SIZE_MAX;
-
 	/* If SWIOTLB is active, use its maximum mapping size */
-	if (is_swiotlb_active())
-		size = swiotlb_max_mapping_size(dev);
-
-	return size;
+	if (is_swiotlb_active() &&
+	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
+		return swiotlb_max_mapping_size(dev);
+	return SIZE_MAX;
 }
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
