Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C08452640A
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 14:50:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D2B9CD48;
	Wed, 22 May 2019 12:50:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06E25CF6
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 12:50:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 9AFC96C5
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 12:50:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64CBC80D;
	Wed, 22 May 2019 05:50:50 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED6273F575;
	Wed, 22 May 2019 05:50:48 -0700 (PDT)
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?Q?Horia_Geant=c4=83?=
	<horia.geanta@nxp.com>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
Date: Wed, 22 May 2019 13:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522123243.GA26390@lst.de>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-imx@nxp.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
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

On 22/05/2019 13:32, Christoph Hellwig wrote:
> I'm a little worried about this.  While it looks functionally correct
> we have surived without it, and doing another copy for every swiotlb
> dma mapping from the device looks extremely painful for the typical use
> cases where we expect the device to transfer the whole mapping.
> 
> I'd be tempted to instead properl document the current behavior and
> introduce a new DMA_ATTR_PARTIAL flag to allow for partial mappings.

Would that work out any different from the existing 
DMA_ATTR_SKIP_CPU_SYNC? If drivers are prepared to handle this issue 
from their end, they can already do so for single mappings by using that 
attr along with explicit partial syncs via dma_sync_single(). For 
page/sg mappings we'd still have the problem of identifying what part of 
"partial" actually matters, and probably having to add some additional 
new sync operations to cope.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
