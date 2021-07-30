Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E63DB35B
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 08:14:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5B2983B9F;
	Fri, 30 Jul 2021 06:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycS7O3pdzmKo; Fri, 30 Jul 2021 06:14:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A929683B98;
	Fri, 30 Jul 2021 06:14:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 930D9C000E;
	Fri, 30 Jul 2021 06:14:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54E30C000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43F88606EB
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUJ-NRLNQbqN for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 06:14:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96AED6063F
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 06:14:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="211157337"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="211157337"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 23:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="465345398"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2021 23:14:03 -0700
Subject: Re: [PATCH v2 22/24] iommu: Allow enabling non-strict mode dynamically
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org
References: <cover.1627468308.git.robin.murphy@arm.com>
 <de75b36b3b31cd328de3811c0725f3d0af448abc.1627468310.git.robin.murphy@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <94645a8e-471d-2daa-d385-95a337025721@linux.intel.com>
Date: Fri, 30 Jul 2021 14:11:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <de75b36b3b31cd328de3811c0725f3d0af448abc.1627468310.git.robin.murphy@arm.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, dianders@chromium.org,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 7/28/21 11:58 PM, Robin Murphy wrote:
> Allocating and enabling a flush queue is in fact something we can
> reasonably do while a DMA domain is active, without having to rebuild it
> from scratch. Thus we can allow a strict -> non-strict transition from
> sysfs without requiring to unbind the device's driver, which is of
> particular interest to users who want to make selective relaxations to
> critical devices like the one serving their root filesystem.
> 
> Disabling and draining a queue also seems technically possible to
> achieve without rebuilding the whole domain, but would certainly be more
> involved. Furthermore there's not such a clear use-case for tightening
> up security *after* the device may already have done whatever it is that
> you don't trust it not to do, so we only consider the relaxation case.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/iommu/iommu.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 25c1adc1ec67..be399d630953 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -3200,6 +3200,13 @@ static int iommu_change_dev_def_domain(struct iommu_group *group,
>   		goto out;
>   	}
>   
> +	/* We can bring up a flush queue without tearing down the domain */
> +	if (type == IOMMU_DOMAIN_DMA_FQ && prev_dom->type == IOMMU_DOMAIN_DMA) {
> +		prev_dom->type = IOMMU_DOMAIN_DMA_FQ;
> +		ret = iommu_dma_init_fq(prev_dom);
> +		goto out;
> +	}
> +
>   	/* Sets group->default_domain to the newly allocated domain */
>   	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
>   	if (ret)
> @@ -3240,9 +3247,9 @@ static int iommu_change_dev_def_domain(struct iommu_group *group,
>   }
>   
>   /*
> - * Changing the default domain through sysfs requires the users to ubind the
> - * drivers from the devices in the iommu group. Return failure if this doesn't
> - * meet.
> + * Changing the default domain through sysfs requires the users to unbind the
> + * drivers from the devices in the iommu group, except for a DMA -> DMA-FQ
> + * transition. Return failure if this isn't met.
>    *
>    * We need to consider the race between this and the device release path.
>    * device_lock(dev) is used here to guarantee that the device release path
> @@ -3318,7 +3325,8 @@ static ssize_t iommu_group_store_type(struct iommu_group *group,
>   
>   	/* Check if the device in the group still has a driver bound to it */
>   	device_lock(dev);
> -	if (device_is_bound(dev)) {
> +	if (device_is_bound(dev) && !(req_type == IOMMU_DOMAIN_DMA_FQ &&
> +	    group->default_domain->type == IOMMU_DOMAIN_DMA)) {
>   		pr_err_ratelimited("Device is still bound to driver\n");
>   		ret = -EBUSY;
>   		goto out;
> 


Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
