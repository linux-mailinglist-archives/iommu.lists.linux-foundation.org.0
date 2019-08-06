Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B683588
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 17:44:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 93BBCD9C;
	Tue,  6 Aug 2019 15:44:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1D3C9CD4
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:44:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F36F89D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:44:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9842B227A8A; Tue,  6 Aug 2019 17:44:03 +0200 (CEST)
Date: Tue, 6 Aug 2019 17:44:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: Regression due to d98849aff879 (dma-direct: handle
	DMA_ATTR_NO_KERNEL_MAPPING in common code)
Message-ID: <20190806154403.GA25050@lst.de>
References: <1565082809.2323.24.camel@pengutronix.de>
	<20190806113318.GA20215@lst.de>
	<41cc93b1-62b5-7fb6-060d-01982e68503b@amd.com>
	<20190806140408.GA22902@lst.de>
	<1565100418.2323.32.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565100418.2323.32.camel@pengutronix.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 06, 2019 at 04:06:58PM +0200, Lucas Stach wrote:
> 
> dma_direct_free_pages() then needs the same check, as otherwise the cpu
> address is treated as a cookie instead of a real address and the
> encryption needs to be re-enabled.

Ok, lets try this one instead:

--
From 3a7aa9fe38a5eae5d879831b4f8c1032e735a0b6 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 6 Aug 2019 14:33:23 +0300
Subject: dma-direct: fix DMA_ATTR_NO_KERNEL_MAPPING

The new DMA_ATTR_NO_KERNEL_MAPPING needs to actually assign
a dma_addr to work.  Also skip it if the architecture needs
forced decryption handling, as that needs a kernel virtual
address.

Fixes: d98849aff879 (dma-direct: handle DMA_ATTR_NO_KERNEL_MAPPING in common code)
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 59bdceea3737..4c211c87a719 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -130,11 +130,13 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 	if (!page)
 		return NULL;
 
-	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING) {
+	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
+	    !force_dma_unencrypted(dev)) {
 		/* remove any dirty cache lines on the kernel alias */
 		if (!PageHighMem(page))
 			arch_dma_prep_coherent(page, size);
 		/* return the page pointer as the opaque cookie */
+		*dma_handle = phys_to_dma(dev, page_to_phys(page));
 		return page;
 	}
 
@@ -178,7 +180,8 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 {
 	unsigned int page_order = get_order(size);
 
-	if (attrs & DMA_ATTR_NO_KERNEL_MAPPING) {
+	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
+	    !force_dma_unencrypted(dev)) {
 		/* cpu_addr is a struct page cookie, not a kernel address */
 		__dma_direct_free_pages(dev, size, cpu_addr);
 		return;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
