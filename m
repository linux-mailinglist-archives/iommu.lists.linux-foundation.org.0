Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2736E4E3
	for <lists.iommu@lfdr.de>; Thu, 29 Apr 2021 08:29:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B91C4066E;
	Thu, 29 Apr 2021 06:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLFzyUHOdVFQ; Thu, 29 Apr 2021 06:29:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 617BE40E9F;
	Thu, 29 Apr 2021 06:29:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3055BC000D;
	Thu, 29 Apr 2021 06:29:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C6D0C000D
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 06:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4743D60AF9
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 06:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPjSwkGZgUOO for <iommu@lists.linux-foundation.org>;
 Thu, 29 Apr 2021 06:29:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E72060D7D
 for <iommu@lists.linux-foundation.org>; Thu, 29 Apr 2021 06:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PQKuhnKqQNnBpj4prENUHQylBY2bJD6gRJT6DAqujBw=; b=iCP0WzdxR6+nOgcbJlqWFvY3T5
 +NSW0juzZZqZXCao13LvMilKYd6Q37O09Y+b1Ovc50yrZX+GqzEm4QneZ+Hrl6pPYf+rHfMqnY8PN
 1j0h4FEIdBQfC4p65wIF+Kau1kzOl8m618p2Ff5mANBjyp5uSR8dMOQNLDNgWJZB7nrJigwrE9x6r
 t6g0U8JtuuHGvfERwOVR6kW7j+G8K95lsTahDRa4hlZ/Mi1dsnE+1/pa97RNXU8pHJ6BTog7f3eXr
 xM7b2eoJLGH0rbxOw3nQtGi26UHKEI9Frryg3Vwydpo0f4vcZudhNSFXe8go26tCVziraWNhykdOH
 fbXyl/Aw==;
Received: from [2001:4bb8:18c:28b2:bf99:b0f4:4c12:11d0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lc0AY-000PSX-AW; Thu, 29 Apr 2021 06:29:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: konrad.wilk@oracle.com
Subject: [PATCH] swiotlb: don't override user specified size in
 swiotlb_adjust_size
Date: Thu, 29 Apr 2021 08:28:59 +0200
Message-Id: <20210429062859.2478387-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: thomas.lendacky@amd.com, iommu@lists.linux-foundation.org
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

If the user already specified a swiotlb size on the command line,
swiotlb_adjust_size shoul not overwrite it.

Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8635a57f88e9..8ca7d505d61c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -118,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
+	if (default_nslabs != IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT)
+		return;
 	size = ALIGN(size, IO_TLB_SIZE);
 	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
