Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE57DD5C
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 16:05:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C20211452;
	Thu,  1 Aug 2019 14:04:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3C1792626
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:00:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 05712821
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 14:00:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B3CAF68AFE; Thu,  1 Aug 2019 16:00:45 +0200 (CEST)
Date: Thu, 1 Aug 2019 16:00:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: large DMA segments vs SWIOTLB
Message-ID: <20190801140045.GA23435@lst.de>
References: <1564584029.7267.15.camel@pengutronix.de>
	<20190801072958.GA16178@lst.de>
	<1564648502.7267.27.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564648502.7267.27.camel@pengutronix.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

On Thu, Aug 01, 2019 at 10:35:02AM +0200, Lucas Stach wrote:
> Hi Christoph,
> 
> Am Donnerstag, den 01.08.2019, 09:29 +0200 schrieb Christoph Hellwig:
> > Hi Lukas,
> > 
> > have you tried the latest 5.3-rc kernel, where we limited the NVMe
> > I/O size based on the swiotlb buffer size?
> 
> Yes, the issue was reproduced on 5.3-rc2. I now see your commit
> limiting the request size, so I guess I need to dig in to see why I'm
> still getting requests larger than the SWIOTLB max segment size. Thanks
> for the pointer!

a similar setup to yours the
dma_addressing_limited doesn't work, but if we changed it to a <=
it does.  The result is counter to what I'd expect, but because I'm on
vacation I didn't have time to look into why it works.  This is his
patch, let me know if this works for you:


diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f7d1eea32c78..89ac1cf754cc 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -689,7 +689,7 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
  */
 static inline bool dma_addressing_limited(struct device *dev)
 {
-	return min_not_zero(dma_get_mask(dev), dev->bus_dma_mask) <
+	return min_not_zero(dma_get_mask(dev), dev->bus_dma_mask) <=
 			    dma_get_required_mask(dev);
 }
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
