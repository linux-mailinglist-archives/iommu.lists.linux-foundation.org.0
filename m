Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E89EA45CDD
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 14:31:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96169E5D;
	Fri, 14 Jun 2019 12:31:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F6B1E57
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 12:31:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C2E076D
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 12:31:32 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 1C78C68AFE; Fri, 14 Jun 2019 14:31:04 +0200 (CEST)
Date: Fri, 14 Jun 2019 14:31:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Apply dma_{alloc,free}_contiguous functions
Message-ID: <20190614123103.GC31052@lst.de>
References: <20190603225259.21994-1-nicoleotsuka@gmail.com>
	<20190606062840.GD26745@lst.de>
	<67324adb-d9bc-03f6-6ec7-1463a2f35474@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67324adb-d9bc-03f6-6ec7-1463a2f35474@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Christoph Hellwig <hch@lst.de>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 14, 2019 at 11:42:54AM +0100, Robin Murphy wrote:
> On 06/06/2019 07:28, Christoph Hellwig wrote:
>> Looks fine to me.  Robin, any comments?
>
> AFAICS this looks like the obvious conversion, so... no? :)

Yep.  Just want to make sure I don't apply dma-iommu patches without
your review.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
