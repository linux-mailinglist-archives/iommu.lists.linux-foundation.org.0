Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F27C588
	for <lists.iommu@lfdr.de>; Wed, 31 Jul 2019 17:08:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F155C3E1D;
	Wed, 31 Jul 2019 15:08:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE3413DB5
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 14:59:26 +0000 (UTC)
X-Greylist: delayed 00:18:51 by SQLgrey-1.7.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E24178B9
	for <iommu@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 14:59:24 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1hspmI-0007Z9-Fb; Wed, 31 Jul 2019 16:40:30 +0200
Message-ID: <1564584029.7267.15.camel@pengutronix.de>
Subject: large DMA segments vs SWIOTLB
From: Lucas Stach <l.stach@pengutronix.de>
To: Christoph Hellwig <hch@lst.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>
Date: Wed, 31 Jul 2019 16:40:29 +0200
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
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

Hi all,

I'm currently looking at an issue with an NVMe device, which isn't
working properly under some specific conditions.

The issue comes down to my platform having DMA addressing restrictions,
with only 3 of the total 4GiB of RAM being device addressable, which
means a bunch of DMA mappings are going through the SWIOTLB.

Now with this NVMe device I'm getting a request with ~520KiB data
payload. The system memory isn't heavily fragmented at that point yet, so the payload gets mapped a single dma segment in nvme_map_data(). Due to the addressing restrictions the request is passed to SWIOTLB, which is unable to satisfy the mapping request, despite plenty of TLB space being available due to the maximum segment size imposed by SWIOTLB. Currently a SWIOTLB slab is 2KiB (IO_TLB_SHIFT) in size, while the maximum segment size is IO_TLB_SEGSIZE = 128 slabs. This causes the dma mapping to fail, which means the blk layer will retry the request indefinitely.

Now I can work around the issue at hand simply by bumping
IO_TLB_SEGSIZE to 512, but this doesn't seem like a very robust
solution.

Do we need a SWIOTLB allocator that doesn't exhibit linear complexity
with the maximum segment size? Some buddy scheme maybe? Splitting the
dma segment doesn't seem to be an option, as the documentation states
that dma_map_sg may return less segments as a result of the mapping
operation, not more. I'm not sure how far this assumption is ingrained
into the users of the API.

Regards,
Lucas


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
