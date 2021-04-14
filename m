Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C535F7CD
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 17:47:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E53C400D2;
	Wed, 14 Apr 2021 15:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx7HN9Hgy-oi; Wed, 14 Apr 2021 15:47:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 981F44017E;
	Wed, 14 Apr 2021 15:47:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75886C0012;
	Wed, 14 Apr 2021 15:47:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A55CC000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C07D842BB
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0l1q2TZ1yTp for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 15:47:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81A5282419
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:47:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0127168C7B; Wed, 14 Apr 2021 17:47:30 +0200 (CEST)
Date: Wed, 14 Apr 2021 17:47:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V2 10/12] HV/IOMMU: Add Hyper-V dma ops support
Message-ID: <20210414154729.GD32045@lst.de>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-11-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414144945.3460554-11-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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

> +static dma_addr_t hyperv_map_page(struct device *dev, struct page *page,
> +				  unsigned long offset, size_t size,
> +				  enum dma_data_direction dir,
> +				  unsigned long attrs)
> +{
> +	phys_addr_t map, phys = (page_to_pfn(page) << PAGE_SHIFT) + offset;
> +
> +	if (!hv_is_isolation_supported())
> +		return phys;
> +
> +	map = swiotlb_tbl_map_single(dev, phys, size, HV_HYP_PAGE_SIZE, dir,
> +				     attrs);
> +	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
> +		return DMA_MAPPING_ERROR;
> +
> +	return map;
> +}

This largerly duplicates what dma-direct + swiotlb does.  Please use
force_dma_unencrypted to force bounce buffering and just use the generic
code.

> +	if (hv_isolation_type_snp()) {
> +		ret = hv_set_mem_host_visibility(
> +				phys_to_virt(hyperv_io_tlb_start),
> +				hyperv_io_tlb_size,
> +				VMBUS_PAGE_VISIBLE_READ_WRITE);
> +		if (ret)
> +			panic("%s: Fail to mark Hyper-v swiotlb buffer visible to host. err=%d\n",
> +			      __func__, ret);
> +
> +		hyperv_io_tlb_remap = ioremap_cache(hyperv_io_tlb_start
> +					    + ms_hyperv.shared_gpa_boundary,
> +						    hyperv_io_tlb_size);
> +		if (!hyperv_io_tlb_remap)
> +			panic("%s: Fail to remap io tlb.\n", __func__);
> +
> +		memset(hyperv_io_tlb_remap, 0x00, hyperv_io_tlb_size);
> +		swiotlb_set_bounce_remap(hyperv_io_tlb_remap);

And this really needs to go into a common hook where we currently just
call set_memory_decrypted so that all the different schemes for these
trusted VMs (we have about half a dozen now) can share code rather than
reinventing it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
