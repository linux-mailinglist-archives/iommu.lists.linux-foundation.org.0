Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F691232
	for <lists.iommu@lfdr.de>; Sat, 17 Aug 2019 20:20:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 18C5C1009;
	Sat, 17 Aug 2019 18:20:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E74AFFA
	for <iommu@lists.linux-foundation.org>;
	Sat, 17 Aug 2019 18:20:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 4AFF976D
	for <iommu@lists.linux-foundation.org>;
	Sat, 17 Aug 2019 18:20:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50DD5337;
	Sat, 17 Aug 2019 11:20:31 -0700 (PDT)
Received: from [10.37.12.25] (unknown [10.37.12.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A66F3F706;
	Sat, 17 Aug 2019 11:20:29 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 07/11] swiotlb-xen: provide a single
	page-coherent.h header
To: Christoph Hellwig <hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
	<20190816130013.31154-8-hch@lst.de>
	<9a3261c6-5d92-cf6b-1ae8-3a8e8b5ef0d4@arm.com>
	<20190817065011.GA18599@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <21746bbf-618a-d12b-c767-f9e865f4dd20@arm.com>
Date: Sat, 17 Aug 2019 19:20:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190817065011.GA18599@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
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

Hi Christoph,

On 8/17/19 7:50 AM, Christoph Hellwig wrote:
> On Fri, Aug 16, 2019 at 11:40:43PM +0100, Julien Grall wrote:
>> I am not sure I agree with this rename. The implementation of the helpers
>> are very Arm specific as this is assuming Dom0 is 1:1 mapped.
>>
>> This was necessary due to the lack of IOMMU on Arm platforms back then.
>> But this is now a pain to get rid of it on newer platform...
> 
> So if you look at the final version of the header after the whole
> series, what assumes a 1:1 mapping?  It all just is
> 
> 	if (pfn_valid())
> 		local cache sync;
> 	else
> 		call into the arch code;

In the context of Xen Arm, the dev_addr is a host physical address. From 
my understanding pfn_valid() is dealing with a guest physical frame.

Therefore by passing PFN_DOWN(dev_addr) in argument you assume that the 
host and guest address spaces are the same.

> 
> are you concerned that the local cache sync might have to be split
> up more for a non-1:1 map in that case?  We could just movea
> the xen_dma_* routines into the arch instead of __xen_dma, but it
> really helps to have a common interface header.
Moving xen_dma_* routines into the arch would be a good option. 
Although, I would still consider a stub version for arch not requiring 
specific DMA.

Cheers,

-- 
Julien Grall

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
