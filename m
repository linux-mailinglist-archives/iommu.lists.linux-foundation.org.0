Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4E151DBC
	for <lists.iommu@lfdr.de>; Tue,  4 Feb 2020 16:58:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B51884854;
	Tue,  4 Feb 2020 15:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or9czWEFbePh; Tue,  4 Feb 2020 15:58:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7DAA18475F;
	Tue,  4 Feb 2020 15:58:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B16CC0174;
	Tue,  4 Feb 2020 15:58:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2DB4C0174
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B6BD86BA1
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kY+xaBlcfIOg for <iommu@lists.linux-foundation.org>;
 Tue,  4 Feb 2020 15:58:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3E0F386A14
 for <iommu@lists.linux-foundation.org>; Tue,  4 Feb 2020 15:58:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AD07768C7B; Tue,  4 Feb 2020 16:58:45 +0100 (CET)
Date: Tue, 4 Feb 2020 16:58:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] dma-direct: improve DMA mask overflow reporting
Message-ID: <20200204155845.GA8839@lst.de>
References: <20200204063205.652456-1-hch@lst.de>
 <20200204063205.652456-3-hch@lst.de>
 <b4ff1d6c-6dcb-3f7b-3935-451bdbffdcc3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4ff1d6c-6dcb-3f7b-3935-451bdbffdcc3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

On Tue, Feb 04, 2020 at 03:14:06PM +0000, Robin Murphy wrote:
>> @@ -371,7 +359,10 @@ dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
>>   		if (swiotlb_force != SWIOTLB_NO_FORCE)
>>   			return swiotlb_map(dev, phys, size, dir, attrs);
>>   -		report_addr(dev, dma_addr, size);
>> +		dev_err_once(dev,
>> +			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
>> +			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
>> +		WARN_ON_ONCE(1);
>
> Or even dev_WARN_ONCE() to make them even simpler?

It looks like dev_WARN_ONCE supports format strings (unlike
WARN_ON_ONCE), so that sounds fine.  If there are no other comments
coming in I'll apply the patches with that change.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
