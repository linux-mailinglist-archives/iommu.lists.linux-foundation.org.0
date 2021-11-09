Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7D44AF6B
	for <lists.iommu@lfdr.de>; Tue,  9 Nov 2021 15:23:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 932BA80CA9;
	Tue,  9 Nov 2021 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7FaTMFnxcgw; Tue,  9 Nov 2021 14:23:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D57AA80C6F;
	Tue,  9 Nov 2021 14:23:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4A8EC0021;
	Tue,  9 Nov 2021 14:23:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 773DDC000E
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AEB74011C
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_ptCv80olM9 for <iommu@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 14:23:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B747E400F3
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:23:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E9F0667373; Tue,  9 Nov 2021 15:23:22 +0100 (CET)
Date: Tue, 9 Nov 2021 15:23:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 04/10] dma-direct: clean up the remapping checks in
 dma_direct_alloc
Message-ID: <20211109142322.GC23489@lst.de>
References: <20211021090611.488281-1-hch@lst.de>
 <20211021090611.488281-5-hch@lst.de>
 <bc7bc5eb-282d-3dbb-b4f9-b9bbd9e0f0a1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc7bc5eb-282d-3dbb-b4f9-b9bbd9e0f0a1@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 David Rientjes <rientjes@google.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Nov 04, 2021 at 12:35:59PM +0000, Robin Murphy wrote:
>> @@ -166,6 +166,7 @@ static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>>   void *dma_direct_alloc(struct device *dev, size_t size,
>>   		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>>   {
>> +	bool remap = false;
>
> How about also adding a "bool set_uncached = false"...

Done.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
