Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B03052677A
	for <lists.iommu@lfdr.de>; Wed, 22 May 2019 17:57:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DC8ADE17;
	Wed, 22 May 2019 15:57:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 044A0DD5
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:57:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 40F6C102
	for <iommu@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:57:32 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 35D7268B05; Wed, 22 May 2019 17:57:09 +0200 (CEST)
Date: Wed, 22 May 2019 17:57:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 07/24] iommu/dma: Move domain lookup into
	__iommu_dma_{map, unmap}
Message-ID: <20190522155708.GA29904@lst.de>
References: <20190520072948.11412-1-hch@lst.de>
	<20190520072948.11412-8-hch@lst.de>
	<b2ef2d14-ec58-a1d6-1741-7834840498ee@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2ef2d14-ec58-a1d6-1741-7834840498ee@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Murphy <tmurphy@arista.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
	linux-arm-kernel@lists.infradead.org
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

On Wed, May 22, 2019 at 02:34:49PM +0100, Robin Murphy wrote:
> On 20/05/2019 08:29, Christoph Hellwig wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Most of the callers don't care, and the couple that do already have the
>> domain to hand for other reasons are in slow paths where the (trivial)
>> overhead of a repeated lookup will be utterly immaterial.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> [hch: dropped the hunk touching iommu_dma_get_msi_page to avoid a
>>   conflict with another series]
>
> Since the MSI changes made it into 5.2, do you want to resurrect that hunk 
> here, or shall I spin it up as a follow-on patch?

Either way is fine with me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
