Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C81FE264CC
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 15:34:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 018E8DB2;
	Wed, 22 May 2019 13:34:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 45486D73
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:34:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D5068879
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 13:34:23 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 2550C67358; Wed, 22 May 2019 15:34:01 +0200 (CEST)
Date: Wed, 22 May 2019 15:34:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
Message-ID: <20190522133400.GA27229@lst.de>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
	<6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
	<20190522130921.GA26874@lst.de>
	<fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-imx@nxp.com, Christoph Hellwig <hch@lst.de>
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

On Wed, May 22, 2019 at 02:25:38PM +0100, Robin Murphy wrote:
> Sure, but that should be irrelevant since the effective problem here is in 
> the sync_*_for_cpu direction, and it's the unmap which nobbles the buffer. 
> If the driver does this:
>
> 	dma_map_single(whole buffer);
> 	<device writes to part of buffer>
> 	dma_unmap_single(whole buffer);
> 	<contents of rest of buffer now undefined>
>
> then it could instead do this and be happy:
>
> 	dma_map_single(whole buffer, SKIP_CPU_SYNC);
> 	<device writes to part of buffer>
> 	dma_sync_single_for_cpu(updated part of buffer);
> 	dma_unmap_single(whole buffer, SKIP_CPU_SYNC);
> 	<contents of rest of buffer still valid>

Assuming the driver knows how much was actually DMAed this would
solve the issue.  Horia, does this work for you?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
