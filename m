Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3AB209C88
	for <lists.iommu@lfdr.de>; Thu, 25 Jun 2020 12:10:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6916223119;
	Thu, 25 Jun 2020 10:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxRzlcZziKvY; Thu, 25 Jun 2020 10:10:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2F0F123115;
	Thu, 25 Jun 2020 10:10:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11ACDC016F;
	Thu, 25 Jun 2020 10:10:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34052C016F
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 10:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 207A4887BE
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 10:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEq+JDodkL6L for <iommu@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 10:10:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8561C88787
 for <iommu@lists.linux-foundation.org>; Thu, 25 Jun 2020 10:10:46 +0000 (UTC)
IronPort-SDR: YglJD9oDEFwGEI7Zwd8527K9P/7QfNyRe7HC2d4fc3xjNA3kxz4U7flsXFx8UEFYEtEub9abIM
 tsG4a+cxkWsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="143063444"
X-IronPort-AV: E=Sophos;i="5.75,278,1589266800"; d="scan'208";a="143063444"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 03:10:46 -0700
IronPort-SDR: PFsp/SsCVenUnNedV0CEWxdvXRhWP/c8o1xR0H0gXdq1qb/ZBGwr3ItsyEJ1n7PfCmRbKEA+iJ
 IyvEJVEHi9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,278,1589266800"; d="scan'208";a="263887183"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.28.52])
 ([10.255.28.52])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2020 03:10:43 -0700
Subject: Re: [PATCH 6/7] iommu/vt-d: Warn on out-of-range invalidation address
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>
References: <1592926996-47914-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1592926996-47914-7-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <d87d15fd-71d5-6735-74df-583024826ab0@linux.intel.com>
Date: Thu, 25 Jun 2020 18:10:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592926996-47914-7-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

Hi,

On 2020/6/23 23:43, Jacob Pan wrote:
> For guest requested IOTLB invalidation, address and mask are provided as
> part of the invalidation data. VT-d HW silently ignores any address bits
> below the mask. SW shall also allow such case but give warning if
> address does not align with the mask. This patch relax the fault
> handling from error to warning and proceed with invalidation request
> with the given mask.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>   drivers/iommu/intel/iommu.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 5ea5732d5ec4..50fc62413a35 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5439,13 +5439,12 @@ intel_iommu_sva_invalidate(struct iommu_domain *domain, struct device *dev,
>   
>   		switch (BIT(cache_type)) {
>   		case IOMMU_CACHE_INV_TYPE_IOTLB:
> +			/* HW will ignore LSB bits based on address mask */
>   			if (inv_info->granularity == IOMMU_INV_GRANU_ADDR &&
>   			    size &&
>   			    (inv_info->addr_info.addr & ((BIT(VTD_PAGE_SHIFT + size)) - 1))) {
> -				pr_err_ratelimited("Address out of range, 0x%llx, size order %llu\n",
> -						   inv_info->addr_info.addr, size);
> -				ret = -ERANGE;
> -				goto out_unlock;
> +				WARN_ONCE(1, "Address out of range, 0x%llx, size order %llu\n",
> +					  inv_info->addr_info.addr, size);

I don't think WARN_ONCE() is suitable here. It makes users think it's a
kernel bug. How about pr_warn_ratelimited()?

Best regards,
baolu

>   			}
>   
>   			/*
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
