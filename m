Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BE250FE4
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 05:19:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E51EE8535F;
	Tue, 25 Aug 2020 03:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOmtLNL77mQe; Tue, 25 Aug 2020 03:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7206B85D68;
	Tue, 25 Aug 2020 03:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D6E0C0051;
	Tue, 25 Aug 2020 03:19:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15CA7C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 03:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 124CB8538A
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 03:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5dy6l_ZFKO6 for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 03:19:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 29CC98535F
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 03:19:01 +0000 (UTC)
IronPort-SDR: rNY8b1P/0XzawHiaPogT2UknN/ndOau1CUBUWMyE6Q8CaKYqvhX7sFh0SIIz9fwCTcSKmVJpa2
 5WGhxttP15tA==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="136097716"
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; d="scan'208";a="136097716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 20:19:00 -0700
IronPort-SDR: /QQMVKdVSaKxgnc2FhLKHODbI95P99e0htrtIEtX0rYLu784bzeG0YZ2Uy7MRBuJMq1MsMeW2u
 gqCAEPXk6YHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,351,1592895600"; d="scan'208";a="322591122"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2020 20:18:59 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/intel: Handle 36b addressing for x86-32
To: Chris Wilson <chris@chris-wilson.co.uk>, iommu@lists.linux-foundation.org
References: <20200822160209.28512-1-chris@chris-wilson.co.uk>
Message-ID: <98c34926-6085-81f2-dce2-53ef1ce1edc8@linux.intel.com>
Date: Tue, 25 Aug 2020 11:13:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822160209.28512-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Cc: intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
 stable@vger.kernel.org
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

Hi Chris,

On 2020/8/23 0:02, Chris Wilson wrote:
> Beware that the address size for x86-32 may exceed unsigned long.
> 
> [    0.368971] UBSAN: shift-out-of-bounds in drivers/iommu/intel/iommu.c:128:14
> [    0.369055] shift exponent 36 is too large for 32-bit type 'long unsigned int'
> 
> If we don't handle the wide addresses, the pages are mismapped and the
> device read/writes go astray, detected as DMAR faults and leading to
> device failure. The behaviour changed (from working to broken) in commit
> fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer"), but
commit <fa954e683178> ("iommu/vt-d: Delegate the dma domain to upper layer")

and adjust the title as "iommu/vt-d: Handle 36bit addressing for x86-32"

with above two changes,

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> the error looks older.
> 
> Fixes: fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: James Sewart <jamessewart@arista.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: <stable@vger.kernel.org> # v5.3+
> ---
>   drivers/iommu/intel/iommu.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2e9c8c3d0da4..ba78a2e854f9 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -123,29 +123,29 @@ static inline unsigned int level_to_offset_bits(int level)
>   	return (level - 1) * LEVEL_STRIDE;
>   }
>   
> -static inline int pfn_level_offset(unsigned long pfn, int level)
> +static inline int pfn_level_offset(u64 pfn, int level)
>   {
>   	return (pfn >> level_to_offset_bits(level)) & LEVEL_MASK;
>   }
>   
> -static inline unsigned long level_mask(int level)
> +static inline u64 level_mask(int level)
>   {
> -	return -1UL << level_to_offset_bits(level);
> +	return -1ULL << level_to_offset_bits(level);
>   }
>   
> -static inline unsigned long level_size(int level)
> +static inline u64 level_size(int level)
>   {
> -	return 1UL << level_to_offset_bits(level);
> +	return 1ULL << level_to_offset_bits(level);
>   }
>   
> -static inline unsigned long align_to_level(unsigned long pfn, int level)
> +static inline u64 align_to_level(u64 pfn, int level)
>   {
>   	return (pfn + level_size(level) - 1) & level_mask(level);
>   }
>   
>   static inline unsigned long lvl_to_nr_pages(unsigned int lvl)
>   {
> -	return  1 << min_t(int, (lvl - 1) * LEVEL_STRIDE, MAX_AGAW_PFN_WIDTH);
> +	return 1UL << min_t(int, (lvl - 1) * LEVEL_STRIDE, MAX_AGAW_PFN_WIDTH);
>   }
>   
>   /* VT-d pages must always be _smaller_ than MM pages. Otherwise things
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
