Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ABA42C9E3
	for <lists.iommu@lfdr.de>; Wed, 13 Oct 2021 21:20:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 173E640155;
	Wed, 13 Oct 2021 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HR9uxR1EGBrV; Wed, 13 Oct 2021 19:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE53540538;
	Wed, 13 Oct 2021 19:20:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C28ECC0022;
	Wed, 13 Oct 2021 19:20:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1248C000D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 19:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1566831AC
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 19:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5LxqoJfFXXZ for <iommu@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 19:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B072831A7
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 19:20:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A69F21063;
 Wed, 13 Oct 2021 12:20:52 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300FF3F70D;
 Wed, 13 Oct 2021 12:20:51 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: Add support for IOVA max alignment tuning
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, joro@8bytes.org, will@kernel.org
References: <1634148667-409263-1-git-send-email-quic_c_gdjako@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a72ccd19-4888-d823-5ec6-9ca891b4fe66@arm.com>
Date: Wed, 13 Oct 2021 20:20:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1634148667-409263-1-git-send-email-quic_c_gdjako@quicinc.com>
Content-Language: en-GB
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, akpm@linux-foundation.org
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

On 2021-10-13 19:11, Georgi Djakov wrote:
> IOVAs are aligned to the smallest PAGE_SIZE order, where the requested
> IOVA can fit. But this might not work for all use-cases. It can cause
> IOVA fragmentation in some multimedia and 8K video use-cases that may
> require larger buffers to be allocated and mapped.
> 
> When the above allocation pattern is used with the current alignment
> scheme, the IOVA space could be quickly exhausted for 32bit devices.
> 
> In order to get better IOVA space utilization and reduce fragmentation,
> a new kernel command line parameter is introduced to make the alignment
> limit configurable by the user during boot.
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
>   drivers/iommu/iova.c                            | 26 ++++++++++++++++++++++++-

I see no good reason for the IOVA layer to lie to its callers. If they 
don't need an aligned IOVA, they shouldn't ask for one in the first 
place. If callers still need some intermediate degree of alignment then 
the IOVA API might want to grow something more expressive than "bool 
size_aligned", but it should still be the callers' responsibility to 
pass an appropriate value.

Thanks,
Robin.

>   2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index ad94a2aa9819..630246dc691f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2056,6 +2056,14 @@
>   			  forcing Dual Address Cycle for PCI cards supporting
>   			  greater than 32-bit addressing.
>   
> +	iommu.max_align_shift=
> +			[ARM64, X86] Limit the alignment of IOVAs to a maximum
> +			PAGE_SIZE order. Larger IOVAs will be aligned to this
> +			specified order. The order is expressed as a power of
> +			two multiplied by the PAGE_SIZE.
> +			Format: { "4" | "5" | "6" | "7" | "8" | "9" }
> +			Default: 9
> +
>   	iommu.strict=	[ARM64, X86] Configure TLB invalidation behaviour
>   			Format: { "0" | "1" }
>   			0 - Lazy mode.
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 9e8bc802ac05..5a8c86871735 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -15,6 +15,9 @@
>   /* The anchor node sits above the top of the usable address space */
>   #define IOVA_ANCHOR	~0UL
>   
> +#define IOMMU_DEFAULT_IOVA_MAX_ALIGN_SHIFT	9
> +static unsigned long iommu_max_align_shift __read_mostly = IOMMU_DEFAULT_IOVA_MAX_ALIGN_SHIFT;
> +
>   static bool iova_rcache_insert(struct iova_domain *iovad,
>   			       unsigned long pfn,
>   			       unsigned long size);
> @@ -27,6 +30,27 @@ static void free_iova_rcaches(struct iova_domain *iovad);
>   static void fq_destroy_all_entries(struct iova_domain *iovad);
>   static void fq_flush_timeout(struct timer_list *t);
>   
> +static unsigned long limit_align_shift(struct iova_domain *iovad, unsigned long shift)
> +{
> +	unsigned long max_align_shift;
> +
> +	max_align_shift = iommu_max_align_shift + PAGE_SHIFT - iova_shift(iovad);
> +	return min_t(unsigned long, max_align_shift, shift);
> +}
> +
> +static int __init iommu_set_def_max_align_shift(char *str)
> +{
> +	unsigned long max_align_shift;
> +
> +	int ret = kstrtoul(str, 10, &max_align_shift);
> +
> +	if (!ret)
> +		iommu_max_align_shift = max_align_shift;
> +
> +	return 0;
> +}
> +early_param("iommu.max_align_shift", iommu_set_def_max_align_shift);
> +
>   static int iova_cpuhp_dead(unsigned int cpu, struct hlist_node *node)
>   {
>   	struct iova_domain *iovad;
> @@ -242,7 +266,7 @@ static int __alloc_and_insert_iova_range(struct iova_domain *iovad,
>   	unsigned long high_pfn = limit_pfn, low_pfn = iovad->start_pfn;
>   
>   	if (size_aligned)
> -		align_mask <<= fls_long(size - 1);
> +		align_mask <<= limit_align_shift(iovad, fls_long(size - 1));
>   
>   	/* Walk the tree backwards */
>   	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
