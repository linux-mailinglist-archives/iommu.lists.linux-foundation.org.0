Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDF32786E
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 08:46:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB123842D1;
	Mon,  1 Mar 2021 07:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lr9I01w7qY3k; Mon,  1 Mar 2021 07:45:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05F3E842D7;
	Mon,  1 Mar 2021 07:45:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E542DC000F;
	Mon,  1 Mar 2021 07:45:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92552C0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8086E4F287
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a31KPsAmnZT9 for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 07:45:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACE404F285
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=waRM0pjuhEeQaBWUrgK7ZdelZaRqodVDxZI32WcdEMs=; b=l9A9+OrFX2akSpcdSbJffe1kyf
 38IwDgTDdrgca89MW5mliDcOLO5Nd0YTAd+ofoshJOMHMQ4O35SMjrqUSU9BIHBTrFAacTJCjWAH3
 MmKvzN6NMpMwvvP6g0ZXvkrEF4XoDYt1DYcZ7SUrX+oWzfjcZJ1GA4dM4UpRcUm7kFnJARpBEfYgI
 A3Sdb4LCU5WFHZbbQwkGeNAkJDOEECqd0DCf7dqLDGdhg10VJK800H5RapjGPVmj1QIBsBNLQ0dey
 tGbmmvR/4HsSuRkqrabDlZRDAgwFImpxNnkr11nYp5NPR3J5sG9CcFaruHrnGOM9tkBPSZNeSHJPt
 25rxC34A==;
Received: from [2001:4bb8:19b:e4b7:cdf9:733f:4874:8eb4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lGdF4-00FRBm-On; Mon, 01 Mar 2021 07:45:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 05/14] xen-swiotlb: use is_swiotlb_buffer in
 is_xen_swiotlb_buffer
Date: Mon,  1 Mar 2021 08:44:27 +0100
Message-Id: <20210301074436.919889-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Dongli Zhang <dongli.zhang@oracle.com>
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

Use the is_swiotlb_buffer to check if a physical address is
a swiotlb buffer.  This works because xen-swiotlb does use the
same buffer as the main swiotlb code, and xen_io_tlb_{start,end}
are just the addresses for it that went through phys_to_virt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 4e8a4e14942afd..bffb35993c9d5f 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -111,10 +111,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * have the same virtual address as another address
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
-	if (pfn_valid(PFN_DOWN(paddr))) {
-		return paddr >= virt_to_phys(xen_io_tlb_start) &&
-		       paddr < virt_to_phys(xen_io_tlb_end);
-	}
+	if (pfn_valid(PFN_DOWN(paddr)))
+		return is_swiotlb_buffer(paddr);
 	return 0;
 }
 
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
