Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2251FF68F
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 17:25:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1EC887BCF;
	Thu, 18 Jun 2020 15:25:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECc0GzrIQzhZ; Thu, 18 Jun 2020 15:25:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 424C387BD6;
	Thu, 18 Jun 2020 15:25:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 254E6C016E;
	Thu, 18 Jun 2020 15:25:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C419C016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 13E1F88709
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dGk5OzrK1nIR for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 15:25:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 31EB988702
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0BWKHLb/czL3HfDkyPQ/l70JHQlX7HmWK3YRfweIKwc=; b=j3bi4iLefY89bOCygQK+/UtFMU
 iwObx1gvW2qJ5avInfE9vP7ExhY+l+DJdttbnP0iZ5hdGbczX3cQzceKcmQ/KHZwoLrlEEdgMFovZ
 HtUhDPNzeda7rRk/Ec2pgorrs0cOUC7YORBqRN+RJxYiV4gTgqRWNwCC7pGZDbIpA1j8gpcSUzLfL
 p9j7ou2LF/sBXkHC3U+oaaMUxK+SM6/0Q2TA9oOp8EFHy9TZsdS7Qu2XNNG0memqIlYwe0+3efnAm
 jXySKW2u0GOiLoTajSfV/28UzaY09XClb8kAkC5C742txomTrbnJqeQMx5HvsRZlN+c0SysJIt6hx
 6XSPak9g==;
Received: from 195-192-102-148.dyn.cablelink.at ([195.192.102.148]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlwPh-0002vR-7z; Thu, 18 Jun 2020 15:25:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: rientjes@google.com
Subject: [PATCH] dma-mapping: DMA_COHERENT_POOL should select GENERIC_ALLOCATOR
Date: Thu, 18 Jun 2020 17:25:06 +0200
Message-Id: <20200618152506.116057-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
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

The dma coherent pool code needs genalloc.  Move the select over
from DMA_REMAP, which doesn't actually need it.

Fixes: dbed452a078d ("dma-pool: decouple DMA_REMAP from DMA_COHERENT_POOL")
Reported-by: kernel test robot <lkp@intel.com>
---
 kernel/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index a0ce3c1494fdd2..6ad16b7c96526c 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -74,12 +74,12 @@ config DMA_NONCOHERENT_MMAP
 	bool
 
 config DMA_COHERENT_POOL
+	select GENERIC_ALLOCATOR
 	bool
 
 config DMA_REMAP
 	bool
 	depends on MMU
-	select GENERIC_ALLOCATOR
 	select DMA_NONCOHERENT_MMAP
 
 config DMA_DIRECT_REMAP
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
