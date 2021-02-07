Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A73125CD
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:09:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9915286FE5;
	Sun,  7 Feb 2021 16:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmkG+MRFKOBl; Sun,  7 Feb 2021 16:09:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F08986FCF;
	Sun,  7 Feb 2021 16:09:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3468FC1DA9;
	Sun,  7 Feb 2021 16:09:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D33DC013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A28485A9E
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGmyWIFEg6HW for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 10EBA859CC
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jFI2mi7dyRl0KQwCReup9amZMDdC7KVLA5/jiqTUJgc=; b=PzcY4sAIeTkV30mNeSR7f4zhev
 1l86naI/SQcUf0zOFqJq4KJw5/8N1oMJjS8yNc/Z8ehT98TCXfbqC0yQIJkU5+vzsX2EJcA7lqXnD
 inxtjszyQ9sK7lZOffjVlwnAIPOGvXzlMpup2gQRm/SVMpF6REFiaCeA3V36wmiPskUOOwbKs2f2/
 Bh9N0vS73XhuuqKUlQtGemY4mIiM6twaFuU0N84w1IvGRIOriBPhiyre+OW/45YumEnkat66MuvVP
 iZjwGsedAM5O6qFZcTy0pBe4gMYLXotX3BJJucUjweYhEXiYYk6TIHHM3R2KLkGXZDkHwdJsP3F08
 DtFINz5Q==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8md1-004tmA-Lk; Sun, 07 Feb 2021 16:09:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 2/8] xen-swiotlb: use is_swiotlb_buffer in
 is_xen_swiotlb_buffer
Date: Sun,  7 Feb 2021 17:09:28 +0100
Message-Id: <20210207160934.2955931-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
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
---
 drivers/xen/swiotlb-xen.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 2b385c1b4a99cb..a4026822a889f7 100644
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
