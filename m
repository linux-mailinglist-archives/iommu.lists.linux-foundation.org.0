Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D49097A606
	for <lists.iommu@lfdr.de>; Tue, 30 Jul 2019 12:28:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7A0FD281F;
	Tue, 30 Jul 2019 10:28:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67FA627C1
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 10:20:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D04ADD3
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 10:20:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id ADBA968AFE; Tue, 30 Jul 2019 12:20:50 +0200 (CEST)
Date: Tue, 30 Jul 2019 12:20:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] dma-mapping: remove dma_{alloc,free,mmap}_writecombine
Message-ID: <20190730102050.GA1663@lst.de>
References: <20190730061849.29686-1-hch@lst.de>
	<5f73f400-eff2-6c7b-887d-c768642d8df1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f73f400-eff2-6c7b-887d-c768642d8df1@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com
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

On Tue, Jul 30, 2019 at 10:50:32AM +0300, Tomi Valkeinen wrote:
> On 30/07/2019 09:18, Christoph Hellwig wrote:
>> We can already use DMA_ATTR_WRITE_COMBINE or the _wc prefixed version,
>> so remove the third way of doing things.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   drivers/gpu/drm/omapdrm/dss/dispc.c | 11 +++++------
>>   include/linux/dma-mapping.h         |  9 ---------
>>   2 files changed, 5 insertions(+), 15 deletions(-)
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>
> Which tree should this be applied to?

I'd like to add it to the dma-mapping tree if possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
