Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CC28411
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 18:44:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A82CAF1C;
	Thu, 23 May 2019 16:43:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 987A0EF7
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 16:43:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 12786821
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 16:43:55 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 941CA68AFE; Thu, 23 May 2019 18:43:32 +0200 (CEST)
Date: Thu, 23 May 2019 18:43:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
Message-ID: <20190523164332.GA22245@lst.de>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
	<6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
	<20190522130921.GA26874@lst.de>
	<fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
	<20190522133400.GA27229@lst.de>
	<CGME20190522135556epcas2p34e0c14f2565abfdccc7035463f60a71b@epcas2p3.samsung.com>
	<ed26de5e-aee4-4e19-095c-cc551012d475@arm.com>
	<0c79721a-11cb-c945-5626-3d43cc299fe6@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c79721a-11cb-c945-5626-3d43cc299fe6@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-imx@nxp.com, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Thu, May 23, 2019 at 07:35:07AM +0200, Marek Szyprowski wrote:
> Don't we have DMA_BIDIRECTIONAL for such case?

Not sure if it was intended for that case, but it definitively should
do the right thing for swiotlb, and it should also do the right thing
in terms of cache maintainance.

> Maybe we should update 
> documentation a bit to point that DMA_FROM_DEVICE expects the whole 
> buffer to be filled by the device?

Probably. Horia, can you try to use DMA_BIDIRECTIONAL?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
