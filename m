Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D98E0F4
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 12:58:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4955D1F0B;
	Mon, 29 Apr 2019 10:58:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB7431EF8
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 10:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 8C638608
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 10:56:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5756380D;
	Mon, 29 Apr 2019 03:56:01 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 068C83F5AF;
	Mon, 29 Apr 2019 03:55:58 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] iommu: Add helper to get minimal page size of
	domain
To: Lu Baolu <baolu.lu@linux.intel.com>, David Woodhouse
	<dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
References: <20190421011719.14909-1-baolu.lu@linux.intel.com>
	<20190421011719.14909-2-baolu.lu@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <05eca601-0264-8141-ceeb-7ef7ad5d5650@arm.com>
Date: Mon, 29 Apr 2019 11:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190421011719.14909-2-baolu.lu@linux.intel.com>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, pengfei.xu@intel.com,
	jacob.jun.pan@intel.com, mika.westerberg@linux.intel.com,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 21/04/2019 02:17, Lu Baolu wrote:
> This makes it possible for other modules to know the minimal
> page size supported by a domain without the knowledge of the
> structure details.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>   include/linux/iommu.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index a5007d035218..46679ef19b7e 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -377,6 +377,14 @@ static inline void iommu_tlb_sync(struct iommu_domain *domain)
>   		domain->ops->iotlb_sync(domain);
>   }
>   
> +static inline unsigned long domain_minimal_pgsize(struct iommu_domain *domain)
> +{
> +	if (domain && domain->pgsize_bitmap)
> +		return 1 << __ffs(domain->pgsize_bitmap);

Nit: this would probably be more efficient on most architectures as:

	if (domain)
		return domain->pgsize_bitmap & -domain->pgsize_bitmap;


I'd also suggest s/minimal/min/ in the name, just to stop it getting too 
long. Otherwise, though, I like the idea, and there's at least one other 
place (in iommu-dma) that can make use of it straight away.

Robin.

> +
> +	return 0;
> +}
> +
>   /* PCI device grouping function */
>   extern struct iommu_group *pci_device_group(struct device *dev);
>   /* Generic device grouping function */
> @@ -704,6 +712,11 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
>   	return NULL;
>   }
>   
> +static inline unsigned long domain_minimal_pgsize(struct iommu_domain *domain)
> +{
> +	return 0;
> +}
> +
>   #endif /* CONFIG_IOMMU_API */
>   
>   #ifdef CONFIG_IOMMU_DEBUGFS
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
