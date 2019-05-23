Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1028589
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 20:05:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E9D31F2A;
	Thu, 23 May 2019 18:05:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A6A6DF24
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 18:05:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5BBF687A
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 18:05:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFFF4374;
	Thu, 23 May 2019 11:05:52 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB46E3F5AF;
	Thu, 23 May 2019 11:05:50 -0700 (PDT)
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
	<6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
	<20190522130921.GA26874@lst.de>
	<fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
	<20190522133400.GA27229@lst.de>
	<CGME20190522135556epcas2p34e0c14f2565abfdccc7035463f60a71b@epcas2p3.samsung.com>
	<ed26de5e-aee4-4e19-095c-cc551012d475@arm.com>
	<0c79721a-11cb-c945-5626-3d43cc299fe6@samsung.com>
	<20190523164332.GA22245@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <49076a29-a0f5-f5f0-6c2a-a2180edd1674@arm.com>
Date: Thu, 23 May 2019 19:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523164332.GA22245@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-imx@nxp.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 23/05/2019 17:43, Christoph Hellwig wrote:
> On Thu, May 23, 2019 at 07:35:07AM +0200, Marek Szyprowski wrote:
>> Don't we have DMA_BIDIRECTIONAL for such case?
> 
> Not sure if it was intended for that case, but it definitively should
> do the right thing for swiotlb, and it should also do the right thing
> in terms of cache maintainance.
> 
>> Maybe we should update
>> documentation a bit to point that DMA_FROM_DEVICE expects the whole
>> buffer to be filled by the device?
> 
> Probably. Horia, can you try to use DMA_BIDIRECTIONAL?
> 

Yes, in general that should be a viable option. I got rather focused on 
the distinction that a "partial" FROM_DEVICE mapping would still be 
allowed to physically prevent the device from making any reads, whereas 
BIDIRECTIONAL would not, but I suspect any benefit being lost there is 
mostly one of debugging visibility rather than appreciable security, and 
probably not enough to justify additional complexity on its own - I 
couldn't say off-hand how many IOMMUs actually support write-only 
permissions anyway.

Whichever way, I'd certainly have no objection to formalising what seems 
to be the existing behaviour (both SWIOTLB and ARM dmabounce look 
consistent, at least) as something like "for the DMA_FROM_DEVICE 
direction, any parts of the buffer not written to by the device will 
become undefined". The IOMMU bounce page stuff is going to be another 
one in this boat, too.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
