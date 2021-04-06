Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC8354AB0
	for <lists.iommu@lfdr.de>; Tue,  6 Apr 2021 03:58:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE9660B6C;
	Tue,  6 Apr 2021 01:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvU3krrU5A3v; Tue,  6 Apr 2021 01:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id D069960B6A;
	Tue,  6 Apr 2021 01:58:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D67EC000A;
	Tue,  6 Apr 2021 01:58:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 105C2C000A
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 01:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF8640EBB
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 01:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJxSJT12527p for <iommu@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 01:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0631440EBA
 for <iommu@lists.linux-foundation.org>; Tue,  6 Apr 2021 01:58:08 +0000 (UTC)
IronPort-SDR: C8lrF80xQQIIj3KD2mjqnRRCsK2Y0ihVA3m38Vy8wBpB84nl8GvbjLNPZwTJGuSb7+UxjEzuBH
 gbqWpiTlZFdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="173036547"
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="173036547"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2021 18:58:08 -0700
IronPort-SDR: jk6rVjoF3eUvldst3p+gEJzCJ+jiSWscioDBkj7I7eezRuqn7HN3NlbByL3KKakeNtSBPyef3L
 iZgfos8XgVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,308,1610438400"; d="scan'208";a="440728151"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 05 Apr 2021 18:58:06 -0700
Subject: Re: [RFC PATCH v3 02/12] iommu: Add an unmap_pages() op for IOMMU
 drivers
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
References: <20210405191112.28192-1-isaacm@codeaurora.org>
 <20210405191112.28192-3-isaacm@codeaurora.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <bf29730d-ddbc-3898-621d-a6211ad2a709@linux.intel.com>
Date: Tue, 6 Apr 2021 09:48:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405191112.28192-3-isaacm@codeaurora.org>
Content-Language: en-US
Cc: robin.murphy@arm.com, will@kernel.org, pratikp@codeaurora.org
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

On 4/6/21 3:11 AM, Isaac J. Manjarres wrote:
> Add a callback for IOMMU drivers to provide a path for the
> IOMMU framework to call into an IOMMU driver, which can call
> into the io-pgtable code, to unmap a virtually contiguous
> range of pages of the same size.
> 
> For IOMMU drivers that do not specify an unmap_pages() callback,
> the existing logic of unmapping memory one page block at a time
> will be used.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>   include/linux/iommu.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 5e7fe519430a..9cf81242581a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -193,6 +193,7 @@ struct iommu_iotlb_gather {
>    * @detach_dev: detach device from an iommu domain
>    * @map: map a physically contiguous memory region to an iommu domain
>    * @unmap: unmap a physically contiguous memory region from an iommu domain
> + * @unmap_pages: unmap a number of pages of the same size from an iommu domain
>    * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
>    * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
>    * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
> @@ -245,6 +246,9 @@ struct iommu_ops {
>   		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
>   	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
>   		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
> +	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
> +			      size_t pgsize, size_t pgcount,
> +			      struct iommu_iotlb_gather *iotlb_gather);
>   	void (*flush_iotlb_all)(struct iommu_domain *domain);
>   	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
>   			       size_t size);
> 

This looks good to me.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
