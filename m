Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6046D367AE3
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 09:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A69D83DF7;
	Thu, 22 Apr 2021 07:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9kRCHHcQ5Cf; Thu, 22 Apr 2021 07:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF6183DEE;
	Thu, 22 Apr 2021 07:20:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B006C000B;
	Thu, 22 Apr 2021 07:20:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47F55C0024
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 258DC40E52
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pohOy4_dnV5K for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 07:19:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5033440E59
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IEVkrkm3MuKaNKcyW8a+DG4O3GXVaGagie2/ONcqlhY=; b=anmjfDz2al0zGRuceriPKIfAtn
 2r5xN/fPvoh9RqCq8f2NgLc28anKl85DQp79zJxmlgMjrkAnWT9K6kWFfWdFfa+/oaUraoNrx3EK7
 Cj1NfF+BsAFyNN5ph+FqgH3P21AXa37gyZz30XWgEDpt7OyTdni3oF/OXOL2GxIlSHK6QlH9F8lXj
 oV/bsNdU9LdBrsaiEIvtR7snQd2qNegyfbIbJA40BDORsEqgSmk4odm8REfk7daCNYinPEfg7qB2T
 I6PzWdLRK3qjS5KE+f7VAlXQTos9C/2Z9rykR9kzQr/7cas/V3Ex7wBiKH/DQZu8dTJdpPwX8l/Ki
 812AaC/A==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZTci-00DRlk-9r; Thu, 22 Apr 2021 07:19:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 6/7] swiotlb: replace default_nslabs with a byte value
Date: Thu, 22 Apr 2021 09:19:20 +0200
Message-Id: <20210422071921.1428607-7-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linuxppc-dev@lists.ozlabs.org
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

Replace the default_nslabs variable with one that stores the size in
bytes as that is what all the users actually expect.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 93737d0932fbf2..87d06ddf4753f3 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -71,7 +71,7 @@ struct io_tlb_mem *io_tlb_default_mem;
  */
 static unsigned int max_segment;
 
-static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long swiotlb_default_size = IO_TLB_DEFAULT_SIZE;
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -106,7 +106,7 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return default_nslabs << IO_TLB_SHIFT;
+	return swiotlb_default_size;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,9 +116,9 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
+	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
+	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
+		swiotlb_default_size >> 20);
 }
 
 void swiotlb_print_info(void)
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
