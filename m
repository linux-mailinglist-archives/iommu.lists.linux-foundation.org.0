Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5458B163AE8
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 04:15:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CD1B862E6;
	Wed, 19 Feb 2020 03:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSbez9KURrUW; Wed, 19 Feb 2020 03:15:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 649CC8557B;
	Wed, 19 Feb 2020 03:15:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55D3FC013E;
	Wed, 19 Feb 2020 03:15:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72A8AC013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CC4C878A8
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOGyOwQFhrIn for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 987278757E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:15:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 19:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,459,1574150400"; d="scan'208";a="253956967"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.252])
 ([10.254.213.252])
 by orsmga002.jf.intel.com with ESMTP; 18 Feb 2020 19:15:38 -0800
Subject: Re: [PATCH] iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys() for
 huge page
To: Yonghyun Hwang <yonghyun@google.com>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
References: <20200218222324.231915-1-yonghyun@google.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <8efc6ea2-d51e-624c-5cc2-4049bb224122@linux.intel.com>
Date: Wed, 19 Feb 2020 11:15:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218222324.231915-1-yonghyun@google.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Moritz Fischer <moritzf@google.com>,
 Deepa Dinamani <deepadinamani@google.com>, linux-kernel@vger.kernel.org,
 Havard Skinnemoen <hskinnemoen@google.com>
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

Hi Yonghyun,

Thanks for the patch.

On 2020/2/19 6:23, Yonghyun Hwang wrote:
> intel_iommu_iova_to_phys() has a bug when it translates an IOVA for a huge
> page onto its corresponding physical address. This commit fixes the bug by
> accomodating the level of page entry for the IOVA and adds IOVA's lower
> address to the physical address. >
> Signed-off-by: Yonghyun Hwang <yonghyun@google.com>
> ---
>   drivers/iommu/intel-iommu.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 0c8d81f56a30..ed6e69adb578 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5555,13 +5555,20 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
>   	struct dma_pte *pte;
>   	int level = 0;
>   	u64 phys = 0;
> +	const unsigned long pfn = iova >> VTD_PAGE_SHIFT;

Why do you need a "const unsigned long" here?

>   
>   	if (dmar_domain->flags & DOMAIN_FLAG_LOSE_CHILDREN)
>   		return 0;
>   
> -	pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
> -	if (pte)
> +	pte = pfn_to_dma_pte(dmar_domain, pfn, &level);
> +	if (pte) {
>   		phys = dma_pte_addr(pte);
> +		if (level > 1)
> +			phys += (pfn &
> +				((1UL << level_to_offset_bits(level)) - 1))
> +				<< VTD_PAGE_SHIFT;
> +		phys += iova & (VTD_PAGE_SIZE - 1);

How about

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 9dc37672bf89..bd17c2510bb2 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5693,8 +5693,14 @@ static phys_addr_t 
intel_iommu_iova_to_phys(struct iommu_domain *domain,
         u64 phys = 0;

         pte = pfn_to_dma_pte(dmar_domain, iova >> VTD_PAGE_SHIFT, &level);
-       if (pte)
+       if (pte) {
+               unsigned long offset_mask;
+
+               offset_mask = BIT_MASK(level_to_offset_bits(level) +
+                                      VTD_PAGE_SHIFT) - 1;
                 phys = dma_pte_addr(pte);
+               phys += iova & (bitmask - 1);
+       }

         return phys;
  }

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
