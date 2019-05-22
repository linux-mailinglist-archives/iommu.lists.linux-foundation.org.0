Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1F2649C
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 15:25:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86072D89;
	Wed, 22 May 2019 13:25:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3A9DD7A
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:25:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5DDBA883
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:25:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26F9615AB;
	Wed, 22 May 2019 06:25:46 -0700 (PDT)
Received: from [10.1.26.184] (unknown [10.1.26.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7E43F73F;
	Wed, 22 May 2019 06:25:44 -0700 (PDT)
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
To: Christoph Hellwig <hch@lst.de>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
	<6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
	<20190522130921.GA26874@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
Date: Wed, 22 May 2019 14:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522130921.GA26874@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-imx@nxp.com
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

On 2019-05-22 2:09 pm, Christoph Hellwig wrote:
> On Wed, May 22, 2019 at 01:50:47PM +0100, Robin Murphy wrote:
>> Would that work out any different from the existing DMA_ATTR_SKIP_CPU_SYNC?
>>
>> If drivers are prepared to handle this issue from their end, they can
>> already do so for single mappings by using that attr along with explicit
>> partial syncs via dma_sync_single(). For page/sg mappings we'd still have
>> the problem of identifying what part of "partial" actually matters, and
>> probably having to add some additional new sync operations to cope.
> 
> Except that the same optimization we are tripping over here is also
> present in dma_sync_* - dma_sync_*_to_device with DMA_FROM_DEVICE is a
> no-op in swiotlb.

Sure, but that should be irrelevant since the effective problem here is 
in the sync_*_for_cpu direction, and it's the unmap which nobbles the 
buffer. If the driver does this:

	dma_map_single(whole buffer);
	<device writes to part of buffer>
	dma_unmap_single(whole buffer);
	<contents of rest of buffer now undefined>

then it could instead do this and be happy:

	dma_map_single(whole buffer, SKIP_CPU_SYNC);
	<device writes to part of buffer>
	dma_sync_single_for_cpu(updated part of buffer);
	dma_unmap_single(whole buffer, SKIP_CPU_SYNC);
	<contents of rest of buffer still valid>

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
