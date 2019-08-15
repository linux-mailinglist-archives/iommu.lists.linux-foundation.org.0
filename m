Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C28ED57
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 15:51:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE785EE4;
	Thu, 15 Aug 2019 13:50:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75241ED7
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:50:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 85C63711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:50:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25C6D344;
	Thu, 15 Aug 2019 06:50:56 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068C83F694;
	Thu, 15 Aug 2019 06:50:54 -0700 (PDT)
Subject: Re: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
	nouveau ?
To: Christoph Hellwig <hch@lst.de>, Corentin Labbe
	<clabbe.montjoie@gmail.com>, bskeggs@redhat.com, airlied@linux.ie,
	m.szyprowski@samsung.com, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
References: <20190814145033.GA11190@Red>
	<20190814174927.GT7444@phenom.ffwll.local>
	<20190815133554.GE12036@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <cdb43f4b-55ff-80c3-8d27-56238b2ab1a1@arm.com>
Date: Thu, 15 Aug 2019 14:50:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815133554.GE12036@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

On 15/08/2019 14:35, Christoph Hellwig wrote:
> On Wed, Aug 14, 2019 at 07:49:27PM +0200, Daniel Vetter wrote:
>> On Wed, Aug 14, 2019 at 04:50:33PM +0200, Corentin Labbe wrote:
>>> Hello
>>>
>>> Since lot of release (at least since 4.19), I hit the following error message:
>>> DMA-API: cacheline tracking ENOMEM, dma-debug disabled
>>>
>>> After hitting that, I try to check who is creating so many DMA mapping and see:
>>> cat /sys/kernel/debug/dma-api/dump | cut -d' ' -f2 | sort | uniq -c
>>>        6 ahci
>>>      257 e1000e
>>>        6 ehci-pci
>>>     5891 nouveau
>>>       24 uhci_hcd
>>>
>>> Does nouveau having this high number of DMA mapping is normal ?
>>
>> Yeah seems perfectly fine for a gpu.
> 
> That is a lot and apparently overwhelm the dma-debug tracking.  Robin
> rewrote this code in Linux 4.21 to work a little better, so I'm curious
> why this might have changes in 4.19, as dma-debug did not change at
> all there.

FWIW, the cacheline tracking entries are a separate thing from the 
dma-debug entries that I rejigged - judging by those numbers there 
should still be plenty of free dma-debug entries, but for some reason it 
has failed to extend the radix tree :/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
