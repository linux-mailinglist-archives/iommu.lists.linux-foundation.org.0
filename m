Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B11307C52
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 18:27:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58A8A86E73;
	Thu, 28 Jan 2021 17:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9kFtUXrh2dc; Thu, 28 Jan 2021 17:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 936FF862C7;
	Thu, 28 Jan 2021 17:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A7DC013A;
	Thu, 28 Jan 2021 17:27:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D01EAC013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBC0E862C9
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0OfaBhaskjE for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 17:27:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A1219862A5
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 17:27:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5065A13A1;
 Thu, 28 Jan 2021 09:27:29 -0800 (PST)
Received: from [10.57.35.163] (unknown [10.57.35.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A1EC3F7C3;
 Thu, 28 Jan 2021 09:27:26 -0800 (PST)
Subject: Re: [PATCH 1/3] Adding page_offset_mask to device_dma_parameters
To: Jianxiong Gao <jxgao@google.com>, erdemaktas@google.com,
 marcorr@google.com, hch@lst.de, m.szyprowski@samsung.com,
 gregkh@linuxfoundation.org, saravanak@google.com,
 heikki.krogerus@linux.intel.com, rafael.j.wysocki@intel.com,
 andriy.shevchenko@linux.intel.com, dan.j.williams@intel.com,
 bgolaszewski@baylibre.com, jroedel@suse.de,
 iommu@lists.linux-foundation.org, konrad.wilk@oracle.com, kbusch@kernel.org,
 axboe@fb.com, sagi@grimberg.me, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210128003829.1892018-1-jxgao@google.com>
 <20210128003829.1892018-2-jxgao@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2863b6d2-47f6-51fa-f60c-ba24904818e9@arm.com>
Date: Thu, 28 Jan 2021 17:27:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128003829.1892018-2-jxgao@google.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-01-28 00:38, Jianxiong Gao wrote:
> Some devices rely on the address offset in a page to function
> correctly (NVMe driver as an example). These devices may use
> a different page size than the Linux kernel. The address offset
> has to be preserved upon mapping, and in order to do so, we
> need to record the page_offset_mask first.
> 
> Signed-off-by: Jianxiong Gao <jxgao@google.com>
> ---
>   include/linux/device.h      |  1 +
>   include/linux/dma-mapping.h | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 1779f90eeb4c..f44e0659fc66 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -292,6 +292,7 @@ struct device_dma_parameters {
>   	 */
>   	unsigned int max_segment_size;
>   	unsigned long segment_boundary_mask;
> +	unsigned int page_offset_mask;

Could we call this something more like "min_align_mask" (sorry, I can't 
think of a name that's actually good and descriptive right now). 
Essentially I worry that having "page" in there is going to be too easy 
to misinterpret as having anything to do what "page" means almost 
everywhere else (even before you throw IOMMU pages into the mix).

Also note that of all the possible ways to pack two ints and a long, 
this one is the worst ;)

Robin.

>   };
>   
>   /**
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 2e49996a8f39..5529a31fefba 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -500,6 +500,23 @@ static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
>   	return -EIO;
>   }
>   
> +static inline unsigned int dma_get_page_offset_mask(struct device *dev)
> +{
> +	if (dev->dma_parms)
> +		return dev->dma_parms->page_offset_mask;
> +	return 0;
> +}
> +
> +static inline int dma_set_page_offset_mask(struct device *dev,
> +		unsigned int page_offset_mask)
> +{
> +	if (dev->dma_parms) {
> +		dev->dma_parms->page_offset_mask = page_offset_mask;
> +		return 0;
> +	}
> +	return -EIO;
> +}
> +
>   static inline int dma_get_cache_alignment(void)
>   {
>   #ifdef ARCH_DMA_MINALIGN
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
