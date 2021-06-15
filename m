Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 459703A7E7B
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 14:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C876D60839;
	Tue, 15 Jun 2021 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPhuyl1apMyI; Tue, 15 Jun 2021 12:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A753260826;
	Tue, 15 Jun 2021 12:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72165C0022;
	Tue, 15 Jun 2021 12:55:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CF70C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD77401B0
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yAgEaIuwBK6 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 12:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF87B400D8
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:55:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B8A811D4;
 Tue, 15 Jun 2021 05:55:25 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3D173F719;
 Tue, 15 Jun 2021 05:55:23 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] iommu/amd: Tailored gather logic for AMD
To: Nadav Amit <nadav.amit@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-6-namit@vmware.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1913c012-e6c0-1d5e-01b3-5f6da367c6bd@arm.com>
Date: Tue, 15 Jun 2021 13:55:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607182541.119756-6-namit@vmware.com>
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

On 2021-06-07 19:25, Nadav Amit wrote:
> From: Nadav Amit <namit@vmware.com>
> 
> AMD's IOMMU can flush efficiently (i.e., in a single flush) any range.
> This is in contrast, for instnace, to Intel IOMMUs that have a limit on
> the number of pages that can be flushed in a single flush.  In addition,
> AMD's IOMMU do not care about the page-size, so changes of the page size
> do not need to trigger a TLB flush.
> 
> So in most cases, a TLB flush due to disjoint range or page-size changes
> are not needed for AMD. Yet, vIOMMUs require the hypervisor to
> synchronize the virtualized IOMMU's PTEs with the physical ones. This
> process induce overheads, so it is better not to cause unnecessary
> flushes, i.e., flushes of PTEs that were not modified.
> 
> Implement and use amd_iommu_iotlb_gather_add_page() and use it instead
> of the generic iommu_iotlb_gather_add_page(). Ignore page-size changes
> and disjoint regions unless "non-present cache" feature is reported by
> the IOMMU capabilities, as this is an indication we are running on a
> physical IOMMU. A similar indication is used by VT-d (see "caching
> mode"). The new logic retains the same flushing behavior that we had
> before the introduction of page-selective IOTLB flushes for AMD.
> 
> On virtualized environments, check if the newly flushed region and the
> gathered one are disjoint and flush if it is. Also check whether the new
> region would cause IOTLB invalidation of large region that would include
> unmodified PTE. The latter check is done according to the "order" of the
> IOTLB flush.

If it helps,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

I wonder if it might be more effective to defer the alignment-based 
splitting part to amd_iommu_iotlb_sync() itself, but that could be 
investigated as another follow-up.

Robin.

> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org>
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>   drivers/iommu/amd/iommu.c | 44 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 3e40f6610b6a..128f2e889ced 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -2053,6 +2053,48 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
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
> +	if (amd_iommu_np_cache && gather->end != 0) {
> +		unsigned long start = iova, end = start + size - 1;
> +
> +		if (iommu_iotlb_gather_is_disjoint(gather, iova, size)) {
> +			/*
> +			 * If the new page is disjoint from the current range,
> +			 * flush.
> +			 */
> +			iommu_iotlb_sync(domain, gather);
> +		} else {
> +			/*
> +			 * If the order of TLB flushes increases by more than
> +			 * 1, it means that we would have to flush PTEs that
> +			 * were not modified. In this case, flush.
> +			 */
> +			unsigned long new_start = min(gather->start, start);
> +			unsigned long new_end = min(gather->end, end);
> +			int msb_diff = fls64(gather->end ^ gather->start);
> +			int new_msb_diff = fls64(new_end ^ new_start);
> +
> +			if (new_msb_diff > msb_diff + 1)
> +				iommu_iotlb_sync(domain, gather);
> +		}
> +	}
> +
> +	iommu_iotlb_gather_add_range(gather, iova, size);
> +}
> +
>   static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
>   			      size_t page_size,
>   			      struct iommu_iotlb_gather *gather)
> @@ -2067,7 +2109,7 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
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
