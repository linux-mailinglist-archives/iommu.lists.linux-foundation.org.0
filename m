Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C291FD5BB
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 22:06:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C400785D37;
	Wed, 17 Jun 2020 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-8_0EKpNK2C; Wed, 17 Jun 2020 20:06:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17F5685C5C;
	Wed, 17 Jun 2020 20:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC5ECC0895;
	Wed, 17 Jun 2020 20:06:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D222AC016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 20:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B77AA86499
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 20:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxQVlHCrBg-6 for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 20:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 536C78647A
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 20:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592424404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEoYywPDJJsgnVH9snN7OvPklZRdXEjF2dzezH+M7Zg=;
 b=FQtORX6F0Wta19ZVRRxNocIavZ8Li7a1Mllf7vcqRmUxTxL6WoZkmL4KFA5SbX6jKz6Hd1
 pcVIEqvQrkpPFpF/VzWDIf3g6W5GYOkkXbd+uD1LTnYF1/HNaKQYF3tk4zSNsOjfu6g4QZ
 QWTSQ1nO9yeOwjTkB70Xa8uz73tQDiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-8NzEK0ciPnCYu5DD11qpEA-1; Wed, 17 Jun 2020 16:06:42 -0400
X-MC-Unique: 8NzEK0ciPnCYu5DD11qpEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 020A9108BD17;
 Wed, 17 Jun 2020 20:06:41 +0000 (UTC)
