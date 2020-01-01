Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944C12DD96
	for <lists.iommu@lfdr.de>; Wed,  1 Jan 2020 05:06:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5CF4F20360;
	Wed,  1 Jan 2020 04:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h249z4rEcAh7; Wed,  1 Jan 2020 04:06:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EDFA520441;
	Wed,  1 Jan 2020 04:06:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D29AFC077D;
	Wed,  1 Jan 2020 04:06:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3781FC077D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20B1F84F2E
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jzcZ_SQLWcL for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jan 2020 04:06:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6165584E60
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 04:06:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 20:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,381,1571727600"; d="scan'208";a="244309244"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 31 Dec 2019 20:06:36 -0800
Subject: Re: [RFC 2/5] iommu/vt-d: Unlink device if failed to add to group
To: Jon Derrick <jonathan.derrick@intel.com>,
 iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-3-git-send-email-jonathan.derrick@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f63981a1-7fe3-d367-c2c1-060f9556f66c@linux.intel.com>
Date: Wed, 1 Jan 2020 12:05:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577823863-3303-3-git-send-email-jonathan.derrick@intel.com>
Content-Language: en-US
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On 1/1/20 4:24 AM, Jon Derrick wrote:
> If the device fails to be added to the group, make sure to unlink the
> reference before returning.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>

This fix looks reasonable to me.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index b2526a4..978d502 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5625,8 +5625,10 @@ static int intel_iommu_add_device(struct device *dev)
>   
>   	group = iommu_group_get_for_dev(dev);
>   
> -	if (IS_ERR(group))
> -		return PTR_ERR(group);
> +	if (IS_ERR(group)) {
> +		ret = PTR_ERR(group);
> +		goto unlink;
> +	}
>   
>   	iommu_group_put(group);
>   
> @@ -5652,7 +5654,8 @@ static int intel_iommu_add_device(struct device *dev)
>   				if (!get_private_domain_for_dev(dev)) {
>   					dev_warn(dev,
>   						 "Failed to get a private domain.\n");
> -					return -ENOMEM;
> +					ret = -ENOMEM;
> +					goto unlink;
>   				}
>   
>   				dev_info(dev,
> @@ -5667,6 +5670,10 @@ static int intel_iommu_add_device(struct device *dev)
>   	}
>   
>   	return 0;
> +
> +unlink:
> +	iommu_device_unlink(&iommu->iommu, dev);
> +	return ret;
>   }
>   
>   static void intel_iommu_remove_device(struct device *dev)
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
