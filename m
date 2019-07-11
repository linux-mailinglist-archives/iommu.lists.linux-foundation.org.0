Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF865459
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 12:12:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42A0B4E9F;
	Thu, 11 Jul 2019 10:11:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B4D4C4E81
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:03:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D82A6893
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:03:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3471C68B05; Thu, 11 Jul 2019 12:03:33 +0200 (CEST)
Date: Thu, 11 Jul 2019 12:03:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] kernel/dma: export dma_alloc_from_contiguous to modules
Message-ID: <20190711100332.GA5853@lst.de>
References: <20190711053343.28873-1-miles.chen@mediatek.com>
	<7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d14b94f-454f-d512-bc8f-589f71bc07ea@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, miles.chen@mediatek.com,
	linux-mediatek@lists.infradead.org, Christoph Hellwig <hch@lst.de>
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

On Thu, Jul 11, 2019 at 09:50:58AM +0100, Robin Murphy wrote:
> On 11/07/2019 06:33, miles.chen@mediatek.com wrote:
>> From: Miles Chen <miles.chen@mediatek.com>
>>
>> This change exports dma_alloc_from_contiguous and
>> dma_release_from_contiguous to modules.
>>
>> Currently, we can add a reserve a memory node in dts files, make
>> it a CMA memory by setting compatible = "shared-dma-pool",
>> and setup the dev->cma_area by using of_reserved_mem_device_init_by_idx().
>>
>> Export dma_alloc_from_contiguous and dma_release_from_contiguous, so we
>> can allocate/free from/to dev->cma_area in kernel modules.
>
> As far as I understand, this was never intended for drivers to call 
> directly. If a device has its own private CMA area, then regular 
> dma_alloc_attrs() should allocate from that automatically; if that's not 
> happening already, then there's a bug somewhere.

Agreed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
