Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0C3AADB1
	for <lists.iommu@lfdr.de>; Thu, 17 Jun 2021 09:34:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C61841DF5;
	Thu, 17 Jun 2021 07:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDaFOie3s60W; Thu, 17 Jun 2021 07:34:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 228AF41DF3;
	Thu, 17 Jun 2021 07:34:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD9C0C000B;
	Thu, 17 Jun 2021 07:34:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C6C3C000B
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034D341580
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2lA8OYUWnrQ for <iommu@lists.linux-foundation.org>;
 Thu, 17 Jun 2021 07:33:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 557D24156D
 for <iommu@lists.linux-foundation.org>; Thu, 17 Jun 2021 07:33:57 +0000 (UTC)
IronPort-SDR: 9HfOb/zrQymDQgiH4a2RthAPluQ5ylH6OI+Y4epkEv364pcRNKwh3oM6jJhEEsRdFOpBKWCzaY
 2NPzxiEf63wQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="227830757"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="227830757"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 00:33:52 -0700
IronPort-SDR: a0EPFHUvIKX7PvFkzYd9iYMvL8ki0WQSXSw/R+IIa22JfeJAHEAPL0HeOks4BF+F+fP5GVsqSS
 oyXhIGw2yp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="472330380"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2021 00:33:49 -0700
Subject: Re: [PATCH v13 4/6] iommu/vt-d: Add support for IOMMU default DMA
 mode build options
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com, corbet@lwn.net
References: <1623841437-211832-1-git-send-email-john.garry@huawei.com>
 <1623841437-211832-5-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <46dbce5c-1c2b-60d4-df56-d2b95a959425@linux.intel.com>
Date: Thu, 17 Jun 2021 15:32:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623841437-211832-5-git-send-email-john.garry@huawei.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

On 6/16/21 7:03 PM, John Garry wrote:
> @@ -4382,9 +4380,9 @@ int __init intel_iommu_init(void)
>   		 * is likely to be much lower than the overhead of synchronizing
>   		 * the virtual and physical IOMMU page-tables.
>   		 */
> -		if (!intel_iommu_strict && cap_caching_mode(iommu->cap)) {
> -			pr_warn("IOMMU batching is disabled due to virtualization");
> -			intel_iommu_strict = 1;
> +		if (cap_caching_mode(iommu->cap)) {
> +			pr_warn("IOMMU batching disallowed due to virtualization\n");
> +			iommu_set_dma_strict(true);

With this change, VM guest will always show this warning. How about
removing this message? Users could get the same information through the
kernel message added by "[PATCH v13 2/6] iommu: Print strict or lazy
mode at init time".

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
