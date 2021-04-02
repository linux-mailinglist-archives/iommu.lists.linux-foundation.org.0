Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id B713D352653
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 06:53:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1880A60A45;
	Fri,  2 Apr 2021 04:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4RnxW-c07Fe; Fri,  2 Apr 2021 04:53:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFB360A43;
	Fri,  2 Apr 2021 04:53:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09A6BC000A;
	Fri,  2 Apr 2021 04:53:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2BC4C000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 04:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C09284C08
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 04:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0tpkR2HCefe for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 04:53:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EABB084C05
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 04:53:28 +0000 (UTC)
IronPort-SDR: 8EakpgymwHAMLQVkjTOPE2hJSBfbK0An8V9h16eXw1WN9z2sFrcR7lYDHviQdAWoTmS8uixrvb
 Z6yxnB4sIdzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="256374976"
X-IronPort-AV: E=Sophos;i="5.81,298,1610438400"; d="scan'208";a="256374976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 21:53:27 -0700
IronPort-SDR: wrvsYJM85qho+rwKDNnxzVYqmYVmd532nChyBcTpoLpAENCHNdIRC5iMpxu6hAlLcPjZYmiSvU
 D1OFOT0HBDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,298,1610438400"; d="scan'208";a="439476626"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 21:53:24 -0700
Subject: Re: [PATCH] iommu/vt-d: Force to flush iotlb before creating superpage
To: "Longpeng(Mike)" <longpeng2@huawei.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20210401071834.1639-1-longpeng2@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <9c368419-6e45-6b27-0f34-26b581589fa7@linux.intel.com>
Date: Fri, 2 Apr 2021 12:44:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401071834.1639-1-longpeng2@huawei.com>
Content-Language: en-US
Cc: Kevin Tian <kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Gonglei <arei.gonglei@huawei.com>
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

Hi Longpeng,

On 4/1/21 3:18 PM, Longpeng(Mike) wrote:
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index ee09323..cbcb434 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -2342,9 +2342,20 @@ static inline int hardware_largepage_caps(struct dmar_domain *domain,
>   				 * removed to make room for superpage(s).
>   				 * We're adding new large pages, so make sure
>   				 * we don't remove their parent tables.
> +				 *
> +				 * We also need to flush the iotlb before creating
> +				 * superpage to ensure it does not perserves any
> +				 * obsolete info.
>   				 */
> -				dma_pte_free_pagetable(domain, iov_pfn, end_pfn,
> -						       largepage_lvl + 1);
> +				if (dma_pte_present(pte)) {

The dma_pte_free_pagetable() clears a batch of PTEs. So checking current
PTE is insufficient. How about removing this check and always performing
cache invalidation?

> +					int i;
> +
> +					dma_pte_free_pagetable(domain, iov_pfn, end_pfn,
> +							       largepage_lvl + 1);
> +					for_each_domain_iommu(i, domain)
> +						iommu_flush_iotlb_psi(g_iommus[i], domain,
> +								      iov_pfn, nr_pages, 0, 0);
> +				

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
