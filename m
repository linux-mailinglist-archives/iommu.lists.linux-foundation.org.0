Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2C618F515
	for <lists.iommu@lfdr.de>; Mon, 23 Mar 2020 13:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24A5988193;
	Mon, 23 Mar 2020 12:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPMm8Rzjtz6t; Mon, 23 Mar 2020 12:55:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8429A8818F;
	Mon, 23 Mar 2020 12:55:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A34DC089F;
	Mon, 23 Mar 2020 12:55:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE3EAC0177
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 12:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BDA1288197
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 12:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5tknDAGDTrT for <iommu@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 12:55:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5C92688187
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 12:55:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4428E68BEB; Mon, 23 Mar 2020 13:55:30 +0100 (CET)
Date: Mon, 23 Mar 2020 13:55:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200323125530.GA17038@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <0a6003e5-8003-4509-4014-4b286d5e8fe0@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a6003e5-8003-4509-4014-4b286d5e8fe0@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Mar 23, 2020 at 12:14:08PM +0000, Robin Murphy wrote:
> On 2020-03-20 2:16 pm, Christoph Hellwig wrote:
>> Several IOMMU drivers have a bypass mode where they can use a direct
>> mapping if the devices DMA mask is large enough.  Add generic support
>> to the core dma-mapping code to do that to switch those drivers to
>> a common solution.
>
> Hmm, this is _almost_, but not quite the same as the case where drivers are 
> managing their own IOMMU mappings, but still need to use streaming DMA for 
> cache maintenance on the underlying pages.

In that case they should simply not call the DMA API at all.  We'll just
need versions of the cache maintainance APIs that tie in with the raw
IOMMU API.

> For that we need the ops bypass 
> to be a "true" bypass and also avoid SWIOTLB regardless of the device's DMA 
> mask. That behaviour should in fact be fine for the opportunistic bypass 
> case here as well, since the mask being "big enough" implies by definition 
> that this should never need to bounce either.

In practice it does.  But that means adding yet another code path
vs the simple direct call to dma_direct_* vs calling the DMA ops
which I'd rather avoid.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
