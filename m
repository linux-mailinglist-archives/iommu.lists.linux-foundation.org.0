Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8FC3125D2
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 17:10:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 424C18685D;
	Sun,  7 Feb 2021 16:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1rLrTFmprgt; Sun,  7 Feb 2021 16:10:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B9D286924;
	Sun,  7 Feb 2021 16:10:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39D1CC013A;
	Sun,  7 Feb 2021 16:10:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D25CC0174
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0C91C8476C
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paKEqN4XfO60 for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 16:10:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 19F3483EFD
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=II87lVlVi39N4h2hDH/RczH9V+xrUdtPsM3lWkdXNMw=; b=f8tMOfWQPN+aI2qzvJbaH14hPP
 zUj0n8mdP6winTuA7Ld5imaXHoukB6enEo6lpPJY+gbSl/jdcrgT44RWZQn/fvkyEITRM+o9or5eu
 42eQVAHxivLfAwJv+PiXGneSRGScJivDXMw3UpV/vAFaBWvOxesQIxEHKndOLafA+pwX+pN3A8fvZ
 kRU7PMlUyNuF99RbDyJsfWPFAbPrlpVxKVJHEDHbNnO4liTGTjj/Xg8BXtv5tSYchEQJT2//eY8SE
 PUZCpnQwbq8lfxC2xYn6xNbU/fxFrjtoq/ILQmud6M79thxiPQrjFHkq1boJ0lxkXWSaDjtq13XNN
 9tvDIyrQ==;
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mdD-004top-Qm; Sun, 07 Feb 2021 16:09:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 8/8] xen-swiotlb: remove the unused size argument from
 xen_swiotlb_fixup
Date: Sun,  7 Feb 2021 17:09:34 +0100
Message-Id: <20210207160934.2955931-9-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b2d9e77059bf5a..621a20c1143597 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,8 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int
-xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int i, rc;
 	int dma_bits;
@@ -195,7 +194,7 @@ int __ref xen_swiotlb_init(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
@@ -243,7 +242,7 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
 		if (repeat--) {
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
