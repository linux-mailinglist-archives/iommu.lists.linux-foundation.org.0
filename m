Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 50643310824
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 10:45:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F408687322;
	Fri,  5 Feb 2021 09:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRq5EqDi8vJZ; Fri,  5 Feb 2021 09:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A222287328;
	Fri,  5 Feb 2021 09:45:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A2F7C08A1;
	Fri,  5 Feb 2021 09:45:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B8FEC1DA9
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 37B2586044
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2uX5GtD3F1i for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:45:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 231D185F56
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9B85068AFE; Fri,  5 Feb 2021 10:45:12 +0100 (CET)
Date: Fri, 5 Feb 2021 10:45:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/8] swiotlb: factor out a nr_slots helper
Message-ID: <20210205094511.GA2801@lst.de>
References: <20210204193035.2606838-1-hch@lst.de>
 <20210204193035.2606838-4-hch@lst.de>
 <ae995e9d-4476-cea2-a4d7-9e9cbab5aafd@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae995e9d-4476-cea2-a4d7-9e9cbab5aafd@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 gregkh@linuxfoundation.org, linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 jxgao@google.com
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

On Thu, Feb 04, 2021 at 10:09:02PM +0000, Robin Murphy wrote:
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index 838dbad10ab916..0c0b81799edbdb 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -194,6 +194,11 @@ static inline unsigned long io_tlb_offset(unsigned long val)
>>   	return val & (IO_TLB_SEGSIZE - 1);
>>   }
>>   +static unsigned long nr_slots(u64 val)
>> +{
>> +	return ALIGN(val, 1 << IO_TLB_SHIFT) >> IO_TLB_SHIFT;
>
> Would DIV_ROUND_UP(val, 1 << IOTLB_SHIFT) be even clearer?

Not sure it is all that much cleaner, but it does fit a common pattern,
so I'll switch to that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
