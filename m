Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F53C768C
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 20:40:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC88C83AF4;
	Tue, 13 Jul 2021 18:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C7Itp_r12kZ1; Tue, 13 Jul 2021 18:40:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CBB4083AF3;
	Tue, 13 Jul 2021 18:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 995D8C001F;
	Tue, 13 Jul 2021 18:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E96AC000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 18:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E434983AA4
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 18:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0QFl4i-Rm4g3 for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 18:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BFA083AE8
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 18:40:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 167E11FB;
 Tue, 13 Jul 2021 11:40:06 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED2963F7D8;
 Tue, 13 Jul 2021 11:40:04 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] iommu/amd: Tailored gather logic for AMD
To: Nadav Amit <nadav.amit@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20210713094151.652597-1-namit@vmware.com>
 <20210713094151.652597-6-namit@vmware.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d9818e0b-681c-29a0-d9cd-e2f4dc963eb4@arm.com>
Date: Tue, 13 Jul 2021 19:40:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713094151.652597-6-namit@vmware.com>
Content-Language: en-GB
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, linux-kernel@vger.kernel.org,
 Jiajun Cao <caojiajun@vmware.com>
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

On 2021-07-13 10:41, Nadav Amit wrote:
> From: Nadav Amit <namit@vmware.com>
> 
> AMD's IOMMU can flush efficiently (i.e., in a single flush) any range.
> This is in contrast, for instnace, to Intel IOMMUs that have a limit on
> the number of pages that can be flushed in a single flush.  In addition,
> AMD's IOMMU do not care about the page-size, so changes of the page size
> do not need to trigger a TLB flush.
> 
> So in most cases, a TLB flush due to disjoint range is not needed for
> AMD. Yet, vIOMMUs require the hypervisor to synchronize the virtualized
> IOMMU's PTEs with the physical ones. This process induce overheads, so
> it is better not to cause unnecessary flushes, i.e., flushes of PTEs
> that were not modified.
> 
> Implement and use amd_iommu_iotlb_gather_add_page() and use it instead
> of the generic iommu_iotlb_gather_add_page(). Ignore disjoint regions
> unless "non-present cache" feature is reported by the IOMMU
> capabilities, as this is an indication we are running on a physical
> IOMMU. A similar indication is used by VT-d (see "caching mode"). The
> new logic retains the same flushing behavior that we had before the
> introduction of page-selective IOTLB flushes for AMD.
> 
> On virtualized environments, check if the newly flushed region and the
> gathered one are disjoint and flush if it is.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>   drivers/iommu/amd/iommu.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index bfae3928b98f..cc55c4c6a355 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -2048,6 +2048,27 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
>   	return ret;
>   }
>   
> +static void amd_iommu_iotlb_gather_add_page(struct iommu_domain *domain,
> +					    struct iommu_iotlb_gather *gather,
> +					    unsigned long iova, size_t size)
> +{
> +	/*
> +	 * AMD's IOMMU can flush as many pages as necessary in a single flush.
> +	 * Unless we run in a virtual machine, which can be inferred according
> +	 * to whether "non-present cache" is on, it is probably best to prefer
> +	 * (potentially) too extensive TLB flushing (i.e., more misses) over
> +	 * mutliple TLB flushes (i.e., more flushes). For virtual machines the
> +	 * hypervisor needs to synchronize the host IOMMU PTEs with those of
> +	 * the guest, and the trade-off is different: unnecessary TLB flushes
> +	 * should be avoided.
> +	 */
> +	if (amd_iommu_np_cache && gather->end != 0 &&

iommu_iotlb_gather_is_disjoint() is also checking "gather->end != 0", so 
I don't think we need both. Strictly it's only necessary here since the 
other call from iommu_iotlb_gather_add_page() equivalently asserts that 
the gather is already non-empty via its gather->pgsize check, but one 
could argue it either way and I don't have a hugely strong preference.

Otherwise, I love how neat this has all ended up, thanks for persevering!

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +	    iommu_iotlb_gather_is_disjoint(gather, iova, size))
> +		iommu_iotlb_sync(domain, gather);
> +
> +	iommu_iotlb_gather_add_range(gather, iova, size);
> +}
> +
>   static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
>   			      size_t page_size,
>   			      struct iommu_iotlb_gather *gather)
> @@ -2062,7 +2083,7 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
>   
>   	r = (ops->unmap) ? ops->unmap(ops, iova, page_size, gather) : 0;
>   
> -	iommu_iotlb_gather_add_page(dom, gather, iova, page_size);
> +	amd_iommu_iotlb_gather_add_page(dom, gather, iova, page_size);
>   
>   	return r;
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
