Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864A304D74
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 01:34:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2857384995;
	Wed, 27 Jan 2021 00:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUr0PEZuv6mR; Wed, 27 Jan 2021 00:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7152085091;
	Wed, 27 Jan 2021 00:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BC15C1DA7;
	Wed, 27 Jan 2021 00:34:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 867DBC013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 00:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 743B3204A9
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 00:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIcF+jsKRvZC for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 00:34:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 71A5F20363
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 00:34:31 +0000 (UTC)
IronPort-SDR: Y8K2c8n7R3gi/6xrPHwGIfCbVcilA91hPxaseVtmAhadw2Myl/uSRbpthD/MNz/Q6jDQGkixrN
 UzGNQ3NlEdVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="264817499"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="264817499"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 16:34:31 -0800
IronPort-SDR: VsRZ5FzjX/+6FlHDQJstXZgFzv5Og8F3n7oMmLPz5rs1v+iHLOJnJ8UALefLQHQFKClkyLQYLs
 kjB++NkxVsQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="402922586"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2021 16:34:28 -0800
Subject: Re: [PATCH] iommu/vt-d: do not use flush-queue when caching-mode is on
To: Nadav Amit <nadav.amit@gmail.com>, iommu@lists.linux-foundation.org
References: <20210126203856.1544088-1-namit@vmware.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cf693fca-4f5a-a6a6-cc58-3f4e3cd882b6@linux.intel.com>
Date: Wed, 27 Jan 2021 08:26:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126203856.1544088-1-namit@vmware.com>
Content-Language: en-US
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Nadav,

On 1/27/21 4:38 AM, Nadav Amit wrote:
> From: Nadav Amit <namit@vmware.com>
> 
> When an Intel IOMMU is virtualized, and a physical device is
> passed-through to the VM, changes of the virtual IOMMU need to be
> propagated to the physical IOMMU. The hypervisor therefore needs to
> monitor PTE mappings in the IOMMU page-tables. Intel specifications
> provide "caching-mode" capability that a virtual IOMMU uses to report
> that the IOMMU is virtualized and a TLB flush is needed after mapping to
> allow the hypervisor to propagate virtual IOMMU mappings to the physical
> IOMMU. To the best of my knowledge no real physical IOMMU reports
> "caching-mode" as turned on.
> 
> Synchronizing the virtual and the physical TLBs is expensive if the
> hypervisor is unaware which PTEs have changed, as the hypervisor is
> required to walk all the virtualized tables and look for changes.
> Consequently, domain flushes are much more expensive than page-specific
> flushes on virtualized IOMMUs with passthrough devices. The kernel
> therefore exploited the "caching-mode" indication to avoid domain
> flushing and use page-specific flushing in virtualized environments. See
> commit 78d5f0f500e6 ("intel-iommu: Avoid global flushes with caching
> mode.")
> 
> This behavior changed after commit 13cf01744608 ("iommu/vt-d: Make use
> of iova deferred flushing"). Now, when batched TLB flushing is used (the
> default), full TLB domain flushes are performed frequently, requiring
> the hypervisor to perform expensive synchronization between the virtual
> TLB and the physical one.

Good catch. Thank you!

> 
> Getting batched TLB flushes to use in such circumstances page-specific
> invalidations again is not easy, since the TLB invalidation scheme
> assumes that "full" domain TLB flushes are performed for scalability.
> 
> Disable batched TLB flushes when caching-mode is on, as the performance
> benefit from using batched TLB invalidations is likely to be much
> smaller than the overhead of the virtual-to-physical IOMMU page-tables
> synchronization.
> 
> Fixes: 78d5f0f500e6 ("intel-iommu: Avoid global flushes with caching mode.")
> Signed-off-by: Nadav Amit <namit@vmware.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>   drivers/iommu/intel/iommu.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 788119c5b021..4e08f5e17175 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5373,6 +5373,30 @@ intel_iommu_domain_set_attr(struct iommu_domain *domain,
>   	return ret;
>   }
>   
> +static int
> +intel_iommu_domain_get_attr_use_flush_queue(struct iommu_domain *domain)

Just nit:

Can we just use this

static bool domain_use_flush_queue(struct iommu_domain *domain)

?

> +{
> +	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
> +	struct intel_iommu *iommu = domain_get_iommu(dmar_domain);
> +
> +	if (intel_iommu_strict)
> +		return 0;
> +
> +	/*
> +	 * The flush queue implementation does not perform page-selective
> +	 * invalidations that are required for efficient TLB flushes in virtual
> +	 * environments. The benefit of batching is likely to be much lower than
> +	 * the overhead of synchronizing the virtual and physical IOMMU
> +	 * page-tables.
> +	 */
> +	if (iommu && cap_caching_mode(iommu->cap)) {
> +		pr_warn_once("IOMMU batching is partially disabled due to virtualization");
> +		return 0;
> +	}

domain_get_iommu() only returns the first iommu, and could return NULL
when this is called before domain attaching to any device. A better
choice could be check caching mode globally and return false if caching
mode is supported on any iommu.

        struct dmar_drhd_unit *drhd;
        struct intel_iommu *iommu;

        rcu_read_lock();
        for_each_active_iommu(iommu, drhd) {
                 if (cap_caching_mode(iommu->cap))
                         return false;
         }
         rcu_read_unlock();

> +
> +	return 1;
> +}
> +
>   static int
>   intel_iommu_domain_get_attr(struct iommu_domain *domain,
>   			    enum iommu_attr attr, void *data)
> @@ -5383,7 +5407,7 @@ intel_iommu_domain_get_attr(struct iommu_domain *domain,
>   	case IOMMU_DOMAIN_DMA:
>   		switch (attr) {
>   		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			*(int *)data = !intel_iommu_strict;
> +			*(int *)data = !intel_iommu_domain_get_attr_use_flush_queue(domain);
>   			return 0;
>   		default:
>   			return -ENODEV;
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