Received: from x1.home (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F0BB7890A;
 Wed, 17 Jun 2020 20:06:40 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:06:39 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: [Regression] Re: [PATCH 18/18] iommu/vt-d: Remove IOVA handling
 code from the non-dma_ops path
Message-ID: <20200617140639.7ed58926@x1.home>
In-Reply-To: <20200516062101.29541-19-baolu.lu@linux.intel.com>
References: <20200516062101.29541-1-baolu.lu@linux.intel.com>
 <20200516062101.29541-19-baolu.lu@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>
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

On Sat, 16 May 2020 14:21:01 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> From: Tom Murphy <murphyt7@tcd.ie>
> 
> There's no need for the non-dma_ops path to keep track of IOVAs. The
> whole point of the non-dma_ops path is that it allows the IOVAs to be
> handled separately. The IOVA handling code removed in this patch is
> pointless.
> 
> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel-iommu.c | 95 +++++++++++++------------------------
>  1 file changed, 32 insertions(+), 63 deletions(-)

This commit results in a massive increase in memory use from the VT-d
code.  I have a 16GB system where I reserve 7168 2MB hugespages for VM
usage (14GB), leaving the host with 2GB.  I can no longer even boot the
host in this configuration.  Bisecting to this commit, I find that
reverting this change shows the following memory usage difference
immediately after boot (no hugepages, nosmp, single user,
intel_iommu=on iommu=pt):

@e70b081c6f37:
             total        used        free      shared  buff/cache   available
Mem:       16090860     2219372    13673044        1040      198444    13602664
Swap:       2097148           0     2097148

reverting e70b081c6f37:
              total        used        free      shared  buff/cache   available
Mem:       16090852      101648    15789156        1040      200048    15719572
Swap:       2097148           0     2097148

More than 2GB of additional memory used!  There's also a notable stall
during bootup for this allocation:

[    9.703360] DMAR: No ATSR found
[    9.709768] DMAR: dmar0: Using Queued invalidation
[    9.719370] DMAR: dmar1: Using Queued invalidation

### 4+ seconds! ###

[   14.076387] pci 0000:00:00.0: Adding to iommu group 0
[   14.086515] pci 0000:00:01.0: Adding to iommu group 1
[   14.096635] pci 0000:00:02.0: Adding to iommu group 2

Thanks,

Alex

> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 3c5cc3424e90..f75d7d9c231f 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -1892,11 +1892,6 @@ static int dmar_init_reserved_ranges(void)
>  	return 0;
>  }
>  
> -static void domain_reserve_special_ranges(struct dmar_domain *domain)
> -{
> -	copy_reserved_iova(&reserved_iova_list, &domain->iovad);
> -}
> -
>  static inline int guestwidth_to_adjustwidth(int gaw)
>  {
>  	int agaw;
> @@ -1918,7 +1913,8 @@ static void domain_exit(struct dmar_domain *domain)
>  	domain_remove_dev_info(domain);
>  
>  	/* destroy iovas */
> -	put_iova_domain(&domain->iovad);
> +	if (domain->domain.type == IOMMU_DOMAIN_DMA)
> +		put_iova_domain(&domain->iovad);
>  
>  	if (domain->pgd) {
>  		struct page *freelist;
> @@ -2627,19 +2623,9 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
>  }
>  
>  static int iommu_domain_identity_map(struct dmar_domain *domain,
> -				     unsigned long long start,
> -				     unsigned long long end)
> +				     unsigned long first_vpfn,
> +				     unsigned long last_vpfn)
>  {
> -	unsigned long first_vpfn = start >> VTD_PAGE_SHIFT;
> -	unsigned long last_vpfn = end >> VTD_PAGE_SHIFT;
> -
> -	if (!reserve_iova(&domain->iovad, dma_to_mm_pfn(first_vpfn),
> -			  dma_to_mm_pfn(last_vpfn))) {
> -		pr_err("Reserving iova failed\n");
> -		return -ENOMEM;
> -	}
> -
> -	pr_debug("Mapping reserved region %llx-%llx\n", start, end);
>  	/*
>  	 * RMRR range might have overlap with physical memory range,
>  	 * clear it first
> @@ -2677,7 +2663,8 @@ static int __init si_domain_init(int hw)
>  
>  		for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>  			ret = iommu_domain_identity_map(si_domain,
> -					PFN_PHYS(start_pfn), PFN_PHYS(end_pfn));
> +					mm_to_dma_pfn(start_pfn),
> +					mm_to_dma_pfn(end_pfn));
>  			if (ret)
>  				return ret;
>  		}
> @@ -4547,58 +4534,37 @@ static int intel_iommu_memory_notifier(struct notifier_block *nb,
>  				       unsigned long val, void *v)
>  {
>  	struct memory_notify *mhp = v;
> -	unsigned long long start, end;
> -	unsigned long start_vpfn, last_vpfn;
> +	unsigned long start_vpfn = mm_to_dma_pfn(mhp->start_pfn);
> +	unsigned long last_vpfn = mm_to_dma_pfn(mhp->start_pfn +
> +			mhp->nr_pages - 1);
>  
>  	switch (val) {
>  	case MEM_GOING_ONLINE:
> -		start = mhp->start_pfn << PAGE_SHIFT;
> -		end = ((mhp->start_pfn + mhp->nr_pages) << PAGE_SHIFT) - 1;
> -		if (iommu_domain_identity_map(si_domain, start, end)) {
> -			pr_warn("Failed to build identity map for [%llx-%llx]\n",
> -				start, end);
> +		if (iommu_domain_identity_map(si_domain,
> +					      start_vpfn, last_vpfn)) {
> +			pr_warn("Failed to build identity map for [%lx-%lx]\n",
> +				start_vpfn, last_vpfn);
>  			return NOTIFY_BAD;
>  		}
>  		break;
>  
>  	case MEM_OFFLINE:
>  	case MEM_CANCEL_ONLINE:
> -		start_vpfn = mm_to_dma_pfn(mhp->start_pfn);
> -		last_vpfn = mm_to_dma_pfn(mhp->start_pfn + mhp->nr_pages - 1);
> -		while (start_vpfn <= last_vpfn) {
> -			struct iova *iova;
> +		{
>  			struct dmar_drhd_unit *drhd;
>  			struct intel_iommu *iommu;
>  			struct page *freelist;
>  
> -			iova = find_iova(&si_domain->iovad, start_vpfn);
> -			if (iova == NULL) {
> -				pr_debug("Failed get IOVA for PFN %lx\n",
> -					 start_vpfn);
> -				break;
> -			}
> -
> -			iova = split_and_remove_iova(&si_domain->iovad, iova,
> -						     start_vpfn, last_vpfn);
> -			if (iova == NULL) {
> -				pr_warn("Failed to split IOVA PFN [%lx-%lx]\n",
> -					start_vpfn, last_vpfn);
> -				return NOTIFY_BAD;
> -			}
> -
> -			freelist = domain_unmap(si_domain, iova->pfn_lo,
> -					       iova->pfn_hi);
> +			freelist = domain_unmap(si_domain,
> +						start_vpfn, last_vpfn);
>  
>  			rcu_read_lock();
>  			for_each_active_iommu(iommu, drhd)
>  				iommu_flush_iotlb_psi(iommu, si_domain,
> -					iova->pfn_lo, iova_size(iova),
> +					start_vpfn, mhp->nr_pages,
>  					!freelist, 0);
>  			rcu_read_unlock();
>  			dma_free_pagelist(freelist);
> -
> -			start_vpfn = iova->pfn_hi + 1;
> -			free_iova_mem(iova);
>  		}
>  		break;
>  	}
> @@ -4626,8 +4592,9 @@ static void free_all_cpu_cached_iovas(unsigned int cpu)
>  		for (did = 0; did < cap_ndoms(iommu->cap); did++) {
>  			domain = get_iommu_domain(iommu, (u16)did);
>  
> -			if (!domain)
> +			if (!domain || domain->domain.type != IOMMU_DOMAIN_DMA)
>  				continue;
> +
>  			free_cpu_cached_iovas(cpu, &domain->iovad);
>  		}
>  	}
> @@ -5037,9 +5004,6 @@ static int md_domain_init(struct dmar_domain *domain, int guest_width)
>  {
>  	int adjust_width;
>  
> -	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
> -	domain_reserve_special_ranges(domain);
> -
>  	/* calculate AGAW */
>  	domain->gaw = guest_width;
>  	adjust_width = guestwidth_to_adjustwidth(guest_width);
> @@ -5058,11 +5022,21 @@ static int md_domain_init(struct dmar_domain *domain, int guest_width)
>  	return 0;
>  }
>  
> +static void intel_init_iova_domain(struct dmar_domain *dmar_domain)
> +{
> +	init_iova_domain(&dmar_domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
> +	copy_reserved_iova(&reserved_iova_list, &dmar_domain->iovad);
> +
> +	if (!intel_iommu_strict &&
> +	    init_iova_flush_queue(&dmar_domain->iovad,
> +				  iommu_flush_iova, iova_entry_free))
> +		pr_info("iova flush queue initialization failed\n");
> +}
> +
>  static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
>  {
>  	struct dmar_domain *dmar_domain;
>  	struct iommu_domain *domain;
> -	int ret;
>  
>  	switch (type) {
>  	case IOMMU_DOMAIN_DMA:
> @@ -5079,13 +5053,8 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
>  			return NULL;
>  		}
>  
> -		if (!intel_iommu_strict && type == IOMMU_DOMAIN_DMA) {
> -			ret = init_iova_flush_queue(&dmar_domain->iovad,
> -						    iommu_flush_iova,
> -						    iova_entry_free);
> -			if (ret)
> -				pr_info("iova flush queue initialization failed\n");
> -		}
> +		if (type == IOMMU_DOMAIN_DMA)
> +			intel_init_iova_domain(dmar_domain);
>  
>  		domain_update_iommu_cap(dmar_domain);
>  

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
