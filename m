Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4E307D95
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 19:16:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B18FC86937;
	Thu, 28 Jan 2021 18:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O44GmF81VaMA; Thu, 28 Jan 2021 18:16:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 11BEC86934;
	Thu, 28 Jan 2021 18:16:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4278C08A1;
	Thu, 28 Jan 2021 18:16:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5969C08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C1C7B2E0F7
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mzIo-w+ouFv for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 18:16:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 016952E0FD
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 18:16:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B320468B02; Thu, 28 Jan 2021 19:15:58 +0100 (CET)
Date: Thu, 28 Jan 2021 19:15:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] Adding page_offset_mask to device_dma_parameters
Message-ID: <20210128181557.GA11790@lst.de>
References: <20210128003829.1892018-1-jxgao@google.com>
 <20210128003829.1892018-2-jxgao@google.com>
 <2863b6d2-47f6-51fa-f60c-ba24904818e9@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2863b6d2-47f6-51fa-f60c-ba24904818e9@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: axboe@fb.com, heikki.krogerus@linux.intel.com, sagi@grimberg.me,
 saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 kbusch@kernel.org, bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 jroedel@suse.de, linux-nvme@lists.infradead.org, dan.j.williams@intel.com,
 Jianxiong Gao <jxgao@google.com>, hch@lst.de
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

On Thu, Jan 28, 2021 at 05:27:25PM +0000, Robin Murphy wrote:
> On 2021-01-28 00:38, Jianxiong Gao wrote:
>> Some devices rely on the address offset in a page to function
>> correctly (NVMe driver as an example). These devices may use
>> a different page size than the Linux kernel. The address offset
>> has to be preserved upon mapping, and in order to do so, we
>> need to record the page_offset_mask first.
>>
>> Signed-off-by: Jianxiong Gao <jxgao@google.com>
>> ---
>>   include/linux/device.h      |  1 +
>>   include/linux/dma-mapping.h | 17 +++++++++++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index 1779f90eeb4c..f44e0659fc66 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -292,6 +292,7 @@ struct device_dma_parameters {
>>   	 */
>>   	unsigned int max_segment_size;
>>   	unsigned long segment_boundary_mask;
>> +	unsigned int page_offset_mask;
>
> Could we call this something more like "min_align_mask" (sorry, I can't 
> think of a name that's actually good and descriptive right now). 
> Essentially I worry that having "page" in there is going to be too easy to 
> misinterpret as having anything to do what "page" means almost everywhere 
> else (even before you throw IOMMU pages into the mix).
>
> Also note that of all the possible ways to pack two ints and a long, this 
> one is the worst ;)

The block layer uses virt_boundary for the related concept, but that
is pretty horrible too.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
