Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FEFB2C9
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 15:45:24 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81F34E32;
	Wed, 13 Nov 2019 14:45:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3DC68BA9
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:45:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C76BE8A
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 14:45:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 367C87A7;
	Wed, 13 Nov 2019 06:45:18 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CEA63F6C4;
	Wed, 13 Nov 2019 06:45:17 -0800 (PST)
Subject: Re: generic DMA bypass flag
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20191113133731.20870-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d27b7b29-df78-4904-8002-b697da5cb013@arm.com>
Date: Wed, 13 Nov 2019 14:45:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113133731.20870-1-hch@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 13/11/2019 1:37 pm, Christoph Hellwig wrote:
> Hi all,
> 
> I've recently beeing chatting with Lu about using dma-iommu and
> per-device DMA ops in the intel IOMMU driver, and one missing feature
> in dma-iommu is a bypass mode where the direct mapping is used even
> when an iommu is attached to improve performance.  The powerpc
> code already has a similar mode, so I'd like to move it to the core
> DMA mapping code.  As part of that I noticed that the current
> powerpc code has a little bug in that it used the wrong check in the
> dma_sync_* routines to see if the direct mapping code is used.

In all honesty, this seems silly. If we can set a per-device flag to say 
"oh, bypass these ops and use some other ops instead", then we can just 
as easily simply give the device the appropriate ops in the first place. 
Because, y'know, the name of the game is "per-device ops".

> These two patches just add the generic code and move powerpc over,
> the intel IOMMU bits will require a separate discussion.

The ops need to match the default domain type, so the hard part of the 
problem is choosing when and if to switch that (particularly fun if 
there are multiple devices in the IOMMU group). Flipping between 
iommu-dma and dma-direct at that point will be trivial.

I don't see a great benefit to pulling legacy cruft out into common code 
instead of just working to get rid of it in-place, when said cruft pulls 
in the opposite direction to where we're taking the common code (i.e. 
it's inherently based on the premise of global ops).

Robin.

> The x86 AMD Gart code also has a bypass mode, but it is a lot
> strange, so I'm not going to touch it for now.
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
