Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A416643449C
	for <lists.iommu@lfdr.de>; Wed, 20 Oct 2021 07:21:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A25260827;
	Wed, 20 Oct 2021 05:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h75RW_FoqfnG; Wed, 20 Oct 2021 05:21:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6A16B60824;
	Wed, 20 Oct 2021 05:21:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37725C000D;
	Wed, 20 Oct 2021 05:21:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D825CC000D
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 05:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF1B1401EE
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 05:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voR61tlX2p1M for <iommu@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 05:21:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 821A1400C4
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 05:21:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="209490400"
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="209490400"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 22:21:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,165,1631602800"; d="scan'208";a="594517234"
Received: from qsu-mobl.ccr.corp.intel.com (HELO [10.254.215.183])
 ([10.254.215.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 22:21:46 -0700
Message-ID: <9e25f2c0-d9d3-475d-e973-63be1891f9a5@linux.intel.com>
Date: Wed, 20 Oct 2021 13:21:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/6] iommu: Move IOMMU pagesize check to attach_device
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
References: <20211019163737.46269-1-sven@svenpeter.dev>
 <20211019163737.46269-5-sven@svenpeter.dev>
From: Lu Baolu <baolu.lu@linux.intel.com>
In-Reply-To: <20211019163737.46269-5-sven@svenpeter.dev>
Cc: Arnd Bergmann <arnd@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Alexander Graf <graf@amazon.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Will Deacon <will@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

On 2021/10/20 0:37, Sven Peter via iommu wrote:
> The iova allocator is capable of handling any granularity which is a power
> of two. Remove the much stronger condition that the granularity must be
> smaller or equal to the CPU page size from a BUG_ON there.
> Instead, check this condition during __iommu_attach_device and fail
> gracefully.
> 
> Signed-off-by: Sven Peter<sven@svenpeter.dev>
> ---
>   drivers/iommu/iommu.c | 35 ++++++++++++++++++++++++++++++++---
>   drivers/iommu/iova.c  |  7 ++++---
>   include/linux/iommu.h |  5 +++++
>   3 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index dd7863e453a5..28896739964b 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -80,6 +80,8 @@ static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
>   						 unsigned type);
>   static int __iommu_attach_device(struct iommu_domain *domain,
>   				 struct device *dev);
> +static void __iommu_detach_device(struct iommu_domain *domain,
> +				  struct device *dev);
>   static int __iommu_attach_group(struct iommu_domain *domain,
>   				struct iommu_group *group);
>   static void __iommu_detach_group(struct iommu_domain *domain,
> @@ -1974,6 +1976,19 @@ void iommu_domain_free(struct iommu_domain *domain)
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_free);
>   
> +static int iommu_check_page_size(struct iommu_domain *domain)
> +{
> +	if (!iommu_is_paging_domain(domain))
> +		return 0;
> +
> +	if (!(domain->pgsize_bitmap & (PAGE_SIZE | (PAGE_SIZE - 1)))) {
> +		pr_warn("IOMMU pages cannot exactly represent CPU pages.\n");
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
>   static int __iommu_attach_device(struct iommu_domain *domain,
>   				 struct device *dev)
>   {
> @@ -1983,9 +1998,23 @@ static int __iommu_attach_device(struct iommu_domain *domain,
>   		return -ENODEV;
>   
>   	ret = domain->ops->attach_dev(domain, dev);
> -	if (!ret)
> -		trace_attach_device_to_domain(dev);
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Check that CPU pages can be represented by the IOVA granularity.
> +	 * This has to be done after ops->attach_dev since many IOMMU drivers
> +	 * only limit domain->pgsize_bitmap after having attached the first
> +	 * device.
> +	 */
> +	ret = iommu_check_page_size(domain);
> +	if (ret) {
> +		__iommu_detach_device(domain, dev);
> +		return ret;
> +	}

It looks odd. __iommu_attach_device() attaches an I/O page table for a
device. How does it relate to CPU pages? Why is it a failure case if CPU
page size is not covered?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
